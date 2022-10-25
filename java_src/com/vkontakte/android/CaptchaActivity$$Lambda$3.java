package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CaptchaActivity$$Lambda$3 implements DialogInterface.OnCancelListener {
    private final CaptchaActivity arg$1;

    private CaptchaActivity$$Lambda$3(CaptchaActivity captchaActivity) {
        this.arg$1 = captchaActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(CaptchaActivity captchaActivity) {
        return new CaptchaActivity$$Lambda$3(captchaActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$2(dialogInterface);
    }
}
