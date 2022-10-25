package com.vkontakte.android.ui.cardview;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.NonNull;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class CardDrawable extends Drawable {
    private static final float SHADOW_MULTIPLIER = 1.5f;
    private float mCornerRadius;
    private Paint mCornerShadowPaint;
    private Path mCornerShadowPath;
    private boolean mDirty;
    private Paint mEdgeShadowPaint;
    private Paint mPaint;
    private final RectF mPreShadowBounds;
    private final int mShadowEndColor;
    private float mShadowSize;
    private final int mShadowStartColor;
    private final boolean mWideMode;
    private final RectF sCornerRect;

    public CardDrawable(Resources resources, int backgroundColor, float radius, boolean wideMode) {
        this.sCornerRect = new RectF();
        this.mDirty = true;
        this.mShadowStartColor = 419430400;
        this.mShadowEndColor = 0;
        this.mShadowSize = V.dp(1.66f) * SHADOW_MULTIPLIER;
        this.mPaint = new Paint(5);
        this.mPaint.setColor(backgroundColor);
        this.mCornerShadowPaint = new Paint(5);
        this.mCornerShadowPaint.setStyle(Paint.Style.FILL);
        this.mCornerShadowPaint.setDither(true);
        this.mCornerRadius = radius;
        this.mPreShadowBounds = new RectF();
        this.mEdgeShadowPaint = new Paint(this.mCornerShadowPaint);
        this.mWideMode = wideMode;
    }

    public float getShadowSize() {
        return this.mShadowSize;
    }

    public CardDrawable(Resources resources, int backgroundColor, float radius) {
        this(resources, backgroundColor, radius, false);
    }

    public CardDrawable(Resources resources, int backgroundColor) {
        this(resources, backgroundColor, V.dp(2.0f));
    }

    public CardDrawable(Resources resources) {
        this(resources, -1);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.mDirty = true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(@NonNull Rect padding) {
        int topShadow = (int) Math.ceil(this.mShadowSize * 0.33333334f);
        int sideShadow = this.mWideMode ? 0 : (int) Math.ceil(this.mShadowSize - topShadow);
        padding.set(sideShadow, topShadow, sideShadow, (int) Math.ceil(this.mShadowSize));
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mDirty) {
            buildComponents(getBounds());
            this.mDirty = false;
        }
        drawShadow(canvas);
        if (!this.mWideMode) {
            int count = canvas.save();
            float offset = this.mShadowSize * 0.6666666f;
            float horizontalOffset = this.mShadowSize - offset;
            canvas.translate(0.0f, -offset);
            this.mPreShadowBounds.bottom += offset;
            this.mPreShadowBounds.left -= horizontalOffset;
            this.mPreShadowBounds.right += horizontalOffset;
            this.mPreShadowBounds.top = Math.round(this.mPreShadowBounds.top);
            this.mPreShadowBounds.bottom = Math.round(this.mPreShadowBounds.bottom);
            drawRoundRect(canvas, this.mPreShadowBounds, this.mCornerRadius, this.mPaint);
            this.mPreShadowBounds.bottom -= offset;
            this.mPreShadowBounds.left += horizontalOffset;
            this.mPreShadowBounds.right -= horizontalOffset;
            canvas.translate(0.0f, offset);
            canvas.restoreToCount(count);
            return;
        }
        canvas.drawRect(0.0f, this.mPreShadowBounds.top - (this.mShadowSize * 0.6666666f), canvas.getWidth(), this.mPreShadowBounds.bottom, this.mPaint);
    }

    private void drawShadow(Canvas canvas) {
        int saved = canvas.save();
        float cornerPathSize = 2.0f * (this.mCornerRadius + this.mShadowSize);
        float edgeShadowTop = (-this.mCornerRadius) - this.mShadowSize;
        Rect bounds = getBounds();
        if (!this.mWideMode) {
            canvas.translate(this.mPreShadowBounds.left + this.mCornerRadius, this.mPreShadowBounds.top + this.mCornerRadius);
            canvas.drawPath(this.mCornerShadowPath, this.mCornerShadowPaint);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.width() - cornerPathSize, -this.mCornerRadius, this.mEdgeShadowPaint);
            canvas.rotate(180.0f);
            canvas.translate((-bounds.width()) + cornerPathSize, (-bounds.height()) + cornerPathSize);
            canvas.drawPath(this.mCornerShadowPath, this.mCornerShadowPaint);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.width() - cornerPathSize, this.mShadowSize + (-this.mCornerRadius), this.mEdgeShadowPaint);
            canvas.rotate(90.0f);
            canvas.translate(0.0f, (-bounds.width()) + cornerPathSize);
            canvas.drawPath(this.mCornerShadowPath, this.mCornerShadowPaint);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.height() - cornerPathSize, -this.mCornerRadius, this.mEdgeShadowPaint);
            canvas.rotate(180.0f);
            canvas.translate((-bounds.height()) + cornerPathSize, (-bounds.width()) + cornerPathSize);
            canvas.drawPath(this.mCornerShadowPath, this.mCornerShadowPaint);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.height() - cornerPathSize, -this.mCornerRadius, this.mEdgeShadowPaint);
        } else {
            canvas.translate(0.0f, this.mPreShadowBounds.top + this.mCornerRadius);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.width(), -this.mCornerRadius, this.mEdgeShadowPaint);
            canvas.rotate(180.0f);
            canvas.translate(-bounds.right, (-bounds.height()) + cornerPathSize);
            canvas.drawRect(0.0f, edgeShadowTop, bounds.width(), this.mShadowSize + (-this.mCornerRadius), this.mEdgeShadowPaint);
        }
        canvas.restoreToCount(saved);
    }

    private void buildShadowCorners() {
        RectF innerBounds = new RectF(-this.mCornerRadius, -this.mCornerRadius, this.mCornerRadius, this.mCornerRadius);
        RectF outerBounds = new RectF(innerBounds);
        outerBounds.inset(-this.mShadowSize, -this.mShadowSize);
        if (this.mCornerShadowPath == null) {
            this.mCornerShadowPath = new Path();
        } else {
            this.mCornerShadowPath.reset();
        }
        this.mCornerShadowPath.setFillType(Path.FillType.EVEN_ODD);
        this.mCornerShadowPath.moveTo(-this.mCornerRadius, 0.0f);
        this.mCornerShadowPath.rLineTo(-this.mShadowSize, 0.0f);
        this.mCornerShadowPath.arcTo(outerBounds, 180.0f, 90.0f, false);
        this.mCornerShadowPath.arcTo(innerBounds, 270.0f, -90.0f, false);
        this.mCornerShadowPath.close();
        float startRatio = this.mCornerRadius / (this.mCornerRadius + this.mShadowSize);
        this.mCornerShadowPaint.setShader(new RadialGradient(0.0f, 0.0f, this.mCornerRadius + this.mShadowSize, new int[]{this.mShadowStartColor, this.mShadowStartColor, this.mShadowEndColor}, new float[]{0.0f, startRatio, 1.0f}, Shader.TileMode.CLAMP));
        this.mEdgeShadowPaint.setShader(new LinearGradient(0.0f, (-this.mCornerRadius) + this.mShadowSize, 0.0f, (-this.mCornerRadius) - this.mShadowSize, new int[]{this.mShadowStartColor, this.mShadowStartColor, this.mShadowEndColor}, new float[]{0.0f, 0.5f, 1.0f}, Shader.TileMode.CLAMP));
    }

    private void buildComponents(Rect bounds) {
        this.mPreShadowBounds.set(bounds.left + this.mShadowSize, bounds.top + this.mShadowSize, bounds.right - this.mShadowSize, bounds.bottom - this.mShadowSize);
        buildShadowCorners();
    }

    public void drawRoundRect(Canvas canvas, RectF bounds, float cornerRadius, Paint paint) {
        if (Build.VERSION.SDK_INT >= 17) {
            canvas.drawRoundRect(bounds, cornerRadius, cornerRadius, paint);
            return;
        }
        float twoRadius = cornerRadius * 2.0f;
        float innerWidth = bounds.width() - twoRadius;
        float innerHeight = bounds.height() - twoRadius;
        this.sCornerRect.set(bounds.left, bounds.top, bounds.left + (2.0f * cornerRadius), bounds.top + (2.0f * cornerRadius));
        canvas.drawArc(this.sCornerRect, 180.0f, 90.0f, true, paint);
        this.sCornerRect.offset(innerWidth, 0.0f);
        canvas.drawArc(this.sCornerRect, 270.0f, 90.0f, true, paint);
        this.sCornerRect.offset(0.0f, innerHeight);
        canvas.drawArc(this.sCornerRect, 0.0f, 90.0f, true, paint);
        this.sCornerRect.offset(-innerWidth, 0.0f);
        canvas.drawArc(this.sCornerRect, 90.0f, 90.0f, true, paint);
        canvas.drawRect(bounds.left + cornerRadius, bounds.top, bounds.right - cornerRadius, bounds.top + cornerRadius, paint);
        canvas.drawRect(bounds.left + cornerRadius, bounds.bottom - cornerRadius, bounds.right - cornerRadius, bounds.bottom, paint);
        canvas.drawRect(bounds.left, bounds.top + cornerRadius, bounds.right, bounds.bottom - cornerRadius, paint);
    }

    public int getRadius() {
        return (int) this.mCornerRadius;
    }
}
