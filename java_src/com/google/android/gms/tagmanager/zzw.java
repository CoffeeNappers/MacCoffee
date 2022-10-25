package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzw extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.CUSTOM_VAR.toString();
    private static final String NAME = com.google.android.gms.internal.zzah.NAME.toString();
    private static final String aEO = com.google.android.gms.internal.zzah.DEFAULT_VALUE.toString();
    private final DataLayer aDZ;

    public zzw(DataLayer dataLayer) {
        super(ID, NAME);
        this.aDZ = dataLayer;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        Object obj = this.aDZ.get(zzdm.zzg(map.get(NAME)));
        if (obj == null) {
            zzaj.zza zzaVar = map.get(aEO);
            return zzaVar != null ? zzaVar : zzdm.zzchm();
        }
        return zzdm.zzat(obj);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
