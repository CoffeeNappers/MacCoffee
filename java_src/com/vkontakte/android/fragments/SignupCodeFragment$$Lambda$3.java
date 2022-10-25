package com.vkontakte.android.fragments;

import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupCodeFragment$$Lambda$3 implements Runnable {
    private final SignupCodeFragment arg$1;
    private final EditText arg$2;

    private SignupCodeFragment$$Lambda$3(SignupCodeFragment signupCodeFragment, EditText editText) {
        this.arg$1 = signupCodeFragment;
        this.arg$2 = editText;
    }

    public static Runnable lambdaFactory$(SignupCodeFragment signupCodeFragment, EditText editText) {
        return new SignupCodeFragment$$Lambda$3(signupCodeFragment, editText);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreateView$3(this.arg$2);
    }
}
