package com.facebook.imagepipeline.producers;

import android.os.SystemClock;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.ByteArrayPool;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.memory.PooledByteBufferOutputStream;
import com.facebook.imagepipeline.producers.NetworkFetcher;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class NetworkFetchProducer implements Producer<EncodedImage> {
    public static final String INTERMEDIATE_RESULT_PRODUCER_EVENT = "intermediate_result";
    public static final String PRODUCER_NAME = "NetworkFetchProducer";
    private static final int READ_SIZE = 16384;
    @VisibleForTesting
    static final long TIME_BETWEEN_PARTIAL_RESULTS_MS = 100;
    private final ByteArrayPool mByteArrayPool;
    private final NetworkFetcher mNetworkFetcher;
    private final PooledByteBufferFactory mPooledByteBufferFactory;

    public NetworkFetchProducer(PooledByteBufferFactory pooledByteBufferFactory, ByteArrayPool byteArrayPool, NetworkFetcher networkFetcher) {
        this.mPooledByteBufferFactory = pooledByteBufferFactory;
        this.mByteArrayPool = byteArrayPool;
        this.mNetworkFetcher = networkFetcher;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext context) {
        context.getListener().onProducerStart(context.getId(), PRODUCER_NAME);
        final FetchState fetchState = this.mNetworkFetcher.mo484createFetchState(consumer, context);
        this.mNetworkFetcher.fetch(fetchState, new NetworkFetcher.Callback() { // from class: com.facebook.imagepipeline.producers.NetworkFetchProducer.1
            @Override // com.facebook.imagepipeline.producers.NetworkFetcher.Callback
            public void onResponse(InputStream response, int responseLength) throws IOException {
                NetworkFetchProducer.this.onResponse(fetchState, response, responseLength);
            }

            @Override // com.facebook.imagepipeline.producers.NetworkFetcher.Callback
            public void onFailure(Throwable throwable) {
                NetworkFetchProducer.this.onFailure(fetchState, throwable);
            }

            @Override // com.facebook.imagepipeline.producers.NetworkFetcher.Callback
            public void onCancellation() {
                NetworkFetchProducer.this.onCancellation(fetchState);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onResponse(FetchState fetchState, InputStream responseData, int responseContentLength) throws IOException {
        PooledByteBufferOutputStream pooledOutputStream;
        if (responseContentLength > 0) {
            pooledOutputStream = this.mPooledByteBufferFactory.mo235newOutputStream(responseContentLength);
        } else {
            pooledOutputStream = this.mPooledByteBufferFactory.mo234newOutputStream();
        }
        byte[] ioArray = this.mByteArrayPool.get(16384);
        while (true) {
            try {
                int length = responseData.read(ioArray);
                if (length >= 0) {
                    if (length > 0) {
                        pooledOutputStream.write(ioArray, 0, length);
                        maybeHandleIntermediateResult(pooledOutputStream, fetchState);
                        float progress = calculateProgress(pooledOutputStream.size(), responseContentLength);
                        fetchState.getConsumer().onProgressUpdate(progress);
                    }
                } else {
                    this.mNetworkFetcher.onFetchCompletion(fetchState, pooledOutputStream.size());
                    handleFinalResult(pooledOutputStream, fetchState);
                    return;
                }
            } finally {
                this.mByteArrayPool.release(ioArray);
                pooledOutputStream.close();
            }
        }
    }

    private static float calculateProgress(int downloaded, int total) {
        return total > 0 ? downloaded / total : 1.0f - ((float) Math.exp((-downloaded) / 50000.0d));
    }

    private void maybeHandleIntermediateResult(PooledByteBufferOutputStream pooledOutputStream, FetchState fetchState) {
        long nowMs = SystemClock.uptimeMillis();
        if (shouldPropagateIntermediateResults(fetchState) && nowMs - fetchState.getLastIntermediateResultTimeMs() >= TIME_BETWEEN_PARTIAL_RESULTS_MS) {
            fetchState.setLastIntermediateResultTimeMs(nowMs);
            fetchState.getListener().onProducerEvent(fetchState.getId(), PRODUCER_NAME, INTERMEDIATE_RESULT_PRODUCER_EVENT);
            notifyConsumer(pooledOutputStream, false, fetchState.getConsumer());
        }
    }

    private void handleFinalResult(PooledByteBufferOutputStream pooledOutputStream, FetchState fetchState) {
        Map<String, String> extraMap = getExtraMap(fetchState, pooledOutputStream.size());
        fetchState.getListener().onProducerFinishWithSuccess(fetchState.getId(), PRODUCER_NAME, extraMap);
        notifyConsumer(pooledOutputStream, true, fetchState.getConsumer());
    }

    private void notifyConsumer(PooledByteBufferOutputStream pooledOutputStream, boolean isFinal, Consumer<EncodedImage> consumer) {
        CloseableReference<PooledByteBuffer> result = CloseableReference.of(pooledOutputStream.mo236toByteBuffer());
        EncodedImage encodedImage = null;
        try {
            EncodedImage encodedImage2 = new EncodedImage(result);
            try {
                encodedImage2.parseMetaData();
                consumer.onNewResult(encodedImage2, isFinal);
                EncodedImage.closeSafely(encodedImage2);
                CloseableReference.closeSafely(result);
            } catch (Throwable th) {
                th = th;
                encodedImage = encodedImage2;
                EncodedImage.closeSafely(encodedImage);
                CloseableReference.closeSafely(result);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onFailure(FetchState fetchState, Throwable e) {
        fetchState.getListener().onProducerFinishWithFailure(fetchState.getId(), PRODUCER_NAME, e, null);
        fetchState.getConsumer().onFailure(e);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onCancellation(FetchState fetchState) {
        fetchState.getListener().onProducerFinishWithCancellation(fetchState.getId(), PRODUCER_NAME, null);
        fetchState.getConsumer().onCancellation();
    }

    private boolean shouldPropagateIntermediateResults(FetchState fetchState) {
        if (!fetchState.getContext().getImageRequest().getProgressiveRenderingEnabled()) {
            return false;
        }
        return this.mNetworkFetcher.shouldPropagate(fetchState);
    }

    @Nullable
    private Map<String, String> getExtraMap(FetchState fetchState, int byteSize) {
        if (!fetchState.getListener().requiresExtraMap(fetchState.getId())) {
            return null;
        }
        return this.mNetworkFetcher.getExtraMap(fetchState, byteSize);
    }
}
