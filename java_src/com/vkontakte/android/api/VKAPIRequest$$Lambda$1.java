package com.vkontakte.android.api;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VKAPIRequest$$Lambda$1 implements DialogInterface.OnCancelListener {
    private final VKAPIRequest arg$1;

    private VKAPIRequest$$Lambda$1(VKAPIRequest vKAPIRequest) {
        this.arg$1 = vKAPIRequest;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(VKAPIRequest vKAPIRequest) {
        return new VKAPIRequest$$Lambda$1(vKAPIRequest);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$wrapProgress$0(dialogInterface);
    }
}
