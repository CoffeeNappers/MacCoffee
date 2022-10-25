package com.vk.attachpicker.crop.gestures;

import android.content.Context;
import android.os.Build;
/* loaded from: classes2.dex */
public final class VersionedGestureDetector {
    public static GestureDetector newInstance(Context context, OnGestureListener listener) {
        GestureDetector detector;
        int sdkVersion = Build.VERSION.SDK_INT;
        if (sdkVersion < 5) {
            detector = new CupcakeGestureDetector(context);
        } else if (sdkVersion < 8) {
            detector = new EclairGestureDetector(context);
        } else {
            detector = new FroyoGestureDetector(context);
        }
        detector.setOnGestureListener(listener);
        return detector;
    }
}
