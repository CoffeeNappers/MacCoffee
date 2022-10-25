package com.vk.attachpicker;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiActivity$$Lambda$5 implements View.OnLongClickListener {
    private final GraffitiActivity arg$1;

    private GraffitiActivity$$Lambda$5(GraffitiActivity graffitiActivity) {
        this.arg$1 = graffitiActivity;
    }

    public static View.OnLongClickListener lambdaFactory$(GraffitiActivity graffitiActivity) {
        return new GraffitiActivity$$Lambda$5(graffitiActivity);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$onCreate$4(view);
    }
}
