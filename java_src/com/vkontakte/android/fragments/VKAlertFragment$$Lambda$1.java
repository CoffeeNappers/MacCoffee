package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VKAlertFragment$$Lambda$1 implements DialogInterface.OnDismissListener {
    private final VKAlertFragment arg$1;

    private VKAlertFragment$$Lambda$1(VKAlertFragment vKAlertFragment) {
        this.arg$1 = vKAlertFragment;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(VKAlertFragment vKAlertFragment) {
        return new VKAlertFragment$$Lambda$1(vKAlertFragment);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$init$0(dialogInterface);
    }
}
