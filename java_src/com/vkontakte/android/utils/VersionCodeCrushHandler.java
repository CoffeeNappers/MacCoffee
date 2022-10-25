package com.vkontakte.android.utils;

import android.content.Context;
import android.content.pm.PackageManager;
import java.lang.Thread;
/* loaded from: classes.dex */
public class VersionCodeCrushHandler implements Thread.UncaughtExceptionHandler {
    private static int versionCode;
    private final Thread.UncaughtExceptionHandler nextHandler = Thread.getDefaultUncaughtExceptionHandler();

    public VersionCodeCrushHandler(Context context) {
        versionCode = getVersionCode(context);
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable ex) {
        if (this.nextHandler != null) {
            StackTraceElement[] elements = ex.getStackTrace();
            ex.setStackTrace(addVersionCodeInfo(elements, versionCode));
            this.nextHandler.uncaughtException(thread, ex);
        }
    }

    public static int getVersionCode(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            L.e(e, new Object[0]);
            return 0;
        }
    }

    public static StackTraceElement[] addVersionCodeInfo(StackTraceElement[] stackTrace, int versionCode2) {
        int originalLength = stackTrace == null ? 0 : stackTrace.length;
        StackTraceElement[] newStackTrace = new StackTraceElement[originalLength + 1];
        newStackTrace[originalLength] = new StackTraceElement("InfoAboutApp", "VersionCode", "numberVersionCode", versionCode2);
        if (stackTrace != null) {
            System.arraycopy(stackTrace, 0, newStackTrace, 0, originalLength);
        }
        return newStackTrace;
    }
}
