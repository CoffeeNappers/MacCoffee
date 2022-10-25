package com.vkontakte.android.fragments;

import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupProfileFragment$$Lambda$2 implements Runnable {
    private final SignupProfileFragment arg$1;
    private final TextView arg$2;

    private SignupProfileFragment$$Lambda$2(SignupProfileFragment signupProfileFragment, TextView textView) {
        this.arg$1 = signupProfileFragment;
        this.arg$2 = textView;
    }

    public static Runnable lambdaFactory$(SignupProfileFragment signupProfileFragment, TextView textView) {
        return new SignupProfileFragment$$Lambda$2(signupProfileFragment, textView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreateView$1(this.arg$2);
    }
}
