package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzamh extends zzamf {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzamh biU;

    static {
        $assertionsDisabled = !zzamh.class.desiredAssertionStatus();
        biU = new zzamh();
    }

    private zzamh() {
    }

    public static zzamh zzczx() {
        return biU;
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        return obj instanceof zzamh;
    }

    public int hashCode() {
        return 37;
    }

    public String toString() {
        return "KeyIndex";
    }

    @Override // java.util.Comparator
    /* renamed from: zza */
    public int compare(zzamk zzamkVar, zzamk zzamkVar2) {
        return zzamkVar.a().compareTo(zzamkVar2.a());
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzczs() {
        return zzamk.zzczz();
    }

    @Override // com.google.android.gms.internal.zzamf
    public String zzczt() {
        return ".key";
    }

    @Override // com.google.android.gms.internal.zzamf
    public zzamk zzg(zzalz zzalzVar, zzaml zzamlVar) {
        if ($assertionsDisabled || (zzamlVar instanceof zzamr)) {
            return new zzamk(zzalz.zzsx((String) zzamlVar.getValue()), zzame.zzczq());
        }
        throw new AssertionError();
    }

    @Override // com.google.android.gms.internal.zzamf
    public boolean zzm(zzaml zzamlVar) {
        return true;
    }
}
