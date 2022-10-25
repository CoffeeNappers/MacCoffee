package com.vk.core.util;

import android.graphics.Color;
/* loaded from: classes2.dex */
public class ColorUtils {
    public static float LUMA_BORDER = 0.75f;

    public static int interpolateColors(int c0, int c1, float p) {
        int a = ave(Color.alpha(c0), Color.alpha(c1), p);
        int r = ave(Color.red(c0), Color.red(c1), p);
        int g = ave(Color.green(c0), Color.green(c1), p);
        int b = ave(Color.blue(c0), Color.blue(c1), p);
        return Color.argb(a, r, g, b);
    }

    private static int ave(int src, int dst, float p) {
        return Math.round((dst - src) * p) + src;
    }

    public static int getOverlayColor(int rgb) {
        return getOverlayColor(Color.red(rgb), Color.green(rgb), Color.blue(rgb));
    }

    public static float luma(int rgb) {
        return luma(Color.red(rgb), Color.green(rgb), Color.blue(rgb));
    }

    public static float luma(int _r, int _g, int _b) {
        float r = _r / 255.0f;
        float g = _g / 255.0f;
        float b = _b / 255.0f;
        float luma = (0.2126f * r) + (0.7152f * g) + (0.0722f * b);
        return luma;
    }

    public static int getOverlayColor(int _r, int _g, int _b) {
        float r = _r / 255.0f;
        float g = _g / 255.0f;
        float b = _b / 255.0f;
        float luma = (0.2126f * r) + (0.7152f * g) + (0.0722f * b);
        return luma > LUMA_BORDER ? Color.argb(255, 73, 79, 92) : Color.argb(255, 255, 255, 255);
    }

    public static int modifyAlpha(int color, float alpha) {
        return modifyAlpha(color, (int) (255.0f * alpha));
    }

    public static int modifyAlpha(int color, int alpha) {
        return (16777215 & color) | (alpha << 24);
    }
}
