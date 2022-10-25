package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WelcomeActivity$$Lambda$4 implements DialogInterface.OnCancelListener {
    private final WelcomeActivity arg$1;

    private WelcomeActivity$$Lambda$4(WelcomeActivity welcomeActivity) {
        this.arg$1 = welcomeActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(WelcomeActivity welcomeActivity) {
        return new WelcomeActivity$$Lambda$4(welcomeActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$3(dialogInterface);
    }
}
