package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerScreen$$Lambda$16 implements Runnable {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$16(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static Runnable lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$16(viewerScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.closeEditorAnimation();
    }
}
