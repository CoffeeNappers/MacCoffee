package com.vk.attachpicker.screen;

import com.vk.attachpicker.widget.AdjusterView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropScreen$$Lambda$5 implements AdjusterView.ScrollListener {
    private final CropScreen arg$1;

    private CropScreen$$Lambda$5(CropScreen cropScreen) {
        this.arg$1 = cropScreen;
    }

    public static AdjusterView.ScrollListener lambdaFactory$(CropScreen cropScreen) {
        return new CropScreen$$Lambda$5(cropScreen);
    }

    @Override // com.vk.attachpicker.widget.AdjusterView.ScrollListener
    @LambdaForm.Hidden
    public void onRotate(float f) {
        this.arg$1.lambda$createView$4(f);
    }
}
