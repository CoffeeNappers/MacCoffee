package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.os.Build;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import android.widget.ListView;
/* loaded from: classes3.dex */
public class HorizontalListView extends ListView {
    private boolean disallowed;
    private float downX;
    private Matrix matrix;
    private float touchslop;

    public HorizontalListView(Context context) {
        super(context);
        this.disallowed = false;
        this.matrix = new Matrix();
        init();
    }

    public HorizontalListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.disallowed = false;
        this.matrix = new Matrix();
        init();
    }

    public HorizontalListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.disallowed = false;
        this.matrix = new Matrix();
        init();
    }

    private void init() {
        this.touchslop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        setClipToPadding(false);
        if (Build.VERSION.SDK_INT >= 9) {
            setOverScrollMode(2);
        }
    }

    @Override // android.view.View
    public void invalidate(Rect rect) {
        invalidate();
    }

    @Override // android.widget.AbsListView, android.view.View
    public void draw(Canvas c) {
        c.save();
        c.rotate(-90.0f, getWidth() / 2, getHeight() / 2);
        c.translate(getPaddingTop(), 0.0f);
        super.draw(c);
        c.restore();
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (ev.getAction() == 0) {
            this.downX = ev.getX();
        }
        if (ev.getAction() == 2 && Math.abs(this.downX - ev.getX()) > this.touchslop && !this.disallowed) {
            this.disallowed = true;
            getParent().requestDisallowInterceptTouchEvent(true);
        }
        if (ev.getAction() == 1) {
            this.disallowed = false;
            getParent().requestDisallowInterceptTouchEvent(false);
        }
        this.matrix.setRotate(90.0f, getWidth() / 2, getHeight() / 2);
        float[] pp = {ev.getX(), ev.getY()};
        this.matrix.mapPoints(pp);
        ev.setLocation(pp[0], pp[1]);
        return super.dispatchTouchEvent(ev);
    }

    @Override // android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, t, l, r, b);
    }

    public Matrix getTMatrix() {
        this.matrix.setRotate(90.0f, getWidth() / 2, getHeight() / 2);
        return this.matrix;
    }
}
