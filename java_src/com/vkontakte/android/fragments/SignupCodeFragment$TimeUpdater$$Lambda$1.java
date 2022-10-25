package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.SignupCodeFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupCodeFragment$TimeUpdater$$Lambda$1 implements Runnable {
    private final SignupCodeFragment.TimeUpdater arg$1;

    private SignupCodeFragment$TimeUpdater$$Lambda$1(SignupCodeFragment.TimeUpdater timeUpdater) {
        this.arg$1 = timeUpdater;
    }

    public static Runnable lambdaFactory$(SignupCodeFragment.TimeUpdater timeUpdater) {
        return new SignupCodeFragment$TimeUpdater$$Lambda$1(timeUpdater);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$run$0();
    }
}
