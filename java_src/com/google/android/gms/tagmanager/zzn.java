package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzn extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.CONSTANT.toString();
    private static final String VALUE = com.google.android.gms.internal.zzah.VALUE.toString();

    public zzn() {
        super(ID, VALUE);
    }

    public static String zzcdw() {
        return ID;
    }

    public static String zzcdx() {
        return VALUE;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return map.get(VALUE);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
