package com.google.android.gms.tagmanager;
/* loaded from: classes2.dex */
class zzbm implements zzcl {
    private final long aFN;
    private final String cd;
    private final long fo;
    private final int fp;
    private double fq;

    /* renamed from: fr  reason: collision with root package name */
    private long f6fr;
    private final Object fs = new Object();
    private final com.google.android.gms.common.util.zze zzaql;

    public zzbm(int i, int i2, long j, long j2, String str, com.google.android.gms.common.util.zze zzeVar) {
        this.fp = i2;
        this.fq = Math.min(i, i2);
        this.fo = j;
        this.aFN = j2;
        this.cd = str;
        this.zzaql = zzeVar;
    }

    @Override // com.google.android.gms.tagmanager.zzcl
    public boolean zzagf() {
        boolean z = false;
        synchronized (this.fs) {
            long currentTimeMillis = this.zzaql.currentTimeMillis();
            if (currentTimeMillis - this.f6fr < this.aFN) {
                String str = this.cd;
                zzbo.zzdi(new StringBuilder(String.valueOf(str).length() + 34).append("Excessive ").append(str).append(" detected; call ignored.").toString());
            } else {
                if (this.fq < this.fp) {
                    double d = (currentTimeMillis - this.f6fr) / this.fo;
                    if (d > 0.0d) {
                        this.fq = Math.min(this.fp, d + this.fq);
                    }
                }
                this.f6fr = currentTimeMillis;
                if (this.fq >= 1.0d) {
                    this.fq -= 1.0d;
                    z = true;
                } else {
                    String str2 = this.cd;
                    zzbo.zzdi(new StringBuilder(String.valueOf(str2).length() + 34).append("Excessive ").append(str2).append(" detected; call ignored.").toString());
                }
            }
        }
        return z;
    }
}
