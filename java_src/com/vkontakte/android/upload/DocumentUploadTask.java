package com.vkontakte.android.upload;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.common.util.UriUtil;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetUploadServer;
import com.vkontakte.android.api.docs.DocsSave;
import com.vkontakte.android.attachments.DocumentAttachment;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class DocumentUploadTask extends HTTPFileUploadTask<DocumentAttachment> implements Parcelable {
    public static final Parcelable.Creator<DocumentUploadTask> CREATOR = new Parcelable.Creator<DocumentUploadTask>() { // from class: com.vkontakte.android.upload.DocumentUploadTask.3
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public DocumentUploadTask mo1125createFromParcel(Parcel source) {
            return new DocumentUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public DocumentUploadTask[] mo1126newArray(int size) {
            return new DocumentUploadTask[size];
        }
    };
    private String mForSaveFile;
    private boolean needShowNotification;
    protected final int ownerID;
    protected Document result;
    private boolean wall;

    public DocumentUploadTask(Context context, String fileName, int oid, boolean wall) {
        this(context, fileName, oid, wall, false);
    }

    public DocumentUploadTask(Context context, String fileName, int oid, boolean wall, boolean needShowNotification) {
        super(context, fileName);
        this.ownerID = oid;
        this.wall = wall;
        this.needShowNotification = needShowNotification;
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected boolean needShowNotifications() {
        return this.needShowNotification;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String getPostFieldName() {
        return UriUtil.LOCAL_FILE_SCHEME;
    }

    protected VKAPIRequest<String> getServerRequest() {
        return new DocsGetUploadServer(this.ownerID, this.wall);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void getServer() throws UploadException {
        VKAPIRequest req = getServerRequest().setCallback(new Callback<String>() { // from class: com.vkontakte.android.upload.DocumentUploadTask.1
            @Override // com.vkontakte.android.api.Callback
            public void success(String url) {
                DocumentUploadTask.this.server = url;
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

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    public void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
        try {
            JSONObject jo = new JSONObject(response);
            this.mForSaveFile = jo.getString(UriUtil.LOCAL_FILE_SCHEME);
        } catch (Exception x) {
            throw new UploadException("can't parse upload response", x);
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void save() throws UploadException {
        VKAPIRequest req = new DocsSave(this.mForSaveFile).setCallback(new Callback<Document>() { // from class: com.vkontakte.android.upload.DocumentUploadTask.2
            @Override // com.vkontakte.android.api.Callback
            public void success(Document doc) {
                DocumentUploadTask.this.result = doc;
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
    }

    @Override // com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public DocumentAttachment mo1144getResult() {
        return new DocumentAttachment(this.result);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    public String statsGetMethodNameForUploadUrl() {
        return this.wall ? "docs.getWallUploadServer" : "docs.getUploadServer";
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        super.writeToParcel(dest, flags);
        dest.writeInt(this.ownerID);
        dest.writeByte(this.wall ? (byte) 1 : (byte) 0);
        dest.writeParcelable(this.result, 0);
        if (!this.needShowNotification) {
            b = 0;
        }
        dest.writeByte(b);
    }

    @Override // com.vkontakte.android.upload.UploadTask
    protected CharSequence getNotificationTitle() {
        return this.context.getString(R.string.uploading_document);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DocumentUploadTask(Parcel in) {
        super(in);
        boolean z = true;
        this.ownerID = in.readInt();
        this.wall = in.readByte() != 0;
        this.result = (Document) in.readParcelable(Document.class.getClassLoader());
        this.needShowNotification = in.readByte() == 0 ? false : z;
    }
}
