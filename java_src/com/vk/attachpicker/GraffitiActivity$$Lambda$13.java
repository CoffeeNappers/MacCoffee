package com.vk.attachpicker;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiActivity$$Lambda$13 implements Runnable {
    private final GraffitiActivity arg$1;

    private GraffitiActivity$$Lambda$13(GraffitiActivity graffitiActivity) {
        this.arg$1 = graffitiActivity;
    }

    public static Runnable lambdaFactory$(GraffitiActivity graffitiActivity) {
        return new GraffitiActivity$$Lambda$13(graffitiActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreate$12();
    }
}
