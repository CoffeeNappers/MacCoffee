package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.animation.DecelerateInterpolator;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class RadialProgressDrawable extends Drawable {
    static DecelerateInterpolator decelerateInterpolator;
    static Paint progressPaint;
    long lastUpdateTime = 0;
    float startMultipler = 0.0f;
    float currentProgress = 0.0f;
    float animationProgressStart = 0.0f;
    long currentProgressTime = 0;
    float animatedProgressValue = 0.0f;
    RectF circleRect = new RectF();
    int progressColor = -1;
    int mThickness = V.dp(2.0f);

    public RadialProgressDrawable() {
        if (decelerateInterpolator == null) {
            decelerateInterpolator = new DecelerateInterpolator();
            progressPaint = new Paint(1);
            progressPaint.setStyle(Paint.Style.STROKE);
            progressPaint.setStrokeCap(Paint.Cap.ROUND);
        }
    }

    public void setProgressColor(int color) {
        this.progressColor = color;
        invalidateSelf();
    }

    public void setThickness(float value) {
        this.mThickness = V.dp(value);
        invalidateSelf();
    }

    public void setProgress(float value, boolean animated) {
        if (!animated) {
            this.animatedProgressValue = value;
            this.animationProgressStart = value;
        } else {
            if (this.animatedProgressValue > value) {
                this.animatedProgressValue = value;
            }
            this.animationProgressStart = this.animatedProgressValue;
        }
        this.currentProgress = value;
        this.currentProgressTime = 0L;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        setProgress(level / 10000.0f, true);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return 255;
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        progressPaint.setColor(this.progressColor);
        progressPaint.setAlpha(255);
        progressPaint.setStrokeWidth(this.mThickness);
        this.circleRect.set(getBounds());
        this.circleRect.inset(this.mThickness >> 1, this.mThickness >> 1);
        canvas.drawArc(this.circleRect, (this.startMultipler * 360.0f) - 90.0f, Math.max(4.0f, this.animatedProgressValue * 360.0f), false, progressPaint);
        long newTime = System.currentTimeMillis();
        long dt = newTime - this.lastUpdateTime;
        if (this.animatedProgressValue != 1.0f && this.lastUpdateTime != 0) {
            this.startMultipler += ((float) dt) / 3000.0f;
            float progressDiff = this.currentProgress - this.animationProgressStart;
            if (progressDiff > 0.0f) {
                this.currentProgressTime += dt;
                if (this.currentProgressTime >= 300) {
                    this.animatedProgressValue = this.currentProgress;
                    this.animationProgressStart = this.currentProgress;
                    this.currentProgressTime = 0L;
                } else {
                    this.animatedProgressValue = this.animationProgressStart + (decelerateInterpolator.getInterpolation(((float) this.currentProgressTime) / 300.0f) * progressDiff);
                }
            }
        }
        this.lastUpdateTime = newTime;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }
}
