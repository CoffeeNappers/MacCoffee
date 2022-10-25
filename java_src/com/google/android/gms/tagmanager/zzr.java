package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzr extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.CONTAINER_VERSION.toString();
    private final String um;

    public zzr(String str) {
        super(ID, new String[0]);
        this.um = str;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return this.um == null ? zzdm.zzchm() : zzdm.zzat(this.um);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
