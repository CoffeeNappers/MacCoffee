package com.vkontakte.android.upload;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetUploadServer;
import com.vkontakte.android.api.audio.AudioSave;
import com.vkontakte.android.audio.MusicTrack;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class AudioUploadTask extends HTTPFileUploadTask<MusicTrack> implements Parcelable {
    public static final Parcelable.Creator<AudioUploadTask> CREATOR = new Parcelable.Creator<AudioUploadTask>() { // from class: com.vkontakte.android.upload.AudioUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public AudioUploadTask mo1118createFromParcel(Parcel source) {
            return new AudioUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public AudioUploadTask[] mo1119newArray(int size) {
            return new AudioUploadTask[size];
        }
    };
    private String mForSaveAudio;
    private String mForSaveHash;
    private String mForSaveServer;
    private boolean needShowNotification;
    private MusicTrack result;

    public AudioUploadTask(Context context, String fileName) {
        this(context, fileName, false);
    }

    public AudioUploadTask(Context context, String fileName, boolean needShowNotification) {
        super(context, fileName);
        this.needShowNotification = needShowNotification;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return UriUtil.LOCAL_FILE_SCHEME;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new AudioGetUploadServer().setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.AudioUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                AudioUploadTask.this.server = url;
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

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.mForSaveServer = jo.getString("server");
            this.mForSaveAudio = jo.getString(MimeTypes.BASE_TYPE_AUDIO);
            this.mForSaveHash = jo.getString(SettingsJsonConstants.ICON_HASH_KEY);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new AudioSave(this.mForSaveAudio, this.mForSaveHash, this.mForSaveServer).setCallback(new Callback<MusicTrack>() { // from class: com.vkontakte.android.upload.AudioUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(MusicTrack audio) {
                AudioUploadTask.this.result = audio;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
            }
        });
        this.currentApiRequest = req;
        boolean res = req.execSync();
        this.currentApiRequest = null;
        if (!res) {
            throw new UploadException("can't save photo");
        }
        if (this.result == null) {
            throw new UploadException("didn't get audio object");
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public MusicTrack mo1144getResult() {
        return this.result;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "audio.getUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_audio);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return this.needShowNotification;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
    }

    private AudioUploadTask(Parcel in) {
        super(in);
    }
}
