package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupActivity$$Lambda$3 implements Runnable {
    private final SignupActivity arg$1;

    private SignupActivity$$Lambda$3(SignupActivity signupActivity) {
        this.arg$1 = signupActivity;
    }

    public static Runnable lambdaFactory$(SignupActivity signupActivity) {
        return new SignupActivity$$Lambda$3(signupActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$setStep$1();
    }
}
