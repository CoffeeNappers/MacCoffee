package com.vkontakte.android.upload;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.FileUtils;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.model.StoryUploadParams;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.stories.StoriesGetUploadServer;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class PhotoStoryUploadTask extends HTTPFileUploadTask<StoryEntry> implements Parcelable {
    public static final Parcelable.Creator<PhotoStoryUploadTask> CREATOR = new Parcelable.Creator<PhotoStoryUploadTask>() { // from class: com.vkontakte.android.upload.PhotoStoryUploadTask.2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public PhotoStoryUploadTask mo1134createFromParcel(Parcel source) {
            return new PhotoStoryUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public PhotoStoryUploadTask[] mo1135newArray(int size) {
            return new PhotoStoryUploadTask[size];
        }
    };
    private StoryEntry story;
    private final StoryUploadParams storyUploadParams;

    public PhotoStoryUploadTask(Context context, String fileName, StoryUploadParams storyUploadParams) {
        super(context, fileName);
        this.storyUploadParams = storyUploadParams;
        init();
    }

    private void init() {
        Intent openIntent = new DialogsFragment.Builder().intent(VKApplication.context);
        PendingIntent intent = PendingIntent.getActivity(VKApplication.context, 0, openIntent, 134217728);
        setDoneNotification(VKApplication.context.getString(R.string.story_sent), null, intent);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return !this.storyUploadParams.isAddToNews() && this.storyUploadParams.getUserIds() != null && this.storyUploadParams.getUserIds().size() > 0;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return UriUtil.LOCAL_FILE_SCHEME;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = StoriesGetUploadServer.getPhotoUploadServer(this.storyUploadParams).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.PhotoStoryUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                PhotoStoryUploadTask.this.server = url;
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

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask
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

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.story = new StoryEntry(jo.getJSONObject(ServerKeys.RESPONSE).getJSONObject("story"));
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        FileUtils.clearOldFilesInUploads();
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public StoryEntry mo1144getResult() {
        return this.story;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "stories.getPhotoUploadServer";
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.story_sending);
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeParcelable(this.storyUploadParams, flags);
        dest.writeParcelable(this.story, flags);
    }

    protected PhotoStoryUploadTask(Parcel in) {
        super(in);
        this.storyUploadParams = (StoryUploadParams) in.readParcelable(StoryUploadParams.class.getClassLoader());
        this.story = (StoryEntry) in.readParcelable(StoryEntry.class.getClassLoader());
        init();
    }
}
