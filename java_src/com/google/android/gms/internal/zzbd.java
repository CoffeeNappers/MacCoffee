package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes2.dex */
public class zzbd extends zzak<Integer, Long> {
    public Long zzain;
    public Long zzaio;
    public Long zzaip;
    public Long zzaiq;
    public Long zzair;
    public Long zzais;
    public Long zzait;
    public Long zzfd;
    public Long zzff;
    public Long zzfj;
    public Long zzfk;

    public zzbd() {
    }

    public zzbd(String str) {
        zzk(str);
    }

    @Override // com.google.android.gms.internal.zzak
    protected HashMap<Integer, Long> zzat() {
        HashMap<Integer, Long> hashMap = new HashMap<>();
        hashMap.put(0, this.zzain);
        hashMap.put(1, this.zzaio);
        hashMap.put(2, this.zzaip);
        hashMap.put(3, this.zzff);
        hashMap.put(4, this.zzfd);
        hashMap.put(5, this.zzaiq);
        hashMap.put(6, this.zzair);
        hashMap.put(7, this.zzais);
        hashMap.put(8, this.zzfk);
        hashMap.put(9, this.zzfj);
        hashMap.put(10, this.zzait);
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzak
    protected void zzk(String str) {
        HashMap zzl = zzl(str);
        if (zzl != null) {
            this.zzain = (Long) zzl.get(0);
            this.zzaio = (Long) zzl.get(1);
            this.zzaip = (Long) zzl.get(2);
            this.zzff = (Long) zzl.get(3);
            this.zzfd = (Long) zzl.get(4);
            this.zzaiq = (Long) zzl.get(5);
            this.zzair = (Long) zzl.get(6);
            this.zzais = (Long) zzl.get(7);
            this.zzfk = (Long) zzl.get(8);
            this.zzfj = (Long) zzl.get(9);
            this.zzait = (Long) zzl.get(10);
        }
    }
}
