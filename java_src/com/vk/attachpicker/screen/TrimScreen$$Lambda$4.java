package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$$Lambda$4 implements View.OnClickListener {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$4(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static View.OnClickListener lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$4(trimScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$5(view);
    }
}
