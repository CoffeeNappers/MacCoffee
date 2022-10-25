package ru.mail.libverify.utils;

import android.content.Context;
import java.lang.ref.WeakReference;
import java.util.Locale;
/* loaded from: classes3.dex */
public class d {
    private static volatile LogReceiver a = null;
    private static volatile WeakReference<Context> b = null;
    private static volatile LogReceiver c;

    public static void a(String str, String str2) {
        if (!a()) {
            return;
        }
        b().e(str, str2);
    }

    public static void a(String str, String str2, Throwable th) {
        if (!a()) {
            return;
        }
        b().e(str, str2, th);
    }

    public static void a(String str, String str2, Object... objArr) {
        if (!a()) {
            return;
        }
        b().e(str, String.format(Locale.US, str2, objArr));
    }

    public static void a(String str, Throwable th, String str2, Object... objArr) {
        if (!a()) {
            return;
        }
        b().e(str, String.format(Locale.US, str2, objArr), th);
    }

    public static void a(LogReceiver logReceiver) {
        c = logReceiver;
    }

    private static boolean a() {
        return c != null;
    }

    private static LogReceiver b() {
        LogReceiver logReceiver = a;
        if (logReceiver == null) {
            synchronized (d.class) {
                logReceiver = a;
                if (logReceiver == null && c != null) {
                    logReceiver = c;
                    a = logReceiver;
                }
            }
        }
        return logReceiver;
    }

    public static void b(String str, String str2) {
        if (!a()) {
            return;
        }
        b().d(str, str2);
    }

    public static void b(String str, String str2, Throwable th) {
        if (!a()) {
            return;
        }
        b().d(str, str2, th);
    }

    public static void b(String str, String str2, Object... objArr) {
        if (!a()) {
            return;
        }
        b().d(str, String.format(Locale.US, str2, objArr));
    }

    public static void b(String str, Throwable th, String str2, Object... objArr) {
        if (!a()) {
            return;
        }
        b().d(str, String.format(Locale.US, str2, objArr), th);
    }

    public static void c(String str, String str2) {
        if (!a()) {
            return;
        }
        b().v(str, str2);
    }

    public static void c(String str, String str2, Throwable th) {
        if (!a()) {
            return;
        }
        b().v(str, str2, th);
    }

    public static void c(String str, String str2, Object... objArr) {
        if (!a()) {
            return;
        }
        b().v(str, String.format(Locale.US, str2, objArr));
    }
}
