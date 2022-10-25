package com.vk.attachpicker;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachActivity$$Lambda$9 implements Runnable {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$9(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static Runnable lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$9(attachActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$initViews$8();
    }
}
