package com.google.android.gms.analytics.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.internal.zzxr;
/* loaded from: classes.dex */
public final class zzaj {
    static zzxr ax;
    static Boolean ay;
    static Object zzaox = new Object();

    public static boolean zzat(Context context) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        if (ay != null) {
            return ay.booleanValue();
        }
        boolean zza = zzao.zza(context, "com.google.android.gms.analytics.AnalyticsReceiver", false);
        ay = Boolean.valueOf(zza);
        return zza;
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onReceive(Context context, Intent intent) {
        zzf zzaw = zzf.zzaw(context);
        zzaf zzaca = zzaw.zzaca();
        if (intent == null) {
            zzaca.zzev("AnalyticsReceiver called with null intent");
            return;
        }
        String action = intent.getAction();
        zzaw.zzacb();
        zzaca.zza("Local AnalyticsReceiver got", action);
        if (!"com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(action)) {
            return;
        }
        boolean zzau = zzak.zzau(context);
        Intent intent2 = new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
        intent2.setComponent(new ComponentName(context, "com.google.android.gms.analytics.AnalyticsService"));
        intent2.setAction("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
        synchronized (zzaox) {
            context.startService(intent2);
            if (!zzau) {
                return;
            }
            try {
                if (ax == null) {
                    ax = new zzxr(context, 1, "Analytics WakeLock");
                    ax.setReferenceCounted(false);
                }
                ax.acquire(1000L);
            } catch (SecurityException e) {
                zzaca.zzev("Analytics service at risk of not starting. For more reliable analytics, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions.");
            }
        }
    }
}
