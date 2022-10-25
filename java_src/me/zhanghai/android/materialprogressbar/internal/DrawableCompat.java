package me.zhanghai.android.materialprogressbar.internal;

import android.graphics.PorterDuff;
/* loaded from: classes3.dex */
public class DrawableCompat {
    public static PorterDuff.Mode parseTintMode(int value, PorterDuff.Mode defaultMode) {
        switch (value) {
            case 3:
                PorterDuff.Mode defaultMode2 = PorterDuff.Mode.SRC_OVER;
                return defaultMode2;
            case 4:
            case 6:
            case 7:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            default:
                return defaultMode;
            case 5:
                PorterDuff.Mode defaultMode3 = PorterDuff.Mode.SRC_IN;
                return defaultMode3;
            case 9:
                PorterDuff.Mode defaultMode4 = PorterDuff.Mode.SRC_ATOP;
                return defaultMode4;
            case 14:
                PorterDuff.Mode defaultMode5 = PorterDuff.Mode.MULTIPLY;
                return defaultMode5;
            case 15:
                PorterDuff.Mode defaultMode6 = PorterDuff.Mode.SCREEN;
                return defaultMode6;
            case 16:
                PorterDuff.Mode defaultMode7 = PorterDuff.Mode.ADD;
                return defaultMode7;
        }
    }
}
