package com.vk.attachpicker.fragment;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiFragment$$Lambda$1 implements View.OnClickListener {
    private final GraffitiFragment arg$1;

    private GraffitiFragment$$Lambda$1(GraffitiFragment graffitiFragment) {
        this.arg$1 = graffitiFragment;
    }

    public static View.OnClickListener lambdaFactory$(GraffitiFragment graffitiFragment) {
        return new GraffitiFragment$$Lambda$1(graffitiFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$0(view);
    }
}
