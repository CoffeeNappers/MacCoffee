package com.vk.attachpicker.gesture;

import android.view.MotionEvent;
/* loaded from: classes2.dex */
public class RotationGestureDetector {
    private static final int INVALID_POINTER_ID = -1;
    private float fX;
    private float fY;
    private OnRotationGestureListener mListener;
    private float sX;
    private float sY;
    private float mAngle = 0.0f;
    private int ptrID1 = -1;
    private int ptrID2 = -1;

    /* loaded from: classes2.dex */
    public interface OnRotationGestureListener {
        void onRotation(float f, float f2, float f3);
    }

    public float getAngle() {
        return this.mAngle;
    }

    public RotationGestureDetector(OnRotationGestureListener listener) {
        this.mListener = listener;
    }

    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case 0:
                this.ptrID1 = event.getPointerId(event.getActionIndex());
                return true;
            case 1:
                this.mAngle = 0.0f;
                this.ptrID1 = -1;
                return true;
            case 2:
                if (this.ptrID1 != -1 && this.ptrID2 != -1) {
                    float nsX = event.getX(event.findPointerIndex(this.ptrID1));
                    float nsY = event.getY(event.findPointerIndex(this.ptrID1));
                    float nfX = event.getX(event.findPointerIndex(this.ptrID2));
                    float nfY = event.getY(event.findPointerIndex(this.ptrID2));
                    float newAngle = angleBetweenLines(this.fX, this.fY, this.sX, this.sY, nfX, nfY, nsX, nsY);
                    if (this.mListener != null && this.mAngle != 0.0f) {
                        this.mListener.onRotation(newAngle - this.mAngle, (nsX + nfX) / 2.0f, (nsY + nfY) / 2.0f);
                    }
                    this.mAngle = newAngle;
                    return true;
                }
                return true;
            case 3:
                this.mAngle = 0.0f;
                this.ptrID1 = -1;
                this.ptrID2 = -1;
                return true;
            case 4:
            default:
                return true;
            case 5:
                this.ptrID2 = event.getPointerId(event.getActionIndex());
                this.sX = event.getX(event.findPointerIndex(this.ptrID1));
                this.sY = event.getY(event.findPointerIndex(this.ptrID1));
                this.fX = event.getX(event.findPointerIndex(this.ptrID2));
                this.fY = event.getY(event.findPointerIndex(this.ptrID2));
                return true;
            case 6:
                this.mAngle = 0.0f;
                this.ptrID2 = -1;
                return true;
        }
    }

    private float angleBetweenLines(float fX, float fY, float sX, float sY, float nfX, float nfY, float nsX, float nsY) {
        float angle1 = (float) Math.atan2(fY - sY, fX - sX);
        float angle2 = (float) Math.atan2(nfY - nsY, nfX - nsX);
        float angle = ((float) Math.toDegrees(angle1 - angle2)) % 360.0f;
        if (angle < -180.0f) {
            angle += 360.0f;
        }
        return angle > 180.0f ? angle - 360.0f : angle;
    }
}
