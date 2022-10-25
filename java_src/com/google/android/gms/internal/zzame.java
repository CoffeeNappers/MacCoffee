package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaml;
import java.util.Collections;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzame extends zzama implements zzaml {
    private static final zzame biQ = new zzame();

    private zzame() {
    }

    public static zzame zzczq() {
        return biQ;
    }

    @Override // com.google.android.gms.internal.zzama
    public boolean equals(Object obj) {
        if (obj instanceof zzame) {
            return true;
        }
        return (obj instanceof zzaml) && ((zzaml) obj).isEmpty() && zzczf().equals(((zzaml) obj).zzczf());
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public int getChildCount() {
        return 0;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public Object getValue() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public Object getValue(boolean z) {
        return null;
    }

    @Override // com.google.android.gms.internal.zzama
    public int hashCode() {
        return 0;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public boolean isEmpty() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzama, java.lang.Iterable
    public Iterator<zzamk> iterator() {
        return Collections.emptyList().iterator();
    }

    @Override // com.google.android.gms.internal.zzama
    public String toString() {
        return "<Empty Node>";
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        return "";
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzaml zzao(zzajq zzajqVar) {
        return this;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public Iterator<zzamk> zzcrl() {
        return Collections.emptyList().iterator();
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public String zzczd() {
        return "";
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public boolean zzcze() {
        return false;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzaml zzczf() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzaml zze(zzalz zzalzVar, zzaml zzamlVar) {
        return (!zzamlVar.isEmpty() && !zzalzVar.zzczb()) ? new zzama().zze(zzalzVar, zzamlVar) : this;
    }

    @Override // com.google.android.gms.internal.zzama, java.lang.Comparable
    /* renamed from: zzh */
    public int compareTo(zzaml zzamlVar) {
        return zzamlVar.isEmpty() ? 0 : -1;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public boolean zzk(zzalz zzalzVar) {
        return false;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzalz zzl(zzalz zzalzVar) {
        return null;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    /* renamed from: zzl */
    public zzame zzg(zzaml zzamlVar) {
        return this;
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzaml zzl(zzajq zzajqVar, zzaml zzamlVar) {
        if (zzajqVar.isEmpty()) {
            return zzamlVar;
        }
        zzalz zzcvj = zzajqVar.zzcvj();
        return zze(zzcvj, zzm(zzcvj).zzl(zzajqVar.zzcvk(), zzamlVar));
    }

    @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
    public zzaml zzm(zzalz zzalzVar) {
        return this;
    }
}
