package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.style.ReplacementSpan;
/* loaded from: classes3.dex */
public class DeleteTextSpan extends ReplacementSpan {
    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence charSequence, int i, int i1, Paint.FontMetricsInt fontMetricsInt) {
        return 0;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence charSequence, int i, int i1, float v, int i2, int i3, int i4, Paint paint) {
    }
}
