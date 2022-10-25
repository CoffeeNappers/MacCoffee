package com.vkontakte.android;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RepostActivity$$Lambda$3 implements DialogInterface.OnClickListener {
    private final RepostActivity arg$1;
    private final int arg$2;
    private final EditText arg$3;

    private RepostActivity$$Lambda$3(RepostActivity repostActivity, int i, EditText editText) {
        this.arg$1 = repostActivity;
        this.arg$2 = i;
        this.arg$3 = editText;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(RepostActivity repostActivity, int i, EditText editText) {
        return new RepostActivity$$Lambda$3(repostActivity, i, editText);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$repostWithComment$2(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
