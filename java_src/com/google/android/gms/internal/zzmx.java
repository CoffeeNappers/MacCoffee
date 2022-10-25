package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzmx extends com.google.android.gms.analytics.zzg<zzmx> {
    private String bZ;
    public int ca;
    public int cb;
    public int cc;
    public int zzbzd;
    public int zzbze;

    public String getLanguage() {
        return this.bZ;
    }

    public void setLanguage(String str) {
        this.bZ = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("language", this.bZ);
        hashMap.put("screenColors", Integer.valueOf(this.ca));
        hashMap.put("screenWidth", Integer.valueOf(this.zzbzd));
        hashMap.put("screenHeight", Integer.valueOf(this.zzbze));
        hashMap.put("viewportWidth", Integer.valueOf(this.cb));
        hashMap.put("viewportHeight", Integer.valueOf(this.cc));
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmx zzmxVar) {
        if (this.ca != 0) {
            zzmxVar.zzby(this.ca);
        }
        if (this.zzbzd != 0) {
            zzmxVar.zzbz(this.zzbzd);
        }
        if (this.zzbze != 0) {
            zzmxVar.zzca(this.zzbze);
        }
        if (this.cb != 0) {
            zzmxVar.zzcb(this.cb);
        }
        if (this.cc != 0) {
            zzmxVar.zzcc(this.cc);
        }
        if (!TextUtils.isEmpty(this.bZ)) {
            zzmxVar.setLanguage(this.bZ);
        }
    }

    public int zzaaq() {
        return this.ca;
    }

    public int zzaar() {
        return this.zzbzd;
    }

    public int zzaas() {
        return this.zzbze;
    }

    public int zzaat() {
        return this.cb;
    }

    public int zzaau() {
        return this.cc;
    }

    public void zzby(int i) {
        this.ca = i;
    }

    public void zzbz(int i) {
        this.zzbzd = i;
    }

    public void zzca(int i) {
        this.zzbze = i;
    }

    public void zzcb(int i) {
        this.cb = i;
    }

    public void zzcc(int i) {
        this.cc = i;
    }
}
