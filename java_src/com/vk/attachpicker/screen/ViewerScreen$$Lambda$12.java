package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$12 implements Runnable {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$12(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static Runnable lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$12(viewerScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$6();
    }
}
