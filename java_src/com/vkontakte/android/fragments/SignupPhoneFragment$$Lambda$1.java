package com.vkontakte.android.fragments;

import android.text.InputFilter;
import android.text.Spanned;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupPhoneFragment$$Lambda$1 implements InputFilter {
    private static final SignupPhoneFragment$$Lambda$1 instance = new SignupPhoneFragment$$Lambda$1();

    private SignupPhoneFragment$$Lambda$1() {
    }

    @Override // android.text.InputFilter
    @LambdaForm.Hidden
    public CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        return SignupPhoneFragment.lambda$onCreateContentView$0(charSequence, i, i2, spanned, i3, i4);
    }
}
