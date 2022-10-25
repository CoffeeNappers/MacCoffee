package com.google.android.gms.measurement.internal;
/* loaded from: classes2.dex */
class zzi {
    final long arD;
    final long arE;
    final long arF;
    final String mName;
    final String zzctj;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzi(String str, String str2, long j, long j2, long j3) {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        com.google.android.gms.common.internal.zzaa.zzbt(j >= 0);
        com.google.android.gms.common.internal.zzaa.zzbt(j2 < 0 ? false : z);
        this.zzctj = str;
        this.mName = str2;
        this.arD = j;
        this.arE = j2;
        this.arF = j3;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzi zzbl(long j) {
        return new zzi(this.zzctj, this.mName, this.arD, this.arE, j);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzi zzbwv() {
        return new zzi(this.zzctj, this.mName, this.arD + 1, this.arE + 1, this.arF);
    }
}
