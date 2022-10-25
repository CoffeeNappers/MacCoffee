package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$$Lambda$6 implements Runnable {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$6(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static Runnable lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$6(trimScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        TrimScreen.access$lambda$0(this.arg$1);
    }
}
