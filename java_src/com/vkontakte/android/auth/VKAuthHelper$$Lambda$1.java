package com.vkontakte.android.auth;

import android.app.Activity;
import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VKAuthHelper$$Lambda$1 implements DialogInterface.OnDismissListener {
    private final Activity arg$1;

    private VKAuthHelper$$Lambda$1(Activity activity) {
        this.arg$1 = activity;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(Activity activity) {
        return new VKAuthHelper$$Lambda$1(activity);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        VKAuthHelper.lambda$showErrorMessage$0(this.arg$1, dialogInterface);
    }
}
