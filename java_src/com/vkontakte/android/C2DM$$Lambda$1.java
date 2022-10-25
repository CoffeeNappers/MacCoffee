package com.vkontakte.android;

import com.vkontakte.android.C2DM;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class C2DM$$Lambda$1 implements Runnable {
    private final C2DM.ThrowableRunnable arg$1;

    private C2DM$$Lambda$1(C2DM.ThrowableRunnable throwableRunnable) {
        this.arg$1 = throwableRunnable;
    }

    public static Runnable lambdaFactory$(C2DM.ThrowableRunnable throwableRunnable) {
        return new C2DM$$Lambda$1(throwableRunnable);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        C2DM.lambda$post$1(this.arg$1);
    }
}
