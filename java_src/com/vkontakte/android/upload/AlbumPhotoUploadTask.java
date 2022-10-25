package com.vkontakte.android.upload;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.PhotosGetUploadServer;
import com.vkontakte.android.api.photos.PhotosSave;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class AlbumPhotoUploadTask extends PhotoUploadTask<Photo> implements Parcelable {
    public static final Parcelable.Creator<AlbumPhotoUploadTask> CREATOR = new Parcelable.Creator<AlbumPhotoUploadTask>() { // from class: com.vkontakte.android.upload.AlbumPhotoUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public AlbumPhotoUploadTask mo1112createFromParcel(Parcel source) {
            return new AlbumPhotoUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public AlbumPhotoUploadTask[] mo1113newArray(int size) {
            return new AlbumPhotoUploadTask[size];
        }
    };
    private int albumID;
    private String description;
    private String mForSaveHash;
    private String mForSavePhotoList;
    private String mForSaveServer;
    private int ownerID;
    private Photo result;
    private boolean showNotification;

    public AlbumPhotoUploadTask(Context context, String fileName, int aid, int oid, String descr, boolean notify) {
        super(context, fileName);
        this.showNotification = true;
        this.albumID = aid;
        this.ownerID = oid;
        this.description = descr;
        this.showNotification = notify;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return "file1";
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new PhotosGetUploadServer(this.albumID, this.ownerID).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.AlbumPhotoUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                AlbumPhotoUploadTask.this.server = url;
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
            this.mForSavePhotoList = jo.getString("photos_list");
            this.mForSaveHash = jo.getString(SettingsJsonConstants.ICON_HASH_KEY);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new PhotosSave(this.albumID, this.ownerID, this.mForSaveServer, this.mForSavePhotoList, this.mForSaveHash, this.description).setCallback(new SimpleCallback<List<Photo>>() { // from class: com.vkontakte.android.upload.AlbumPhotoUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(List<Photo> photos) {
                if (photos.size() > 0) {
                    AlbumPhotoUploadTask.this.result = photos.get(0);
                }
            }
        });
        this.currentApiRequest = req;
        boolean res = req.execSync();
        this.currentApiRequest = null;
        if (!res) {
            throw new UploadException("can't save photo");
        }
        if (this.result == null) {
            throw new UploadException("didn't get photo object");
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        Intent intent = new Intent(Upload.ACTION_PHOTO_ADDED);
        intent.putExtra("photo", this.result);
        intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, this.result.albumID);
        this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_photo);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return this.showNotification;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public Photo mo1144getResult() {
        return this.result;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "photos.getUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.PhotoUploadTask, com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.albumID);
        dest.writeInt(this.ownerID);
        dest.writeString(this.description);
        dest.writeInt(this.showNotification ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private AlbumPhotoUploadTask(Parcel in) {
        super(in);
        boolean z = true;
        this.showNotification = true;
        this.albumID = in.readInt();
        this.ownerID = in.readInt();
        this.description = in.readString();
        this.showNotification = in.readInt() != 1 ? false : z;
    }
}
