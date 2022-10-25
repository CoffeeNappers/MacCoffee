package com.vkontakte.android.fragments;

import android.text.InputFilter;
import android.text.Spanned;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupPhoneFragment$$Lambda$2 implements InputFilter {
    private static final SignupPhoneFragment$$Lambda$2 instance = new SignupPhoneFragment$$Lambda$2();

    private SignupPhoneFragment$$Lambda$2() {
    }

    public static InputFilter lambdaFactory$() {
        return instance;
    }

    @Override // android.text.InputFilter
    @LambdaForm.Hidden
    public CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        CharSequence replaceAll;
        replaceAll = charSequence.toString().replaceAll("[^0-9]", "");
        return replaceAll;
    }
}
