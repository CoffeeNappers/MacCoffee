package com.vkontakte.android.fragments;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthCheckFragment$$Lambda$2 implements TextView.OnEditorActionListener {
    private final AuthCheckFragment arg$1;

    private AuthCheckFragment$$Lambda$2(AuthCheckFragment authCheckFragment) {
        this.arg$1 = authCheckFragment;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(AuthCheckFragment authCheckFragment) {
        return new AuthCheckFragment$$Lambda$2(authCheckFragment);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateContentView$2(textView, i, keyEvent);
    }
}
