package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import me.grishka.appkit.views.NavigationSpinner;
/* loaded from: classes3.dex */
public class SpinnerNews extends NavigationSpinner {
    float lastX;
    float lastY;

    public SpinnerNews(Context context) {
        super(context);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    public SpinnerNews(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    public SpinnerNews(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    public SpinnerNews(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes, int mode) {
        super(context, attrs, defStyleAttr, defStyleRes, mode);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    public SpinnerNews(Context context, AttributeSet attrs, int defStyleAttr, int mode) {
        super(context, attrs, defStyleAttr, mode);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    public SpinnerNews(Context context, int mode) {
        super(context, mode);
        this.lastX = 0.0f;
        this.lastY = 0.0f;
    }

    @Override // android.widget.Spinner, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        this.lastX = event.getX();
        this.lastY = event.getY();
        if (getChildCount() == 1 && event.getAction() == 0) {
            View child = getChildAt(0);
            return this.lastX < ((float) Math.max(getHeight(), child.getWidth())) && super.onTouchEvent(event);
        }
        return super.onTouchEvent(event);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        this.lastX = event.getX();
        this.lastY = event.getY();
        if (getChildCount() == 1 && event.getAction() == 0) {
            View child = getChildAt(0);
            return this.lastX < ((float) Math.max(getHeight(), child.getWidth())) && super.onInterceptTouchEvent(event);
        }
        return super.onInterceptTouchEvent(event);
    }
}
