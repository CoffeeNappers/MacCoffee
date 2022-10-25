package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SignupCodeFragment$$Lambda$5 implements Runnable {
    private final SignupCodeFragment arg$1;

    private SignupCodeFragment$$Lambda$5(SignupCodeFragment signupCodeFragment) {
        this.arg$1 = signupCodeFragment;
    }

    public static Runnable lambdaFactory$(SignupCodeFragment signupCodeFragment) {
        return new SignupCodeFragment$$Lambda$5(signupCodeFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$1();
    }
}
