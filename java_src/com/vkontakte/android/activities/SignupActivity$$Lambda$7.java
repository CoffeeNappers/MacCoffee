package com.vkontakte.android.activities;

import com.vkontakte.android.functions.VoidF0;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class SignupActivity$$Lambda$7 implements VoidF0 {
    private final SignupActivity arg$1;

    private SignupActivity$$Lambda$7(SignupActivity signupActivity) {
        this.arg$1 = signupActivity;
    }

    public static VoidF0 lambdaFactory$(SignupActivity signupActivity) {
        return new SignupActivity$$Lambda$7(signupActivity);
    }

    @Override // com.vkontakte.android.functions.VoidF0
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.onPassDone();
    }
}
