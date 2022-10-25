package com.vk.attachpicker.screen;

import android.view.MotionEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropScreen$$Lambda$6 implements View.OnTouchListener {
    private final CropScreen arg$1;

    private CropScreen$$Lambda$6(CropScreen cropScreen) {
        this.arg$1 = cropScreen;
    }

    public static View.OnTouchListener lambdaFactory$(CropScreen cropScreen) {
        return new CropScreen$$Lambda$6(cropScreen);
    }

    @Override // android.view.View.OnTouchListener
    @LambdaForm.Hidden
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return this.arg$1.lambda$createView$5(view, motionEvent);
    }
}
