package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WelcomeActivity$$Lambda$3 implements DialogInterface.OnClickListener {
    private final WelcomeActivity arg$1;

    private WelcomeActivity$$Lambda$3(WelcomeActivity welcomeActivity) {
        this.arg$1 = welcomeActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(WelcomeActivity welcomeActivity) {
        return new WelcomeActivity$$Lambda$3(welcomeActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$2(dialogInterface, i);
    }
}
