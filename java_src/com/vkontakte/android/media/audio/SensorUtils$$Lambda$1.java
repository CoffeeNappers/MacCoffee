package com.vkontakte.android.media.audio;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SensorUtils$$Lambda$1 implements Runnable {
    private final SensorUtils arg$1;

    private SensorUtils$$Lambda$1(SensorUtils sensorUtils) {
        this.arg$1 = sensorUtils;
    }

    public static Runnable lambdaFactory$(SensorUtils sensorUtils) {
        return new SensorUtils$$Lambda$1(sensorUtils);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$startSensors$0();
    }
}
