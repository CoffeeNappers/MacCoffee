package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoUploadDialog$$Lambda$3 implements DialogInterface.OnClickListener {
    private static final VideoUploadDialog$$Lambda$3 instance = new VideoUploadDialog$$Lambda$3();

    private VideoUploadDialog$$Lambda$3() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        VideoUploadDialog.lambda$onCreate$2(dialogInterface, i);
    }
}
