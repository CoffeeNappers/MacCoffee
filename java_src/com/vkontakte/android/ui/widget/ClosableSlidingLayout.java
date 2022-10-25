package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.v4.widget.ViewDragHelper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes3.dex */
public class ClosableSlidingLayout extends FrameLayout {
    private android.support.v4.widget.ViewDragHelper mDragHelper;

    public ClosableSlidingLayout(Context context) {
        super(context);
        init();
    }

    public ClosableSlidingLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ClosableSlidingLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    @TargetApi(21)
    public ClosableSlidingLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        this.mDragHelper = android.support.v4.widget.ViewDragHelper.create(this, 0.8f, new ViewDragCallback());
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        return this.mDragHelper.shouldInterceptTouchEvent(event) || super.onInterceptTouchEvent(event);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        this.mDragHelper.processTouchEvent(event);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ViewDragCallback extends ViewDragHelper.Callback {
        private ViewDragCallback() {
        }

        @Override // android.support.v4.widget.ViewDragHelper.Callback
        public boolean tryCaptureView(View child, int pointerId) {
            return true;
        }
    }
}
