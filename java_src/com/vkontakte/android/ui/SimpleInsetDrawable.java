package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class SimpleInsetDrawable extends Drawable {
    private Rect adjustedBounds = new Rect();
    private int bottom;
    private int left;
    private int right;
    private int top;
    private Drawable wrapped;

    public SimpleInsetDrawable(Drawable d, int left, int top, int right, int bottom) {
        this.wrapped = d;
        this.left = left;
        this.top = top;
        this.right = right;
        this.bottom = bottom;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.save();
        canvas.clipRect(getBounds());
        this.wrapped.draw(canvas);
        canvas.restore();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.adjustedBounds.set(bounds.left + this.left, bounds.top + this.top, bounds.right - this.right, bounds.bottom - this.bottom);
        this.wrapped.setBounds(this.adjustedBounds);
        invalidateSelf();
    }
}
