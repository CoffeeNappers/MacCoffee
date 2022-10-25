package com.google.android.gms.internal;
@zzji
/* loaded from: classes.dex */
public class zzlm {
    private long zzcxi;
    private long zzcxj = Long.MIN_VALUE;
    private Object zzako = new Object();

    public zzlm(long j) {
        this.zzcxi = j;
    }

    public boolean tryAcquire() {
        boolean z;
        synchronized (this.zzako) {
            long elapsedRealtime = com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime();
            if (this.zzcxj + this.zzcxi > elapsedRealtime) {
                z = false;
            } else {
                this.zzcxj = elapsedRealtime;
                z = true;
            }
        }
        return z;
    }
}
