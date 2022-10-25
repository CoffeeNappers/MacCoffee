package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoUploadDialog$$Lambda$1 implements DialogInterface.OnDismissListener {
    private final VideoUploadDialog arg$1;

    private VideoUploadDialog$$Lambda$1(VideoUploadDialog videoUploadDialog) {
        this.arg$1 = videoUploadDialog;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(VideoUploadDialog videoUploadDialog) {
        return new VideoUploadDialog$$Lambda$1(videoUploadDialog);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$0(dialogInterface);
    }
}
