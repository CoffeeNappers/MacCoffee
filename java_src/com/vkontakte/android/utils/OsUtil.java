package com.vkontakte.android.utils;

import android.os.Build;
/* loaded from: classes3.dex */
public final class OsUtil {
    private static final boolean sIsAtLeastICS_MR1;
    private static final boolean sIsAtLeastJB;
    private static final boolean sIsAtLeastJB_MR1;
    private static final boolean sIsAtLeastJB_MR2;
    private static final boolean sIsAtLeastKLP;
    private static final boolean sIsAtLeastKLP_W;
    private static final boolean sIsAtLeastL;
    private static final boolean sIsAtLeastL_MR1;
    private static final boolean sIsAtLeastM;
    private static final boolean sIsAtLeastN;
    private static final boolean sIsAtLeastN_MR1;

    private OsUtil() {
    }

    static {
        boolean z = true;
        int v = getApiVersion();
        sIsAtLeastICS_MR1 = v >= 15;
        sIsAtLeastJB = v >= 16;
        sIsAtLeastJB_MR1 = v >= 17;
        sIsAtLeastJB_MR2 = v >= 18;
        sIsAtLeastKLP = v >= 19;
        sIsAtLeastKLP_W = v >= 20;
        sIsAtLeastL = v >= 21;
        sIsAtLeastL_MR1 = v >= 22;
        sIsAtLeastM = v >= 23;
        sIsAtLeastN = v >= 24;
        if (v < 25) {
            z = false;
        }
        sIsAtLeastN_MR1 = z;
    }

    public static boolean isAtLeastICS_MR1() {
        return sIsAtLeastICS_MR1;
    }

    public static boolean isAtLeastJB() {
        return sIsAtLeastJB;
    }

    public static boolean isAtLeastJB_MR1() {
        return sIsAtLeastJB_MR1;
    }

    public static boolean isAtLeastJB_MR2() {
        return sIsAtLeastJB_MR2;
    }

    public static boolean isAtLeastKLP() {
        return sIsAtLeastKLP;
    }

    public static boolean isAtLeastKLP_W() {
        return sIsAtLeastKLP_W;
    }

    public static boolean isAtLeastL() {
        return sIsAtLeastL;
    }

    public static boolean isAtLeastL_MR1() {
        return sIsAtLeastL_MR1;
    }

    public static boolean isAtLeastM() {
        return sIsAtLeastM;
    }

    public static boolean isAtLeastN() {
        return sIsAtLeastN;
    }

    public static boolean isAtLeastN_MR1() {
        return sIsAtLeastN_MR1;
    }

    public static int getApiVersion() {
        return Build.VERSION.SDK_INT;
    }
}
