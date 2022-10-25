package com.vk.camera.camera1;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Camera1View$$Lambda$1 implements Runnable {
    private final Camera1View arg$1;

    private Camera1View$$Lambda$1(Camera1View camera1View) {
        this.arg$1 = camera1View;
    }

    public static Runnable lambdaFactory$(Camera1View camera1View) {
        return new Camera1View$$Lambda$1(camera1View);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.startTimer();
    }
}
