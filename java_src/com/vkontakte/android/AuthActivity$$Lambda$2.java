package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthActivity$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final AuthActivity arg$1;

    private AuthActivity$$Lambda$2(AuthActivity authActivity) {
        this.arg$1 = authActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(AuthActivity authActivity) {
        return new AuthActivity$$Lambda$2(authActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$1(dialogInterface);
    }
}
