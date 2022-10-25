package com.google.android.gms.analytics.internal;
/* loaded from: classes.dex */
public class zzad {
    private final String cd;
    private final long fo;
    private final int fp;
    private double fq;

    /* renamed from: fr  reason: collision with root package name */
    private long f3fr;
    private final Object fs;
    private final com.google.android.gms.common.util.zze zzaql;

    public zzad(int i, long j, String str, com.google.android.gms.common.util.zze zzeVar) {
        this.fs = new Object();
        this.fp = i;
        this.fq = this.fp;
        this.fo = j;
        this.cd = str;
        this.zzaql = zzeVar;
    }

    public zzad(String str, com.google.android.gms.common.util.zze zzeVar) {
        this(60, 2000L, str, zzeVar);
    }

    public boolean zzagf() {
        boolean z;
        synchronized (this.fs) {
            long currentTimeMillis = this.zzaql.currentTimeMillis();
            if (this.fq < this.fp) {
                double d = (currentTimeMillis - this.f3fr) / this.fo;
                if (d > 0.0d) {
                    this.fq = Math.min(this.fp, d + this.fq);
                }
            }
            this.f3fr = currentTimeMillis;
            if (this.fq >= 1.0d) {
                this.fq -= 1.0d;
                z = true;
            } else {
                String str = this.cd;
                zzae.zzdi(new StringBuilder(String.valueOf(str).length() + 34).append("Excessive ").append(str).append(" detected; call ignored.").toString());
                z = false;
            }
        }
        return z;
    }
}
