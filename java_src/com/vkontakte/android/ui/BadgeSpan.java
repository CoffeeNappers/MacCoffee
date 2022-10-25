package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.text.style.ReplacementSpan;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class BadgeSpan extends ReplacementSpan {
    private Paint bgPaint = new Paint(1);
    private RectF rect = new RectF();

    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        return Math.round(paint.measureText(text, start, end)) + V.dp(12.0f);
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        this.bgPaint.setColor((Math.round(paint.getAlpha() * 0.16f) << 24) | (paint.getColor() & ViewCompat.MEASURED_SIZE_MASK));
        this.rect.set(x, top, Math.round(paint.measureText(text, start, end)) + x + V.dp(12.0f), bottom);
        canvas.drawRoundRect(this.rect, V.dp(2.0f), V.dp(2.0f), this.bgPaint);
        canvas.drawText(text, start, end, x + V.dp(6.0f), y, paint);
    }
}
