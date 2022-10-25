package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.upload.GraffitiUploadTask;
import com.vkontakte.android.upload.UploadTask;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class PendingGraffitiAttachment extends GraffitiAttachment implements PendingAttachment {
    public static final Serializer.Creator<PendingGraffitiAttachment> CREATOR = new Serializer.CreatorAdapter<PendingGraffitiAttachment>() { // from class: com.vkontakte.android.attachments.PendingGraffitiAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingGraffitiAttachment mo1087createFromSerializer(Serializer in) {
            return new PendingGraffitiAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingGraffitiAttachment[] mo1088newArray(int size) {
            return new PendingGraffitiAttachment[size];
        }
    };

    public PendingGraffitiAttachment(int id, int ownerId, String url, int width, int height, String access_key) {
        super(id, ownerId, url, width, height, access_key);
    }

    public PendingGraffitiAttachment(Serializer parcel) {
        super(parcel);
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public String getUrl() {
        return this.url;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public int getUploadId() {
        return this.id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public void setId(int id) {
        this.id = id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask */
    public UploadTask mo901createUploadTask(Context context) {
        GraffitiUploadTask task = new GraffitiUploadTask(VKApplication.context, this.url, VKAccountManager.getCurrent().getUid());
        task.setID(this.id);
        return task;
    }

    @Override // com.vkontakte.android.attachments.GraffitiAttachment, com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        if (!this.url.startsWith("file://")) {
            ((VKImageView) view).load("file://" + this.url, ImageSize.MID);
        } else {
            ((VKImageView) view).load(this.url, ImageSize.MID);
        }
    }
}
