package com.vkontakte.android.attachments;

import android.content.Context;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.upload.AudioUploadTask;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class PendingAudioAttachment extends AudioAttachment implements PendingAttachment {
    public static final Serializer.Creator<PendingAudioAttachment> CREATOR = new Serializer.CreatorAdapter<PendingAudioAttachment>() { // from class: com.vkontakte.android.attachments.PendingAudioAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingAudioAttachment mo1087createFromSerializer(Serializer s) {
            return new PendingAudioAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingAudioAttachment[] mo1088newArray(int size) {
            return new PendingAudioAttachment[size];
        }
    };

    public PendingAudioAttachment(MusicTrack mt) {
        super(mt);
    }

    public PendingAudioAttachment(Serializer s) {
        super(s);
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public String getUrl() {
        return this.musicTrack.url;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public int getUploadId() {
        return this.musicTrack.aid;
    }

    public int getId() {
        return this.musicTrack.aid;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public void setId(int id) {
        this.musicTrack.aid = id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask */
    public AudioUploadTask mo901createUploadTask(Context context) {
        AudioUploadTask task = new AudioUploadTask(context, this.musicTrack.url);
        task.setID(this.musicTrack.aid);
        return task;
    }
}
