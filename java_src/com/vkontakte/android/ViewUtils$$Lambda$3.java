package com.vkontakte.android;

import android.app.Dialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewUtils$$Lambda$3 implements Runnable {
    private final Dialog arg$1;

    private ViewUtils$$Lambda$3(Dialog dialog) {
        this.arg$1 = dialog;
    }

    public static Runnable lambdaFactory$(Dialog dialog) {
        return new ViewUtils$$Lambda$3(dialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ViewUtils.lambda$showDialogSafety$2(this.arg$1);
    }
}
