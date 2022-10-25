package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzbq extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.LOWERCASE_STRING.toString();
    private static final String aFk = com.google.android.gms.internal.zzah.ARG0.toString();

    public zzbq() {
        super(ID, aFk);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(zzdm.zzg(map.get(aFk)).toLowerCase());
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
