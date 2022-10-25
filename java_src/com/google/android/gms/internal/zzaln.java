package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzaln {
    private final zzald bhY;
    private final zzald bhZ;

    public zzaln(zzald zzaldVar, zzald zzaldVar2) {
        this.bhY = zzaldVar;
        this.bhZ = zzaldVar2;
    }

    public zzaln zza(zzamg zzamgVar, boolean z, boolean z2) {
        return new zzaln(new zzald(zzamgVar, z, z2), this.bhZ);
    }

    public zzaln zzb(zzamg zzamgVar, boolean z, boolean z2) {
        return new zzaln(this.bhY, new zzald(zzamgVar, z, z2));
    }

    public zzald zzcyl() {
        return this.bhY;
    }

    public zzaml zzcym() {
        if (this.bhY.zzcxh()) {
            return this.bhY.zzcqy();
        }
        return null;
    }

    public zzald zzcyn() {
        return this.bhZ;
    }

    public zzaml zzcyo() {
        if (this.bhZ.zzcxh()) {
            return this.bhZ.zzcqy();
        }
        return null;
    }
}
