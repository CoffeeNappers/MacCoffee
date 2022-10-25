package com.vk.attachpicker.util;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TooltipController$$Lambda$1 implements Runnable {
    private final TooltipController arg$1;

    private TooltipController$$Lambda$1(TooltipController tooltipController) {
        this.arg$1 = tooltipController;
    }

    public static Runnable lambdaFactory$(TooltipController tooltipController) {
        return new TooltipController$$Lambda$1(tooltipController);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$0();
    }
}
