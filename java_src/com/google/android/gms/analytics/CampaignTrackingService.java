package com.google.android.gms.analytics;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.RequiresPermission;
import android.text.TextUtils;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzao;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzxr;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes.dex */
public class CampaignTrackingService extends Service {
    private static Boolean az;
    private Handler mHandler;

    private Handler getHandler() {
        Handler handler = this.mHandler;
        if (handler == null) {
            Handler handler2 = new Handler(getMainLooper());
            this.mHandler = handler2;
            return handler2;
        }
        return handler;
    }

    public static boolean zzau(Context context) {
        zzaa.zzy(context);
        if (az != null) {
            return az.booleanValue();
        }
        boolean zzr = zzao.zzr(context, "com.google.android.gms.analytics.CampaignTrackingService");
        az = Boolean.valueOf(zzr);
        return zzr;
    }

    private void zzyz() {
        try {
            synchronized (CampaignTrackingReceiver.zzaox) {
                zzxr zzxrVar = CampaignTrackingReceiver.ax;
                if (zzxrVar != null && zzxrVar.isHeld()) {
                    zzxrVar.release();
                }
            }
        } catch (SecurityException e) {
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onCreate() {
        super.onCreate();
        com.google.android.gms.analytics.internal.zzf.zzaw(this).zzaca().zzes("CampaignTrackingService is starting up");
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public void onDestroy() {
        com.google.android.gms.analytics.internal.zzf.zzaw(this).zzaca().zzes("CampaignTrackingService is shutting down");
        super.onDestroy();
    }

    @Override // android.app.Service
    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public int onStartCommand(Intent intent, int i, final int i2) {
        zzyz();
        com.google.android.gms.analytics.internal.zzf zzaw = com.google.android.gms.analytics.internal.zzf.zzaw(this);
        final zzaf zzaca = zzaw.zzaca();
        zzaw.zzacb();
        String stringExtra = intent.getStringExtra(ArgKeys.REFERRER);
        final Handler handler = getHandler();
        if (TextUtils.isEmpty(stringExtra)) {
            zzaw.zzacb();
            zzaca.zzev("No campaign found on com.android.vending.INSTALL_REFERRER \"referrer\" extra");
            zzaw.zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.CampaignTrackingService.1
                @Override // java.lang.Runnable
                public void run() {
                    CampaignTrackingService.this.zza(zzaca, handler, i2);
                }
            });
        } else {
            int zzaei = zzaw.zzacb().zzaei();
            if (stringExtra.length() > zzaei) {
                zzaca.zzc("Campaign data exceed the maximum supported size and will be clipped. size, limit", Integer.valueOf(stringExtra.length()), Integer.valueOf(zzaei));
                stringExtra = stringExtra.substring(0, zzaei);
            }
            zzaca.zza("CampaignTrackingService called. startId, campaign", Integer.valueOf(i2), stringExtra);
            zzaw.zzzg().zza(stringExtra, new Runnable() { // from class: com.google.android.gms.analytics.CampaignTrackingService.2
                @Override // java.lang.Runnable
                public void run() {
                    CampaignTrackingService.this.zza(zzaca, handler, i2);
                }
            });
        }
        return 2;
    }

    protected void zza(final zzaf zzafVar, Handler handler, final int i) {
        handler.post(new Runnable() { // from class: com.google.android.gms.analytics.CampaignTrackingService.3
            @Override // java.lang.Runnable
            public void run() {
                boolean stopSelfResult = CampaignTrackingService.this.stopSelfResult(i);
                if (stopSelfResult) {
                    zzafVar.zza("Install campaign broadcast processed", Boolean.valueOf(stopSelfResult));
                }
            }
        });
    }
}
