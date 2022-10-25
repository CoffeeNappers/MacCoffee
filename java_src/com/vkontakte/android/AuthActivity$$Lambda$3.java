package com.vkontakte.android;

import android.view.KeyEvent;
import android.widget.TextView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthActivity$$Lambda$3 implements TextView.OnEditorActionListener {
    private final AuthActivity arg$1;

    private AuthActivity$$Lambda$3(AuthActivity authActivity) {
        this.arg$1 = authActivity;
    }

    public static TextView.OnEditorActionListener lambdaFactory$(AuthActivity authActivity) {
        return new AuthActivity$$Lambda$3(authActivity);
    }

    @Override // android.widget.TextView.OnEditorActionListener
    @LambdaForm.Hidden
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreate$2(textView, i, keyEvent);
    }
}
