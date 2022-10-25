package com.vkontakte.android.utils;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
/* loaded from: classes3.dex */
public class TypefaceSpanAssets extends MetricAffectingSpan {
    private final Typeface typeface;

    public TypefaceSpanAssets(Typeface typeface) {
        this.typeface = typeface;
    }

    @Override // android.text.style.CharacterStyle
    public void updateDrawState(TextPaint ds) {
        apply(ds, this.typeface);
    }

    @Override // android.text.style.MetricAffectingSpan
    public void updateMeasureState(TextPaint paint) {
        apply(paint, this.typeface);
    }

    private static void apply(Paint paint, Typeface type) {
        int oldStyle;
        Typeface old = paint.getTypeface();
        if (old == null) {
            oldStyle = 0;
        } else {
            oldStyle = old.getStyle();
        }
        int fake = oldStyle & (type.getStyle() ^ (-1));
        if ((fake & 1) != 0) {
            paint.setFakeBoldText(true);
        }
        if ((fake & 2) != 0) {
            paint.setTextSkewX(-0.25f);
        }
        paint.setTypeface(type);
    }
}
