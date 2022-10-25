package com.vkontakte.android;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes2.dex */
public class IconBgDrawable extends Drawable {
    private Drawable drawable;

    public IconBgDrawable(Drawable d) {
        this.drawable = d;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(Rect bounds) {
        super.setBounds(bounds);
        int bw = this.drawable.getIntrinsicWidth();
        int bh = this.drawable.getIntrinsicHeight();
        int rh = bounds.height();
        Rect r = new Rect(bounds.left, (bounds.top + (rh / 2)) - (bh / 2), bounds.left + bw, bounds.top + (rh / 2) + (bh / 2));
        Log.d("vk", "bounds " + r);
        this.drawable.setBounds(r);
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int l, int t, int r, int b) {
        int bw = this.drawable.getIntrinsicWidth();
        int bh = this.drawable.getIntrinsicHeight();
        if (b - t < bh) {
            b = t + bh;
        }
        int rh = b - t;
        super.setBounds(l, t, r, b);
        this.drawable.setBounds(l, ((rh / 2) + t) - (bh / 2), l + bw, (rh / 2) + t + (bh / 2));
        this.drawable.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.drawable.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect rect) {
        rect.left = this.drawable.getIntrinsicWidth() + Global.scale(5.0f);
        rect.bottom = 0;
        rect.right = 0;
        rect.top = 0;
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setState(int[] stateSet) {
        return this.drawable.setState(stateSet);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.drawable.getOpacity();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getChangingConfigurations() {
        return this.drawable.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.drawable.getIntrinsicWidth();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.drawable.getIntrinsicHeight();
    }
}
