package com.vk.imageloader.view.zoomable;

import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
/* loaded from: classes2.dex */
public class ScaleDragDetector implements ScaleGestureDetector.OnScaleGestureListener {
    private static final int INVALID_POINTER_ID = -1;
    private int mActivePointerId = -1;
    private int mActivePointerIndex = 0;
    private boolean mIsDragging;
    float mLastTouchX;
    float mLastTouchY;
    private final float mMinimumVelocity;
    private final ScaleGestureDetector mScaleDetector;
    private final OnScaleDragGestureListener mScaleDragGestureListener;
    private final float mTouchSlop;
    private VelocityTracker mVelocityTracker;

    public ScaleDragDetector(Context context, OnScaleDragGestureListener scaleDragGestureListener) {
        this.mScaleDetector = new ScaleGestureDetector(context, this);
        this.mScaleDragGestureListener = scaleDragGestureListener;
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mMinimumVelocity = configuration.getScaledMinimumFlingVelocity();
        this.mTouchSlop = configuration.getScaledTouchSlop();
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScale(ScaleGestureDetector detector) {
        float scaleFactor = detector.getScaleFactor();
        if (Float.isNaN(scaleFactor) || Float.isInfinite(scaleFactor)) {
            return false;
        }
        this.mScaleDragGestureListener.onScale(scaleFactor, detector.getFocusX(), detector.getFocusY());
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public boolean onScaleBegin(ScaleGestureDetector detector) {
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public void onScaleEnd(ScaleGestureDetector detector) {
        this.mScaleDragGestureListener.onScaleEnd();
    }

    public boolean isScaling() {
        return this.mScaleDetector.isInProgress();
    }

    public boolean isDragging() {
        return this.mIsDragging;
    }

    private float getActiveX(MotionEvent ev) {
        try {
            return MotionEventCompat.getX(ev, this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getX();
        }
    }

    private float getActiveY(MotionEvent ev) {
        try {
            return MotionEventCompat.getY(ev, this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getY();
        }
    }

    public boolean onTouchEvent(MotionEvent ev) {
        this.mScaleDetector.onTouchEvent(ev);
        int action = MotionEventCompat.getActionMasked(ev);
        onTouchActivePointer(action, ev);
        onTouchDragEvent(action, ev);
        return true;
    }

    private void onTouchActivePointer(int action, MotionEvent ev) {
        int i = 0;
        switch (action) {
            case 0:
                this.mActivePointerId = ev.getPointerId(0);
                break;
            case 1:
            case 3:
                this.mActivePointerId = -1;
                break;
            case 6:
                int pointerIndex = MotionEventCompat.getActionIndex(ev);
                int pointerId = MotionEventCompat.getPointerId(ev, pointerIndex);
                if (pointerId == this.mActivePointerId) {
                    int newPointerIndex = pointerIndex == 0 ? 1 : 0;
                    this.mActivePointerId = MotionEventCompat.getPointerId(ev, newPointerIndex);
                    this.mLastTouchX = MotionEventCompat.getX(ev, newPointerIndex);
                    this.mLastTouchY = MotionEventCompat.getY(ev, newPointerIndex);
                    break;
                }
                break;
        }
        if (this.mActivePointerId != -1) {
            i = this.mActivePointerId;
        }
        this.mActivePointerIndex = MotionEventCompat.findPointerIndex(ev, i);
    }

    private void onTouchDragEvent(int action, MotionEvent ev) {
        boolean z = false;
        switch (action) {
            case 0:
                this.mVelocityTracker = VelocityTracker.obtain();
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(ev);
                }
                this.mLastTouchX = getActiveX(ev);
                this.mLastTouchY = getActiveY(ev);
                this.mIsDragging = false;
                return;
            case 1:
                if (this.mIsDragging && this.mVelocityTracker != null) {
                    this.mLastTouchX = getActiveX(ev);
                    this.mLastTouchY = getActiveY(ev);
                    this.mVelocityTracker.addMovement(ev);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float vX = this.mVelocityTracker.getXVelocity();
                    float vY = this.mVelocityTracker.getYVelocity();
                    if (Math.max(Math.abs(vX), Math.abs(vY)) >= this.mMinimumVelocity) {
                        this.mScaleDragGestureListener.onFling(this.mLastTouchX, this.mLastTouchY, -vX, -vY);
                    }
                }
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    return;
                }
                return;
            case 2:
                float x = getActiveX(ev);
                float y = getActiveY(ev);
                float dx = x - this.mLastTouchX;
                float dy = y - this.mLastTouchY;
                if (!this.mIsDragging) {
                    if (Math.sqrt((dx * dx) + (dy * dy)) >= this.mTouchSlop) {
                        z = true;
                    }
                    this.mIsDragging = z;
                }
                if (this.mIsDragging) {
                    this.mScaleDragGestureListener.onDrag(dx, dy);
                    this.mLastTouchX = x;
                    this.mLastTouchY = y;
                    if (this.mVelocityTracker != null) {
                        this.mVelocityTracker.addMovement(ev);
                        return;
                    }
                    return;
                }
                return;
            case 3:
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    return;
                }
                return;
            default:
                return;
        }
    }
}
