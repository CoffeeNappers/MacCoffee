package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzap extends zzcd {
    private static final String ID = com.google.android.gms.internal.zzag.GREATER_THAN.toString();

    public zzap() {
        super(ID);
    }

    @Override // com.google.android.gms.tagmanager.zzcd
    protected boolean zza(zzdl zzdlVar, zzdl zzdlVar2, Map<String, zzaj.zza> map) {
        return zzdlVar.compareTo(zzdlVar2) > 0;
    }
}