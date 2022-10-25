package com.vkontakte.android;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChangePasswordActivity$$Lambda$2 implements View.OnClickListener {
    private final ChangePasswordActivity arg$1;

    private ChangePasswordActivity$$Lambda$2(ChangePasswordActivity changePasswordActivity) {
        this.arg$1 = changePasswordActivity;
    }

    public static View.OnClickListener lambdaFactory$(ChangePasswordActivity changePasswordActivity) {
        return new ChangePasswordActivity$$Lambda$2(changePasswordActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$1(view);
    }
}
