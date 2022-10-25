package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class RepostActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final RepostActivity arg$1;
    private final ArrayList arg$2;

    private RepostActivity$$Lambda$1(RepostActivity repostActivity, ArrayList arrayList) {
        this.arg$1 = repostActivity;
        this.arg$2 = arrayList;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(RepostActivity repostActivity, ArrayList arrayList) {
        return new RepostActivity$$Lambda$1(repostActivity, arrayList);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onCreate$0(this.arg$2, dialogInterface, i);
    }
}
