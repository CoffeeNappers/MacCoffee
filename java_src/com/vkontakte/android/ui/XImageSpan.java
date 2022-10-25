package com.vkontakte.android.ui;

import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.text.style.ImageSpan;
/* loaded from: classes3.dex */
public class XImageSpan extends ImageSpan {
    public XImageSpan(Drawable d, int verticalAlignment) {
        super(d, verticalAlignment);
    }

    @Override // android.text.style.DynamicDrawableSpan, android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        int sz = super.getSize(paint, text, start, end, fm);
        if (fm != null) {
            fm.ascent = (int) paint.ascent();
            fm.descent = (int) paint.descent();
            fm.bottom = (int) paint.descent();
        }
        int fh = Math.abs((int) paint.ascent()) + Math.abs((int) paint.descent());
        Drawable d = getDrawable();
        d.setBounds(0, 0, fh, fh);
        return sz;
    }
}
