package com.vkontakte.android.data;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Analytics$$Lambda$4 implements Runnable {
    private static final Analytics$$Lambda$4 instance = new Analytics$$Lambda$4();

    private Analytics$$Lambda$4() {
    }

    public static Runnable lambdaFactory$() {
        return instance;
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Analytics.updateDeviceID(null);
    }
}
