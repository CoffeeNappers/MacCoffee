package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupActivity$$Lambda$2 implements Runnable {
    private final SignupActivity arg$1;

    private SignupActivity$$Lambda$2(SignupActivity signupActivity) {
        this.arg$1 = signupActivity;
    }

    public static Runnable lambdaFactory$(SignupActivity signupActivity) {
        return new SignupActivity$$Lambda$2(signupActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPhoneDone$0();
    }
}
