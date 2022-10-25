package com.vk.stories.util;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.Log;
import com.vk.core.util.FileUtils;
import com.vk.medianative.FFMpegVideoCompressor;
import com.vkontakte.android.VKApplication;
import java.io.File;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class VideoCompressor {
    private static final int AUDIO_BITRATE = 128000;
    private static final float FFMPEG_BITRATE_MULTIPLIER = 1.13f;
    private static final String TAG = "VideoCompressor";
    private static final int VIDEO_BITRATE = 1500000;
    private static final Handler uiHandler = new Handler(Looper.getMainLooper());
    private static final Executor ffMpegCompressExecutor = Executors.newSingleThreadExecutor();

    /* loaded from: classes2.dex */
    public interface CompressDelegate {
        void onBytes(int i);

        void onCancel();

        void onError(Exception exc);

        void onFinish(long j, File file);

        void onProgress(int i);
    }

    /* loaded from: classes2.dex */
    public interface RenderTask {
        void cancel();

        File getOutputFile();

        boolean isCanceled();
    }

    public static RenderTask render(VideoCompressorParameters parameters, boolean temp, Bitmap image, CompressDelegate compressDelegate) {
        return doFFMpegRender(parameters, temp, image, compressDelegate);
    }

    public static RenderTask render(VideoCompressorParameters parameters, boolean temp, CompressDelegate compressDelegate) {
        return doFFMpegRender(parameters, temp, null, compressDelegate);
    }

    private static RenderTask doFFMpegRender(VideoCompressorParameters parameters, boolean temp, Bitmap image, CompressDelegate compressDelegate) {
        File outputVideo;
        AtomicBoolean isCanceled = new AtomicBoolean();
        AtomicReference<FFMpegVideoCompressor> compressorAtomicReference = new AtomicReference<>();
        if (temp) {
            outputVideo = FileUtils.getTempUploadVideoFile();
        } else {
            outputVideo = FileUtils.getVideoFile();
        }
        FileUtils.touch(outputVideo);
        ffMpegCompressExecutor.execute(new AnonymousClass1(isCanceled, compressDelegate, parameters, outputVideo, image, compressorAtomicReference));
        return new AnonymousClass2(isCanceled, compressorAtomicReference, compressDelegate, outputVideo);
    }

    /* renamed from: com.vk.stories.util.VideoCompressor$1 */
    /* loaded from: classes2.dex */
    public static class AnonymousClass1 implements Runnable {
        final /* synthetic */ CompressDelegate val$compressDelegate;
        final /* synthetic */ AtomicReference val$compressorAtomicReference;
        final /* synthetic */ Bitmap val$image;
        final /* synthetic */ AtomicBoolean val$isCanceled;
        final /* synthetic */ File val$outputVideo;
        final /* synthetic */ VideoCompressorParameters val$parameters;

        AnonymousClass1(AtomicBoolean atomicBoolean, CompressDelegate compressDelegate, VideoCompressorParameters videoCompressorParameters, File file, Bitmap bitmap, AtomicReference atomicReference) {
            this.val$isCanceled = atomicBoolean;
            this.val$compressDelegate = compressDelegate;
            this.val$parameters = videoCompressorParameters;
            this.val$outputVideo = file;
            this.val$image = bitmap;
            this.val$compressorAtomicReference = atomicReference;
        }

        @Override // java.lang.Runnable
        public void run() {
            long start = SystemClock.uptimeMillis();
            if (this.val$isCanceled.get()) {
                VideoCompressor.uiHandler.post(VideoCompressor$1$$Lambda$1.lambdaFactory$(this.val$compressDelegate));
                return;
            }
            try {
                FFMpegVideoCompressor videoCompressor = new FFMpegVideoCompressor(VKApplication.context, VKApplication.deviceYear());
                videoCompressor.config(this.val$parameters.disableAudio ? 0 : VideoCompressor.AUDIO_BITRATE, 1695000, this.val$parameters.maxSize);
                videoCompressor.path(this.val$parameters.inputVideo, this.val$outputVideo);
                videoCompressor.mirror(this.val$parameters.mirror);
                videoCompressor.aspectRatio(this.val$parameters.aspectRatio);
                if (this.val$image != null) {
                    videoCompressor.addOverlay(this.val$image);
                } else {
                    videoCompressor.addOverlay(this.val$parameters.overlayFile);
                }
                videoCompressor.callback(new C02471());
                if (this.val$isCanceled.get()) {
                    VideoCompressor.uiHandler.post(VideoCompressor$1$$Lambda$2.lambdaFactory$(this.val$compressDelegate));
                    return;
                }
                this.val$compressorAtomicReference.set(videoCompressor);
                videoCompressor.startCompression(FileUtils.getTempAyuvFile().getAbsolutePath());
                videoCompressor.waitForCompression();
                this.val$compressorAtomicReference.set(null);
                long stop = SystemClock.uptimeMillis();
                VideoCompressor.uiHandler.post(VideoCompressor$1$$Lambda$4.lambdaFactory$(this.val$compressDelegate, stop, start, this.val$outputVideo));
            } catch (Exception e) {
                FileUtils.deleteFile(this.val$outputVideo);
                if (!this.val$isCanceled.get()) {
                    VideoCompressor.uiHandler.post(VideoCompressor$1$$Lambda$3.lambdaFactory$(this.val$compressDelegate, e));
                    this.val$compressorAtomicReference.set(null);
                }
            }
        }

        /* renamed from: com.vk.stories.util.VideoCompressor$1$1 */
        /* loaded from: classes2.dex */
        class C02471 implements FFMpegVideoCompressor.Callback {
            C02471() {
                AnonymousClass1.this = this$0;
            }

            @Override // com.vk.medianative.FFMpegVideoCompressor.Callback
            public void onVideoInfo(int width, int height, int videoFrames, int audioFrames, double fps, int sampleRate) {
                Log.d(VideoCompressor.TAG, String.format("width: %d, height: %d, videoFrames: %d, audioFrames: %d, fps: %f, sampleRate: %d", Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(videoFrames), Integer.valueOf(audioFrames), Double.valueOf(fps), Integer.valueOf(sampleRate)));
            }

            @Override // com.vk.medianative.FFMpegVideoCompressor.Callback
            public void onProgress(int progress) {
                if (!AnonymousClass1.this.val$isCanceled.get()) {
                    VideoCompressor.uiHandler.post(VideoCompressor$1$1$$Lambda$1.lambdaFactory$(AnonymousClass1.this.val$compressDelegate, progress));
                }
            }

            @Override // com.vk.medianative.FFMpegVideoCompressor.Callback
            public void onBytes(int bytes) {
                if (!AnonymousClass1.this.val$isCanceled.get()) {
                    VideoCompressor.uiHandler.post(VideoCompressor$1$1$$Lambda$2.lambdaFactory$(AnonymousClass1.this.val$compressDelegate, bytes));
                }
            }
        }
    }

    /* renamed from: com.vk.stories.util.VideoCompressor$2 */
    /* loaded from: classes2.dex */
    public static class AnonymousClass2 implements RenderTask {
        final /* synthetic */ CompressDelegate val$compressDelegate;
        final /* synthetic */ AtomicReference val$compressorAtomicReference;
        final /* synthetic */ AtomicBoolean val$isCanceled;
        final /* synthetic */ File val$outputVideo;

        AnonymousClass2(AtomicBoolean atomicBoolean, AtomicReference atomicReference, CompressDelegate compressDelegate, File file) {
            this.val$isCanceled = atomicBoolean;
            this.val$compressorAtomicReference = atomicReference;
            this.val$compressDelegate = compressDelegate;
            this.val$outputVideo = file;
        }

        @Override // com.vk.stories.util.VideoCompressor.RenderTask
        public void cancel() {
            this.val$isCanceled.set(true);
            FFMpegVideoCompressor videoCompressor = (FFMpegVideoCompressor) this.val$compressorAtomicReference.get();
            if (videoCompressor != null) {
                videoCompressor.forceStop();
                VideoCompressor.uiHandler.post(VideoCompressor$2$$Lambda$1.lambdaFactory$(this.val$compressDelegate));
                this.val$compressorAtomicReference.set(null);
            }
        }

        @Override // com.vk.stories.util.VideoCompressor.RenderTask
        public boolean isCanceled() {
            return this.val$isCanceled.get();
        }

        @Override // com.vk.stories.util.VideoCompressor.RenderTask
        public File getOutputFile() {
            return this.val$outputVideo;
        }
    }

    /* loaded from: classes2.dex */
    public static class VideoCompressorParameters implements Parcelable {
        public static final Parcelable.Creator<VideoCompressorParameters> CREATOR = new Parcelable.Creator<VideoCompressorParameters>() { // from class: com.vk.stories.util.VideoCompressor.VideoCompressorParameters.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public VideoCompressorParameters mo542createFromParcel(Parcel source) {
                return new VideoCompressorParameters(source);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public VideoCompressorParameters[] mo543newArray(int size) {
                return new VideoCompressorParameters[size];
            }
        };
        private float aspectRatio;
        private boolean disableAudio;
        private final File inputVideo;
        private int maxSize;
        private boolean mirror;
        private File overlayFile;
        private File previewFile;

        public VideoCompressorParameters(File inputVideo) {
            this.inputVideo = inputVideo;
        }

        public File inputVideo() {
            return this.inputVideo;
        }

        public File imageFile() {
            return this.overlayFile;
        }

        public VideoCompressorParameters imageFile(File imageFile) {
            this.overlayFile = imageFile;
            return this;
        }

        public File previewFile() {
            return this.previewFile;
        }

        public VideoCompressorParameters previewFile(File previewFile) {
            this.previewFile = previewFile;
            return this;
        }

        public boolean mirror() {
            return this.mirror;
        }

        public VideoCompressorParameters mirror(boolean mirror) {
            this.mirror = mirror;
            return this;
        }

        public boolean isDisableAudio() {
            return this.disableAudio;
        }

        public VideoCompressorParameters disableAudio(boolean disableAudio) {
            this.disableAudio = disableAudio;
            return this;
        }

        public float aspectRatio() {
            return this.aspectRatio;
        }

        public VideoCompressorParameters aspectRatio(float aspectRatio) {
            this.aspectRatio = aspectRatio;
            return this;
        }

        public int maxSize() {
            return this.maxSize;
        }

        public VideoCompressorParameters maxSize(int maxSize) {
            this.maxSize = maxSize;
            return this;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            byte b = 1;
            dest.writeSerializable(this.inputVideo);
            dest.writeSerializable(this.overlayFile);
            dest.writeSerializable(this.previewFile);
            dest.writeByte(this.mirror ? (byte) 1 : (byte) 0);
            if (!this.disableAudio) {
                b = 0;
            }
            dest.writeByte(b);
            dest.writeFloat(this.aspectRatio);
            dest.writeInt(this.maxSize);
        }

        protected VideoCompressorParameters(Parcel in) {
            boolean z = true;
            this.inputVideo = (File) in.readSerializable();
            this.overlayFile = (File) in.readSerializable();
            this.previewFile = (File) in.readSerializable();
            this.mirror = in.readByte() != 0;
            this.disableAudio = in.readByte() == 0 ? false : z;
            this.aspectRatio = in.readFloat();
            this.maxSize = in.readInt();
        }
    }
}
