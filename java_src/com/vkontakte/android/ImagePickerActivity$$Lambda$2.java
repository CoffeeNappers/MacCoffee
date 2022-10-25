package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ImagePickerActivity$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final ImagePickerActivity arg$1;

    private ImagePickerActivity$$Lambda$2(ImagePickerActivity imagePickerActivity) {
        this.arg$1 = imagePickerActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(ImagePickerActivity imagePickerActivity) {
        return new ImagePickerActivity$$Lambda$2(imagePickerActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$1(dialogInterface);
    }
}
