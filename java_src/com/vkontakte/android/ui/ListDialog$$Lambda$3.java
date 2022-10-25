package com.vkontakte.android.ui;

import android.content.DialogInterface;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ListDialog$$Lambda$3 implements DialogInterface.OnDismissListener {
    private final View arg$1;

    private ListDialog$$Lambda$3(View view) {
        this.arg$1 = view;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(View view) {
        return new ListDialog$$Lambda$3(view);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        ListDialog.lambda$show$2(this.arg$1, dialogInterface);
    }
}
