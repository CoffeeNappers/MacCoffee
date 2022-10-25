package com.vk.emoji;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.style.ReplacementSpan;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
class BetterImageSpan extends ReplacementSpan {
    public static final int ALIGN_BASELINE = 1;
    public static final int ALIGN_BOTTOM = 0;
    public static final int ALIGN_CENTER = 2;
    private final int mAlignment;
    private Rect mBounds;
    private final Drawable mDrawable;
    private final Paint.FontMetricsInt mFontMetricsInt;
    private int mHeight;
    private int mWidth;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface BetterImageSpanAlignment {
    }

    public static final int normalizeAlignment(int alignment) {
        switch (alignment) {
            case 0:
                return 0;
            case 1:
            default:
                return 1;
            case 2:
                return 2;
        }
    }

    public BetterImageSpan(Drawable drawable) {
        this(drawable, 1);
    }

    public BetterImageSpan(Drawable drawable, int verticalAlignment) {
        this.mFontMetricsInt = new Paint.FontMetricsInt();
        this.mDrawable = drawable;
        this.mAlignment = verticalAlignment;
        updateBounds();
    }

    public Drawable getDrawable() {
        return this.mDrawable;
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fontMetrics) {
        updateBounds();
        if (fontMetrics == null) {
            return this.mWidth;
        }
        updateFontMetrics(fontMetrics, this.mAlignment, this.mHeight);
        return this.mWidth;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        paint.getFontMetricsInt(this.mFontMetricsInt);
        int iconTop = y + getOffsetAboveBaseline(this.mFontMetricsInt, this.mAlignment, this.mHeight);
        canvas.translate(x, iconTop);
        this.mDrawable.draw(canvas);
        canvas.translate(-x, -iconTop);
    }

    public void updateBounds() {
        this.mBounds = this.mDrawable.getBounds();
        this.mWidth = this.mBounds.width();
        this.mHeight = this.mBounds.height();
    }

    public static void updateFontMetrics(Paint.FontMetricsInt fontMetrics, int alignment, int height) {
        if (isZeroFontMetrics(fontMetrics)) {
            int top = (int) ((-0.75f) * height);
            int bottom = top + height;
            fontMetrics.ascent = top;
            fontMetrics.top = top;
            fontMetrics.descent = bottom;
            fontMetrics.bottom = bottom;
            return;
        }
        int offsetAbove = getOffsetAboveBaseline(fontMetrics, alignment, height);
        int offsetBelow = height + offsetAbove;
        if (offsetAbove < fontMetrics.ascent) {
            fontMetrics.ascent = offsetAbove;
        }
        if (offsetAbove < fontMetrics.top) {
            fontMetrics.top = offsetAbove;
        }
        if (offsetBelow > fontMetrics.descent) {
            fontMetrics.descent = offsetBelow;
        }
        if (offsetBelow > fontMetrics.bottom) {
            fontMetrics.bottom = offsetBelow;
        }
    }

    private static int getOffsetAboveBaseline(Paint.FontMetricsInt fm, int alignment, int height) {
        switch (alignment) {
            case 0:
                return fm.descent - height;
            case 1:
            default:
                return -height;
            case 2:
                int textHeight = fm.descent - fm.ascent;
                int offset = (textHeight - height) / 2;
                return fm.ascent + offset;
        }
    }

    private static boolean isZeroFontMetrics(Paint.FontMetricsInt fm) {
        return fm.descent == 0 && fm.top == 0 && fm.ascent == 0 && fm.bottom == 0;
    }
}
