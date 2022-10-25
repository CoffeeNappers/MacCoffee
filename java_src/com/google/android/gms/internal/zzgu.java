package com.google.android.gms.internal;
@zzji
/* loaded from: classes.dex */
public final class zzgu {
    public final int zzbwl;
    public final zzgp zzbwm;
    public final zzha zzbwn;
    public final String zzbwo;
    public final zzgs zzbwp;
    public final zzhc zzbwq;
    public final long zzbwr;

    /* loaded from: classes2.dex */
    public interface zza {
        void zza(int i, zzhc zzhcVar);

        void zzad(int i);
    }

    public zzgu(int i) {
        this(null, null, null, null, i, null, 0L);
    }

    public zzgu(zzgp zzgpVar, zzha zzhaVar, String str, zzgs zzgsVar, int i, zzhc zzhcVar, long j) {
        this.zzbwm = zzgpVar;
        this.zzbwn = zzhaVar;
        this.zzbwo = str;
        this.zzbwp = zzgsVar;
        this.zzbwl = i;
        this.zzbwq = zzhcVar;
        this.zzbwr = j;
    }
}
