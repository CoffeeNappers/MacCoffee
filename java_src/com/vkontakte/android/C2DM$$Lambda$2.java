package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class C2DM$$Lambda$2 implements Runnable {
    private static final C2DM$$Lambda$2 instance = new C2DM$$Lambda$2();

    private C2DM$$Lambda$2() {
    }

    public static Runnable lambdaFactory$() {
        return instance;
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        C2DM.lambda$static$0();
    }
}
