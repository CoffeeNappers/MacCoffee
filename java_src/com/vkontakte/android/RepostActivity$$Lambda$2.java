package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RepostActivity$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final RepostActivity arg$1;

    private RepostActivity$$Lambda$2(RepostActivity repostActivity) {
        this.arg$1 = repostActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(RepostActivity repostActivity) {
        return new RepostActivity$$Lambda$2(repostActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onCreate$1(dialogInterface);
    }
}
