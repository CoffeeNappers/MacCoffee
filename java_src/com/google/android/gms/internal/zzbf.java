package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes2.dex */
public class zzbf extends zzak<Integer, Long> {
    public Long zzaiv;

    public zzbf() {
    }

    public zzbf(String str) {
        zzk(str);
    }

    @Override // com.google.android.gms.internal.zzak
    protected HashMap<Integer, Long> zzat() {
        HashMap<Integer, Long> hashMap = new HashMap<>();
        hashMap.put(0, this.zzaiv);
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzak
    protected void zzk(String str) {
        HashMap zzl = zzl(str);
        if (zzl != null) {
            this.zzaiv = (Long) zzl.get(0);
        }
    }
}
