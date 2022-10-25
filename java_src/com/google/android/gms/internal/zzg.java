package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import java.util.concurrent.BlockingQueue;
/* loaded from: classes2.dex */
public class zzg extends Thread {
    private final zzb zzi;
    private final zzn zzj;
    private volatile boolean zzk;
    private final BlockingQueue<zzk<?>> zzx;
    private final zzf zzy;

    public zzg(BlockingQueue<zzk<?>> blockingQueue, zzf zzfVar, zzb zzbVar, zzn zznVar) {
        super("VolleyNetworkDispatcher");
        this.zzk = false;
        this.zzx = blockingQueue;
        this.zzy = zzfVar;
        this.zzi = zzbVar;
        this.zzj = zznVar;
    }

    @TargetApi(14)
    private void zzb(zzk<?> zzkVar) {
        if (Build.VERSION.SDK_INT >= 14) {
            TrafficStats.setThreadStatsTag(zzkVar.zzf());
        }
    }

    private void zzb(zzk<?> zzkVar, zzr zzrVar) {
        this.zzj.zza(zzkVar, zzkVar.zzb(zzrVar));
    }

    public void quit() {
        this.zzk = true;
        interrupt();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Process.setThreadPriority(10);
        while (true) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            try {
                zzk<?> take = this.zzx.take();
                try {
                    take.zzc("network-queue-take");
                    if (take.isCanceled()) {
                        take.zzd("network-discard-cancelled");
                    } else {
                        zzb(take);
                        zzi zza = this.zzy.zza(take);
                        take.zzc("network-http-complete");
                        if (!zza.zzaa || !take.zzu()) {
                            zzm<?> zza2 = take.zza(zza);
                            take.zzc("network-parse-complete");
                            if (take.zzp() && zza2.zzbf != null) {
                                this.zzi.zza(take.zzg(), zza2.zzbf);
                                take.zzc("network-cache-written");
                            }
                            take.zzt();
                            this.zzj.zza(take, zza2);
                        } else {
                            take.zzd("not-modified");
                        }
                    }
                } catch (zzr e) {
                    e.zza(SystemClock.elapsedRealtime() - elapsedRealtime);
                    zzb(take, e);
                } catch (Exception e2) {
                    zzs.zza(e2, "Unhandled exception %s", e2.toString());
                    zzr zzrVar = new zzr(e2);
                    zzrVar.zza(SystemClock.elapsedRealtime() - elapsedRealtime);
                    this.zzj.zza(take, zzrVar);
                }
            } catch (InterruptedException e3) {
                if (this.zzk) {
                    return;
                }
            }
        }
    }
}
