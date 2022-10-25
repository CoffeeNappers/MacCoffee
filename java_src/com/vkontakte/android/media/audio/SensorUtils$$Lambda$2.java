package com.vkontakte.android.media.audio;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SensorUtils$$Lambda$2 implements Runnable {
    private final SensorUtils arg$1;

    private SensorUtils$$Lambda$2(SensorUtils sensorUtils) {
        this.arg$1 = sensorUtils;
    }

    public static Runnable lambdaFactory$(SensorUtils sensorUtils) {
        return new SensorUtils$$Lambda$2(sensorUtils);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$stopSensors$1();
    }
}
