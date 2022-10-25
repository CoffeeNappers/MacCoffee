package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzamn extends zzamf {
    private final zzajq bjh;

    public zzamn(zzajq zzajqVar) {
        if (zzajqVar.size() != 1 || !zzajqVar.zzcvj().zzczb()) {
            this.bjh = zzajqVar;
            return;
        }
        throw new IllegalArgumentException("Can't create PathIndex with '.priority' as key. Please use PriorityIndex instead!");
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return this.bjh.equals(((zzamn) obj).bjh);
    }

    public int hashCode() {
        return this.bjh.hashCode();
    }

    @Override // java.util.Comparator
    /* renamed from: zza */
    public int compare(zzamk zzamkVar, zzamk zzamkVar2) {
        int compareTo = zzamkVar.zzcqy().zzao(this.bjh).compareTo(zzamkVar2.zzcqy().zzao(this.bjh));
        return compareTo == 0 ? zzamkVar.a().compareTo(zzamkVar2.a()) : compareTo;
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzczs() {
        return new zzamk(zzalz.zzcyy(), zzame.zzczq().zzl(this.bjh, zzaml.bjd));
    }

    @Override // com.google.android.gms.internal.zzamf
    public String zzczt() {
        return this.bjh.zzcvh();
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzg(zzalz zzalzVar, zzaml zzamlVar) {
        return new zzamk(zzalzVar, zzame.zzczq().zzl(this.bjh, zzamlVar));
    }

    @Override // com.google.android.gms.internal.zzamf
    public boolean zzm(zzaml zzamlVar) {
        return !zzamlVar.zzao(this.bjh).isEmpty();
    }
}
