package com.vkontakte.android.activities;

import com.vkontakte.android.fragments.SignupCodeFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class RestoreActivity$$Lambda$5 implements SignupCodeFragment.OnResendListener {
    private final RestoreActivity arg$1;

    private RestoreActivity$$Lambda$5(RestoreActivity restoreActivity) {
        this.arg$1 = restoreActivity;
    }

    public static SignupCodeFragment.OnResendListener lambdaFactory$(RestoreActivity restoreActivity) {
        return new RestoreActivity$$Lambda$5(restoreActivity);
    }

    @Override // com.vkontakte.android.fragments.SignupCodeFragment.OnResendListener
    @LambdaForm.Hidden
    public void resendCode(boolean z, Runnable runnable) {
        this.arg$1.lambda$setStep$3(z, runnable);
    }
}
