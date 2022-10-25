package com.vk.attachpicker;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GraffitiActivity$$Lambda$14 implements DialogInterface.OnClickListener {
    private final GraffitiActivity arg$1;

    private GraffitiActivity$$Lambda$14(GraffitiActivity graffitiActivity) {
        this.arg$1 = graffitiActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GraffitiActivity graffitiActivity) {
        return new GraffitiActivity$$Lambda$14(graffitiActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$finish$13(dialogInterface, i);
    }
}
