package com.vkontakte.android.ui.drawables;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class DotsLoadingDrawable extends Drawable implements Animatable {
    static final int TIME = 500;
    Paint paint = new Paint(5);
    boolean started = false;
    static final int RADIUS = V.dp(3.0f);
    static final int HEIGHT = RADIUS << 1;
    static final int WIDTH = V.dp(26.5f);
    static final int[] DOTS_X = {V.dp(3.0f), V.dp(13.0f), V.dp(23.0f)};

    public DotsLoadingDrawable() {
        this.paint.setColor(-1);
        start();
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        this.started = true;
        scheduleSelf(DotsLoadingDrawable$$Lambda$1.lambdaFactory$(this), 0L);
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        this.started = false;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.started;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        int y = bounds.top + (bounds.height() / 2);
        long time = SystemClock.uptimeMillis();
        drawCircle(canvas, bounds.left + DOTS_X[0], y, time, 3);
        drawCircle(canvas, bounds.left + DOTS_X[1], y, time, 2);
        drawCircle(canvas, bounds.left + DOTS_X[2], y, time, 1);
        if (this.started) {
            invalidateSelf();
        }
    }

    void drawCircle(Canvas canvas, int x, int y, long time, int which) {
        float timeDiff = (float) (((which * 125) + time) % 500);
        float percent = 1.0f - (timeDiff / 500.0f);
        this.paint.setAlpha(((int) (166.0f * percent)) + 89);
        canvas.drawCircle(x, y, RADIUS, this.paint);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return WIDTH;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return HEIGHT;
    }
}
