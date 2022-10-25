package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import java.util.Arrays;
/* loaded from: classes.dex */
public class RoundedColorDrawable extends Drawable implements Rounded {
    private int mAlpha;
    private int mBorderColor;
    @VisibleForTesting
    final Path mBorderPath;
    @VisibleForTesting
    final float[] mBorderRadii;
    private float mBorderWidth;
    private int mColor;
    private boolean mIsCircle;
    private float mPadding;
    @VisibleForTesting
    final Paint mPaint;
    @VisibleForTesting
    final Path mPath;
    private final float[] mRadii;
    private final RectF mTempRect;

    public RoundedColorDrawable(int color) {
        this.mRadii = new float[8];
        this.mBorderRadii = new float[8];
        this.mPaint = new Paint(1);
        this.mIsCircle = false;
        this.mBorderWidth = 0.0f;
        this.mPadding = 0.0f;
        this.mBorderColor = 0;
        this.mPath = new Path();
        this.mBorderPath = new Path();
        this.mColor = 0;
        this.mTempRect = new RectF();
        this.mAlpha = 255;
        setColor(color);
    }

    public static RoundedColorDrawable fromColorDrawable(ColorDrawable colorDrawable) {
        return new RoundedColorDrawable(colorDrawable.getColor());
    }

    public RoundedColorDrawable(float[] radii, int color) {
        this(color);
        setRadii(radii);
    }

    public RoundedColorDrawable(float radius, int color) {
        this(color);
        setRadius(radius);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        updatePath();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.mPaint.setColor(DrawableUtils.multiplyColorAlpha(this.mColor, this.mAlpha));
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawPath(this.mPath, this.mPaint);
        if (this.mBorderWidth != 0.0f) {
            this.mPaint.setColor(DrawableUtils.multiplyColorAlpha(this.mBorderColor, this.mAlpha));
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setStrokeWidth(this.mBorderWidth);
            canvas.drawPath(this.mBorderPath, this.mPaint);
        }
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setCircle(boolean isCircle) {
        this.mIsCircle = isCircle;
        updatePath();
        invalidateSelf();
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public boolean isCircle() {
        return this.mIsCircle;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setRadii(float[] radii) {
        if (radii == null) {
            Arrays.fill(this.mRadii, 0.0f);
        } else {
            Preconditions.checkArgument(radii.length == 8, "radii should have exactly 8 values");
            System.arraycopy(radii, 0, this.mRadii, 0, 8);
        }
        updatePath();
        invalidateSelf();
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public float[] getRadii() {
        return this.mRadii;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setRadius(float radius) {
        Preconditions.checkArgument(radius >= 0.0f, "radius should be non negative");
        Arrays.fill(this.mRadii, radius);
        updatePath();
        invalidateSelf();
    }

    public void setColor(int color) {
        if (this.mColor != color) {
            this.mColor = color;
            invalidateSelf();
        }
    }

    public int getColor() {
        return this.mColor;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setBorder(int color, float width) {
        if (this.mBorderColor != color) {
            this.mBorderColor = color;
            invalidateSelf();
        }
        if (this.mBorderWidth != width) {
            this.mBorderWidth = width;
            updatePath();
            invalidateSelf();
        }
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public int getBorderColor() {
        return this.mBorderColor;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public float getBorderWidth() {
        return this.mBorderWidth;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setPadding(float padding) {
        if (this.mPadding != padding) {
            this.mPadding = padding;
            updatePath();
            invalidateSelf();
        }
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public float getPadding() {
        return this.mPadding;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (alpha != this.mAlpha) {
            this.mAlpha = alpha;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.mAlpha;
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return DrawableUtils.getOpacityFromColor(DrawableUtils.multiplyColorAlpha(this.mColor, this.mAlpha));
    }

    private void updatePath() {
        this.mPath.reset();
        this.mBorderPath.reset();
        this.mTempRect.set(getBounds());
        this.mTempRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
        if (this.mIsCircle) {
            float radius = Math.min(this.mTempRect.width(), this.mTempRect.height()) / 2.0f;
            this.mBorderPath.addCircle(this.mTempRect.centerX(), this.mTempRect.centerY(), radius, Path.Direction.CW);
        } else {
            for (int i = 0; i < this.mBorderRadii.length; i++) {
                this.mBorderRadii[i] = (this.mRadii[i] + this.mPadding) - (this.mBorderWidth / 2.0f);
            }
            this.mBorderPath.addRoundRect(this.mTempRect, this.mBorderRadii, Path.Direction.CW);
        }
        this.mTempRect.inset((-this.mBorderWidth) / 2.0f, (-this.mBorderWidth) / 2.0f);
        this.mTempRect.inset(this.mPadding, this.mPadding);
        if (this.mIsCircle) {
            float radius2 = Math.min(this.mTempRect.width(), this.mTempRect.height()) / 2.0f;
            this.mPath.addCircle(this.mTempRect.centerX(), this.mTempRect.centerY(), radius2, Path.Direction.CW);
        } else {
            this.mPath.addRoundRect(this.mTempRect, this.mRadii, Path.Direction.CW);
        }
        this.mTempRect.inset(-this.mPadding, -this.mPadding);
    }
}
