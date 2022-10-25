package com.vkontakte.android.upload;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.graphics.BitmapFactory;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.PhotosGetOwnerPhotoUploadServer;
import com.vkontakte.android.api.photos.PhotosSaveOwnerPhoto;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.FileInputStream;
import java.io.IOException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class ProfilePhotoUploadTask extends PhotoUploadTask<Photo> implements Parcelable {
    public static final Parcelable.Creator<ProfilePhotoUploadTask> CREATOR = new Parcelable.Creator<ProfilePhotoUploadTask>() { // from class: com.vkontakte.android.upload.ProfilePhotoUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ProfilePhotoUploadTask mo1136createFromParcel(Parcel source) {
            return new ProfilePhotoUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ProfilePhotoUploadTask[] mo1137newArray(int size) {
            return new ProfilePhotoUploadTask[size];
        }
    };
    private String mForSaveHash;
    private String mForSavePhoto;
    private String mForSaveServer;
    private float mThumbBottom;
    private float mThumbLeft;
    private float mThumbRight;
    private float mThumbTop;
    private boolean notify;
    private int ownerID;
    private String result;

    public ProfilePhotoUploadTask(Context context, String fileName, int oid, boolean showNotification, float thumbLeft, float thumbTop, float thumbRight, float thumbBottom) {
        super(context, fileName);
        setDisableDownscale(true);
        this.ownerID = oid;
        this.notify = showNotification;
        setDoneNotification(context.getString(R.string.photo_upload_ok), context.getString(R.string.photo_upload_ok_long), PendingIntent.getActivity(context, 0, new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + this.ownerID)), 0));
        this.mThumbLeft = thumbLeft;
        this.mThumbTop = thumbTop;
        this.mThumbRight = thumbRight;
        this.mThumbBottom = thumbBottom;
        Log.d("Upload", String.format("%fx%f, %f,%f", Float.valueOf(this.mThumbLeft), Float.valueOf(this.mThumbTop), Float.valueOf(this.mThumbRight), Float.valueOf(this.mThumbBottom)));
    }

    public ProfilePhotoUploadTask(Context context, String fileName, int oid, boolean showNotification) {
        this(context, fileName, oid, showNotification, -1.0f, -1.0f, -1.0f, -1.0f);
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return "photo";
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new PhotosGetOwnerPhotoUploadServer(this.ownerID).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.ProfilePhotoUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                String realName;
                ProfilePhotoUploadTask.this.server = url;
                if (ProfilePhotoUploadTask.this.mThumbLeft > 0.0f) {
                    boolean reverseThePolarity = false;
                    try {
                        if (!ProfilePhotoUploadTask.this.file.startsWith("content:") && (realName = UploadUtils.resolvePath(Uri.parse(ProfilePhotoUploadTask.this.file))) != null) {
                            try {
                                ExifInterface exif = new ExifInterface(realName);
                                int orientation = exif.getAttributeInt("Orientation", 0);
                                reverseThePolarity = orientation == 8 || orientation == 6;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        BitmapFactory.Options options = new BitmapFactory.Options();
                        options.inJustDecodeBounds = true;
                        AssetFileDescriptor f = ProfilePhotoUploadTask.this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(ProfilePhotoUploadTask.this.file), "r");
                        FileInputStream is = f.createInputStream();
                        BitmapFactory.decodeStream(is, null, options);
                        int left = (int) ((reverseThePolarity ? options.outHeight : options.outWidth) * ProfilePhotoUploadTask.this.mThumbLeft);
                        int top = (int) ((reverseThePolarity ? options.outWidth : options.outHeight) * ProfilePhotoUploadTask.this.mThumbTop);
                        int right = (int) ((reverseThePolarity ? options.outHeight : options.outWidth) * ProfilePhotoUploadTask.this.mThumbRight);
                        int bottom = (int) ((reverseThePolarity ? options.outWidth : options.outHeight) * ProfilePhotoUploadTask.this.mThumbBottom);
                        int width = Math.min(right - left, bottom - top);
                        StringBuilder sb = new StringBuilder();
                        ProfilePhotoUploadTask profilePhotoUploadTask = ProfilePhotoUploadTask.this;
                        profilePhotoUploadTask.server = sb.append(profilePhotoUploadTask.server).append("&_square_crop=").append(left).append(',').append(top).append(',').append(width).append("&_full=").append(left).append(',').append(top).append(',').append(right - left).append(',').append(bottom - top).toString();
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                }
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
        VKAPIRequest req = new PhotosSaveOwnerPhoto(this.ownerID, this.mForSaveServer, this.mForSavePhoto, this.mForSaveHash);
        this.currentApiRequest = req;
        boolean res = req.execSync();
        this.currentApiRequest = null;
        if (!res) {
            throw new UploadException("can't save photo");
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        VKAPIRequest<JSONObject> req = new VKAPIRequest(this.ownerID > 0 ? "getProfiles" : "groups.getById").param(this.ownerID > 0 ? ServerKeys.USER_IDS : "group_ids", Math.abs(this.ownerID)).param(GraphRequest.FIELDS_PARAM, Global.displayDensity > 1.0f ? "photo_100" : "photo_50").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.upload.ProfilePhotoUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject r) {
                try {
                    String photo = r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    VKAccount account = VKAccountManager.getCurrent();
                    if (ProfilePhotoUploadTask.this.ownerID == account.getUid()) {
                        VKAccountManager.editCurrent().setPhoto(photo).commit();
                    }
                    Intent intent = new Intent(Posts.ACTION_USER_PHOTO_CHANGED);
                    intent.putExtra("photo", photo);
                    intent.putExtra("id", ProfilePhotoUploadTask.this.ownerID);
                    ProfilePhotoUploadTask.this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                } catch (Exception x) {
                    Log.w("vk", x);
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
            }
        });
        this.currentApiRequest = req;
        boolean res = req.execSync();
        this.currentApiRequest = null;
        if (!res) {
            throw new UploadException("can't get photo");
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return this.notify;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_photo);
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "photos.getOwnerPhotoUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.PhotoUploadTask, com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.ownerID);
        dest.writeByte(this.notify ? (byte) 1 : (byte) 0);
        dest.writeFloat(this.mThumbLeft);
        dest.writeFloat(this.mThumbTop);
        dest.writeFloat(this.mThumbRight);
        dest.writeFloat(this.mThumbBottom);
    }

    private ProfilePhotoUploadTask(Parcel in) {
        super(in);
        this.ownerID = in.readInt();
        this.notify = in.readByte() != 0;
        this.mThumbLeft = in.readFloat();
        this.mThumbTop = in.readFloat();
        this.mThumbRight = in.readFloat();
        this.mThumbBottom = in.readFloat();
    }
}
