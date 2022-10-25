package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
abstract class zzdh extends zzci {
    public zzdh(String str) {
        super(str);
    }

    @Override // com.google.android.gms.tagmanager.zzci
    protected boolean zza(zzaj.zza zzaVar, zzaj.zza zzaVar2, Map<String, zzaj.zza> map) {
        String zzg = zzdm.zzg(zzaVar);
        String zzg2 = zzdm.zzg(zzaVar2);
        if (zzg == zzdm.zzchl() || zzg2 == zzdm.zzchl()) {
            return false;
        }
        return zza(zzg, zzg2, map);
    }

    protected abstract boolean zza(String str, String str2, Map<String, zzaj.zza> map);
}
