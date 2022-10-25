package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes2.dex */
public class zzba extends zzak<Integer, Object> {
    public Long zzahn;
    public Boolean zzaho;
    public Boolean zzahp;

    public zzba() {
    }

    public zzba(String str) {
        zzk(str);
    }

    @Override // com.google.android.gms.internal.zzak
    protected HashMap<Integer, Object> zzat() {
        HashMap<Integer, Object> hashMap = new HashMap<>();
        hashMap.put(0, this.zzahn);
        hashMap.put(1, this.zzaho);
        hashMap.put(2, this.zzahp);
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzak
    protected void zzk(String str) {
        HashMap zzl = zzl(str);
        if (zzl != null) {
            this.zzahn = (Long) zzl.get(0);
            this.zzaho = (Boolean) zzl.get(1);
            this.zzahp = (Boolean) zzl.get(2);
        }
    }
}
