package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zzna extends com.google.android.gms.analytics.zzg<zzna> {
    public String cg;
    public boolean ch;

    public String getDescription() {
        return this.cg;
    }

    public void setDescription(String str) {
        this.cg = str;
    }

    public String toString() {
        HashMap hashMap = new HashMap();
        hashMap.put("description", this.cg);
        hashMap.put("fatal", Boolean.valueOf(this.ch));
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzna zznaVar) {
        if (!TextUtils.isEmpty(this.cg)) {
            zznaVar.setDescription(this.cg);
        }
        if (this.ch) {
            zznaVar.zzar(this.ch);
        }
    }

    public boolean zzaaz() {
        return this.ch;
    }

    public void zzar(boolean z) {
        this.ch = z;
    }
}
