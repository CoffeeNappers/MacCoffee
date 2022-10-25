package com.vkontakte.android.ui.drawables;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.util.TypedValue;
/* loaded from: classes3.dex */
public class TextDrawable extends Drawable {
    private static final int DEFAULT_COLOR = -1;
    private static final int DEFAULT_TEXT_SIZE = 12;
    private final int mIntrinsicHeight;
    private final int mIntrinsicWidth;
    private final Paint mPaint = new Paint(1);
    private final CharSequence mText;

    public TextDrawable(Resources res, CharSequence text, int padding) {
        this.mText = text;
        this.mPaint.setColor(-1);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mPaint.setFakeBoldText(true);
        float textSize = TypedValue.applyDimension(2, 12.0f, res.getDisplayMetrics());
        this.mPaint.setTextSize(textSize);
        this.mIntrinsicWidth = ((int) (this.mPaint.measureText(this.mText, 0, this.mText.length()) + 0.5d)) + (padding * 2);
        this.mIntrinsicHeight = this.mPaint.getFontMetricsInt(null) + padding;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(@NonNull Canvas canvas) {
        Rect bounds = getBounds();
        canvas.drawText(this.mText.toString(), bounds.centerX(), (int) (bounds.centerY() - ((this.mPaint.descent() + this.mPaint.ascent()) / 2.0f)), this.mPaint);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.mPaint.getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mIntrinsicWidth;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mIntrinsicHeight;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter filter) {
        this.mPaint.setColorFilter(filter);
    }
}
