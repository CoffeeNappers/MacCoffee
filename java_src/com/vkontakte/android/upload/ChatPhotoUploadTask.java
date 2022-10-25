package com.vkontakte.android.upload;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.GraphRequest;
import com.facebook.common.util.UriUtil;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesSetChatPhoto;
import com.vkontakte.android.api.photos.PhotosGetChatUploadServer;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class ChatPhotoUploadTask extends PhotoUploadTask<Photo> implements Parcelable {
    public static final Parcelable.Creator<ChatPhotoUploadTask> CREATOR = new Parcelable.Creator<ChatPhotoUploadTask>() { // from class: com.vkontakte.android.upload.ChatPhotoUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ChatPhotoUploadTask mo1122createFromParcel(Parcel source) {
            return new ChatPhotoUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ChatPhotoUploadTask[] mo1123newArray(int size) {
            return new ChatPhotoUploadTask[size];
        }
    };
    private int chatID;
    private String mForSaveFile;
    private String result;

    public ChatPhotoUploadTask(Context context, String fileName, int oid) {
        super(context, fileName);
        this.chatID = oid;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return UriUtil.LOCAL_FILE_SCHEME;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new PhotosGetChatUploadServer(this.chatID).setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.ChatPhotoUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                ChatPhotoUploadTask.this.server = url;
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
            this.mForSaveFile = jo.getString(ServerKeys.RESPONSE);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new MessagesSetChatPhoto(this.chatID, this.mForSaveFile);
        this.currentApiRequest = req;
        boolean res = req.execSync();
        this.currentApiRequest = null;
        if (!res) {
            throw new UploadException("can't save photo");
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        VKAPIRequest req = new VKAPIRequest(this.chatID > 0 ? "getProfiles" : "groups.getById").param(this.chatID > 0 ? ServerKeys.USER_IDS : "group_ids", Math.abs(this.chatID)).param(GraphRequest.FIELDS_PARAM, Global.displayDensity > 1.0f ? "photo_100" : "photo_50").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.upload.ChatPhotoUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject r) {
                try {
                    String photo = r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    VKAccount account = VKAccountManager.getCurrent();
                    if (ChatPhotoUploadTask.this.chatID == account.getUid()) {
                        VKAccountManager.editCurrent().setPhoto(photo).commit();
                    }
                    Intent intent = new Intent(Posts.ACTION_USER_PHOTO_CHANGED);
                    intent.putExtra("photo", photo);
                    intent.putExtra("id", ChatPhotoUploadTask.this.chatID);
                    ChatPhotoUploadTask.this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
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

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "photos.getChatUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.PhotoUploadTask, com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.chatID);
    }

    private ChatPhotoUploadTask(Parcel in) {
        super(in);
        this.chatID = in.readInt();
    }
}
