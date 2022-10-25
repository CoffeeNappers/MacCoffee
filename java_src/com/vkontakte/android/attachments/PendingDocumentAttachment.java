package com.vkontakte.android.attachments;

import android.content.Context;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.upload.DocumentUploadTask;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class PendingDocumentAttachment extends DocumentAttachment implements PendingAttachment {
    public static final Serializer.Creator<PendingDocumentAttachment> CREATOR = new Serializer.CreatorAdapter<PendingDocumentAttachment>() { // from class: com.vkontakte.android.attachments.PendingDocumentAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingDocumentAttachment mo1087createFromSerializer(Serializer in) {
            return new PendingDocumentAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingDocumentAttachment[] mo1088newArray(int size) {
            return new PendingDocumentAttachment[size];
        }
    };

    public PendingDocumentAttachment(String _title, String _url, int _size, String _thumb, int _oid, int _did, String ext) {
        super(_title, _url, _size, _thumb, _oid, _did, ext, "", 0, 0, null);
    }

    public PendingDocumentAttachment(Serializer parcel) {
        super(parcel);
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public String getUrl() {
        return this.url;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public int getUploadId() {
        return this.did;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public void setId(int id) {
        this.did = id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask */
    public DocumentUploadTask mo901createUploadTask(Context context) {
        DocumentUploadTask task = new DocumentUploadTask(context, this.url, VKAccountManager.getCurrent().getUid(), true);
        task.setID(this.did);
        return task;
    }
}
