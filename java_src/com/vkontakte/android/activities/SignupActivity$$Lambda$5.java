package com.vkontakte.android.activities;

import com.vkontakte.android.fragments.SignupCodeFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SignupActivity$$Lambda$5 implements SignupCodeFragment.OnResendListener {
    private final SignupActivity arg$1;

    private SignupActivity$$Lambda$5(SignupActivity signupActivity) {
        this.arg$1 = signupActivity;
    }

    public static SignupCodeFragment.OnResendListener lambdaFactory$(SignupActivity signupActivity) {
        return new SignupActivity$$Lambda$5(signupActivity);
    }

    @Override // com.vkontakte.android.fragments.SignupCodeFragment.OnResendListener
    @LambdaForm.Hidden
    public void resendCode(boolean z, Runnable runnable) {
        this.arg$1.lambda$setStep$2(z, runnable);
    }
}
