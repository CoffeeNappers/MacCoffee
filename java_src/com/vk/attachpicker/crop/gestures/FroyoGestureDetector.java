package com.vk.attachpicker.crop.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
@TargetApi(8)
/* loaded from: classes2.dex */
public class FroyoGestureDetector extends EclairGestureDetector {
    protected final ScaleGestureDetector mDetector;

    public FroyoGestureDetector(Context context) {
        super(context);
        ScaleGestureDetector.OnScaleGestureListener mScaleListener = new ScaleGestureDetector.OnScaleGestureListener() { // from class: com.vk.attachpicker.crop.gestures.FroyoGestureDetector.1
            @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
            public boolean onScale(ScaleGestureDetector detector) {
                float scaleFactor = detector.getScaleFactor();
                if (Float.isNaN(scaleFactor) || Float.isInfinite(scaleFactor)) {
                    return false;
                }
                FroyoGestureDetector.this.mListener.onScale(scaleFactor, detector.getFocusX(), detector.getFocusY());
                return true;
            }

            @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
            public boolean onScaleBegin(ScaleGestureDetector detector) {
                return true;
            }

            @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
            public void onScaleEnd(ScaleGestureDetector detector) {
            }
        };
        this.mDetector = new ScaleGestureDetector(context, mScaleListener);
    }

    @Override // com.vk.attachpicker.crop.gestures.CupcakeGestureDetector, com.vk.attachpicker.crop.gestures.GestureDetector
    public boolean isScaling() {
        return this.mDetector.isInProgress();
    }

    @Override // com.vk.attachpicker.crop.gestures.EclairGestureDetector, com.vk.attachpicker.crop.gestures.CupcakeGestureDetector, com.vk.attachpicker.crop.gestures.GestureDetector
    public boolean onTouchEvent(MotionEvent ev) {
        this.mDetector.onTouchEvent(ev);
        return super.onTouchEvent(ev);
    }
}
