package com.vkontakte.android;

import android.graphics.Bitmap;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CaptchaActivity$$Lambda$6 implements Runnable {
    private final CaptchaActivity arg$1;
    private final Bitmap arg$2;

    private CaptchaActivity$$Lambda$6(CaptchaActivity captchaActivity, Bitmap bitmap) {
        this.arg$1 = captchaActivity;
        this.arg$2 = bitmap;
    }

    public static Runnable lambdaFactory$(CaptchaActivity captchaActivity, Bitmap bitmap) {
        return new CaptchaActivity$$Lambda$6(captchaActivity, bitmap);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$displayImage$5(this.arg$2);
    }
}
