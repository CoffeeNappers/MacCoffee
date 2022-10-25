package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerScreen$$Lambda$10 implements Runnable {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$10(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static Runnable lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$10(viewerScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ViewerScreen.access$lambda$0(this.arg$1);
    }
}
