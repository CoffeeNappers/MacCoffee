package com.google.android.gms.internal;

import java.util.Map;
/* loaded from: classes2.dex */
public class zzall {
    private final zzajq aZr;
    private final zzalk aZv;

    public zzall(zzajq zzajqVar, zzalk zzalkVar) {
        this.aZr = zzajqVar;
        this.aZv = zzalkVar;
    }

    public static zzall zzan(zzajq zzajqVar) {
        return new zzall(zzajqVar, zzalk.bhG);
    }

    public static zzall zzb(zzajq zzajqVar, Map<String, Object> map) {
        return new zzall(zzajqVar, zzalk.zzcd(map));
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzall zzallVar = (zzall) obj;
        return this.aZr.equals(zzallVar.aZr) && this.aZv.equals(zzallVar.aZv);
    }

    public int hashCode() {
        return (this.aZr.hashCode() * 31) + this.aZv.hashCode();
    }

    public boolean isDefault() {
        return this.aZv.isDefault();
    }

    public String toString() {
        String valueOf = String.valueOf(this.aZr);
        String valueOf2 = String.valueOf(this.aZv);
        return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append(":").append(valueOf2).toString();
    }

    public zzajq zzcrc() {
        return this.aZr;
    }

    public zzamf zzcya() {
        return this.aZv.zzcya();
    }

    public boolean zzcye() {
        return this.aZv.zzcye();
    }

    public zzalk zzcyh() {
        return this.aZv;
    }
}
