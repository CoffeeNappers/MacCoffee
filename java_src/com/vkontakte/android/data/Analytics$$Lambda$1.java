package com.vkontakte.android.data;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Analytics$$Lambda$1 implements Runnable {
    private final Runnable arg$1;

    private Analytics$$Lambda$1(Runnable runnable) {
        this.arg$1 = runnable;
    }

    public static Runnable lambdaFactory$(Runnable runnable) {
        return new Analytics$$Lambda$1(runnable);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Analytics.lambda$updateDeviceID$2(this.arg$1);
    }
}
