package com.vk.attachpicker.crop;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import com.vk.attachpicker.crop.gestures.FroyoGestureDetector;
import com.vk.attachpicker.crop.gestures.GestureDetector;
import com.vk.attachpicker.crop.gestures.OnGestureListener;
/* loaded from: classes2.dex */
public class CropTouchListener implements View.OnTouchListener, OnGestureListener {
    private boolean enabled = true;
    private final GestureCallback gestureCallback;
    private final GestureDetector scaleDragDetector;

    /* loaded from: classes2.dex */
    public interface GestureCallback {
        void onScale(float f, float f2, float f3);

        void onTouchBegin();

        void onTouchEnd();

        boolean onTranslate(float f, float f2);
    }

    public CropTouchListener(Context context, GestureCallback gestureCallback) {
        this.scaleDragDetector = new FroyoGestureDetector(context);
        this.scaleDragDetector.setOnGestureListener(this);
        this.gestureCallback = gestureCallback;
    }

    public void postTranslate(float dx, float dy) {
        this.gestureCallback.onTranslate(dx, dy);
    }

    public void postScale(float scaleDelta, float focalX, float focalY) {
        this.gestureCallback.onScale(scaleDelta, focalX, focalY);
    }

    @Override // com.vk.attachpicker.crop.gestures.OnGestureListener
    public void onDrag(float dx, float dy) {
        if (!this.scaleDragDetector.isScaling()) {
            postTranslate(dx, dy);
        }
    }

    @Override // com.vk.attachpicker.crop.gestures.OnGestureListener
    public void onFling(float startX, float startY, float velocityX, float velocityY) {
    }

    @Override // com.vk.attachpicker.crop.gestures.OnGestureListener
    public void onScale(float scaleFactor, float focusX, float focusY) {
        postScale(scaleFactor, focusX, focusY);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent ev) {
        if (!this.enabled) {
            return false;
        }
        switch (ev.getAction()) {
            case 0:
                this.gestureCallback.onTouchBegin();
                break;
            case 1:
            case 3:
                this.gestureCallback.onTouchEnd();
                break;
        }
        try {
            return this.scaleDragDetector.onTouchEvent(ev);
        } catch (Throwable th) {
            return false;
        }
    }

    public boolean isEnabled() {
        return this.enabled;
    }

    public void setTouchEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
