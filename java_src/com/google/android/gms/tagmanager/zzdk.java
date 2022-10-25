package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
abstract class zzdk extends zzam {
    public zzdk(String str, String... strArr) {
        super(str, strArr);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        zzba(map);
        return zzdm.zzchm();
    }

    public abstract void zzba(Map<String, zzaj.zza> map);

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
