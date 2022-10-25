package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import com.vkontakte.android.upload.UploadListener;
import com.vkontakte.android.upload.UploadTask;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$6 implements DialogInterface.OnCancelListener {
    private final UploadTask arg$1;
    private final UploadListener arg$2;

    private BoardTopicViewFragment$$Lambda$6(UploadTask uploadTask, UploadListener uploadListener) {
        this.arg$1 = uploadTask;
        this.arg$2 = uploadListener;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(UploadTask uploadTask, UploadListener uploadListener) {
        return new BoardTopicViewFragment$$Lambda$6(uploadTask, uploadListener);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        BoardTopicViewFragment.lambda$sendPendingAttachmentComment$6(this.arg$1, this.arg$2, dialogInterface);
    }
}
