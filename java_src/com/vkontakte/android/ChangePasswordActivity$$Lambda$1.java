package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChangePasswordActivity$$Lambda$1 implements DialogInterface.OnDismissListener {
    private final ChangePasswordActivity arg$1;

    private ChangePasswordActivity$$Lambda$1(ChangePasswordActivity changePasswordActivity) {
        this.arg$1 = changePasswordActivity;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(ChangePasswordActivity changePasswordActivity) {
        return new ChangePasswordActivity$$Lambda$1(changePasswordActivity);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$0(dialogInterface);
    }
}
