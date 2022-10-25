package ru.mail.libverify.utils;

import android.annotation.TargetApi;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.support.annotation.NonNull;
/* loaded from: classes3.dex */
public final class h {
    @TargetApi(19)
    public static boolean a(@NonNull Context context) {
        AppOpsManager appOpsManager;
        if (Build.VERSION.SDK_INT >= 19 && (appOpsManager = (AppOpsManager) context.getSystemService("appops")) != null) {
            ApplicationInfo applicationInfo = context.getApplicationInfo();
            String packageName = context.getApplicationContext().getPackageName();
            int i = applicationInfo.uid;
            try {
                Class<?> cls = Class.forName(AppOpsManager.class.getName());
                return ((Integer) cls.getMethod("checkOpNoThrow", Integer.TYPE, Integer.TYPE, String.class).invoke(appOpsManager, Integer.valueOf(((Integer) cls.getDeclaredField("OP_POST_NOTIFICATION").get(Integer.class)).intValue()), Integer.valueOf(i), packageName)).intValue() == 0;
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }
}
