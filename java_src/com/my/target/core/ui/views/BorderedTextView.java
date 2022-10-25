package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.TextView;
/* loaded from: classes2.dex */
public class BorderedTextView extends TextView {
    private GradientDrawable a;
    private int b;

    public BorderedTextView(Context context) {
        super(context);
        a();
    }

    public BorderedTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        a();
    }

    public BorderedTextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        a();
    }

    private void a() {
        this.a = new GradientDrawable();
        this.a.setStroke(0, -13421773);
        this.a.setColor(0);
        this.b = (int) TypedValue.applyDimension(1, 2.0f, getContext().getResources().getDisplayMetrics());
    }

    public void setBorder(int i, int i2) {
        setBorder(i, i2, 0);
    }

    public void setBorder(int i, int i2, int i3) {
        this.a.setStroke(i, i2);
        this.a.setCornerRadius(i3);
        invalidate();
    }

    @Override // android.view.View
    public void setBackgroundColor(int i) {
        this.a.setColor(i);
        invalidate();
    }

    @Override // android.widget.TextView, android.view.View
    protected void onDraw(Canvas canvas) {
        this.a.setBounds(getPaddingLeft() - this.b, getPaddingTop(), getWidth(), getHeight());
        this.a.draw(canvas);
        super.onDraw(canvas);
    }

    @Override // android.widget.TextView, android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        setMeasuredDimension(getMeasuredWidth() + (this.b * 2), getMeasuredHeight());
    }
}
