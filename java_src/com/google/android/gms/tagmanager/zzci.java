package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public abstract class zzci extends zzam {
    private static final String aFk = com.google.android.gms.internal.zzah.ARG0.toString();
    private static final String aGj = com.google.android.gms.internal.zzah.ARG1.toString();

    public zzci(String str) {
        super(str, aFk, aGj);
    }

    protected abstract boolean zza(zzaj.zza zzaVar, zzaj.zza zzaVar2, Map<String, zzaj.zza> map);

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        for (zzaj.zza zzaVar : map.values()) {
            if (zzaVar == zzdm.zzchm()) {
                return zzdm.zzat(false);
            }
        }
        zzaj.zza zzaVar2 = map.get(aFk);
        zzaj.zza zzaVar3 = map.get(aGj);
        return zzdm.zzat(Boolean.valueOf((zzaVar2 == null || zzaVar3 == null) ? false : zza(zzaVar2, zzaVar3, map)));
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ String zzcfg() {
        return super.zzcfg();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ Set zzcfh() {
        return super.zzcfh();
    }
}
