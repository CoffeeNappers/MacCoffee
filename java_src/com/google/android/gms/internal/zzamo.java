package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzamo extends zzamf {
    private static final zzamo bji = new zzamo();

    private zzamo() {
    }

    public static zzamo b() {
        return bji;
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        return obj instanceof zzamo;
    }

    public int hashCode() {
        return 3155577;
    }

    public String toString() {
        return "PriorityIndex";
    }

    @Override // java.util.Comparator
    /* renamed from: zza */
    public int compare(zzamk zzamkVar, zzamk zzamkVar2) {
        return zzamm.zza(zzamkVar.a(), zzamkVar.zzcqy().zzczf(), zzamkVar2.a(), zzamkVar2.zzcqy().zzczf());
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzczs() {
        return zzg(zzalz.zzcyy(), zzaml.bjd);
    }

    @Override // com.google.android.gms.internal.zzamf
    public String zzczt() {
        throw new IllegalArgumentException("Can't get query definition on priority index!");
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzg(zzalz zzalzVar, zzaml zzamlVar) {
        return new zzamk(zzalzVar, new zzamr("[PRIORITY-POST]", zzamlVar));
    }

    @Override // com.google.android.gms.internal.zzamf
    public boolean zzm(zzaml zzamlVar) {
        return !zzamlVar.zzczf().isEmpty();
    }
}
