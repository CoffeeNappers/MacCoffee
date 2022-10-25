package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.MainThread;
/* loaded from: classes2.dex */
public final class zzaf {
    private final zza avJ;
    private final Context mContext;
    private final Handler mHandler;

    /* loaded from: classes2.dex */
    public interface zza {
        boolean callServiceStopSelfResult(int i);

        Context getContext();
    }

    public zzaf(zza zzaVar) {
        this.mContext = zzaVar.getContext();
        com.google.android.gms.common.internal.zzaa.zzy(this.mContext);
        this.avJ = zzaVar;
        this.mHandler = new Handler();
    }

    private zzq zzbwb() {
        return zzx.zzdq(this.mContext).zzbwb();
    }

    public static boolean zzi(Context context, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        return zzal.zzr(context, z ? "com.google.android.gms.measurement.PackageMeasurementService" : "com.google.android.gms.measurement.AppMeasurementService");
    }

    @MainThread
    public IBinder onBind(Intent intent) {
        if (intent == null) {
            zzbwb().zzbwy().log("onBind called with null intent");
            return null;
        }
        String action = intent.getAction();
        if ("com.google.android.gms.measurement.START".equals(action)) {
            return new zzy(zzx.zzdq(this.mContext));
        }
        zzbwb().zzbxa().zzj("onBind received unknown action", action);
        return null;
    }

    @MainThread
    public void onCreate() {
        zzx zzdq = zzx.zzdq(this.mContext);
        zzq zzbwb = zzdq.zzbwb();
        zzdq.zzbwd().zzayi();
        zzbwb.zzbxe().log("Local AppMeasurementService is starting up");
    }

    @MainThread
    public void onDestroy() {
        zzx zzdq = zzx.zzdq(this.mContext);
        zzq zzbwb = zzdq.zzbwb();
        zzdq.zzbwd().zzayi();
        zzbwb.zzbxe().log("Local AppMeasurementService is shutting down");
    }

    @MainThread
    public void onRebind(Intent intent) {
        if (intent == null) {
            zzbwb().zzbwy().log("onRebind called with null intent");
            return;
        }
        zzbwb().zzbxe().zzj("onRebind called. action", intent.getAction());
    }

    @MainThread
    public int onStartCommand(Intent intent, int i, final int i2) {
        final zzx zzdq = zzx.zzdq(this.mContext);
        final zzq zzbwb = zzdq.zzbwb();
        if (intent == null) {
            zzbwb.zzbxa().log("AppMeasurementService started with null intent");
        } else {
            String action = intent.getAction();
            zzdq.zzbwd().zzayi();
            zzbwb.zzbxe().zze("Local AppMeasurementService called. startId, action", Integer.valueOf(i2), action);
            if ("com.google.android.gms.measurement.UPLOAD".equals(action)) {
                zzdq.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzaf.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzdq.zzbyj();
                        zzdq.zzbye();
                        zzaf.this.mHandler.post(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzaf.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (zzaf.this.avJ.callServiceStopSelfResult(i2)) {
                                    zzdq.zzbwd().zzayi();
                                    zzbwb.zzbxe().log("Local AppMeasurementService processed last upload request");
                                }
                            }
                        });
                    }
                });
            }
        }
        return 2;
    }

    @MainThread
    public boolean onUnbind(Intent intent) {
        if (intent == null) {
            zzbwb().zzbwy().log("onUnbind called with null intent");
        } else {
            zzbwb().zzbxe().zzj("onUnbind called for intent. action", intent.getAction());
        }
        return true;
    }
}
