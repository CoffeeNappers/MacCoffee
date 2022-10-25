package com.google.android.gms.analytics.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public class zzb extends zzd {
    private final zzl cI;

    public zzb(zzf zzfVar, zzg zzgVar) {
        super(zzfVar);
        com.google.android.gms.common.internal.zzaa.zzy(zzgVar);
        this.cI = zzgVar.zzj(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onServiceConnected() {
        zzzx();
        this.cI.onServiceConnected();
    }

    public void setLocalDispatchPeriod(final int i) {
        zzacj();
        zzb("setLocalDispatchPeriod (sec)", Integer.valueOf(i));
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.1
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zzw(i * 1000);
            }
        });
    }

    public void start() {
        this.cI.start();
    }

    public long zza(zzh zzhVar) {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        zzzx();
        long zza = this.cI.zza(zzhVar, true);
        if (zza == 0) {
            this.cI.zzc(zzhVar);
        }
        return zza;
    }

    public void zza(final zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        zzacj();
        zzb("Hit delivery requested", zzabVar);
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.4
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zza(zzabVar);
            }
        });
    }

    public void zza(final zzw zzwVar) {
        zzacj();
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.6
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zzb(zzwVar);
            }
        });
    }

    public void zza(final String str, final Runnable runnable) {
        com.google.android.gms.common.internal.zzaa.zzh(str, "campaign param can't be empty");
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.3
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zzfa(str);
                if (runnable != null) {
                    runnable.run();
                }
            }
        });
    }

    public void zzabr() {
        zzacj();
        zzaby();
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.5
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zzabr();
            }
        });
    }

    public void zzabs() {
        zzacj();
        Context context = getContext();
        if (!zzaj.zzat(context) || !zzak.zzau(context)) {
            zza((zzw) null);
            return;
        }
        Intent intent = new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
        intent.setComponent(new ComponentName(context, "com.google.android.gms.analytics.AnalyticsService"));
        context.startService(intent);
    }

    public boolean zzabt() {
        zzacj();
        try {
            zzacc().zzc(new Callable<Void>() { // from class: com.google.android.gms.analytics.internal.zzb.7
                @Override // java.util.concurrent.Callable
                /* renamed from: zzdo */
                public Void call() throws Exception {
                    zzb.this.cI.zzado();
                    return null;
                }
            }).get(4L, TimeUnit.SECONDS);
            return true;
        } catch (InterruptedException e) {
            zzd("syncDispatchLocalHits interrupted", e);
            return false;
        } catch (ExecutionException e2) {
            zze("syncDispatchLocalHits failed", e2);
            return false;
        } catch (TimeoutException e3) {
            zzd("syncDispatchLocalHits timed out", e3);
            return false;
        }
    }

    public void zzabu() {
        zzacj();
        com.google.android.gms.analytics.zzi.zzzx();
        this.cI.zzabu();
    }

    public void zzabv() {
        zzes("Radio powered up");
        zzabs();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzabw() {
        zzzx();
        this.cI.zzabw();
    }

    public void zzaw(final boolean z) {
        zza("Network connectivity status changed", Boolean.valueOf(z));
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzb.2
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.cI.zzaw(z);
            }
        });
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        this.cI.initialize();
    }
}
