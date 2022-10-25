package com.google.android.gms.ads.internal;

import com.google.android.gms.internal.zzfb;
import com.google.android.gms.internal.zzfu;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzd {
    public final zzfu zzamp;
    public final com.google.android.gms.ads.internal.overlay.zzj zzamq;
    public final com.google.android.gms.ads.internal.overlay.zzm zzamr;
    public final com.google.android.gms.ads.internal.safebrowsing.zzd zzams;

    public zzd(zzfu zzfuVar, com.google.android.gms.ads.internal.overlay.zzj zzjVar, com.google.android.gms.ads.internal.overlay.zzm zzmVar, com.google.android.gms.ads.internal.safebrowsing.zzd zzdVar) {
        this.zzamp = zzfuVar;
        this.zzamq = zzjVar;
        this.zzamr = zzmVar;
        this.zzams = zzdVar;
    }

    public static zzd zzfd() {
        return new zzd(new zzfb(), new com.google.android.gms.ads.internal.overlay.zzn(), new com.google.android.gms.ads.internal.overlay.zzt(), new com.google.android.gms.ads.internal.safebrowsing.zza());
    }
}
