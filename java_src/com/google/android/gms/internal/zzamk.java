package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzamk {
    private static final zzamk bjb = new zzamk(zzalz.zzcyx(), zzame.zzczq());
    private static final zzamk bjc = new zzamk(zzalz.zzcyy(), zzaml.bjd);
    private final zzalz bhe;
    private final zzaml biS;

    public zzamk(zzalz zzalzVar, zzaml zzamlVar) {
        this.bhe = zzalzVar;
        this.biS = zzamlVar;
    }

    public static zzamk zzczy() {
        return bjb;
    }

    public static zzamk zzczz() {
        return bjc;
    }

    public zzalz a() {
        return this.bhe;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzamk zzamkVar = (zzamk) obj;
        return this.bhe.equals(zzamkVar.bhe) && this.biS.equals(zzamkVar.biS);
    }

    public int hashCode() {
        return (this.bhe.hashCode() * 31) + this.biS.hashCode();
    }

    public String toString() {
        String valueOf = String.valueOf(this.bhe);
        String valueOf2 = String.valueOf(this.biS);
        return new StringBuilder(String.valueOf(valueOf).length() + 23 + String.valueOf(valueOf2).length()).append("NamedNode{name=").append(valueOf).append(", node=").append(valueOf2).append("}").toString();
    }

    public zzaml zzcqy() {
        return this.biS;
    }
}
