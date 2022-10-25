package com.vkontakte.android.activities;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$4 implements DialogInterface.OnClickListener {
    private final BaseVideoActivity arg$1;

    private BaseVideoActivity$$Lambda$4(BaseVideoActivity baseVideoActivity) {
        this.arg$1 = baseVideoActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(BaseVideoActivity baseVideoActivity) {
        return new BaseVideoActivity$$Lambda$4(baseVideoActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$displayError$3(dialogInterface, i);
    }
}
