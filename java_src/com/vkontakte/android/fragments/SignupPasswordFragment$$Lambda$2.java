package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupPasswordFragment$$Lambda$2 implements Runnable {
    private final SignupPasswordFragment arg$1;

    private SignupPasswordFragment$$Lambda$2(SignupPasswordFragment signupPasswordFragment) {
        this.arg$1 = signupPasswordFragment;
    }

    public static Runnable lambdaFactory$(SignupPasswordFragment signupPasswordFragment) {
        return new SignupPasswordFragment$$Lambda$2(signupPasswordFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreateView$1();
    }
}
