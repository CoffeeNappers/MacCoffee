package com.vkontakte.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupCodeFragment$$Lambda$4 implements TextView.OnEditorActionListener {
    private final SignupCodeFragment arg$1;

    private SignupCodeFragment$$Lambda$4(SignupCodeFragment signupCodeFragment) {
        this.arg$1 = signupCodeFragment;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(SignupCodeFragment signupCodeFragment) {
        return new SignupCodeFragment$$Lambda$4(signupCodeFragment);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateView$4(textView, i, keyEvent);
    }
}
