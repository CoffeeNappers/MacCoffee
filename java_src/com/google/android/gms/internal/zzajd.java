package com.google.android.gms.internal;

import java.util.Random;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class zzajd {
    private final ScheduledExecutorService aZE;
    private final zzalw aZR;
    private final long bcG;
    private final long bcH;
    private final double bcI;
    private final double bcJ;
    private final Random bcK;
    private ScheduledFuture<?> bcL;
    private long bcM;
    private boolean bcN;

    /* loaded from: classes2.dex */
    public static class zza {
        private final zzalw aZR;
        private final ScheduledExecutorService bcP;
        private long bcG = 1000;
        private double bcI = 0.5d;
        private long bcQ = 30000;
        private double bcJ = 1.3d;

        public zza(ScheduledExecutorService scheduledExecutorService, zzalx zzalxVar, String str) {
            this.bcP = scheduledExecutorService;
            this.aZR = new zzalw(zzalxVar, str);
        }

        public zza zzcg(long j) {
            this.bcG = j;
            return this;
        }

        public zza zzch(long j) {
            this.bcQ = j;
            return this;
        }

        public zzajd zzcty() {
            return new zzajd(this.bcP, this.aZR, this.bcG, this.bcQ, this.bcJ, this.bcI);
        }

        public zza zzj(double d) {
            this.bcJ = d;
            return this;
        }

        public zza zzk(double d) {
            if (d < 0.0d || d > 1.0d) {
                throw new IllegalArgumentException(new StringBuilder(47).append("Argument out of range: ").append(d).toString());
            }
            this.bcI = d;
            return this;
        }
    }

    private zzajd(ScheduledExecutorService scheduledExecutorService, zzalw zzalwVar, long j, long j2, double d, double d2) {
        this.bcK = new Random();
        this.bcN = true;
        this.aZE = scheduledExecutorService;
        this.aZR = zzalwVar;
        this.bcG = j;
        this.bcH = j2;
        this.bcJ = d;
        this.bcI = d2;
    }

    public void cancel() {
        if (this.bcL != null) {
            this.aZR.zzi("Cancelling existing retry attempt", new Object[0]);
            this.bcL.cancel(false);
            this.bcL = null;
        } else {
            this.aZR.zzi("No existing retry attempt to cancel", new Object[0]);
        }
        this.bcM = 0L;
    }

    public void zzcpm() {
        this.bcN = true;
        this.bcM = 0L;
    }

    public void zzctx() {
        this.bcM = this.bcH;
    }

    public void zzr(final Runnable runnable) {
        long j = 0;
        Runnable runnable2 = new Runnable() { // from class: com.google.android.gms.internal.zzajd.1
            @Override // java.lang.Runnable
            public void run() {
                zzajd.this.bcL = null;
                runnable.run();
            }
        };
        if (this.bcL != null) {
            this.aZR.zzi("Cancelling previous scheduled retry", new Object[0]);
            this.bcL.cancel(false);
            this.bcL = null;
        }
        if (!this.bcN) {
            if (this.bcM == 0) {
                this.bcM = this.bcG;
            } else {
                this.bcM = Math.min((long) (this.bcM * this.bcJ), this.bcH);
            }
            j = (long) (((1.0d - this.bcI) * this.bcM) + (this.bcI * this.bcM * this.bcK.nextDouble()));
        }
        this.bcN = false;
        this.aZR.zzi("Scheduling retry in %dms", Long.valueOf(j));
        this.bcL = this.aZE.schedule(runnable2, j, TimeUnit.MILLISECONDS);
    }
}
