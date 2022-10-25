package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzaks implements zzakq {
    public final long bgD;

    public zzaks(long j) {
        this.bgD = j;
    }

    @Override // com.google.android.gms.internal.zzakq
    public boolean zzcl(long j) {
        return j > 1000;
    }

    @Override // com.google.android.gms.internal.zzakq
    public float zzcww() {
        return 0.2f;
    }

    @Override // com.google.android.gms.internal.zzakq
    public long zzcwx() {
        return 1000L;
    }

    @Override // com.google.android.gms.internal.zzakq
    public boolean zzi(long j, long j2) {
        return j > this.bgD || j2 > 1000;
    }
}
