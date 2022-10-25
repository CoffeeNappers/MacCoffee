package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
final class zzapj<T> extends zzapk<T> {
    private final zzapg<T> boA;
    private final zzaox<T> boB;
    private final zzaos boC;
    private final zzaqo<T> boD;
    private final zzapl boE;
    private zzapk<T> bol;

    /* loaded from: classes2.dex */
    private static class zza implements zzapl {
        private final zzapg<?> boA;
        private final zzaox<?> boB;
        private final zzaqo<?> boF;
        private final boolean boG;
        private final Class<?> boH;

        private zza(Object obj, zzaqo<?> zzaqoVar, boolean z, Class<?> cls) {
            this.boA = obj instanceof zzapg ? (zzapg) obj : null;
            this.boB = obj instanceof zzaox ? (zzaox) obj : null;
            zzapq.zzbt((this.boA == null && this.boB == null) ? false : true);
            this.boF = zzaqoVar;
            this.boG = z;
            this.boH = cls;
        }

        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            if (this.boF != null ? this.boF.equals(zzaqoVar) || (this.boG && this.boF.bC() == zzaqoVar.bB()) : this.boH.isAssignableFrom(zzaqoVar.bB())) {
                return new zzapj(this.boA, this.boB, zzaosVar, zzaqoVar, this);
            }
            return null;
        }
    }

    private zzapj(zzapg<T> zzapgVar, zzaox<T> zzaoxVar, zzaos zzaosVar, zzaqo<T> zzaqoVar, zzapl zzaplVar) {
        this.boA = zzapgVar;
        this.boB = zzaoxVar;
        this.boC = zzaosVar;
        this.boD = zzaqoVar;
        this.boE = zzaplVar;
    }

    private zzapk<T> bg() {
        zzapk<T> zzapkVar = this.bol;
        if (zzapkVar != null) {
            return zzapkVar;
        }
        zzapk<T> zza2 = this.boC.zza(this.boE, this.boD);
        this.bol = zza2;
        return zza2;
    }

    public static zzapl zza(zzaqo<?> zzaqoVar, Object obj) {
        return new zza(obj, zzaqoVar, false, null);
    }

    public static zzapl zzb(zzaqo<?> zzaqoVar, Object obj) {
        return new zza(obj, zzaqoVar, zzaqoVar.bC() == zzaqoVar.bB(), null);
    }

    @Override // com.google.android.gms.internal.zzapk
    public void zza(zzaqr zzaqrVar, T t) throws IOException {
        if (this.boA == null) {
            bg().zza(zzaqrVar, t);
        } else if (t == null) {
            zzaqrVar.bA();
        } else {
            zzapz.zzb(this.boA.zza(t, this.boD.bC(), this.boC.boj), zzaqrVar);
        }
    }

    @Override // com.google.android.gms.internal.zzapk
    public T zzb(zzaqp zzaqpVar) throws IOException {
        if (this.boB == null) {
            return bg().zzb(zzaqpVar);
        }
        zzaoy zzh = zzapz.zzh(zzaqpVar);
        if (zzh.aY()) {
            return null;
        }
        try {
            return this.boB.zzb(zzh, this.boD.bC(), this.boC.boi);
        } catch (zzapc e) {
            throw e;
        } catch (Exception e2) {
            throw new zzapc(e2);
        }
    }
}
