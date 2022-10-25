package com.google.android.gms.analytics;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.analytics.internal.zzak;
/* loaded from: classes.dex */
public final class AnalyticsService extends Service implements zzak.zza {
    private zzak ar;

    private zzak zzyw() {
        if (this.ar == null) {
            this.ar = new zzak(this);
        }
        return this.ar;
    }

    @Override // com.google.android.gms.analytics.internal.zzak.zza
    public boolean callServiceStopSelfResult(int i) {
        return stopSelfResult(i);
    }

    @Override // com.google.android.gms.analytics.internal.zzak.zza
    public Context getContext() {
        return this;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        zzyw();
        return null;
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onCreate() {
        super.onCreate();
        zzyw().onCreate();
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onDestroy() {
        zzyw().onDestroy();
        super.onDestroy();
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public int onStartCommand(Intent intent, int i, int i2) {
        return zzyw().onStartCommand(intent, i, i2);
    }
}
