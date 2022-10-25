package com.vk.attachpicker.crop;

import android.animation.ValueAnimator;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropImageView$$Lambda$1 implements ValueAnimator.AnimatorUpdateListener {
    private final CropImageView arg$1;
    private final float arg$10;
    private final float arg$2;
    private final float[] arg$3;
    private final float arg$4;
    private final float arg$5;
    private final float arg$6;
    private final float arg$7;
    private final float[] arg$8;
    private final float[] arg$9;

    private CropImageView$$Lambda$1(CropImageView cropImageView, float f, float[] fArr, float f2, float f3, float f4, float f5, float[] fArr2, float[] fArr3, float f6) {
        this.arg$1 = cropImageView;
        this.arg$2 = f;
        this.arg$3 = fArr;
        this.arg$4 = f2;
        this.arg$5 = f3;
        this.arg$6 = f4;
        this.arg$7 = f5;
        this.arg$8 = fArr2;
        this.arg$9 = fArr3;
        this.arg$10 = f6;
    }

    public static ValueAnimator.AnimatorUpdateListener lambdaFactory$(CropImageView cropImageView, float f, float[] fArr, float f2, float f3, float f4, float f5, float[] fArr2, float[] fArr3, float f6) {
        return new CropImageView$$Lambda$1(cropImageView, f, fArr, f2, f3, f4, f5, fArr2, fArr3, f6);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    @LambdaForm.Hidden
    public void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.arg$1.lambda$createMovePreviewToCenterAnimator$0(this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6, this.arg$7, this.arg$8, this.arg$9, this.arg$10, valueAnimator);
    }
}
