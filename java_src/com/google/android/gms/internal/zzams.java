package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzams extends zzamf {
    private static final zzams bjm = new zzams();

    private zzams() {
    }

    public static zzams d() {
        return bjm;
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        return obj instanceof zzams;
    }

    public int hashCode() {
        return 4;
    }

    public String toString() {
        return "ValueIndex";
    }

    @Override // java.util.Comparator
    /* renamed from: zza */
    public int compare(zzamk zzamkVar, zzamk zzamkVar2) {
        int compareTo = zzamkVar.zzcqy().compareTo(zzamkVar2.zzcqy());
        return compareTo == 0 ? zzamkVar.a().compareTo(zzamkVar2.a()) : compareTo;
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzczs() {
        return new zzamk(zzalz.zzcyy(), zzaml.bjd);
    }

    @Override // com.google.android.gms.internal.zzamf
    public String zzczt() {
        return ".value";
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzg(zzalz zzalzVar, zzaml zzamlVar) {
        return new zzamk(zzalzVar, zzamlVar);
    }

    @Override // com.google.android.gms.internal.zzamf
    public boolean zzm(zzaml zzamlVar) {
        return true;
    }
}
