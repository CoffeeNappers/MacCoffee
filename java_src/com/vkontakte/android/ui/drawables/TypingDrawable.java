package com.vkontakte.android.ui.drawables;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class TypingDrawable extends Drawable {
    private static final int LEFT_PADDING = 4;
    private static final float MAX_ALPHA = 1.0f;
    private static final int MAX_RADIUS = 6;
    private static final float MIN_ALPHA = 0.4f;
    private static final int MIN_RADIUS = 4;
    private static final int WIDTH = 48;
    private static final int X_1 = 10;
    private static final int X_2 = 26;
    private static final int X_3 = 42;
    private Paint paint = new Paint();
    private volatile boolean isStarted = true;
    float count = 0.0f;

    public TypingDrawable(int color) {
        this.paint.setAntiAlias(true);
        this.paint.setColor(color);
    }

    private void drawCircle(Canvas canvas, float percent, float x, float y) {
        this.paint.setAlpha(alpha(MIN_ALPHA + (0.6f * percent)));
        canvas.drawCircle(x, y, dp(4.0f) + (dp(2.0f) * percent), this.paint);
    }

    private float dp(float size) {
        return Global.scale(size) / 2;
    }

    private int alpha(float alpha) {
        return (int) (255.0f * alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        drawCircle(canvas, (((float) Math.sin(this.count + 2.0f)) + 1.0f) / 2.0f, dp(10.0f), getBounds().centerY());
        drawCircle(canvas, (((float) Math.sin(this.count + 1.0f)) + 1.0f) / 2.0f, dp(26.0f), getBounds().centerY());
        drawCircle(canvas, (((float) Math.sin(this.count)) + 1.0f) / 2.0f, dp(42.0f), getBounds().centerY());
        this.count = (float) (this.count + 0.15d);
        if (this.isStarted) {
            invalidateSelf();
        }
    }

    public void start() {
        this.isStarted = true;
    }

    public void stop() {
        this.isStarted = false;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return (int) dp(18.0f);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return (int) dp(48.0f);
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
        return this.paint.getAlpha();
    }
}
