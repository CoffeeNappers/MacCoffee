package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
abstract class zzcd extends zzci {
    public zzcd(String str) {
        super(str);
    }

    @Override // com.google.android.gms.tagmanager.zzci
    protected boolean zza(zzaj.zza zzaVar, zzaj.zza zzaVar2, Map<String, zzaj.zza> map) {
        zzdl zzh = zzdm.zzh(zzaVar);
        zzdl zzh2 = zzdm.zzh(zzaVar2);
        if (zzh == zzdm.zzchk() || zzh2 == zzdm.zzchk()) {
            return false;
        }
        return zza(zzh, zzh2, map);
    }

    protected abstract boolean zza(zzdl zzdlVar, zzdl zzdlVar2, Map<String, zzaj.zza> map);
}
