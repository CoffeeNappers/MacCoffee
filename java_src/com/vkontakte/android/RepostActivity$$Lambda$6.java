package com.vkontakte.android;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RepostActivity$$Lambda$6 implements DialogInterface.OnShowListener {
    private final RepostActivity arg$1;
    private final EditText arg$2;

    private RepostActivity$$Lambda$6(RepostActivity repostActivity, EditText editText) {
        this.arg$1 = repostActivity;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnShowListener lambdaFactory$(RepostActivity repostActivity, EditText editText) {
        return new RepostActivity$$Lambda$6(repostActivity, editText);
    }

    @Override // android.content.DialogInterface.OnShowListener
    @LambdaForm.Hidden
    public void onShow(DialogInterface dialogInterface) {
        this.arg$1.lambda$repostWithComment$5(this.arg$2, dialogInterface);
    }
}
