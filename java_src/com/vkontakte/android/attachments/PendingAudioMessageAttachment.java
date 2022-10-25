package com.vkontakte.android.attachments;

import android.content.Context;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.upload.AudioMessageUploadTask;
import com.vkontakte.android.utils.Serializer;
import java.io.File;
/* loaded from: classes2.dex */
public class PendingAudioMessageAttachment extends AudioMessageAttachment implements PendingAttachment {
    public static final Serializer.Creator<PendingAudioMessageAttachment> CREATOR = new Serializer.CreatorAdapter<PendingAudioMessageAttachment>() { // from class: com.vkontakte.android.attachments.PendingAudioMessageAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingAudioMessageAttachment mo1087createFromSerializer(Serializer in) {
            return new PendingAudioMessageAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingAudioMessageAttachment[] mo1088newArray(int size) {
            return new PendingAudioMessageAttachment[size];
        }
    };

    public PendingAudioMessageAttachment(String title, String url, int size, int oid, int did, String ext, int duration, byte[] waveform) {
        super(null, null, duration, waveform, title, url, size, oid, did, ext);
        renameUploadFile(oid, did);
    }

    public PendingAudioMessageAttachment(Serializer parcel) {
        super(parcel);
    }

    private void renameUploadFile(int oid, int did) {
        File newFile = getCacheFile(oid, did);
        boolean result = new File(this.url).renameTo(newFile);
        if (result) {
            this.url = newFile.getAbsolutePath();
        }
    }

    @Override // com.vkontakte.android.attachments.AudioMessageAttachment
    protected String getLink() {
        return this.url;
    }

    @Override // com.vkontakte.android.attachments.AudioMessageAttachment
    protected boolean isFileInCache() {
        return new File(this.url).exists();
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
        renameUploadFile(this.oid, this.did);
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask */
    public AudioMessageUploadTask mo901createUploadTask(Context context) {
        AudioMessageUploadTask task = new AudioMessageUploadTask(context, this.url, getWaveform(), VKAccountManager.getCurrent().getUid());
        task.setID(this.did);
        return task;
    }

    public boolean removeFile() {
        return isFileInCache() && new File(this.url).delete();
    }
}
