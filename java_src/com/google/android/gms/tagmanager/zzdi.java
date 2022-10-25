package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzdi extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.TIME.toString();

    public zzdi() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(Long.valueOf(System.currentTimeMillis()));
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
