package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropScreen$$Lambda$4 implements View.OnClickListener {
    private final CropScreen arg$1;

    private CropScreen$$Lambda$4(CropScreen cropScreen) {
        this.arg$1 = cropScreen;
    }

    public static View.OnClickListener lambdaFactory$(CropScreen cropScreen) {
        return new CropScreen$$Lambda$4(cropScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$3(view);
    }
}
