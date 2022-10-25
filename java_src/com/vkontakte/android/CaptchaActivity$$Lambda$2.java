package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CaptchaActivity$$Lambda$2 implements DialogInterface.OnClickListener {
    private final CaptchaActivity arg$1;

    private CaptchaActivity$$Lambda$2(CaptchaActivity captchaActivity) {
        this.arg$1 = captchaActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(CaptchaActivity captchaActivity) {
        return new CaptchaActivity$$Lambda$2(captchaActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$1(dialogInterface, i);
    }
}
