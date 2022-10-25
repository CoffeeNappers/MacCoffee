package com.my.target;

import android.util.Log;
/* loaded from: classes2.dex */
public class Tracer {
    private static final String TAG = "[myTarget]";
    public static boolean enabled = false;

    public static void d(String str) {
        if (enabled) {
            if (str == null) {
                str = "null";
            }
            Log.d(TAG, str);
        }
    }

    public static void e(String str) {
        if (enabled) {
            if (str == null) {
                str = "null";
            }
            Log.e(TAG, str);
        }
    }

    public static void i(String str) {
        if (str == null) {
            str = "null";
        }
        Log.i(TAG, str);
    }

    private Tracer() {
    }
}
