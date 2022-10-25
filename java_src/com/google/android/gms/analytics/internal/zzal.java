package com.google.android.gms.analytics.internal;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class zzal {
    private final com.google.android.gms.common.util.zze zzaql;
    private long zzbwt;

    public zzal(com.google.android.gms.common.util.zze zzeVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
        this.zzaql = zzeVar;
    }

    public zzal(com.google.android.gms.common.util.zze zzeVar, long j) {
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
        this.zzaql = zzeVar;
        this.zzbwt = j;
    }

    public void clear() {
        this.zzbwt = 0L;
    }

    public void start() {
        this.zzbwt = this.zzaql.elapsedRealtime();
    }

    public boolean zzz(long j) {
        return this.zzbwt == 0 || this.zzaql.elapsedRealtime() - this.zzbwt > j;
    }
}
