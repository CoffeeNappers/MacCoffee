package com.my.tracker;

import android.util.Log;
/* compiled from: Tracer.java */
/* loaded from: classes2.dex */
public final class a {
    static volatile boolean a = false;
    static volatile LogHandler b;

    public static void a(String str) {
        if (a) {
            if (b == null) {
                if (str == null) {
                    str = "null";
                }
                Log.d("[myTracker]", str);
                return;
            }
            LogHandler logHandler = b;
            if (str == null) {
                str = "null";
            }
            logHandler.d(str);
        }
    }

    public static void b(String str) {
        if (b == null) {
            if (str == null) {
                str = "null";
            }
            Log.i("[myTracker]", str);
            return;
        }
        LogHandler logHandler = b;
        if (str == null) {
            str = "null";
        }
        logHandler.i(str);
    }

    public static void c(String str) {
        if (a) {
            if (b == null) {
                if (str == null) {
                    str = "null";
                }
                Log.e("[myTracker]", str);
                return;
            }
            LogHandler logHandler = b;
            if (str == null) {
                str = "null";
            }
            logHandler.e(str);
        }
    }

    public static void a(String str, Throwable th) {
        if (a) {
            if (b == null) {
                if (str == null) {
                    str = "null";
                }
                Log.e("[myTracker]", str, th);
                return;
            }
            LogHandler logHandler = b;
            if (str == null) {
                str = "null";
            }
            logHandler.e(str, th);
        }
    }
}
