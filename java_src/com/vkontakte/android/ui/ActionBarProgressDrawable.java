package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class ActionBarProgressDrawable extends Drawable {
    private static final long HEIGHT_ANIM_DURATION = 300;
    private static final long STEP_ANIM_DURATION = 300;
    private Drawable bg;
    private long heightAnimStart;
    private Interpolator itrp;
    private long stepAnimStart;
    private int step = 0;
    private int total = 1;
    private int animToStep = -1;
    private Paint rectPaint = new Paint();

    public ActionBarProgressDrawable(Drawable drawable) {
        this.bg = drawable;
        this.rectPaint.setColor(-1);
        this.itrp = new DecelerateInterpolator();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int height;
        int offset;
        Rect bnds = copyBounds();
        this.bg.setBounds(bnds);
        this.bg.draw(canvas);
        float stepSize = bnds.width() / this.total;
        boolean animRunning = false;
        if (System.currentTimeMillis() - this.heightAnimStart < 300) {
            height = Math.round(Global.scale(2.0f) * this.itrp.getInterpolation(((float) (System.currentTimeMillis() - this.heightAnimStart)) / 300.0f));
            animRunning = true;
        } else {
            height = Global.scale(2.0f);
        }
        if (System.currentTimeMillis() - this.stepAnimStart < 300) {
            float diff = (this.animToStep * stepSize) - (this.step * stepSize);
            offset = Math.round((this.step * stepSize) + (this.itrp.getInterpolation(((float) (System.currentTimeMillis() - this.stepAnimStart)) / 300.0f) * diff));
            animRunning = true;
        } else {
            if (this.animToStep != -1) {
                this.step = this.animToStep;
                this.animToStep = -1;
            }
            offset = Math.round(this.step * stepSize);
        }
        canvas.drawRect(new Rect(offset, bnds.height() - height, Math.round(offset + stepSize), bnds.height()), this.rectPaint);
        if (animRunning) {
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    public void setStepCount(int count) {
        this.total = count;
        invalidateSelf();
    }

    public void setStep(int step) {
        this.step = step;
    }

    public void setStepAnimated(int step) {
        if (this.step != step) {
            this.animToStep = step;
            this.stepAnimStart = System.currentTimeMillis();
            invalidateSelf();
        }
    }

    public void animateHeight() {
        this.heightAnimStart = System.currentTimeMillis();
        invalidateSelf();
    }
}
