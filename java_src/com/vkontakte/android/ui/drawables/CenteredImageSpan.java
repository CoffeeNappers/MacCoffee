package com.vkontakte.android.ui.drawables;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.text.style.ImageSpan;
/* loaded from: classes3.dex */
public class CenteredImageSpan extends ImageSpan {
    public CenteredImageSpan(Context context, int drawableRes) {
        super(context, drawableRes);
    }

    public CenteredImageSpan(Drawable drawable) {
        super(drawable);
    }

    @Override // android.text.style.DynamicDrawableSpan, android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        Rect rect = getDrawable().getBounds();
        if (fm != null) {
            Paint.FontMetricsInt pfm = paint.getFontMetricsInt();
            fm.ascent = pfm.ascent;
            fm.descent = pfm.descent;
            fm.top = pfm.top;
            fm.bottom = pfm.bottom;
        }
        return rect.right;
    }

    @Override // android.text.style.DynamicDrawableSpan, android.text.style.ReplacementSpan
    public void draw(@NonNull Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, @NonNull Paint paint) {
        canvas.save();
        Drawable drawable = getDrawable();
        int drawableHeight = drawable.getIntrinsicHeight();
        int fontAscent = paint.getFontMetricsInt().ascent;
        int fontDescent = paint.getFontMetricsInt().descent;
        int transY = (bottom - drawable.getBounds().bottom) + (((drawableHeight - fontDescent) + fontAscent) / 2);
        canvas.translate(x, transY);
        drawable.draw(canvas);
        canvas.restore();
    }
}
