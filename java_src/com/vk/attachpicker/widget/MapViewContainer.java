package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.design.widget.CoordinatorLayout;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import com.vk.attachpicker.util.Utils;
/* loaded from: classes2.dex */
public class MapViewContainer extends FrameLayout {
    private float downTopY;
    private boolean moveStartEventSent;
    private OnMoveStartListener onMoveStart;

    /* loaded from: classes2.dex */
    public interface OnMoveStartListener {
        void onMoveStart();
    }

    public MapViewContainer(Context context) {
        super(context);
    }

    public MapViewContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MapViewContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        CoordinatorLayout parent = findParentCoordinatorLayout(this);
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.moveStartEventSent = false;
                this.downTopY = Utils.getYOnScreen(this);
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                    break;
                }
                break;
            case 1:
            case 3:
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(false);
                    break;
                }
                break;
        }
        if (this.onMoveStart != null) {
            if (!this.moveStartEventSent) {
                this.moveStartEventSent = true;
                this.onMoveStart.onMoveStart();
            }
            float deltaY = Utils.getYOnScreen(this) - this.downTopY;
            if (deltaY != 0.0f) {
                motionEvent.setLocation(motionEvent.getX(), motionEvent.getY() + deltaY);
            }
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    public OnMoveStartListener getOnMoveStart() {
        return this.onMoveStart;
    }

    public void setOnMoveStart(OnMoveStartListener onMoveStart) {
        this.onMoveStart = onMoveStart;
    }

    private CoordinatorLayout findParentCoordinatorLayout(View v) {
        if (v == null) {
            return null;
        }
        if (v instanceof CoordinatorLayout) {
            return (CoordinatorLayout) v;
        }
        return findParentCoordinatorLayout((View) v.getParent());
    }
}
