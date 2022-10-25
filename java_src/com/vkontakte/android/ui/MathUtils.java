package com.vkontakte.android.ui;
/* loaded from: classes3.dex */
public class MathUtils {
    private MathUtils() {
    }

    public static int truncate(int item, int to) {
        int boundary = (item / to) * to;
        if (boundary == item) {
            return boundary - to;
        }
        return boundary;
    }
}
