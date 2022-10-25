package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupCodeFragment$$Lambda$1 implements View.OnClickListener {
    private final SignupCodeFragment arg$1;

    private SignupCodeFragment$$Lambda$1(SignupCodeFragment signupCodeFragment) {
        this.arg$1 = signupCodeFragment;
    }

    public static View.OnClickListener lambdaFactory$(SignupCodeFragment signupCodeFragment) {
        return new SignupCodeFragment$$Lambda$1(signupCodeFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateView$0(view);
    }
}
