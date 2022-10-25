package com.vkontakte.android.attachments;

import android.content.Context;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.media.video.VideoEncoderSettings;
import com.vkontakte.android.upload.VideoUploadTask;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class PendingVideoAttachment extends VideoAttachment implements PendingAttachment {
    public static final Serializer.Creator<PendingVideoAttachment> CREATOR = new Serializer.CreatorAdapter<PendingVideoAttachment>() { // from class: com.vkontakte.android.attachments.PendingVideoAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingVideoAttachment mo1087createFromSerializer(Serializer s) {
            return new PendingVideoAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingVideoAttachment[] mo1088newArray(int size) {
            return new PendingVideoAttachment[size];
        }
    };

    public PendingVideoAttachment(VideoFile vf) {
        super(vf);
    }

    public PendingVideoAttachment(Serializer s) {
        super(s);
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public String getUrl() {
        return this.video.urlExternal;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public int getUploadId() {
        return this.video.vid;
    }

    public int getId() {
        return this.video.vid;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public void setId(int id) {
        this.video.vid = id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask  reason: collision with other method in class */
    public VideoUploadTask mo901createUploadTask(Context context) {
        VideoUploadTask task = new VideoUploadTask(context, this.video.urlExternal, this.video.title, "", VideoEncoderSettings.p480, true, VKAccountManager.getCurrent().getUid(), false);
        task.setID(this.video.vid);
        return task;
    }
}
