package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class CircularProgressBar extends View {
    private static final int IND_LOOP_TIME = 3500;
    private static final int IND_TRANS_TIME = 300;
    private static Bitmap shadow;
    private long animStartTime;
    private double animatedProgressValue;
    private double animationProgressStart;
    private Paint bgPaint;
    private Paint blackBgPaint;
    private long currentProgressTime;
    private DecelerateInterpolator ditp;
    private Paint erasePaint;
    private Interpolator interpolator;
    private MyInterpolator itp;
    private long lastUpdateTime;
    private Paint paint;
    private double progress;
    private int startAlpha;

    public CircularProgressBar(Context context) {
        super(context);
        this.itp = new MyInterpolator();
        this.ditp = new DecelerateInterpolator(2.0f);
        this.animStartTime = 0L;
        this.startAlpha = 0;
        this.interpolator = new DecelerateInterpolator();
        init();
    }

    public CircularProgressBar(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.itp = new MyInterpolator();
        this.ditp = new DecelerateInterpolator(2.0f);
        this.animStartTime = 0L;
        this.startAlpha = 0;
        this.interpolator = new DecelerateInterpolator();
        init();
    }

    public CircularProgressBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.itp = new MyInterpolator();
        this.ditp = new DecelerateInterpolator(2.0f);
        this.animStartTime = 0L;
        this.startAlpha = 0;
        this.interpolator = new DecelerateInterpolator();
        init();
    }

    private void init() {
        this.paint = new Paint();
        this.paint.setAntiAlias(true);
        this.paint.setColor(-1);
        this.paint.setStyle(Paint.Style.STROKE);
        this.paint.setStrokeWidth(Global.scale(3.0f));
        this.paint.setStrokeCap(Paint.Cap.ROUND);
        if (isInEditMode()) {
            this.progress = 0.45d;
        }
        this.bgPaint = new Paint();
        this.bgPaint.setAntiAlias(true);
        this.bgPaint.setColor(822083583);
        this.bgPaint.setStyle(Paint.Style.STROKE);
        this.bgPaint.setStrokeWidth(Global.scale(3.0f));
        this.blackBgPaint = new Paint();
        this.blackBgPaint.setAntiAlias(true);
        this.blackBgPaint.setColor(536870912);
        this.blackBgPaint.setStyle(Paint.Style.STROKE);
        this.blackBgPaint.setStrokeWidth(Global.scale(3.0f));
        this.erasePaint = new Paint();
        this.erasePaint.setAntiAlias(true);
        this.erasePaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.erasePaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
    }

    public void setProgress(double p) {
        this.progress = p;
        this.animationProgressStart = this.animatedProgressValue;
        this.currentProgressTime = 0L;
        if (p != 0.0d) {
            this.animStartTime = 0L;
        }
        postInvalidate();
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        RectF arcRect = new RectF(Global.scale(15.0f), Global.scale(15.0f), getWidth() - Global.scale(15.0f), getHeight() - Global.scale(15.0f));
        if (shadow == null || shadow.getWidth() != getWidth() || shadow.getHeight() != getHeight()) {
            shadow = Bitmap.createBitmap(getWidth(), getHeight(), Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(shadow);
            Paint shadowPaint = new Paint(this.paint);
            shadowPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
            shadowPaint.setShadowLayer(Global.scale(10.0f), 0.0f, Global.scale(10.0f), 805306368);
            canvas.drawArc(arcRect, 0.0f, 360.0f, false, shadowPaint);
            shadowPaint.setShadowLayer(Global.scale(6.0f), 0.0f, Global.scale(3.0f), 989855744);
            canvas.drawArc(arcRect, 0.0f, 360.0f, false, shadowPaint);
            Paint clearPaint = new Paint(this.paint);
            clearPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
            clearPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
            for (int i = 0; i < 5; i++) {
                canvas.drawArc(arcRect, 0.0f, 360.0f, false, clearPaint);
            }
        }
        if (this.progress == 0.0d) {
            if (this.animStartTime == 0) {
                this.animStartTime = System.currentTimeMillis();
            }
            float at = ((int) (System.currentTimeMillis() - this.animStartTime)) / 3500.0f;
            c.drawBitmap(shadow, 0.0f, 0.0f, (Paint) null);
            c.drawArc(arcRect, 0.0f, 360.0f, false, this.blackBgPaint);
            this.bgPaint.setAlpha(yforx(at) + 46);
            c.drawArc(arcRect, 0.0f, 360.0f, false, this.bgPaint);
            postInvalidate();
        } else {
            if (this.bgPaint.getAlpha() != 96) {
                if (this.animStartTime == 0) {
                    this.animStartTime = System.currentTimeMillis();
                    this.startAlpha = this.bgPaint.getAlpha();
                }
                int animTime = (int) (System.currentTimeMillis() - this.animStartTime);
                float at2 = animTime / 3500.0f;
                float it = this.ditp.getInterpolation(at2);
                if (animTime >= 300) {
                    this.animStartTime = 0L;
                    this.bgPaint.setAlpha(96);
                } else {
                    this.bgPaint.setAlpha(this.startAlpha + ((int) ((96 - this.startAlpha) * it)));
                    postInvalidate();
                }
            }
            c.drawBitmap(shadow, 0.0f, 0.0f, (Paint) null);
            c.drawArc(arcRect, 0.0f, 360.0f, false, this.blackBgPaint);
            c.drawArc(arcRect, 0.0f, 360.0f, false, this.bgPaint);
            c.drawArc(arcRect, -90.0f, (float) (this.animatedProgressValue * 360.0d), false, this.paint);
        }
        long newTime = System.currentTimeMillis();
        long dt = newTime - this.lastUpdateTime;
        this.lastUpdateTime = newTime;
        double progressDiff = this.progress - this.animationProgressStart;
        if (progressDiff > 0.0d) {
            this.currentProgressTime += dt;
            if (this.currentProgressTime >= 300) {
                this.animatedProgressValue = this.progress;
                this.animationProgressStart = this.progress;
                this.currentProgressTime = 0L;
            } else {
                this.animatedProgressValue = this.animationProgressStart + (this.interpolator.getInterpolation(((float) this.currentProgressTime) / 300.0f) * progressDiff);
            }
            postInvalidate();
        }
    }

    int yforx(float x) {
        return (int) Math.round(((-94.0d) * Math.abs(Math.sin(x * 3.141592653589793d))) + 100.0d);
    }

    /* loaded from: classes3.dex */
    private class MyInterpolator implements Interpolator {
        private DecelerateInterpolator dec = new DecelerateInterpolator(1.5f);
        private AccelerateInterpolator acc = new AccelerateInterpolator(1.5f);

        public MyInterpolator() {
        }

        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float input) {
            return ((double) input) <= 0.5d ? this.acc.getInterpolation(input * 2.0f) * 0.5f : (this.dec.getInterpolation((input - 0.5f) * 2.0f) * 0.5f) + 0.5f;
        }
    }
}
