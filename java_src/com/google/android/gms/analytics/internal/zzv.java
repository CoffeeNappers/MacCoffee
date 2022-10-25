package com.google.android.gms.analytics.internal;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
/* loaded from: classes2.dex */
public class zzv extends zzd {
    private boolean ei;
    private boolean ej;
    private AlarmManager ek;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzv(zzf zzfVar) {
        super(zzfVar);
        this.ek = (AlarmManager) getContext().getSystemService("alarm");
    }

    private PendingIntent zzafo() {
        Intent intent = new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
        intent.setComponent(new ComponentName(getContext(), "com.google.android.gms.analytics.AnalyticsReceiver"));
        return PendingIntent.getBroadcast(getContext(), 0, intent, 0);
    }

    public void cancel() {
        zzacj();
        this.ej = false;
        this.ek.cancel(zzafo());
    }

    public void schedule() {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zza(zzafn(), "Receiver not registered");
        long zzaen = zzacb().zzaen();
        if (zzaen > 0) {
            cancel();
            long elapsedRealtime = zzabz().elapsedRealtime() + zzaen;
            this.ej = true;
            this.ek.setInexactRepeating(2, elapsedRealtime, 0L, zzafo());
        }
    }

    public boolean zzafn() {
        return this.ei;
    }

    public boolean zzfy() {
        return this.ej;
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        ActivityInfo receiverInfo;
        try {
            this.ek.cancel(zzafo());
            if (zzacb().zzaen() <= 0 || (receiverInfo = getContext().getPackageManager().getReceiverInfo(new ComponentName(getContext(), "com.google.android.gms.analytics.AnalyticsReceiver"), 2)) == null || !receiverInfo.enabled) {
                return;
            }
            zzes("Receiver registered. Using alarm for local dispatch.");
            this.ei = true;
        } catch (PackageManager.NameNotFoundException e) {
        }
    }
}
