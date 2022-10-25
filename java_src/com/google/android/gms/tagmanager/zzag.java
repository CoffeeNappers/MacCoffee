package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzag extends zzdh {
    private static final String ID = com.google.android.gms.internal.zzag.ENDS_WITH.toString();

    public zzag() {
        super(ID);
    }

    @Override // com.google.android.gms.tagmanager.zzdh
    protected boolean zza(String str, String str2, Map<String, zzaj.zza> map) {
        return str.endsWith(str2);
    }
}
