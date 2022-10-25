package com.google.android.gms.tagmanager;
/* loaded from: classes2.dex */
class zzda implements zzcl {
    private long aHj;
    private final long fo;
    private final int fp;
    private double fq;
    private final Object fs;
    private final com.google.android.gms.common.util.zze zzaql;

    public zzda() {
        this(60, 2000L);
    }

    public zzda(int i, long j) {
        this.fs = new Object();
        this.fp = i;
        this.fq = this.fp;
        this.fo = j;
        this.zzaql = com.google.android.gms.common.util.zzh.zzayl();
    }

    @Override // com.google.android.gms.tagmanager.zzcl
    public boolean zzagf() {
        boolean z;
        synchronized (this.fs) {
            long currentTimeMillis = this.zzaql.currentTimeMillis();
            if (this.fq < this.fp) {
                double d = (currentTimeMillis - this.aHj) / this.fo;
                if (d > 0.0d) {
                    this.fq = Math.min(this.fp, d + this.fq);
                }
            }
            this.aHj = currentTimeMillis;
            if (this.fq >= 1.0d) {
                this.fq -= 1.0d;
                z = true;
            } else {
                zzbo.zzdi("No more tokens available.");
                z = false;
            }
        }
        return z;
    }
}
