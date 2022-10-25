package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zznb extends com.google.android.gms.analytics.zzg<zznb> {
    private String ci;
    private String cj;
    private String ck;
    private String cl;
    private boolean cm;
    private String cn;
    private boolean co;
    private double cp;

    public String getUserId() {
        return this.ck;
    }

    public void setClientId(String str) {
        this.cj = str;
    }

    public void setSampleRate(double d) {
        com.google.android.gms.common.internal.zzaa.zzb(d >= 0.0d && d <= 100.0d, "Sample rate must be between 0% and 100%");
        this.cp = d;
    }

    public void setUserId(String str) {
        this.ck = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("hitType", this.ci);
        hashMap.put("clientId", this.cj);
        hashMap.put("userId", this.ck);
        hashMap.put("androidAdId", this.cl);
        hashMap.put("AdTargetingEnabled", Boolean.valueOf(this.cm));
        hashMap.put("sessionControl", this.cn);
        hashMap.put("nonInteraction", Boolean.valueOf(this.co));
        hashMap.put("sampleRate", Double.valueOf(this.cp));
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zznb zznbVar) {
        if (!TextUtils.isEmpty(this.ci)) {
            zznbVar.zzeh(this.ci);
        }
        if (!TextUtils.isEmpty(this.cj)) {
            zznbVar.setClientId(this.cj);
        }
        if (!TextUtils.isEmpty(this.ck)) {
            zznbVar.setUserId(this.ck);
        }
        if (!TextUtils.isEmpty(this.cl)) {
            zznbVar.zzei(this.cl);
        }
        if (this.cm) {
            zznbVar.zzas(true);
        }
        if (!TextUtils.isEmpty(this.cn)) {
            zznbVar.zzej(this.cn);
        }
        if (this.co) {
            zznbVar.zzat(this.co);
        }
        if (this.cp != 0.0d) {
            zznbVar.setSampleRate(this.cp);
        }
    }

    public String zzaba() {
        return this.ci;
    }

    public String zzabb() {
        return this.cl;
    }

    public boolean zzabc() {
        return this.cm;
    }

    public String zzabd() {
        return this.cn;
    }

    public boolean zzabe() {
        return this.co;
    }

    public double zzabf() {
        return this.cp;
    }

    public void zzas(boolean z) {
        this.cm = z;
    }

    public void zzat(boolean z) {
        this.co = z;
    }

    public void zzeh(String str) {
        this.ci = str;
    }

    public void zzei(String str) {
        this.cl = str;
    }

    public void zzej(String str) {
        this.cn = str;
    }

    public String zzze() {
        return this.cj;
    }
}
