package com.vkontakte.android.activities;

import com.vkontakte.android.functions.VoidF0;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupActivity$$Lambda$1 implements VoidF0 {
    private final SignupActivity arg$1;

    private SignupActivity$$Lambda$1(SignupActivity signupActivity) {
        this.arg$1 = signupActivity;
    }

    public static VoidF0 lambdaFactory$(SignupActivity signupActivity) {
        return new SignupActivity$$Lambda$1(signupActivity);
    }

    @Override // com.vkontakte.android.functions.VoidF0
    @LambdaForm.Hidden
    public void f() {
        SignupActivity.access$lambda$0(this.arg$1);
    }
}
