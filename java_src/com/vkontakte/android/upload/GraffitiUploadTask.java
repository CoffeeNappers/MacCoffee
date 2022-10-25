package com.vkontakte.android.upload;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.FileUtils;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetUploadServer;
import com.vkontakte.android.api.docs.DocsSave;
import com.vkontakte.android.attachments.GraffitiAttachment;
import java.io.File;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class GraffitiUploadTask extends HTTPFileUploadTask<GraffitiAttachment> implements Parcelable {
    public static final Parcelable.Creator<GraffitiUploadTask> CREATOR = new Parcelable.Creator<GraffitiUploadTask>() { // from class: com.vkontakte.android.upload.GraffitiUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GraffitiUploadTask mo1128createFromParcel(Parcel source) {
            return new GraffitiUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GraffitiUploadTask[] mo1129newArray(int size) {
            return new GraffitiUploadTask[size];
        }
    };
    private String mForSaveFile;
    private int ownerID;
    private Document result;

    public GraffitiUploadTask(Context context, String fileName, int oid) {
        super(context, fileName);
        this.ownerID = oid;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return false;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return UriUtil.LOCAL_FILE_SCHEME;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = new DocsGetUploadServer(this.ownerID, "graffiti").setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.GraffitiUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                GraffitiUploadTask.this.server = url;
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
        for (int i = 0; i < 3; i++) {
            try {
                super.doUpload();
                return;
            } catch (UploadException e) {
                if (i < 2) {
                    getServer();
                }
            }
        }
        throw new UploadException("can't upload");
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.mForSaveFile = jo.getString(UriUtil.LOCAL_FILE_SCHEME);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new DocsSave(this.mForSaveFile).setCallback(new Callback<Document>() { // from class: com.vkontakte.android.upload.GraffitiUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(Document doc) {
                GraffitiUploadTask.this.result = doc;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
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
        GraffitiAttachment.put(this.result.did, this.result.oid, this.file);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        if (!TextUtils.isEmpty(this.file) && this.file.contains(".vkontakte/GRAF_")) {
            FileUtils.deleteFile(new File(this.file));
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public GraffitiAttachment mo1144getResult() {
        return new GraffitiAttachment(this.result);
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String statsGetMethodNameForUploadUrl() {
        return "docs.getUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.ownerID);
        dest.writeParcelable(this.result, 0);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_document);
    }

    private GraffitiUploadTask(Parcel in) {
        super(in);
        this.ownerID = in.readInt();
        this.result = (Document) in.readParcelable(Document.class.getClassLoader());
    }
}
