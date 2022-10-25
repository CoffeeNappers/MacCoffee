package com.vk.attachpicker.crop.gestures;

import android.view.MotionEvent;
/* loaded from: classes2.dex */
public interface GestureDetector {
    boolean isScaling();

    boolean onTouchEvent(MotionEvent motionEvent);

    void setOnGestureListener(OnGestureListener onGestureListener);
}
