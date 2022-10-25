package com.vkontakte.android.upload;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.media.session.PlaybackStateCompat;
import com.vk.analytics.Analytics;
import com.vk.attachpicker.util.CameraUtils;
import com.vk.attachpicker.util.Prefs;
import com.vk.core.util.FileUtils;
import com.vk.stories.StoriesController;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.model.StoryUploadParams;
import com.vk.stories.util.VideoCompressor;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.stories.StoriesGetUploadServer;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.io.File;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class VideoStoryUploadTask extends HTTPResumableUploadTask<StoryEntry> implements Parcelable, VideoCompressor.CompressDelegate {
    public static final Parcelable.Creator<VideoStoryUploadTask> CREATOR = new Parcelable.Creator<VideoStoryUploadTask>() { // from class: com.vkontakte.android.upload.VideoStoryUploadTask.2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public VideoStoryUploadTask mo1139createFromParcel(Parcel source) {
            return new VideoStoryUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public VideoStoryUploadTask[] mo1140newArray(int size) {
            return new VideoStoryUploadTask[size];
        }
    };
    private static final String LOG = "VideoStoryUploadTask";
    private Exception compressException;
    private float compressProgress;
    private final VideoCompressor.VideoCompressorParameters parameters;
    private VideoCompressor.RenderTask renderTask;
    private StoryEntry story;
    private final StoryUploadParams storyUploadParams;

    public VideoStoryUploadTask(Context context, StoryUploadParams storyUploadParams, VideoCompressor.VideoCompressorParameters parameters) {
        super(context, parameters.inputVideo().getAbsolutePath());
        this.storyUploadParams = storyUploadParams;
        this.parameters = parameters;
        init();
    }

    protected VideoStoryUploadTask(Parcel in) {
        super(in);
        this.storyUploadParams = (StoryUploadParams) in.readParcelable(StoryUploadParams.class.getClassLoader());
        this.parameters = (VideoCompressor.VideoCompressorParameters) in.readParcelable(VideoCompressor.VideoCompressorParameters.class.getClassLoader());
        this.story = (StoryEntry) in.readParcelable(StoryEntry.class.getClassLoader());
        init();
    }

    private void init() {
        Intent openIntent = new DialogsFragment.Builder().intent(VKApplication.context);
        PendingIntent intent = PendingIntent.getActivity(VKApplication.context, 0, openIntent, 134217728);
        setDoneNotification(VKApplication.context.getString(R.string.story_sent), null, intent);
    }

    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
    public void onProgress(int progress) {
        this.compressProgress = progress / 100.0f;
    }

    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
    public void onBytes(int bytes) {
        setWrittenFileBytesCount(bytes);
    }

    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
    public void onFinish(long time, File resultFile) {
        this.renderTask = null;
        StoriesController.onVideoUploadTaskCompressFinish(this.id, resultFile);
        setFileWriteFinished(true);
        if (Prefs.storiesPrefs().getBoolean("save_stories")) {
            CameraUtils.saveVideo(resultFile);
        }
    }

    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
    public void onCancel() {
        setFileWriteFinished(false);
        setPreProcessFilePath(null);
        this.renderTask = null;
    }

    @Override // com.vk.stories.util.VideoCompressor.CompressDelegate
    public void onError(Exception e) {
        setFileWriteFinished(false);
        setPreProcessFilePath(null);
        this.renderTask = null;
        this.compressException = e;
        Analytics.logException(e);
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected void waitNewBytesWritten(long fileLength) throws Exception {
        if (this.compressException != null) {
            throw this.compressException;
        }
        super.waitNewBytesWritten(fileLength);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = StoriesGetUploadServer.getVideoUploadServer(this.storyUploadParams).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.VideoStoryUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                VideoStoryUploadTask.this.server = url;
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
    protected String preProcessFile() {
        if (this.renderTask == null && getPreProcessFilePath() == null) {
            setFileWriteFinished(false);
            this.renderTask = VideoCompressor.render(this.parameters, true, this);
            return this.renderTask.getOutputFile().getAbsolutePath();
        }
        return getPreProcessFilePath();
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask
    public void doUpload() throws UploadException {
        try {
            super.doUpload();
        } catch (UploadException ex) {
            dropState();
            throw ex;
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.story = new StoryEntry(jo.getJSONObject(ServerKeys.RESPONSE).getJSONObject("story"));
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask
    public void cancel() {
        if (this.renderTask != null) {
            this.renderTask.cancel();
            this.renderTask = null;
        }
        super.cancel();
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        FileUtils.clearOldFilesInUploads();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.upload.UploadTask
    public void onProgress(int loaded, int total, boolean indeterminate) {
        super.onProgress((int) (this.compressProgress * 100.0f), 100, indeterminate);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public StoryEntry mo1144getResult() {
        return this.story;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return !this.storyUploadParams.isAddToNews() && this.storyUploadParams.getUserIds() != null && this.storyUploadParams.getUserIds().size() > 0;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.story_sending);
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "stories.getVideoUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask
    protected long skipNFirstBytesUntilFileIsReady() {
        return PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.HTTPResumableUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeParcelable(this.storyUploadParams, flags);
        dest.writeParcelable(this.parameters, flags);
        dest.writeParcelable(this.story, flags);
    }
}
