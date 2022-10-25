package com.google.android.gms.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzmw extends com.google.android.gms.analytics.zzg<zzmw> {
    private final Map<String, Object> zzbly = new HashMap();

    private String zzed(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        if (str != null && str.startsWith("&")) {
            str = str.substring(1);
        }
        com.google.android.gms.common.internal.zzaa.zzh(str, "Name can not be empty or \"&\"");
        return str;
    }

    public void set(String str, String str2) {
        this.zzbly.put(zzed(str), str2);
    }

    public String toString() {
        return zzj(this.zzbly);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmw zzmwVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzmwVar);
        zzmwVar.zzbly.putAll(this.zzbly);
    }

    public Map<String, Object> zzaap() {
        return Collections.unmodifiableMap(this.zzbly);
    }
}
