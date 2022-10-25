package com.vk.camera;

import android.app.Activity;
import android.graphics.Bitmap;
import com.facebook.imagepipeline.common.RotationOptions;
/* loaded from: classes2.dex */
public class Utils {
    public static float getBitmapAr(Bitmap bitmap) {
        return bitmap.getWidth() / bitmap.getHeight();
    }

    public static int getViewsRotation(int o) {
        int result;
        if (o % RotationOptions.ROTATE_180 == 0) {
            result = o + 90;
        } else {
            result = 0;
        }
        if (result == 270) {
            return -90;
        }
        return result;
    }

    public static void keepScreenOn(Activity activity, boolean enabled) {
        try {
            if (enabled) {
                activity.getWindow().addFlags(128);
            } else {
                activity.getWindow().clearFlags(128);
            }
        } catch (Exception e) {
        }
    }
}
