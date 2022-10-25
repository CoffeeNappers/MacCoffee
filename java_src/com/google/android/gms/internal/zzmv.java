package com.google.android.gms.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzmv extends com.google.android.gms.analytics.zzg<zzmv> {
    private Map<Integer, Double> bY = new HashMap(4);

    public String toString() {
        HashMap hashMap = new HashMap();
        for (Map.Entry<Integer, Double> entry : this.bY.entrySet()) {
            String valueOf = String.valueOf(entry.getKey());
            hashMap.put(new StringBuilder(String.valueOf(valueOf).length() + 6).append("metric").append(valueOf).toString(), entry.getValue());
        }
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmv zzmvVar) {
        zzmvVar.bY.putAll(this.bY);
    }

    public Map<Integer, Double> zzaao() {
        return Collections.unmodifiableMap(this.bY);
    }
}
