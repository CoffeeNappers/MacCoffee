package com.google.android.gms.ads.internal.client;

import com.google.android.gms.internal.zzeu;
import com.google.android.gms.internal.zzhx;
import com.google.android.gms.internal.zzim;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzm {
    private static final Object zzaox = new Object();
    private static zzm zzbal;
    private final com.google.android.gms.ads.internal.util.client.zza zzbam = new com.google.android.gms.ads.internal.util.client.zza();
    private final zzl zzban = new zzl(new zze(), new zzd(), new zzai(), new zzeu(), new com.google.android.gms.ads.internal.reward.client.zzf(), new zzim(), new zzhx());

    static {
        zza(new zzm());
    }

    protected zzm() {
    }

    protected static void zza(zzm zzmVar) {
        synchronized (zzaox) {
            zzbal = zzmVar;
        }
    }

    private static zzm zzkq() {
        zzm zzmVar;
        synchronized (zzaox) {
            zzmVar = zzbal;
        }
        return zzmVar;
    }

    public static com.google.android.gms.ads.internal.util.client.zza zzkr() {
        return zzkq().zzbam;
    }

    public static zzl zzks() {
        return zzkq().zzban;
    }
}
