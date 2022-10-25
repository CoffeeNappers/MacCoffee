package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RepostActivity$$Lambda$4 implements DialogInterface.OnClickListener {
    private final RepostActivity arg$1;

    private RepostActivity$$Lambda$4(RepostActivity repostActivity) {
        this.arg$1 = repostActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(RepostActivity repostActivity) {
        return new RepostActivity$$Lambda$4(repostActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$repostWithComment$3(dialogInterface, i);
    }
}
