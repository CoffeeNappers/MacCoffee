package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerScreen$$Lambda$5 implements View.OnClickListener {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$5(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static View.OnClickListener lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$5(viewerScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$11(view);
    }
}
