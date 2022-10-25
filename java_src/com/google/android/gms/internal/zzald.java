package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzald {
    private final zzamg bhk;
    private final boolean bhl;
    private final boolean bhm;

    public zzald(zzamg zzamgVar, boolean z, boolean z2) {
        this.bhk = zzamgVar;
        this.bhl = z;
        this.bhm = z2;
    }

    public boolean zzam(zzajq zzajqVar) {
        return zzajqVar.isEmpty() ? zzcxh() && !this.bhm : zzf(zzajqVar.zzcvj());
    }

    public zzaml zzcqy() {
        return this.bhk.zzcqy();
    }

    public boolean zzcxh() {
        return this.bhl;
    }

    public boolean zzcxi() {
        return this.bhm;
    }

    public zzamg zzcxj() {
        return this.bhk;
    }

    public boolean zzf(zzalz zzalzVar) {
        return (zzcxh() && !this.bhm) || this.bhk.zzcqy().zzk(zzalzVar);
    }
}
