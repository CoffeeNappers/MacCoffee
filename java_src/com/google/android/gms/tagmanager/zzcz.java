package com.google.android.gms.tagmanager;

import android.os.Build;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzcz extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.SDK_VERSION.toString();

    public zzcz() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(Integer.valueOf(Build.VERSION.SDK_INT));
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
