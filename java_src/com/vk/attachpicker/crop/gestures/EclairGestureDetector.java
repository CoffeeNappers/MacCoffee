package com.vk.attachpicker.crop.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import com.vk.attachpicker.crop.Compat;
@TargetApi(5)
/* loaded from: classes2.dex */
public class EclairGestureDetector extends CupcakeGestureDetector {
    private static final int INVALID_POINTER_ID = -1;
    private int mActivePointerId;
    private int mActivePointerIndex;

    public EclairGestureDetector(Context context) {
        super(context);
        this.mActivePointerId = -1;
        this.mActivePointerIndex = 0;
    }

    @Override // com.vk.attachpicker.crop.gestures.CupcakeGestureDetector
    float getActiveX(MotionEvent ev) {
        try {
            return ev.getX(this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getX();
        }
    }

    @Override // com.vk.attachpicker.crop.gestures.CupcakeGestureDetector
    float getActiveY(MotionEvent ev) {
        try {
            return ev.getY(this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getY();
        }
    }

    @Override // com.vk.attachpicker.crop.gestures.CupcakeGestureDetector, com.vk.attachpicker.crop.gestures.GestureDetector
    public boolean onTouchEvent(MotionEvent ev) {
        int i = 0;
        int action = ev.getAction();
        switch (action & 255) {
            case 0:
                this.mActivePointerId = ev.getPointerId(0);
                break;
            case 1:
            case 3:
                this.mActivePointerId = -1;
                break;
            case 6:
                int pointerIndex = Compat.getPointerIndex(ev.getAction());
                int pointerId = ev.getPointerId(pointerIndex);
                if (pointerId == this.mActivePointerId) {
                    int newPointerIndex = pointerIndex == 0 ? 1 : 0;
                    this.mActivePointerId = ev.getPointerId(newPointerIndex);
                    this.mLastTouchX = ev.getX(newPointerIndex);
                    this.mLastTouchY = ev.getY(newPointerIndex);
                    break;
                }
                break;
        }
        if (this.mActivePointerId != -1) {
            i = this.mActivePointerId;
        }
        this.mActivePointerIndex = ev.findPointerIndex(i);
        return super.onTouchEvent(ev);
    }
}
