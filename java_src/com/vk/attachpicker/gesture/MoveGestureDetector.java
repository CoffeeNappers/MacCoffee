package com.vk.attachpicker.gesture;

import android.view.MotionEvent;
/* loaded from: classes2.dex */
public class MoveGestureDetector {
    private OnMoveGestureListener mListener;
    private int prevPointerCount;
    private float prevX;
    private float prevY;

    /* loaded from: classes2.dex */
    public interface OnMoveGestureListener {
        void onMove(float f, float f2);
    }

    public MoveGestureDetector(OnMoveGestureListener listener) {
        this.mListener = listener;
    }

    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction()) {
            case 1:
            default:
                return true;
            case 0:
                this.prevPointerCount = event.getPointerCount();
                this.prevX = getFocalX(event);
                this.prevY = getFocalY(event);
                break;
            case 2:
                break;
        }
        float newX = getFocalX(event);
        float newY = getFocalY(event);
        int newPointerCount = event.getPointerCount();
        if (this.mListener != null && this.prevPointerCount == newPointerCount) {
            this.mListener.onMove(newX - this.prevX, newY - this.prevY);
        }
        this.prevX = newX;
        this.prevY = newY;
        this.prevPointerCount = newPointerCount;
        return true;
    }

    public static float getFocalX(MotionEvent e) {
        int pCount = e.getPointerCount();
        float x = 0.0f;
        for (int i = 0; i < pCount; i++) {
            x += e.getX(i);
        }
        return x / pCount;
    }

    public static float getFocalY(MotionEvent e) {
        int pCount = e.getPointerCount();
        float y = 0.0f;
        for (int i = 0; i < pCount; i++) {
            y += e.getY(i);
        }
        return y / pCount;
    }
}
