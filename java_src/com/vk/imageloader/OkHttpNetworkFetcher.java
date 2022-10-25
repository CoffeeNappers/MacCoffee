package com.vk.imageloader;

import android.net.Uri;
import android.os.Looper;
import android.os.SystemClock;
import com.facebook.common.logging.FLog;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.producers.BaseNetworkFetcher;
import com.facebook.imagepipeline.producers.BaseProducerContextCallbacks;
import com.facebook.imagepipeline.producers.Consumer;
import com.facebook.imagepipeline.producers.FetchState;
import com.facebook.imagepipeline.producers.NetworkFetcher;
import com.facebook.imagepipeline.producers.ProducerContext;
import com.vk.core.network.Network;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import okhttp3.CacheControl;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
/* loaded from: classes2.dex */
public class OkHttpNetworkFetcher extends BaseNetworkFetcher<OkHttpNetworkFetchState> {
    private static final String FETCH_TIME = "fetch_time";
    private static final String IMAGE_SIZE = "image_size";
    private static final String QUEUE_TIME = "queue_time";
    private static final String TAG = "OkHttpNetworkFetchProducer";
    private static final String TOTAL_TIME = "total_time";
    private static HttpImageBenchmarkReporter benchmarkReporter;
    private Executor cancellationExecutor;

    /* loaded from: classes2.dex */
    public interface HttpImageBenchmarkReporter {
        void reportImageLoadFailure(String str, int i, Exception exc, boolean z, boolean z2);

        void reportImageLoadSucceeded(String str, int i, int i2, int i3, boolean z);
    }

    @Override // com.facebook.imagepipeline.producers.NetworkFetcher
    /* renamed from: createFetchState */
    public /* bridge */ /* synthetic */ FetchState mo484createFetchState(Consumer consumer, ProducerContext producerContext) {
        return mo484createFetchState((Consumer<EncodedImage>) consumer, producerContext);
    }

    /* loaded from: classes2.dex */
    public static class OkHttpNetworkFetchState extends FetchState {
        public long fetchCompleteTime;
        public long responseTime;
        public long submitTime;

        public OkHttpNetworkFetchState(Consumer<EncodedImage> consumer, ProducerContext producerContext) {
            super(consumer, producerContext);
        }
    }

    public static void setBenchmarkReporter(HttpImageBenchmarkReporter reporter) {
        benchmarkReporter = reporter;
    }

    @Override // com.facebook.imagepipeline.producers.NetworkFetcher
    /* renamed from: createFetchState  reason: collision with other method in class */
    public OkHttpNetworkFetchState mo484createFetchState(Consumer<EncodedImage> consumer, ProducerContext context) {
        return new OkHttpNetworkFetchState(consumer, context);
    }

    @Override // com.facebook.imagepipeline.producers.NetworkFetcher
    public void fetch(final OkHttpNetworkFetchState fetchState, final NetworkFetcher.Callback callback) {
        fetchState.submitTime = SystemClock.elapsedRealtime();
        Uri uri = fetchState.getUri();
        Request request = new Request.Builder().cacheControl(new CacheControl.Builder().noStore().build()).url(uri.toString()).get().build();
        final OkHttpClient client = Network.getInstance().getClient(Network.ClientType.CLIENT_IMAGE_LOADER);
        final Call call = client.newCall(request);
        fetchState.getContext().addCallbacks(new BaseProducerContextCallbacks() { // from class: com.vk.imageloader.OkHttpNetworkFetcher.1
            @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
            public void onCancellationRequested() {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    if (OkHttpNetworkFetcher.this.cancellationExecutor == null) {
                        OkHttpNetworkFetcher.this.cancellationExecutor = client.dispatcher().executorService();
                    }
                    OkHttpNetworkFetcher.this.cancellationExecutor.execute(new Runnable() { // from class: com.vk.imageloader.OkHttpNetworkFetcher.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            call.cancel();
                        }
                    });
                    return;
                }
                call.cancel();
            }
        });
        call.enqueue(new Callback() { // from class: com.vk.imageloader.OkHttpNetworkFetcher.2
            @Override // okhttp3.Callback
            public void onResponse(Call call2, Response response) throws IOException {
                fetchState.responseTime = SystemClock.elapsedRealtime();
                ResponseBody body = response.body();
                try {
                    try {
                        if (!response.isSuccessful()) {
                            OkHttpNetworkFetcher.this.handleException(fetchState, call2, response.code(), new IOException("Unexpected HTTP code " + response), true, callback);
                        } else {
                            long contentLength = body.contentLength();
                            if (contentLength < 0) {
                                contentLength = 0;
                            }
                            callback.onResponse(body.byteStream(), (int) contentLength);
                            try {
                                body.close();
                            } catch (Exception e) {
                                FLog.w(OkHttpNetworkFetcher.TAG, "Exception when closing response body", e);
                            }
                        }
                    } catch (Exception e2) {
                        OkHttpNetworkFetcher.this.handleException(fetchState, call2, response.code(), e2, true, callback);
                        try {
                            body.close();
                        } catch (Exception e3) {
                            FLog.w(OkHttpNetworkFetcher.TAG, "Exception when closing response body", e3);
                        }
                    }
                } finally {
                    try {
                        body.close();
                    } catch (Exception e4) {
                        FLog.w(OkHttpNetworkFetcher.TAG, "Exception when closing response body", e4);
                    }
                }
            }

            @Override // okhttp3.Callback
            public void onFailure(Call call2, IOException e) {
                OkHttpNetworkFetcher.this.handleException(fetchState, call2, 0, e, false, callback);
            }
        });
    }

    @Override // com.facebook.imagepipeline.producers.BaseNetworkFetcher, com.facebook.imagepipeline.producers.NetworkFetcher
    public void onFetchCompletion(OkHttpNetworkFetchState fetchState, int byteSize) {
        fetchState.fetchCompleteTime = SystemClock.elapsedRealtime();
        if (benchmarkReporter != null) {
            int totalTime = (int) (fetchState.fetchCompleteTime - fetchState.submitTime);
            int fetchTime = (int) (fetchState.fetchCompleteTime - fetchState.responseTime);
            String uri = fetchState.getContext().getImageRequest().getSourceUri().toString();
            benchmarkReporter.reportImageLoadSucceeded(uri, totalTime, fetchTime, byteSize, isOriginal(fetchState));
        }
    }

    @Override // com.facebook.imagepipeline.producers.BaseNetworkFetcher, com.facebook.imagepipeline.producers.NetworkFetcher
    public Map<String, String> getExtraMap(OkHttpNetworkFetchState fetchState, int byteSize) {
        Map<String, String> extraMap = new HashMap<>(4);
        extraMap.put(QUEUE_TIME, Long.toString(fetchState.responseTime - fetchState.submitTime));
        extraMap.put(FETCH_TIME, Long.toString(fetchState.fetchCompleteTime - fetchState.responseTime));
        extraMap.put(TOTAL_TIME, Long.toString(fetchState.fetchCompleteTime - fetchState.submitTime));
        extraMap.put(IMAGE_SIZE, Integer.toString(byteSize));
        return extraMap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleException(OkHttpNetworkFetchState fetchState, Call call, int responseCode, Exception e, boolean apiError, NetworkFetcher.Callback callback) {
        if (call.isCanceled()) {
            callback.onCancellation();
            return;
        }
        callback.onFailure(e);
        if (benchmarkReporter != null) {
            benchmarkReporter.reportImageLoadFailure(call.request().url().toString(), responseCode, e, apiError, isOriginal(fetchState));
        }
    }

    private static boolean isOriginal(OkHttpNetworkFetchState fetchState) {
        ResizeOptions options = fetchState.getContext().getImageRequest().getResizeOptions();
        return options != null && options.height > ImageSize.BIG.getPixelsSize();
    }
}
