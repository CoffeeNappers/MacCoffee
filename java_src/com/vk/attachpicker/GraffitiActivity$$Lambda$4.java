package com.vk.attachpicker;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiActivity$$Lambda$4 implements View.OnClickListener {
    private final GraffitiActivity arg$1;

    private GraffitiActivity$$Lambda$4(GraffitiActivity graffitiActivity) {
        this.arg$1 = graffitiActivity;
    }

    public static View.OnClickListener lambdaFactory$(GraffitiActivity graffitiActivity) {
        return new GraffitiActivity$$Lambda$4(graffitiActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$3(view);
    }
}