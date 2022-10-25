package com.vkontakte.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupProfileFragment$$Lambda$1 implements TextView.OnEditorActionListener {
    private final SignupProfileFragment arg$1;

    private SignupProfileFragment$$Lambda$1(SignupProfileFragment signupProfileFragment) {
        this.arg$1 = signupProfileFragment;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(SignupProfileFragment signupProfileFragment) {
        return new SignupProfileFragment$$Lambda$1(signupProfileFragment);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateView$0(textView, i, keyEvent);
    }
}
