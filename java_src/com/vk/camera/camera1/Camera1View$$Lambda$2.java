package com.vk.camera.camera1;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Camera1View$$Lambda$2 implements Runnable {
    private final Camera1View arg$1;
    private final int arg$2;

    private Camera1View$$Lambda$2(Camera1View camera1View, int i) {
        this.arg$1 = camera1View;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(Camera1View camera1View, int i) {
        return new Camera1View$$Lambda$2(camera1View, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$stopRecording$0(this.arg$2);
    }
}
