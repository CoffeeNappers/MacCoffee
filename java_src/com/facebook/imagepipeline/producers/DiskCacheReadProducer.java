package com.facebook.imagepipeline.producers;

import bolts.Continuation;
import bolts.Task;
import com.facebook.common.internal.ImmutableMap;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.imagepipeline.cache.DiskCachePolicy;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class DiskCacheReadProducer implements Producer<EncodedImage> {
    public static final String EXTRA_CACHED_VALUE_FOUND = "cached_value_found";
    public static final String PRODUCER_NAME = "DiskCacheProducer";
    private final DiskCachePolicy mDiskCachePolicy;
    private final Producer<EncodedImage> mInputProducer;

    public DiskCacheReadProducer(Producer<EncodedImage> inputProducer, DiskCachePolicy diskCachePolicy) {
        this.mInputProducer = inputProducer;
        this.mDiskCachePolicy = diskCachePolicy;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        ImageRequest imageRequest = producerContext.getImageRequest();
        if (!imageRequest.isDiskCacheEnabled()) {
            maybeStartInputProducer(consumer, producerContext);
            return;
        }
        producerContext.getListener().onProducerStart(producerContext.getId(), PRODUCER_NAME);
        AtomicBoolean isCancelled = new AtomicBoolean(false);
        Task<EncodedImage> diskLookupTask = this.mDiskCachePolicy.createAndStartCacheReadTask(imageRequest, producerContext.getCallerContext(), isCancelled);
        Continuation<EncodedImage, Void> continuation = onFinishDiskReads(consumer, producerContext);
        diskLookupTask.continueWith(continuation);
        subscribeTaskForRequestCancellation(isCancelled, producerContext);
    }

    private Continuation<EncodedImage, Void> onFinishDiskReads(final Consumer<EncodedImage> consumer, final ProducerContext producerContext) {
        final String requestId = producerContext.getId();
        final ProducerListener listener = producerContext.getListener();
        return new Continuation<EncodedImage, Void>() { // from class: com.facebook.imagepipeline.producers.DiskCacheReadProducer.1
            @Override // bolts.Continuation
            /* renamed from: then  reason: collision with other method in class */
            public Void mo533then(Task<EncodedImage> task) throws Exception {
                if (DiskCacheReadProducer.isTaskCancelled(task)) {
                    listener.onProducerFinishWithCancellation(requestId, DiskCacheReadProducer.PRODUCER_NAME, null);
                    consumer.onCancellation();
                } else if (task.isFaulted()) {
                    listener.onProducerFinishWithFailure(requestId, DiskCacheReadProducer.PRODUCER_NAME, task.getError(), null);
                    DiskCacheReadProducer.this.mInputProducer.produceResults(consumer, producerContext);
                } else {
                    EncodedImage cachedReference = task.getResult();
                    if (cachedReference != null) {
                        listener.onProducerFinishWithSuccess(requestId, DiskCacheReadProducer.PRODUCER_NAME, DiskCacheReadProducer.getExtraMap(listener, requestId, true));
                        consumer.onProgressUpdate(1.0f);
                        consumer.onNewResult(cachedReference, true);
                        cachedReference.close();
                    } else {
                        listener.onProducerFinishWithSuccess(requestId, DiskCacheReadProducer.PRODUCER_NAME, DiskCacheReadProducer.getExtraMap(listener, requestId, false));
                        DiskCacheReadProducer.this.mInputProducer.produceResults(consumer, producerContext);
                    }
                }
                return null;
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isTaskCancelled(Task<?> task) {
        return task.isCancelled() || (task.isFaulted() && (task.getError() instanceof CancellationException));
    }

    private void maybeStartInputProducer(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
        if (producerContext.getLowestPermittedRequestLevel().getValue() >= ImageRequest.RequestLevel.DISK_CACHE.getValue()) {
            consumer.onNewResult(null, true);
        } else {
            this.mInputProducer.produceResults(consumer, producerContext);
        }
    }

    @VisibleForTesting
    static Map<String, String> getExtraMap(ProducerListener listener, String requestId, boolean valueFound) {
        if (!listener.requiresExtraMap(requestId)) {
            return null;
        }
        return ImmutableMap.of("cached_value_found", String.valueOf(valueFound));
    }

    private void subscribeTaskForRequestCancellation(final AtomicBoolean isCancelled, ProducerContext producerContext) {
        producerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.DiskCacheReadProducer.2
            @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
            public void onCancellationRequested() {
                isCancelled.set(true);
            }
        });
    }
}
