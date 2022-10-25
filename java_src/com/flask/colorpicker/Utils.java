package com.flask.colorpicker;

import android.graphics.Color;
/* loaded from: classes.dex */
public class Utils {
    public static float getAlphaPercent(int argb) {
        return Color.alpha(argb) / 255.0f;
    }

    public static int alphaValueAsInt(float alpha) {
        return Math.round(255.0f * alpha);
    }

    public static int adjustAlpha(float alpha, int color) {
        return (alphaValueAsInt(alpha) << 24) | (16777215 & color);
    }

    public static int colorAtLightness(int color, float lightness) {
        Color.colorToHSV(color, hsv);
        float[] hsv = {0.0f, 0.0f, lightness};
        return Color.HSVToColor(hsv);
    }

    public static float lightnessOfColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        return hsv[2];
    }
}
