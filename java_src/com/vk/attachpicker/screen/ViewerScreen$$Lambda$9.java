package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$9 implements Runnable {
    private final TrimScreen arg$1;

    private ViewerScreen$$Lambda$9(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static Runnable lambdaFactory$(TrimScreen trimScreen) {
        return new ViewerScreen$$Lambda$9(trimScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.showMaxLengthToast();
    }
}
