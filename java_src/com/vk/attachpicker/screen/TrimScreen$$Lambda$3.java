package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$$Lambda$3 implements View.OnClickListener {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$3(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static View.OnClickListener lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$3(trimScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$4(view);
    }
}
