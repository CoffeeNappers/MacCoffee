package com.google.android.gms.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzmu extends com.google.android.gms.analytics.zzg<zzmu> {
    private Map<Integer, String> bX = new HashMap(4);

    public String toString() {
        HashMap hashMap = new HashMap();
        for (Map.Entry<Integer, String> entry : this.bX.entrySet()) {
            String valueOf = String.valueOf(entry.getKey());
            hashMap.put(new StringBuilder(String.valueOf(valueOf).length() + 9).append("dimension").append(valueOf).toString(), entry.getValue());
        }
        return zzj(hashMap);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmu zzmuVar) {
        zzmuVar.bX.putAll(this.bX);
    }

    public Map<Integer, String> zzaan() {
        return Collections.unmodifiableMap(this.bX);
    }
}
