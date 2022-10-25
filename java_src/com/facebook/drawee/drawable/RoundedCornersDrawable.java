package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import java.util.Arrays;
/* loaded from: classes.dex */
public class RoundedCornersDrawable extends ForwardingDrawable implements Rounded {
    private int mBorderColor;
    private final Path mBorderPath;
    @VisibleForTesting
    final float[] mBorderRadii;
    private float mBorderWidth;
    private boolean mIsCircle;
    private int mOverlayColor;
    private float mPadding;
    @VisibleForTesting
    final Paint mPaint;
    private final Path mPath;
    private final float[] mRadii;
    private final RectF mTempRectangle;
    @VisibleForTesting
    Type mType;

    /* loaded from: classes.dex */
    public enum Type {
        OVERLAY_COLOR,
        CLIPPING
    }

    public RoundedCornersDrawable(Drawable drawable) {
        super((Drawable) Preconditions.checkNotNull(drawable));
        this.mType = Type.OVERLAY_COLOR;
        this.mRadii = new float[8];
        this.mBorderRadii = new float[8];
        this.mPaint = new Paint(1);
        this.mIsCircle = false;
        this.mBorderWidth = 0.0f;
        this.mBorderColor = 0;
        this.mOverlayColor = 0;
        this.mPadding = 0.0f;
        this.mPath = new Path();
        this.mBorderPath = new Path();
        this.mTempRectangle = new RectF();
    }

    public void setType(Type type) {
        this.mType = type;
        invalidateSelf();
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
    public void setRadius(float radius) {
        Arrays.fill(this.mRadii, radius);
        updatePath();
        invalidateSelf();
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

    public void setOverlayColor(int overlayColor) {
        this.mOverlayColor = overlayColor;
        invalidateSelf();
    }

    public int getOverlayColor() {
        return this.mOverlayColor;
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public void setBorder(int color, float width) {
        this.mBorderColor = color;
        this.mBorderWidth = width;
        updatePath();
        invalidateSelf();
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
        this.mPadding = padding;
        updatePath();
        invalidateSelf();
    }

    @Override // com.facebook.drawee.drawable.Rounded
    public float getPadding() {
        return this.mPadding;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        updatePath();
    }

    private void updatePath() {
        this.mPath.reset();
        this.mBorderPath.reset();
        this.mTempRectangle.set(getBounds());
        this.mTempRectangle.inset(this.mPadding, this.mPadding);
        if (this.mIsCircle) {
            this.mPath.addCircle(this.mTempRectangle.centerX(), this.mTempRectangle.centerY(), Math.min(this.mTempRectangle.width(), this.mTempRectangle.height()) / 2.0f, Path.Direction.CW);
        } else {
            this.mPath.addRoundRect(this.mTempRectangle, this.mRadii, Path.Direction.CW);
        }
        this.mTempRectangle.inset(-this.mPadding, -this.mPadding);
        this.mTempRectangle.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
        if (this.mIsCircle) {
            float radius = Math.min(this.mTempRectangle.width(), this.mTempRectangle.height()) / 2.0f;
            this.mBorderPath.addCircle(this.mTempRectangle.centerX(), this.mTempRectangle.centerY(), radius, Path.Direction.CW);
        } else {
            for (int i = 0; i < this.mBorderRadii.length; i++) {
                this.mBorderRadii[i] = (this.mRadii[i] + this.mPadding) - (this.mBorderWidth / 2.0f);
            }
            this.mBorderPath.addRoundRect(this.mTempRectangle, this.mBorderRadii, Path.Direction.CW);
        }
        this.mTempRectangle.inset((-this.mBorderWidth) / 2.0f, (-this.mBorderWidth) / 2.0f);
    }

    @Override // com.facebook.drawee.drawable.ForwardingDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        switch (this.mType) {
            case CLIPPING:
                int saveCount = canvas.save();
                this.mPath.setFillType(Path.FillType.EVEN_ODD);
                canvas.clipPath(this.mPath);
                super.draw(canvas);
                canvas.restoreToCount(saveCount);
                break;
            case OVERLAY_COLOR:
                super.draw(canvas);
                this.mPaint.setColor(this.mOverlayColor);
                this.mPaint.setStyle(Paint.Style.FILL);
                this.mPath.setFillType(Path.FillType.INVERSE_EVEN_ODD);
                canvas.drawPath(this.mPath, this.mPaint);
                if (this.mIsCircle) {
                    float paddingH = ((bounds.width() - bounds.height()) + this.mBorderWidth) / 2.0f;
                    float paddingV = ((bounds.height() - bounds.width()) + this.mBorderWidth) / 2.0f;
                    if (paddingH > 0.0f) {
                        canvas.drawRect(bounds.left, bounds.top, bounds.left + paddingH, bounds.bottom, this.mPaint);
                        canvas.drawRect(bounds.right - paddingH, bounds.top, bounds.right, bounds.bottom, this.mPaint);
                    }
                    if (paddingV > 0.0f) {
                        canvas.drawRect(bounds.left, bounds.top, bounds.right, bounds.top + paddingV, this.mPaint);
                        canvas.drawRect(bounds.left, bounds.bottom - paddingV, bounds.right, bounds.bottom, this.mPaint);
                        break;
                    }
                }
                break;
        }
        if (this.mBorderColor != 0) {
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setColor(this.mBorderColor);
            this.mPaint.setStrokeWidth(this.mBorderWidth);
            this.mPath.setFillType(Path.FillType.EVEN_ODD);
            canvas.drawPath(this.mBorderPath, this.mPaint);
        }
    }
}
