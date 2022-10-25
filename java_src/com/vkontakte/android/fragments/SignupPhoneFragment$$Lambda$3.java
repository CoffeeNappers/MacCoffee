package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupPhoneFragment$$Lambda$3 implements View.OnClickListener {
    private final SignupPhoneFragment arg$1;

    private SignupPhoneFragment$$Lambda$3(SignupPhoneFragment signupPhoneFragment) {
        this.arg$1 = signupPhoneFragment;
    }

    public static View.OnClickListener lambdaFactory$(SignupPhoneFragment signupPhoneFragment) {
        return new SignupPhoneFragment$$Lambda$3(signupPhoneFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$2(view);
    }
}
