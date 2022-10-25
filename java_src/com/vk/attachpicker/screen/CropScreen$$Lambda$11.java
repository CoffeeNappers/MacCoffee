package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropScreen$$Lambda$11 implements Runnable {
    private final CropScreen arg$1;

    private CropScreen$$Lambda$11(CropScreen cropScreen) {
        this.arg$1 = cropScreen;
    }

    public static Runnable lambdaFactory$(CropScreen cropScreen) {
        return new CropScreen$$Lambda$11(cropScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.finish();
    }
}
