package com.vkontakte.android.upload;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.PhotosGetWallUploadServer;
import com.vkontakte.android.api.photos.PhotosSaveWallPhoto;
import com.vkontakte.android.attachments.PhotoAttachment;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class WallPhotoUploadTask extends PhotoUploadTask<PhotoAttachment> implements Parcelable {
    public static final Parcelable.Creator<WallPhotoUploadTask> CREATOR = new Parcelable.Creator<WallPhotoUploadTask>() { // from class: com.vkontakte.android.upload.WallPhotoUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public WallPhotoUploadTask mo1145createFromParcel(Parcel source) {
            return new WallPhotoUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public WallPhotoUploadTask[] mo1146newArray(int size) {
            return new WallPhotoUploadTask[size];
        }
    };
    private String mForSaveHash;
    private String mForSavePhoto;
    private String mForSaveServer;
    private int ownerID;
    private PhotoAttachment result;

    public WallPhotoUploadTask(Context context, String fileName, int oid) {
        super(context, fileName);
        this.ownerID = oid;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return "photo";
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new PhotosGetWallUploadServer(this.ownerID).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.WallPhotoUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                WallPhotoUploadTask.this.server = url;
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
            this.mForSavePhoto = jo.getString("photo");
            this.mForSaveHash = jo.getString(SettingsJsonConstants.ICON_HASH_KEY);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new PhotosSaveWallPhoto(this.ownerID, this.mForSaveServer, this.mForSavePhoto, this.mForSaveHash).setCallback(new SimpleCallback<PhotoAttachment>() { // from class: com.vkontakte.android.upload.WallPhotoUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(PhotoAttachment photo) {
                WallPhotoUploadTask.this.result = photo;
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
    /* renamed from: getResult  reason: collision with other method in class */
    public PhotoAttachment mo1144getResult() {
        return this.result;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "photos.getWallUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.PhotoUploadTask, com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.ownerID);
    }

    private WallPhotoUploadTask(Parcel in) {
        super(in);
        this.ownerID = in.readInt();
    }
}
