package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.support.v7.widget.AppCompatTextView;
import android.util.AttributeSet;
import android.view.MotionEvent;
/* loaded from: classes3.dex */
public class LinkedTextView extends AppCompatTextView {
    private ClickableLinksDelegate delegate;

    public LinkedTextView(Context context) {
        super(context);
        this.delegate = new ClickableLinksDelegate(this);
        setDrawingCacheEnabled(false);
    }

    public LinkedTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.delegate = new ClickableLinksDelegate(this);
        setDrawingCacheEnabled(false);
    }

    public LinkedTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.delegate = new ClickableLinksDelegate(this);
        setDrawingCacheEnabled(false);
    }

    public void setCanShowMessageOptions(boolean canShowMessageOptions) {
        this.delegate.setCanShowMessageOptions(canShowMessageOptions);
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return this.delegate.onTouch(ev) || super.onTouchEvent(ev);
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        this.delegate.onDraw(c);
    }
}
