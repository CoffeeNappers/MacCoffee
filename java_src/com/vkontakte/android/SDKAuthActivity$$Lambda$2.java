package com.vkontakte.android;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SDKAuthActivity$$Lambda$2 implements View.OnClickListener {
    private final SDKAuthActivity arg$1;

    private SDKAuthActivity$$Lambda$2(SDKAuthActivity sDKAuthActivity) {
        this.arg$1 = sDKAuthActivity;
    }

    public static View.OnClickListener lambdaFactory$(SDKAuthActivity sDKAuthActivity) {
        return new SDKAuthActivity$$Lambda$2(sDKAuthActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$1(view);
    }
}
