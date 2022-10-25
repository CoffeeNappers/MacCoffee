package com.facebook.imagepipeline.nativecode;

import android.graphics.Bitmap;
import com.facebook.common.internal.DoNotStrip;
import com.facebook.common.internal.Preconditions;
@DoNotStrip
/* loaded from: classes.dex */
public class NativeBlurFilter {
    @DoNotStrip
    private static native void nativeIterativeBoxBlur(Bitmap bitmap, int i, int i2);

    static {
        ImagePipelineNativeLoader.load();
    }

    public static void iterativeBoxBlur(Bitmap bitmap, int iterations, int blurRadius) {
        boolean z = true;
        Preconditions.checkNotNull(bitmap);
        Preconditions.checkArgument(iterations > 0);
        if (blurRadius <= 0) {
            z = false;
        }
        Preconditions.checkArgument(z);
        nativeIterativeBoxBlur(bitmap, iterations, blurRadius);
    }
}
