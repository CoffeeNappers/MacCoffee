package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class TrimScreen$$Lambda$8 implements Runnable {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$8(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static Runnable lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$8(trimScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0();
    }
}
