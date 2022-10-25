package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CaptchaActivity$$Lambda$5 implements Runnable {
    private final CaptchaActivity arg$1;

    private CaptchaActivity$$Lambda$5(CaptchaActivity captchaActivity) {
        this.arg$1 = captchaActivity;
    }

    public static Runnable lambdaFactory$(CaptchaActivity captchaActivity) {
        return new CaptchaActivity$$Lambda$5(captchaActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$loadImage$4();
    }
}
