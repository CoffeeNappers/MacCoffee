package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzak extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.EVENT.toString();
    private final zzcx aEa;

    public zzak(zzcx zzcxVar) {
        super(ID, new String[0]);
        this.aEa = zzcxVar;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String zzcgj = this.aEa.zzcgj();
        return zzcgj == null ? zzdm.zzchm() : zzdm.zzat(zzcgj);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
