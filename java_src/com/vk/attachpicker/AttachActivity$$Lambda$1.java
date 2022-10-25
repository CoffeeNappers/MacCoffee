package com.vk.attachpicker;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AttachActivity$$Lambda$1 implements Runnable {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$1(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static Runnable lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$1(attachActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreate$0();
    }
}
