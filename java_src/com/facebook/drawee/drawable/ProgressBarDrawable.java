package com.facebook.drawee.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
/* loaded from: classes.dex */
public class ProgressBarDrawable extends Drawable implements CloneableDrawable {
    private final Paint mPaint = new Paint(1);
    private final Path mPath = new Path();
    private final RectF mRect = new RectF();
    private int mBackgroundColor = Integer.MIN_VALUE;
    private int mColor = -2147450625;
    private int mPadding = 10;
    private int mBarWidth = 20;
    private int mLevel = 0;
    private int mRadius = 0;
    private boolean mHideWhenZero = false;
    private boolean mIsVertical = false;

    public void setColor(int color) {
        if (this.mColor != color) {
            this.mColor = color;
            invalidateSelf();
        }
    }

    public int getColor() {
        return this.mColor;
    }

    public void setBackgroundColor(int backgroundColor) {
        if (this.mBackgroundColor != backgroundColor) {
            this.mBackgroundColor = backgroundColor;
            invalidateSelf();
        }
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public void setPadding(int padding) {
        if (this.mPadding != padding) {
            this.mPadding = padding;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect padding) {
        padding.set(this.mPadding, this.mPadding, this.mPadding, this.mPadding);
        return this.mPadding != 0;
    }

    public void setBarWidth(int barWidth) {
        if (this.mBarWidth != barWidth) {
            this.mBarWidth = barWidth;
            invalidateSelf();
        }
    }

    public int getBarWidth() {
        return this.mBarWidth;
    }

    public void setHideWhenZero(boolean hideWhenZero) {
        this.mHideWhenZero = hideWhenZero;
    }

    public boolean getHideWhenZero() {
        return this.mHideWhenZero;
    }

    public void setRadius(int radius) {
        if (this.mRadius != radius) {
            this.mRadius = radius;
            invalidateSelf();
        }
    }

    public int getRadius() {
        return this.mRadius;
    }

    public void setIsVertical(boolean isVertical) {
        if (this.mIsVertical != isVertical) {
            this.mIsVertical = isVertical;
            invalidateSelf();
        }
    }

    public boolean getIsVertical() {
        return this.mIsVertical;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        this.mLevel = level;
        invalidateSelf();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return DrawableUtils.getOpacityFromColor(this.mPaint.getColor());
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (!this.mHideWhenZero || this.mLevel != 0) {
            if (this.mIsVertical) {
                drawVerticalBar(canvas, 10000, this.mBackgroundColor);
                drawVerticalBar(canvas, this.mLevel, this.mColor);
                return;
            }
            drawHorizontalBar(canvas, 10000, this.mBackgroundColor);
            drawHorizontalBar(canvas, this.mLevel, this.mColor);
        }
    }

    @Override // com.facebook.drawee.drawable.CloneableDrawable
    /* renamed from: cloneDrawable */
    public Drawable mo212cloneDrawable() {
        ProgressBarDrawable copy = new ProgressBarDrawable();
        copy.mBackgroundColor = this.mBackgroundColor;
        copy.mColor = this.mColor;
        copy.mPadding = this.mPadding;
        copy.mBarWidth = this.mBarWidth;
        copy.mLevel = this.mLevel;
        copy.mRadius = this.mRadius;
        copy.mHideWhenZero = this.mHideWhenZero;
        copy.mIsVertical = this.mIsVertical;
        return copy;
    }

    private void drawHorizontalBar(Canvas canvas, int level, int color) {
        Rect bounds = getBounds();
        int length = ((bounds.width() - (this.mPadding * 2)) * level) / 10000;
        int xpos = bounds.left + this.mPadding;
        int ypos = (bounds.bottom - this.mPadding) - this.mBarWidth;
        this.mRect.set(xpos, ypos, xpos + length, this.mBarWidth + ypos);
        drawBar(canvas, color);
    }

    private void drawVerticalBar(Canvas canvas, int level, int color) {
        Rect bounds = getBounds();
        int length = ((bounds.height() - (this.mPadding * 2)) * level) / 10000;
        int xpos = bounds.left + this.mPadding;
        int ypos = bounds.top + this.mPadding;
        this.mRect.set(xpos, ypos, this.mBarWidth + xpos, ypos + length);
        drawBar(canvas, color);
    }

    private void drawBar(Canvas canvas, int color) {
        this.mPaint.setColor(color);
        this.mPaint.setStyle(Paint.Style.FILL_AND_STROKE);
        this.mPath.reset();
        this.mPath.setFillType(Path.FillType.EVEN_ODD);
        this.mPath.addRoundRect(this.mRect, Math.min(this.mRadius, this.mBarWidth / 2), Math.min(this.mRadius, this.mBarWidth / 2), Path.Direction.CW);
        canvas.drawPath(this.mPath, this.mPaint);
    }
}
