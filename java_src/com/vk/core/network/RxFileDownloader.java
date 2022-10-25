package com.vk.core.network;

import android.content.Context;
import com.vk.core.util.FileUtils;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.functions.Cancellable;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ForwardingSource;
import okio.Okio;
import okio.Source;
/* loaded from: classes2.dex */
public class RxFileDownloader implements ObservableOnSubscribe<DownloadEvent> {
    private static final ExecutorService backgroundThread = Executors.newSingleThreadExecutor();
    private final Context context;
    private final File outputFile;
    private final String url;

    public static Observable<DownloadEvent> download(Context context, String url, File outputFile) {
        return Observable.create(new RxFileDownloader(context, url, outputFile)).sample(100L, TimeUnit.MILLISECONDS, true).subscribeOn(Schedulers.io());
    }

    public RxFileDownloader(Context context, String url, File outputFile) {
        this.context = context;
        this.url = url;
        this.outputFile = outputFile;
    }

    @Override // io.reactivex.ObservableOnSubscribe
    public void subscribe(final ObservableEmitter<DownloadEvent> e) throws Exception {
        try {
            FileUtils.doubleTryDeleteFile(this.outputFile);
            OkHttpClient.Builder builder = Network.getInstance().makeBuilder().addNetworkInterceptor(new Interceptor() { // from class: com.vk.core.network.RxFileDownloader.1
                @Override // okhttp3.Interceptor
                public Response intercept(Interceptor.Chain chain) throws IOException {
                    Response originalResponse = chain.proceed(chain.request());
                    return originalResponse.newBuilder().body(new ProgressResponseBody(originalResponse.body(), e)).build();
                }
            });
            OkHttpClient client = builder.build();
            Request request = new Request.Builder().url(this.url).build();
            Response response = client.newCall(request).execute();
            e.setCancellable(createResponseCancellable(response));
            try {
                BufferedSink sink = Okio.buffer(Okio.sink(this.outputFile));
                sink.writeAll(response.body().source());
                sink.close();
            } catch (DownloadCancelationException e2) {
                FileUtils.deleteFile(this.outputFile);
            }
            if (!e.isDisposed()) {
                e.onNext(DownloadEvent.createDoneEvent(this.outputFile));
                e.onComplete();
            }
        } catch (Exception exc) {
            FileUtils.deleteFile(this.outputFile);
            if (!e.isDisposed()) {
                e.onError(exc);
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class DownloadEvent {
        private static final int TYPE_DONE = 2;
        private static final int TYPE_PROGRESS = 1;
        private static final int TYPE_PROGRESS_INDETERMINATE = -1;
        private static final int TYPE_START = 0;
        public final float progress;
        public final File resultFile;
        public final int type;

        public static DownloadEvent createStartEvent() {
            return new DownloadEvent(0, 0.0f, null);
        }

        public static DownloadEvent createIndeterminateProgressEvent() {
            return new DownloadEvent();
        }

        public static DownloadEvent createProgressEvent(float progress) {
            return new DownloadEvent(progress);
        }

        public static DownloadEvent createDoneEvent(File resultFile) {
            return new DownloadEvent(resultFile);
        }

        private DownloadEvent() {
            this(-1, 0.0f, null);
        }

        private DownloadEvent(float progress) {
            this(1, progress, null);
        }

        private DownloadEvent(File resultFile) {
            this(2, 0.0f, resultFile);
        }

        public DownloadEvent(int type, float progress, File resultFile) {
            this.type = type;
            this.progress = progress;
            this.resultFile = resultFile;
        }

        public boolean isIndeterminateProgressEvent() {
            return this.type == -1;
        }

        public boolean isProgressEvent() {
            return this.type == 1;
        }

        public boolean isDoneEvent() {
            return this.type == 2;
        }

        public boolean isStartEvent() {
            return this.type == 0;
        }

        public String toString() {
            if (isStartEvent()) {
                return "DownloadEvent:TYPE_START";
            }
            if (isIndeterminateProgressEvent()) {
                return "DownloadEvent:TYPE_PROGRESS_INDETERMINATE";
            }
            if (isProgressEvent()) {
                return "DownloadEvent:TYPE_PROGRESS:" + this.progress;
            }
            return "DownloadEvent:TYPE_DONE:" + this.resultFile.getAbsolutePath();
        }
    }

    /* loaded from: classes2.dex */
    private static class ProgressResponseBody extends ResponseBody {
        private BufferedSource bufferedSource;
        private final ObservableEmitter<DownloadEvent> observableEmitter;
        private final ResponseBody responseBody;

        public ProgressResponseBody(ResponseBody responseBody, ObservableEmitter<DownloadEvent> observableEmitterr) {
            this.responseBody = responseBody;
            this.observableEmitter = observableEmitterr;
        }

        @Override // okhttp3.ResponseBody
        public MediaType contentType() {
            return this.responseBody.contentType();
        }

        @Override // okhttp3.ResponseBody
        public long contentLength() {
            return this.responseBody.contentLength();
        }

        @Override // okhttp3.ResponseBody
        public BufferedSource source() {
            if (this.bufferedSource == null) {
                this.bufferedSource = Okio.buffer(source(this.responseBody.source()));
            }
            return this.bufferedSource;
        }

        private Source source(Source source) {
            final AtomicBoolean firstRead = new AtomicBoolean(true);
            return new ForwardingSource(source) { // from class: com.vk.core.network.RxFileDownloader.ProgressResponseBody.1
                long totalBytesRead = 0;

                @Override // okio.ForwardingSource, okio.Source
                public long read(Buffer sink, long byteCount) throws IOException {
                    long bytesRead = super.read(sink, byteCount);
                    if (firstRead.get()) {
                        firstRead.set(false);
                        if (!ProgressResponseBody.this.observableEmitter.isDisposed()) {
                            ProgressResponseBody.this.observableEmitter.onNext(DownloadEvent.createStartEvent());
                        }
                    }
                    this.totalBytesRead = (bytesRead != -1 ? bytesRead : 0L) + this.totalBytesRead;
                    if (!ProgressResponseBody.this.observableEmitter.isDisposed()) {
                        if (ProgressResponseBody.this.responseBody.contentLength() == 0) {
                            ProgressResponseBody.this.observableEmitter.onNext(DownloadEvent.createIndeterminateProgressEvent());
                        } else {
                            float a = (float) this.totalBytesRead;
                            float b = (float) ProgressResponseBody.this.responseBody.contentLength();
                            ProgressResponseBody.this.observableEmitter.onNext(DownloadEvent.createProgressEvent(a / b));
                        }
                        return bytesRead;
                    }
                    throw new DownloadCancelationException();
                }
            };
        }
    }

    /* loaded from: classes2.dex */
    private static class DownloadCancelationException extends IOException {
        private DownloadCancelationException() {
        }
    }

    private static Cancellable createResponseCancellable(final Response response) {
        return new Cancellable() { // from class: com.vk.core.network.RxFileDownloader.2
            @Override // io.reactivex.functions.Cancellable
            public void cancel() throws Exception {
                RxFileDownloader.backgroundThread.submit(new Runnable() { // from class: com.vk.core.network.RxFileDownloader.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            Response.this.close();
                        } catch (Exception e) {
                        }
                    }
                });
            }
        };
    }
}
