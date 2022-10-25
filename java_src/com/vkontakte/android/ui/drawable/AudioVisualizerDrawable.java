package com.vkontakte.android.ui.drawable;

import android.animation.TimeInterpolator;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import com.vkontakte.android.Global;
import java.util.Random;
/* loaded from: classes3.dex */
public class AudioVisualizerDrawable extends Drawable {
    private static final long UPDATE_INTVL = 150;
    private boolean isAnimating;
    private float[] prevVals = {0.0f, 0.0f, 0.0f};
    private float[] nextVals = {0.0f, 0.0f, 0.0f};
    private TimeInterpolator[] interpolators = {null, null, null};
    private DecelerateInterpolator decelerate = new DecelerateInterpolator();
    private AccelerateInterpolator accelerate = new AccelerateInterpolator();
    private long startTime = 0;
    private Random random = new Random();
    private Paint paint = new Paint();

    public AudioVisualizerDrawable() {
        this.paint.setColor(-11435592);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int h = getBounds().height();
        canvas.translate(getBounds().left, getBounds().top);
        if (System.currentTimeMillis() - this.startTime > UPDATE_INTVL) {
            this.startTime = System.currentTimeMillis();
            for (int i = 0; i < 3; i++) {
                this.prevVals[i] = this.nextVals[i];
                if (this.isAnimating) {
                    this.nextVals[i] = (float) (Math.cbrt(this.random.nextInt(1000000)) / 100.0d);
                } else {
                    this.nextVals[i] = 0.0f;
                }
                this.interpolators[i] = this.nextVals[i] > this.prevVals[i] ? this.accelerate : this.decelerate;
            }
        }
        float t = ((float) (System.currentTimeMillis() - this.startTime)) / 150.0f;
        float s = 0.0f;
        float lineWidth = getBounds().width() / 4.0f;
        float spaceWidth = getBounds().width() / 8.0f;
        for (int i2 = 0; i2 < 3; i2++) {
            s += this.prevVals[i2];
            int rectH = Math.max((int) Global.displayDensity, Math.round((this.prevVals[i2] + ((this.nextVals[i2] - this.prevVals[i2]) * this.interpolators[i2].getInterpolation(t))) * h));
            float left = i2 * (lineWidth + spaceWidth);
            canvas.drawRect(left, h - rectH, left + lineWidth, h, this.paint);
        }
        canvas.translate(-getBounds().left, -getBounds().top);
        if (s != 0.0f || this.isAnimating) {
            invalidateSelf();
        }
    }

    public AudioVisualizerDrawable setColor(int color) {
        this.paint.setColor(color);
        return this;
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

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        this.isAnimating = false;
        int length = state.length;
        for (int i = 0; i < length; i++) {
            int s = state[i];
            this.isAnimating = (s == 16842913) | this.isAnimating;
        }
        return true;
    }
}
