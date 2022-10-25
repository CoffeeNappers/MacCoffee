package com.vk.core.util;

import android.content.DialogInterface;
import com.vk.core.util.AlertDialogs;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AlertDialogs$AlertDialogBuilder$$Lambda$1 implements DialogInterface.OnClickListener {
    private final Runnable[] arg$1;

    private AlertDialogs$AlertDialogBuilder$$Lambda$1(Runnable[] runnableArr) {
        this.arg$1 = runnableArr;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(Runnable[] runnableArr) {
        return new AlertDialogs$AlertDialogBuilder$$Lambda$1(runnableArr);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        AlertDialogs.AlertDialogBuilder.lambda$build$0(this.arg$1, dialogInterface, i);
    }
}
