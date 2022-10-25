package net.ypresto.androidtranscoder;

import android.media.MediaFormat;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import net.ypresto.androidtranscoder.engine.MediaTranscoderEngine;
import net.ypresto.androidtranscoder.format.MediaFormatPresets;
import net.ypresto.androidtranscoder.format.MediaFormatStrategy;
/* loaded from: classes.dex */
public class MediaTranscoder {
    private static final int MAXIMUM_THREAD = 1;
    private static final String TAG = "MediaTranscoder";
    private static volatile MediaTranscoder sMediaTranscoder;
    private ThreadPoolExecutor mExecutor = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), new ThreadFactory() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.1
        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            return new Thread(r, "MediaTranscoder-Worker");
        }
    });

    /* loaded from: classes3.dex */
    public interface Listener {
        void onTranscodeCanceled();

        void onTranscodeCompleted();

        void onTranscodeFailed(Exception exc);

        void onTranscodeProgress(double d);
    }

    private MediaTranscoder() {
    }

    public static MediaTranscoder getInstance() {
        if (sMediaTranscoder == null) {
            synchronized (MediaTranscoder.class) {
                if (sMediaTranscoder == null) {
                    sMediaTranscoder = new MediaTranscoder();
                }
            }
        }
        return sMediaTranscoder;
    }

    @Deprecated
    public Future<Void> transcodeVideo(FileDescriptor inFileDescriptor, String outPath, Listener listener) {
        return transcodeVideo(inFileDescriptor, outPath, new MediaFormatStrategy() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.2
            @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
            public MediaFormat createVideoOutputFormat(MediaFormat inputFormat) {
                return MediaFormatPresets.getExportPreset960x540();
            }

            @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
            public MediaFormat createAudioOutputFormat(MediaFormat inputFormat) {
                return null;
            }
        }, listener);
    }

    public Future<Void> transcodeVideo(String inPath, String outPath, MediaFormatStrategy outFormatStrategy, final Listener listener) throws IOException {
        FileInputStream fileInputStream = null;
        try {
            final FileInputStream fileInputStream2 = new FileInputStream(inPath);
            try {
                FileDescriptor inFileDescriptor = fileInputStream2.getFD();
                return transcodeVideo(inFileDescriptor, outPath, outFormatStrategy, new Listener() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.3
                    @Override // net.ypresto.androidtranscoder.MediaTranscoder.Listener
                    public void onTranscodeProgress(double progress) {
                        listener.onTranscodeProgress(progress);
                    }

                    @Override // net.ypresto.androidtranscoder.MediaTranscoder.Listener
                    public void onTranscodeCompleted() {
                        closeStream();
                        listener.onTranscodeCompleted();
                    }

                    @Override // net.ypresto.androidtranscoder.MediaTranscoder.Listener
                    public void onTranscodeCanceled() {
                        closeStream();
                        listener.onTranscodeCanceled();
                    }

                    @Override // net.ypresto.androidtranscoder.MediaTranscoder.Listener
                    public void onTranscodeFailed(Exception exception) {
                        closeStream();
                        listener.onTranscodeFailed(exception);
                    }

                    private void closeStream() {
                        try {
                            fileInputStream2.close();
                        } catch (IOException e) {
                            Log.e(MediaTranscoder.TAG, "Can't close input stream: ", e);
                        }
                    }
                });
            } catch (IOException e) {
                e = e;
                fileInputStream = fileInputStream2;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException eClose) {
                        Log.e(TAG, "Can't close input stream: ", eClose);
                    }
                }
                throw e;
            }
        } catch (IOException e2) {
            e = e2;
        }
    }

    public Future<Void> transcodeVideo(FileDescriptor inFileDescriptor, String outPath, MediaFormatStrategy outFormatStrategy, Listener listener) {
        Looper looper = Looper.myLooper();
        if (looper == null) {
            looper = Looper.getMainLooper();
        }
        Handler handler = new Handler(looper);
        AtomicReference<Future<Void>> futureReference = new AtomicReference<>();
        Future<Void> createdFuture = this.mExecutor.submit(new AnonymousClass4(handler, listener, inFileDescriptor, outPath, outFormatStrategy, futureReference));
        futureReference.set(createdFuture);
        return createdFuture;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: net.ypresto.androidtranscoder.MediaTranscoder$4  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass4 implements Callable<Void> {
        final /* synthetic */ AtomicReference val$futureReference;
        final /* synthetic */ Handler val$handler;
        final /* synthetic */ FileDescriptor val$inFileDescriptor;
        final /* synthetic */ Listener val$listener;
        final /* synthetic */ MediaFormatStrategy val$outFormatStrategy;
        final /* synthetic */ String val$outPath;

        AnonymousClass4(Handler handler, Listener listener, FileDescriptor fileDescriptor, String str, MediaFormatStrategy mediaFormatStrategy, AtomicReference atomicReference) {
            this.val$handler = handler;
            this.val$listener = listener;
            this.val$inFileDescriptor = fileDescriptor;
            this.val$outPath = str;
            this.val$outFormatStrategy = mediaFormatStrategy;
            this.val$futureReference = atomicReference;
        }

        @Override // java.util.concurrent.Callable
        public Void call() throws Exception {
            Exception caughtException = null;
            try {
                MediaTranscoderEngine engine = new MediaTranscoderEngine();
                engine.setProgressCallback(new MediaTranscoderEngine.ProgressCallback() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.4.1
                    @Override // net.ypresto.androidtranscoder.engine.MediaTranscoderEngine.ProgressCallback
                    public void onProgress(final double progress) {
                        AnonymousClass4.this.val$handler.post(new Runnable() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.4.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AnonymousClass4.this.val$listener.onTranscodeProgress(progress);
                            }
                        });
                    }
                });
                engine.setDataSource(this.val$inFileDescriptor);
                engine.transcodeVideo(this.val$outPath, this.val$outFormatStrategy);
            } catch (IOException e) {
                Log.w(MediaTranscoder.TAG, "Transcode failed: input file (fd: " + this.val$inFileDescriptor.toString() + ") not found or could not open output file ('" + this.val$outPath + "') .", e);
                caughtException = e;
            } catch (InterruptedException e2) {
                Log.i(MediaTranscoder.TAG, "Cancel transcode video file.", e2);
                caughtException = e2;
            } catch (RuntimeException e3) {
                Log.e(MediaTranscoder.TAG, "Fatal error while transcoding, this might be invalid format or bug in engine or Android.", e3);
                caughtException = e3;
            }
            final Exception exception = caughtException;
            this.val$handler.post(new Runnable() { // from class: net.ypresto.androidtranscoder.MediaTranscoder.4.2
                @Override // java.lang.Runnable
                public void run() {
                    if (exception == null) {
                        AnonymousClass4.this.val$listener.onTranscodeCompleted();
                        return;
                    }
                    Future<Void> future = (Future) AnonymousClass4.this.val$futureReference.get();
                    if (future != null && future.isCancelled()) {
                        AnonymousClass4.this.val$listener.onTranscodeCanceled();
                    } else {
                        AnonymousClass4.this.val$listener.onTranscodeFailed(exception);
                    }
                }
            });
            if (exception != null) {
                throw exception;
            }
            return null;
        }
    }
}
