package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CaptchaActivity$$Lambda$4 implements Runnable {
    private final CaptchaActivity arg$1;

    private CaptchaActivity$$Lambda$4(CaptchaActivity captchaActivity) {
        this.arg$1 = captchaActivity;
    }

    public static Runnable lambdaFactory$(CaptchaActivity captchaActivity) {
        return new CaptchaActivity$$Lambda$4(captchaActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreate$3();
    }
}
