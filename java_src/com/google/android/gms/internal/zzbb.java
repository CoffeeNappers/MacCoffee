package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes2.dex */
public class zzbb extends zzak<Integer, Long> {
    public Long zzahq;
    public Long zzahr;

    public zzbb() {
    }

    public zzbb(String str) {
        zzk(str);
    }

    @Override // com.google.android.gms.internal.zzak
    protected HashMap<Integer, Long> zzat() {
        HashMap<Integer, Long> hashMap = new HashMap<>();
        hashMap.put(0, this.zzahq);
        hashMap.put(1, this.zzahr);
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzak
    protected void zzk(String str) {
        HashMap zzl = zzl(str);
        if (zzl != null) {
            this.zzahq = (Long) zzl.get(0);
            this.zzahr = (Long) zzl.get(1);
        }
    }
}
