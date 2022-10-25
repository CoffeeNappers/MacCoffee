package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
/* loaded from: classes2.dex */
public class FastTransitionDrawable extends BitmapDrawable {
    private static final float FADE_DURATION = 200.0f;
    private int alpha;
    private boolean animating;
    private Drawable placeholder;
    private long startTimeMillis;

    public FastTransitionDrawable(Context context, Bitmap bitmap, Drawable placeholder, boolean fade) {
        super(context.getResources(), bitmap);
        this.alpha = 255;
        if (fade) {
            this.startTimeMillis = SystemClock.uptimeMillis();
            this.placeholder = placeholder;
            this.animating = true;
            if (placeholder == null) {
                this.placeholder = new ColorDrawable(0);
            }
        }
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (!this.animating) {
            super.draw(canvas);
            return;
        }
        float normalized = ((float) (SystemClock.uptimeMillis() - this.startTimeMillis)) / FADE_DURATION;
        if (normalized >= 1.0f) {
            this.animating = false;
            this.placeholder = null;
            super.draw(canvas);
            return;
        }
        if (this.placeholder != null) {
            this.placeholder.draw(canvas);
        }
        int partialAlpha = (int) (this.alpha * normalized);
        super.setAlpha(partialAlpha);
        super.draw(canvas);
        super.setAlpha(this.alpha);
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        if (this.placeholder != null) {
            this.placeholder.setAlpha(alpha);
        }
        super.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        if (this.placeholder != null) {
            this.placeholder.setColorFilter(cf);
        }
        super.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        if (this.placeholder != null) {
            this.placeholder.setBounds(bounds);
        }
        super.onBoundsChange(bounds);
    }
}
