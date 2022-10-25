package com.google.android.gms.internal;

import android.text.TextUtils;
import com.vkontakte.android.data.ServerKeys;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzne extends com.google.android.gms.analytics.zzg<zzne> {
    public long cA;
    public String ce;
    public String cz;
    public String mCategory;

    public String getCategory() {
        return this.mCategory;
    }

    public String getLabel() {
        return this.ce;
    }

    public long getTimeInMillis() {
        return this.cA;
    }

    public void setTimeInMillis(long j) {
        this.cA = j;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("variableName", this.cz);
        hashMap.put("timeInMillis", Long.valueOf(this.cA));
        hashMap.put(ServerKeys.CATEGORY, this.mCategory);
        hashMap.put("label", this.ce);
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzne zzneVar) {
        if (!TextUtils.isEmpty(this.cz)) {
            zzneVar.zzeo(this.cz);
        }
        if (this.cA != 0) {
            zzneVar.setTimeInMillis(this.cA);
        }
        if (!TextUtils.isEmpty(this.mCategory)) {
            zzneVar.zzee(this.mCategory);
        }
        if (!TextUtils.isEmpty(this.ce)) {
            zzneVar.zzeg(this.ce);
        }
    }

    public String zzabm() {
        return this.cz;
    }

    public void zzee(String str) {
        this.mCategory = str;
    }

    public void zzeg(String str) {
        this.ce = str;
    }

    public void zzeo(String str) {
        this.cz = str;
    }
}
