package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.internal.zzxr;
/* loaded from: classes.dex */
public final class zzak {
    private static Boolean az;
    private final zza fL;
    private final Context mContext;
    private final Handler mHandler;

    /* loaded from: classes.dex */
    public interface zza {
        boolean callServiceStopSelfResult(int i);

        Context getContext();
    }

    public zzak(zza zzaVar) {
        this.mContext = zzaVar.getContext();
        com.google.android.gms.common.internal.zzaa.zzy(this.mContext);
        this.fL = zzaVar;
        this.mHandler = new Handler();
    }

    public static boolean zzau(Context context) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        if (az != null) {
            return az.booleanValue();
        }
        boolean zzr = zzao.zzr(context, "com.google.android.gms.analytics.AnalyticsService");
        az = Boolean.valueOf(zzr);
        return zzr;
    }

    private void zzyz() {
        try {
            synchronized (zzaj.zzaox) {
                zzxr zzxrVar = zzaj.ax;
                if (zzxrVar != null && zzxrVar.isHeld()) {
                    zzxrVar.release();
                }
            }
        } catch (SecurityException e) {
        }
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onCreate() {
        zzf zzaw = zzf.zzaw(this.mContext);
        zzaf zzaca = zzaw.zzaca();
        zzaw.zzacb();
        zzaca.zzes("Local AnalyticsService is starting up");
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onDestroy() {
        zzf zzaw = zzf.zzaw(this.mContext);
        zzaf zzaca = zzaw.zzaca();
        zzaw.zzacb();
        zzaca.zzes("Local AnalyticsService is shutting down");
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public int onStartCommand(Intent intent, int i, final int i2) {
        zzyz();
        final zzf zzaw = zzf.zzaw(this.mContext);
        final zzaf zzaca = zzaw.zzaca();
        if (intent == null) {
            zzaca.zzev("AnalyticsService started with null intent");
        } else {
            String action = intent.getAction();
            zzaw.zzacb();
            zzaca.zza("Local AnalyticsService called. startId, action", Integer.valueOf(i2), action);
            if ("com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(action)) {
                zzaw.zzzg().zza(new zzw() { // from class: com.google.android.gms.analytics.internal.zzak.1
                    @Override // com.google.android.gms.analytics.internal.zzw
                    public void zzf(Throwable th) {
                        zzak.this.mHandler.post(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzak.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (zzak.this.fL.callServiceStopSelfResult(i2)) {
                                    zzaw.zzacb();
                                    zzaca.zzes("Local AnalyticsService processed last dispatch request");
                                }
                            }
                        });
                    }
                });
            }
        }
        return 2;
    }
}
