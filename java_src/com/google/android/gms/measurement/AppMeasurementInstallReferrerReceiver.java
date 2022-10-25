package com.google.android.gms.measurement;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.MainThread;
import com.google.android.gms.measurement.internal.zzu;
/* loaded from: classes2.dex */
public final class AppMeasurementInstallReferrerReceiver extends BroadcastReceiver implements zzu.zza {
    private zzu aqD;

    private zzu zzbte() {
        if (this.aqD == null) {
            this.aqD = new zzu(this);
        }
        return this.aqD;
    }

    @Override // com.google.android.gms.measurement.internal.zzu.zza
    public void doStartService(Context context, Intent intent) {
    }

    @Override // android.content.BroadcastReceiver
    @MainThread
    public void onReceive(Context context, Intent intent) {
        zzbte().onReceive(context, intent);
    }
}
