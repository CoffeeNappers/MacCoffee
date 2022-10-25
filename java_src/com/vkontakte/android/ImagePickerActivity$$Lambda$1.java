package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class ImagePickerActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final ImagePickerActivity arg$1;
    private final ArrayList arg$2;

    private ImagePickerActivity$$Lambda$1(ImagePickerActivity imagePickerActivity, ArrayList arrayList) {
        this.arg$1 = imagePickerActivity;
        this.arg$2 = arrayList;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ImagePickerActivity imagePickerActivity, ArrayList arrayList) {
        return new ImagePickerActivity$$Lambda$1(imagePickerActivity, arrayList);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$0(this.arg$2, dialogInterface, i);
    }
}
