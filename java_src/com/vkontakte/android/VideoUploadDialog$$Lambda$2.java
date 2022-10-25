package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoUploadDialog$$Lambda$2 implements DialogInterface.OnClickListener {
    private final VideoUploadDialog arg$1;

    private VideoUploadDialog$$Lambda$2(VideoUploadDialog videoUploadDialog) {
        this.arg$1 = videoUploadDialog;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(VideoUploadDialog videoUploadDialog) {
        return new VideoUploadDialog$$Lambda$2(videoUploadDialog);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$1(dialogInterface, i);
    }
}
