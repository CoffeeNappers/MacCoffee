package com.vkontakte.android.activities;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$5 implements DialogInterface.OnCancelListener {
    private final BaseVideoActivity arg$1;

    private BaseVideoActivity$$Lambda$5(BaseVideoActivity baseVideoActivity) {
        this.arg$1 = baseVideoActivity;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(BaseVideoActivity baseVideoActivity) {
        return new BaseVideoActivity$$Lambda$5(baseVideoActivity);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$displayError$4(dialogInterface);
    }
}
