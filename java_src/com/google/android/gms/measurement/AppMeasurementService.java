package com.google.android.gms.measurement;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.MainThread;
import com.google.android.gms.measurement.internal.zzaf;
/* loaded from: classes2.dex */
public final class AppMeasurementService extends Service implements zzaf.zza {
    private zzaf aqE;

    private zzaf zzbtf() {
        if (this.aqE == null) {
            this.aqE = new zzaf(this);
        }
        return this.aqE;
    }

    @Override // com.google.android.gms.measurement.internal.zzaf.zza
    public boolean callServiceStopSelfResult(int i) {
        return stopSelfResult(i);
    }

    @Override // com.google.android.gms.measurement.internal.zzaf.zza
    public Context getContext() {
        return this;
    }

    @Override // android.app.Service
    @MainThread
    public IBinder onBind(Intent intent) {
        return zzbtf().onBind(intent);
    }

    @Override // android.app.Service
    @MainThread
    public void onCreate() {
        super.onCreate();
        zzbtf().onCreate();
    }

    @Override // android.app.Service
    @MainThread
    public void onDestroy() {
        zzbtf().onDestroy();
        super.onDestroy();
    }

    @Override // android.app.Service
    @MainThread
    public void onRebind(Intent intent) {
        zzbtf().onRebind(intent);
    }

    @Override // android.app.Service
    @MainThread
    public int onStartCommand(Intent intent, int i, int i2) {
        zzbtf().onStartCommand(intent, i, i2);
        AppMeasurementReceiver.completeWakefulIntent(intent);
        return 2;
    }

    @Override // android.app.Service
    @MainThread
    public boolean onUnbind(Intent intent) {
        return zzbtf().onUnbind(intent);
    }
}
