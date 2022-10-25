package com.facebook.widget.text.span;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.style.ReplacementSpan;
/* loaded from: classes.dex */
public class BetterImageSpan extends ReplacementSpan {
    public static final int ALIGN_BASELINE = 1;
    public static final int ALIGN_BOTTOM = 0;
    public static final int ALIGN_CENTER = 2;
    private final int mAlignment;
    private Rect mBounds;
    private final Drawable mDrawable;
    private final Paint.FontMetricsInt mFontMetricsInt;
    private int mHeight;
    private int mWidth;

    /* loaded from: classes.dex */
    public @interface BetterImageSpanAlignment {
    }

    @BetterImageSpanAlignment
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

    public BetterImageSpan(Drawable drawable, @BetterImageSpanAlignment int verticalAlignment) {
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
        int offsetAbove = getOffsetAboveBaseline(fontMetrics);
        int offsetBelow = this.mHeight + offsetAbove;
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
            fontMetrics.descent = offsetBelow;
        }
        return this.mWidth;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        paint.getFontMetricsInt(this.mFontMetricsInt);
        int iconTop = y + getOffsetAboveBaseline(this.mFontMetricsInt);
        canvas.translate(x, iconTop);
        this.mDrawable.draw(canvas);
        canvas.translate(-x, -iconTop);
    }

    public void updateBounds() {
        this.mBounds = this.mDrawable.getBounds();
        this.mWidth = this.mBounds.width();
        this.mHeight = this.mBounds.height();
    }

    private int getOffsetAboveBaseline(Paint.FontMetricsInt fm) {
        switch (this.mAlignment) {
            case 0:
                return fm.descent - this.mHeight;
            case 1:
            default:
                return -this.mHeight;
            case 2:
                int textHeight = fm.descent - fm.ascent;
                int offset = (textHeight - this.mHeight) / 2;
                return fm.ascent + offset;
        }
    }
}
