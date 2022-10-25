package com.google.android.gms.tagmanager;

import android.os.Build;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzcf extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.OS_VERSION.toString();

    public zzcf() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(Build.VERSION.RELEASE);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
