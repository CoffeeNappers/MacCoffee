package com.vkontakte.android.upload;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.core.util.FileUtils;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGetById;
import com.vkontakte.android.api.video.VideoSave;
import com.vkontakte.android.media.video.VKFormatStrategy;
import com.vkontakte.android.media.video.VideoEncoderSettings;
import com.vkontakte.android.utils.OsUtil;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import net.ypresto.androidtranscoder.engine.MediaTranscoderEngine;
import net.ypresto.androidtranscoder.format.MediaFormatStrategy;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class VideoUploadTask extends HTTPResumableUploadTask<VideoFile> implements Parcelable {
    private static final float COMPRESS_PROGRESS_PART = 0.75f;
    public static final Parcelable.Creator<VideoUploadTask> CREATOR;
    private static final String LOG = "VideoUpload";
    private static final int PROGRESS_MAX = 100;
    private static final int PROGRESS_REQUEST_DELAY = 300;
    private String accessKey;
    private boolean compress;
    private String descr;
    private VideoEncoderSettings encoderSettings;
    private boolean isPrivate;
    private int lastProgress;
    private String mFromResponseDirectLink;
    private String name;
    private String outputFilePath;
    private int ownerID;
    private final Handler progressUpdateHandler;
    private VideoFile result;
    private boolean showNotification;
    private Thread transcodeThread;
    private int videoID;

    static native void nativeCancel();

    static native int nativeCompressFile(String str, String str2, int i, int i2, boolean z);

    static native double nativeGetProgress();

    static {
        if (!OsUtil.isAtLeastJB_MR2()) {
            System.loadLibrary("ffmpeg");
            System.loadLibrary("vkvideo");
        }
        CREATOR = new Parcelable.Creator<VideoUploadTask>() { // from class: com.vkontakte.android.upload.VideoUploadTask.4
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public VideoUploadTask mo1142createFromParcel(Parcel source) {
                return new VideoUploadTask(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public VideoUploadTask[] mo1143newArray(int size) {
                return new VideoUploadTask[size];
            }
        };
    }

    public VideoUploadTask(Context context, String fileName, String name, String description, VideoEncoderSettings videoEncoderSettings, boolean priv, int ownerID, boolean notify) {
        super(context, fileName);
        this.progressUpdateHandler = new Handler();
        this.name = name;
        this.descr = description;
        this.isPrivate = priv;
        this.ownerID = ownerID;
        this.showNotification = notify;
        this.encoderSettings = videoEncoderSettings;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        this.compress = prefs.getBoolean("compressVideos", true);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new VideoSave(this.ownerID, this.name, this.descr, this.isPrivate, true).setCallback(new Callback<VideoSave.Result>() { // from class: com.vkontakte.android.upload.VideoUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VideoSave.Result r) {
                VideoUploadTask.this.server = r.uploadUrl;
                VideoUploadTask.this.videoID = r.id;
                VideoUploadTask.this.accessKey = r.accessKey;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Log.e("vk", "Error getting upload server " + error);
            }
        });
        this.currentApiRequest = req;
        boolean result = req.execSync();
        this.currentApiRequest = null;
        if (!result) {
            throw new UploadException("can't get upload server");
        }
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.mFromResponseDirectLink = jo.optString("direct_link");
        } catch (JSONException ex) {
            throw new UploadException("Cannot parse response", ex);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new VideoGetById(this.ownerID, this.videoID, null).setCallback(new Callback<VideoFile>() { // from class: com.vkontakte.android.upload.VideoUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(VideoFile video) {
                if (!TextUtils.isEmpty(video.url240) && video.url240.contains(".vk.flv")) {
                    video.url240 = null;
                }
                VideoUploadTask.this.result = video;
                VideoUploadTask.this.result.accessKey = VideoUploadTask.this.accessKey;
                VideoUploadTask.this.result.canAdd = !VideoUploadTask.this.isPrivate;
                if (VideoUploadTask.this.mFromResponseDirectLink != null) {
                    VideoUploadTask.this.result.url240 = VideoUploadTask.this.mFromResponseDirectLink;
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Log.e("vk", "Error getting video " + error);
            }
        });
        this.currentApiRequest = req;
        boolean result = req.execSync();
        this.currentApiRequest = null;
        if (!result) {
            throw new UploadException("can't get video");
        }
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected String preProcessFile() {
        if (this.compress) {
            String sourcePath = this.file;
            if (sourcePath.startsWith("content:") || sourcePath.startsWith("file:")) {
                sourcePath = UploadUtils.resolvePath(Uri.parse(this.file));
                if ("unknown".equals(sourcePath)) {
                    return super.preProcessFile();
                }
            }
            File input = new File(sourcePath);
            if (input.exists()) {
                File outputFolder = new File(Environment.getExternalStorageDirectory(), ".vkontakte");
                File output = new File(outputFolder, "temp_upload.mp4");
                this.outputFilePath = output.getAbsolutePath();
                if (!outputFolder.exists()) {
                    outputFolder.mkdir();
                }
                if (OsUtil.isAtLeastJB_MR2()) {
                    return transcodeApi18(input, output);
                }
                return transcodeApi15(sourcePath, this.outputFilePath);
            }
            return super.preProcessFile();
        }
        return super.preProcessFile();
    }

    private String transcodeApi15(String inputPath, String outputPath) {
        String type = URLConnection.guessContentTypeFromName(inputPath);
        if (MimeTypes.VIDEO_MP4.equals(type)) {
            Runnable progressUpdateRunnable = new ProgressUpdateRunnable();
            this.progressUpdateHandler.postDelayed(progressUpdateRunnable, 300L);
            int result = nativeCompressFile(inputPath, outputPath, this.encoderSettings.getShorterLength(), this.encoderSettings.getBitrate(), APIController.API_DEBUG);
            this.progressUpdateHandler.removeCallbacks(progressUpdateRunnable);
            if (result != 0) {
                Log.d(LOG, "Upload without compress");
                this.compress = false;
                return null;
            }
            return outputPath;
        }
        Log.d(LOG, "Can not guess input video type format or format is not support: " + type);
        this.compress = false;
        return null;
    }

    private String transcodeApi18(File input, File output) {
        String str = null;
        try {
            MediaFormatStrategy strategy = new VKFormatStrategy(this.encoderSettings);
            this.transcodeThread = new Thread(new TranscodeRunnable(input, output.getAbsolutePath(), strategy));
            this.transcodeThread.start();
            this.transcodeThread.join();
            if (output.exists()) {
                str = output.getAbsolutePath();
            } else {
                this.compress = false;
            }
        } catch (Exception e) {
            Log.w(LOG, "Transcoding process was interrupted");
            this.compress = false;
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(18)
    public void transcodeVideo(File inputFile, String outputPath, MediaFormatStrategy strategy) {
        FileInputStream fileInputStream = null;
        FileDescriptor fileDescriptor = null;
        try {
            FileInputStream fileInputStream2 = new FileInputStream(inputFile);
            try {
                fileDescriptor = fileInputStream2.getFD();
                MediaTranscoderEngine engine = new MediaTranscoderEngine();
                engine.setProgressCallback(new MediaTranscoderEngine.ProgressCallback() { // from class: com.vkontakte.android.upload.VideoUploadTask.3
                    @Override // net.ypresto.androidtranscoder.engine.MediaTranscoderEngine.ProgressCallback
                    public void onProgress(double progress) {
                        VideoUploadTask.this.postProgress(progress);
                    }
                });
                engine.setDataSource(fileDescriptor);
                engine.transcodeVideo(outputPath, strategy);
            } catch (IOException e) {
                e = e;
                fileInputStream = fileInputStream2;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException eClose) {
                        Log.e(LOG, "Can't close input stream: ", eClose);
                    }
                }
                if (fileDescriptor != null) {
                    Log.w(LOG, "Transcode failed: input file (fd: " + fileDescriptor.toString() + ") not found or could not open output file ('" + outputPath + "') .", e);
                }
                removeTempCompressFile();
            } catch (InterruptedException e2) {
                Log.i(LOG, "Cancel transcode video file.");
                removeTempCompressFile();
            } catch (Throwable th) {
                e = th;
                Log.e(LOG, "Fatal error while transcoding, this might be invalid format or bug in engine or Android.", e);
                removeTempCompressFile();
            }
        } catch (IOException e3) {
            e = e3;
        } catch (InterruptedException e4) {
        } catch (Throwable th2) {
            e = th2;
        }
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask
    public void cancel() {
        if (OsUtil.isAtLeastJB_MR2()) {
            if (this.transcodeThread != null) {
                this.transcodeThread.interrupt();
            }
        } else {
            nativeCancel();
        }
        removeTempFile();
        super.cancel();
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        removeTempFile();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.upload.UploadTask
    public void onProgress(int loaded, int total, boolean indeterminate) {
        if (this.compress) {
            float progress = loaded / total;
            super.onProgress(((int) (0.25f * progress * 100.0f)) + 75, 100, indeterminate);
            return;
        }
        super.onProgress(loaded, total, indeterminate);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public VideoFile mo1144getResult() {
        return this.result;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return this.showNotification;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_video);
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "video.save";
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        super.writeToParcel(dest, flags);
        dest.writeString(this.name);
        dest.writeString(this.descr);
        dest.writeByte(this.isPrivate ? (byte) 1 : (byte) 0);
        dest.writeInt(this.ownerID);
        dest.writeInt(this.videoID);
        dest.writeByte(this.showNotification ? (byte) 1 : (byte) 0);
        if (!this.compress) {
            b = 0;
        }
        dest.writeByte(b);
        dest.writeParcelable(this.encoderSettings, 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private VideoUploadTask(Parcel in) {
        super(in);
        boolean z = true;
        this.progressUpdateHandler = new Handler();
        this.name = in.readString();
        this.descr = in.readString();
        this.isPrivate = in.readByte() != 0;
        this.ownerID = in.readInt();
        this.videoID = in.readInt();
        this.showNotification = in.readByte() != 0;
        this.compress = in.readByte() == 0 ? false : z;
        this.encoderSettings = (VideoEncoderSettings) in.readParcelable(VideoEncoderSettings.class.getClassLoader());
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected long skipNFirstBytesUntilFileIsReady() {
        return 0L;
    }

    private void removeTempCompressFile() {
        if (this.outputFilePath != null) {
            File tempFile = new File(this.outputFilePath);
            if (tempFile.exists()) {
                tempFile.delete();
            }
        }
    }

    private void removeTempFile() {
        removeTempCompressFile();
        String sourcePath = this.file;
        if (sourcePath.startsWith("content:") || sourcePath.startsWith("file:")) {
            sourcePath = UploadUtils.resolvePath(Uri.parse(this.file));
            if ("unknown".equals(sourcePath)) {
                return;
            }
        }
        if (!TextUtils.isEmpty(sourcePath) && sourcePath.contains(".vkontakte/TEMP_TRIM_")) {
            FileUtils.deleteFile(new File(sourcePath));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postProgress(double progress) {
        int percentage = (int) (0.75d * progress * 100.0d);
        if (this.lastProgress != percentage) {
            this.lastProgress = percentage;
            super.onProgress(percentage, 100, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ProgressUpdateRunnable implements Runnable {
        private ProgressUpdateRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            VideoUploadTask.this.postProgress(VideoUploadTask.nativeGetProgress());
            VideoUploadTask.this.progressUpdateHandler.postDelayed(this, 300L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class TranscodeRunnable implements Runnable {
        private final File input;
        private final String outputPath;
        private final MediaFormatStrategy strategy;

        public TranscodeRunnable(File input, String outputPath, MediaFormatStrategy strategy) {
            this.input = input;
            this.outputPath = outputPath;
            this.strategy = strategy;
        }

        @Override // java.lang.Runnable
        public void run() {
            VideoUploadTask.this.transcodeVideo(this.input, this.outputPath, this.strategy);
        }
    }
}
