package com.vkontakte.android.ui;

import android.graphics.Typeface;
import android.os.Build;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public enum Font {
    Medium("Roboto-Medium.ttf", "sans-serif-medium", 0, 21),
    Light("", "sans-serif-light", 0, 16),
    Regular("", "sans-serif-regular", 0, 16),
    Bold("", "sans-serif-regular", 1, 16);
    
    private static final String FONTS_FOLDER = "fonts";
    public final Typeface typeface;

    Font(String localPath, String systemName, int typefaceStyle, int sdkVersion) {
        if (Build.VERSION.SDK_INT >= sdkVersion) {
            this.typeface = Typeface.create(systemName, typefaceStyle);
        } else {
            this.typeface = Typeface.createFromAsset(VKApplication.context.getResources().getAssets(), "fonts/" + localPath);
        }
    }

    /* loaded from: classes3.dex */
    public static class TypefaceSpan extends MetricAffectingSpan {
        private Integer mColor;
        private Typeface mTypeface;

        public TypefaceSpan(Font font) {
            this.mColor = null;
            this.mTypeface = font.typeface;
        }

        public TypefaceSpan(Font font, int color) {
            this(font);
            this.mColor = Integer.valueOf(color);
        }

        @Override // android.text.style.MetricAffectingSpan
        public void updateMeasureState(TextPaint p) {
            if (this.mTypeface != null) {
                p.setTypeface(this.mTypeface);
            }
            if (this.mColor != null) {
                p.setColor(this.mColor.intValue());
            }
            p.setFlags(p.getFlags() | 128);
        }

        @Override // android.text.style.CharacterStyle
        public void updateDrawState(TextPaint tp) {
            if (this.mTypeface != null) {
                tp.setTypeface(this.mTypeface);
            }
            if (this.mColor != null) {
                tp.setColor(this.mColor.intValue());
            }
            tp.setFlags(tp.getFlags() | 128);
        }
    }
}
