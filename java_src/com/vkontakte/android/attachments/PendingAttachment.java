package com.vkontakte.android.attachments;

import android.content.Context;
import android.os.Parcelable;
import com.vkontakte.android.upload.UploadTask;
/* loaded from: classes2.dex */
public interface PendingAttachment<A extends Parcelable> {
    /* renamed from: createUploadTask */
    UploadTask<A> mo901createUploadTask(Context context);

    int getUploadId();

    String getUrl();

    void setId(int i);
}
