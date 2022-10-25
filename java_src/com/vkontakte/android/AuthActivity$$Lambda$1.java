package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final AuthActivity arg$1;

    private AuthActivity$$Lambda$1(AuthActivity authActivity) {
        this.arg$1 = authActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(AuthActivity authActivity) {
        return new AuthActivity$$Lambda$1(authActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$0(dialogInterface, i);
    }
}
