package com.vkontakte.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupPasswordFragment$$Lambda$1 implements TextView.OnEditorActionListener {
    private final SignupPasswordFragment arg$1;

    private SignupPasswordFragment$$Lambda$1(SignupPasswordFragment signupPasswordFragment) {
        this.arg$1 = signupPasswordFragment;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(SignupPasswordFragment signupPasswordFragment) {
        return new SignupPasswordFragment$$Lambda$1(signupPasswordFragment);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateView$0(textView, i, keyEvent);
    }
}
