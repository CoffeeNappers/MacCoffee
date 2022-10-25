package com.google.android.gms.analytics;

import com.google.android.gms.analytics.zzh;
import com.google.android.gms.common.internal.zzaa;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public abstract class zzh<T extends zzh> {
    private final zzi bg;
    protected final zze bh;
    private final List<zzf> bi;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzh(zzi zziVar, com.google.android.gms.common.util.zze zzeVar) {
        zzaa.zzy(zziVar);
        this.bg = zziVar;
        this.bi = new ArrayList();
        zze zzeVar2 = new zze(this, zzeVar);
        zzeVar2.zzzs();
        this.bh = zzeVar2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(zze zzeVar) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzd(zze zzeVar) {
        for (zzf zzfVar : this.bi) {
            zzfVar.zza(this, zzeVar);
        }
    }

    public zze zzyu() {
        zze zzzi = this.bh.zzzi();
        zzd(zzzi);
        return zzzi;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzi zzzq() {
        return this.bg;
    }

    public zze zzzt() {
        return this.bh;
    }

    public List<zzk> zzzu() {
        return this.bh.zzzk();
    }
}
