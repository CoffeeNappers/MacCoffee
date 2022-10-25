package com.vkontakte.android.ui.util;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class DividerDrawable extends Drawable {
    final int color;
    final int leftPadding;
    Rect bounds = new Rect();
    Paint paint = new Paint();

    public DividerDrawable(int leftPadding, int color) {
        this.leftPadding = leftPadding;
        this.color = color;
        this.paint.setColor(color);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.bounds.set(bounds.left + this.leftPadding, bounds.top, bounds.right, bounds.bottom);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawRect(this.bounds, this.paint);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.paint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.paint.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }
}
