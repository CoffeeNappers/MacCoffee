package com.vk.emoji;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes2.dex */
abstract class EmojiDrawable extends Drawable {
    private final Rect drawingBounds = new Rect();

    protected abstract void drawInBounds(Canvas canvas, Rect rect);

    public EmojiDrawable(int size, int paddingHorizontal, int paddingVertical) {
        setBounds(0, 0, (paddingHorizontal * 2) + size, (paddingVertical * 2) + size);
        int cx = getBounds().centerX();
        int cy = getBounds().centerY();
        int s2 = size / 2;
        this.drawingBounds.set(cx - s2, cy - s2, cx + s2, cy + s2);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        drawInBounds(canvas, this.drawingBounds);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return getBounds().width();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return getBounds().height();
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumWidth() {
        return getBounds().width();
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumHeight() {
        return getBounds().height();
    }
}
