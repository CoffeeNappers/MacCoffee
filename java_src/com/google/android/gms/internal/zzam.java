package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes2.dex */
public class zzam extends zzak<Integer, Object> {
    public String zzcn;
    public String zzcp;
    public String zzcq;
    public String zzcr;
    public long zzyi;

    public zzam() {
        this.zzcn = "E";
        this.zzyi = -1L;
        this.zzcp = "E";
        this.zzcq = "E";
        this.zzcr = "E";
    }

    public zzam(String str) {
        this();
        zzk(str);
    }

    @Override // com.google.android.gms.internal.zzak
    protected HashMap<Integer, Object> zzat() {
        HashMap<Integer, Object> hashMap = new HashMap<>();
        hashMap.put(0, this.zzcn);
        hashMap.put(4, this.zzcr);
        hashMap.put(3, this.zzcq);
        hashMap.put(2, this.zzcp);
        hashMap.put(1, Long.valueOf(this.zzyi));
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzak
    protected void zzk(String str) {
        HashMap zzl = zzl(str);
        if (zzl != null) {
            this.zzcn = zzl.get(0) == null ? "E" : (String) zzl.get(0);
            this.zzyi = zzl.get(1) == null ? -1L : ((Long) zzl.get(1)).longValue();
            this.zzcp = zzl.get(2) == null ? "E" : (String) zzl.get(2);
            this.zzcq = zzl.get(3) == null ? "E" : (String) zzl.get(3);
            this.zzcr = zzl.get(4) == null ? "E" : (String) zzl.get(4);
        }
    }
}
