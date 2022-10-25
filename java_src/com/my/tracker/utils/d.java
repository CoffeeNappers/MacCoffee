package com.my.tracker.utils;

import android.content.Context;
import android.os.Build;
/* compiled from: PermissionUtils.java */
/* loaded from: classes2.dex */
public final class d {
    public static boolean a() {
        String str = Build.MANUFACTURER;
        return "Xiaomi".equalsIgnoreCase(str) || "Meizu".equalsIgnoreCase(str);
    }

    public static boolean a(String str, Context context) {
        return context.checkCallingOrSelfPermission(str) == 0;
    }
}
