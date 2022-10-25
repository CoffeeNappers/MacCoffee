package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzdg extends zzdh {
    private static final String ID = com.google.android.gms.internal.zzag.STARTS_WITH.toString();

    public zzdg() {
        super(ID);
    }

    @Override // com.google.android.gms.tagmanager.zzdh
    protected boolean zza(String str, String str2, Map<String, zzaj.zza> map) {
        return str.startsWith(str2);
    }
}
