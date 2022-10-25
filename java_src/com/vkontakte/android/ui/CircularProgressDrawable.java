package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import com.vkontakte.android.Global;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class CircularProgressDrawable extends Drawable {
    private float animatedProgressValue;
    private float animationProgressStart;
    private Path checkMark;
    private Path circleAnim;
    private Paint clearPaint;
    private long currentProgressTime;
    private long doneAnimStart;
    private Paint fgPaint;
    private long lastUpdateTime;
    private int level;
    private Paint pbPaint;
    private Paint pbgPaint;
    private boolean playingDoneAnim;
    private boolean useCheckMark;
    private boolean dimBg = true;
    private boolean pad = true;
    private Interpolator interpolator = new DecelerateInterpolator();
    private Interpolator accInterpolator = new AccelerateInterpolator();
    private Interpolator overInterpolator = new OvershootInterpolator();
    private Matrix matrix = new Matrix();
    private RectF tmpRect = new RectF();
    private Rect rect = new Rect();
    private int DEFAULT_SIZE_DIP = 70;
    private Paint bgPaint = new Paint(1);

    public CircularProgressDrawable(boolean useCheckMark) {
        this.bgPaint.setColor(1342177280);
        this.pbgPaint = new Paint();
        this.pbgPaint.setColor(1090519039);
        this.pbgPaint.setStyle(Paint.Style.STROKE);
        this.pbgPaint.setStrokeWidth(Global.scale(3.0f));
        this.pbgPaint.setAntiAlias(true);
        this.pbPaint = new Paint();
        this.pbPaint.setColor(-1);
        this.pbPaint.setStyle(Paint.Style.STROKE);
        this.pbPaint.setStrokeWidth(Global.scale(3.0f));
        this.pbPaint.setAntiAlias(true);
        this.pbPaint.setStrokeCap(Paint.Cap.ROUND);
        this.fgPaint = new Paint();
        this.fgPaint.setColor(-1);
        this.fgPaint.setAntiAlias(true);
        this.clearPaint = new Paint();
        this.clearPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.clearPaint.setAntiAlias(true);
        this.clearPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        this.useCheckMark = useCheckMark;
        if (useCheckMark) {
            this.circleAnim = new Path();
            this.circleAnim.setFillType(Path.FillType.EVEN_ODD);
        }
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        if (this.useCheckMark) {
            this.checkMark = new Path();
            this.checkMark.moveTo(0.36233333f, -0.21821874f);
            this.checkMark.lineTo(0.3191875f, -0.26139584f);
            this.checkMark.lineTo(-0.12597917f, 0.18776041f);
            this.checkMark.lineTo(-0.3294375f, -0.014427084f);
            this.checkMark.lineTo(-0.3726146f, 0.028729167f);
            this.checkMark.lineTo(-0.12564583f, 0.27414584f);
            this.checkMark.lineTo(-0.08248958f, 0.231f);
            this.checkMark.lineTo(-0.0826875f, 0.23079167f);
            this.checkMark.close();
            this.checkMark.toggleInverseFillType();
            int cs = this.pad ? (int) Math.min(Math.min(bounds.height(), bounds.width()) / 2.0f, Global.scale(this.DEFAULT_SIZE_DIP)) : Math.min(bounds.height(), bounds.width()) - ((int) this.pbPaint.getStrokeWidth());
            Matrix m = new Matrix();
            m.setScale(cs * 0.7f, cs * 0.7f);
            this.checkMark.transform(m);
        }
    }

    public void setColors(int ringColor, int fillColor) {
        this.pbgPaint.setColor(ringColor);
        this.pbPaint.setColor(fillColor);
    }

    public void setDimBackground(boolean dim) {
        this.dimBg = dim;
    }

    public void setThickness(float t) {
        this.pbPaint.setStrokeWidth(V.dp(t));
        this.pbgPaint.setStrokeWidth(V.dp(t));
    }

    public void setPad(boolean p) {
        this.pad = p;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean onLevelChange(int level) {
        this.level = level;
        this.animationProgressStart = this.animatedProgressValue;
        this.currentProgressTime = 0L;
        invalidateSelf();
        return true;
    }

    public void playDoneAnimation() {
        this.playingDoneAnim = true;
        this.doneAnimStart = System.currentTimeMillis();
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas c) {
        float progr = getLevel() / 10000.0f;
        this.tmpRect.set(getBounds());
        this.rect.set(getBounds());
        int cs = this.pad ? (int) Math.min(Math.min(this.rect.height(), this.rect.width()) / 2.0f, Global.scale(this.DEFAULT_SIZE_DIP)) : Math.min(this.rect.height(), this.rect.width()) - ((int) this.pbPaint.getStrokeWidth());
        if (this.dimBg) {
            c.drawRoundRect(this.tmpRect, V.dp(2.0f), V.dp(2.0f), this.bgPaint);
        }
        RectF pb = this.tmpRect;
        pb.set((this.rect.left + (this.rect.width() / 2)) - (cs / 2), (this.rect.top + (this.rect.height() / 2)) - (cs / 2), this.rect.left + (this.rect.width() / 2) + (cs / 2), this.rect.top + (this.rect.height() / 2) + (cs / 2));
        if (this.useCheckMark && this.playingDoneAnim) {
            float time = ((float) (System.currentTimeMillis() - this.doneAnimStart)) / 500.0f;
            pb.inset((-this.pbPaint.getStrokeWidth()) / 2.0f, (-this.pbPaint.getStrokeWidth()) / 2.0f);
            if (time <= 0.5d) {
                this.circleAnim.reset();
                this.circleAnim.addArc(pb, 0.0f, 360.0f);
                pb.inset(Math.max((pb.width() / 2.0f) * this.accInterpolator.getInterpolation(2.0f * time), this.pbPaint.getStrokeWidth()), Math.max((pb.height() / 2.0f) * this.accInterpolator.getInterpolation(2.0f * time), this.pbPaint.getStrokeWidth()));
                this.circleAnim.addArc(pb, 0.0f, 360.0f);
                c.drawPath(this.circleAnim, this.fgPaint);
            }
            if (this.checkMark != null && time > 0.5d) {
                float t = this.overInterpolator.getInterpolation((time - 0.5f) * 2.0f);
                this.circleAnim.reset();
                this.circleAnim.addArc(pb, 0.0f, 360.0f);
                this.matrix.reset();
                this.matrix.setTranslate(pb.centerX(), pb.centerY());
                this.matrix.postScale(t, t, pb.centerX(), pb.centerY());
                this.circleAnim.addPath(this.checkMark, this.matrix);
                c.drawPath(this.circleAnim, this.fgPaint);
            }
            if (time < 1.0f) {
                invalidateSelf();
                return;
            }
            return;
        }
        c.drawArc(pb, 0.0f, 360.0f, false, this.pbgPaint);
        c.drawArc(pb, 0.0f, 360.0f * this.animatedProgressValue, false, this.pbPaint);
        long newTime = System.currentTimeMillis();
        long dt = newTime - this.lastUpdateTime;
        this.lastUpdateTime = newTime;
        float progressDiff = progr - this.animationProgressStart;
        if (progressDiff > 0.0f) {
            this.currentProgressTime += dt;
            if (this.currentProgressTime >= 300) {
                this.animatedProgressValue = progr;
                this.animationProgressStart = progr;
                this.currentProgressTime = 0L;
            } else {
                this.animatedProgressValue = this.animationProgressStart + (this.interpolator.getInterpolation(((float) this.currentProgressTime) / 300.0f) * progressDiff);
            }
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return -1;
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
}
