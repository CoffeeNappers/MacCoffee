package com.google.android.gms.internal;

import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public final class zzapb extends zzaoy {
    private final zzapw<String, zzaoy> bov = new zzapw<>();

    private zzaoy zzcl(Object obj) {
        return obj == null ? zzapa.bou : new zzape(obj);
    }

    public Set<Map.Entry<String, zzaoy>> entrySet() {
        return this.bov.entrySet();
    }

    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof zzapb) && ((zzapb) obj).bov.equals(this.bov));
    }

    public boolean has(String str) {
        return this.bov.containsKey(str);
    }

    public int hashCode() {
        return this.bov.hashCode();
    }

    public void zza(String str, zzaoy zzaoyVar) {
        if (zzaoyVar == null) {
            zzaoyVar = zzapa.bou;
        }
        this.bov.put(str, zzaoyVar);
    }

    public void zzb(String str, Boolean bool) {
        zza(str, zzcl(bool));
    }

    public void zzcb(String str, String str2) {
        zza(str, zzcl(str2));
    }

    public zzaoy zzuo(String str) {
        return this.bov.get(str);
    }

    public zzaov zzup(String str) {
        return (zzaov) this.bov.get(str);
    }
}
