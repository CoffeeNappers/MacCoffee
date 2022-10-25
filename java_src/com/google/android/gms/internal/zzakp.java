package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakn;
/* loaded from: classes2.dex */
public class zzakp extends zzakn {
    private final zzaml bgx;

    public zzakp(zzako zzakoVar, zzajq zzajqVar, zzaml zzamlVar) {
        super(zzakn.zza.Overwrite, zzakoVar, zzajqVar);
        this.bgx = zzamlVar;
    }

    public String toString() {
        return String.format("Overwrite { path=%s, source=%s, snapshot=%s }", zzcrc(), zzcwp(), this.bgx);
    }

    @Override // com.google.android.gms.internal.zzakn
    public zzakn zzc(zzalz zzalzVar) {
        return this.aZr.isEmpty() ? new zzakp(this.bgj, zzajq.zzcvg(), this.bgx.zzm(zzalzVar)) : new zzakp(this.bgj, this.aZr.zzcvk(), this.bgx);
    }

    public zzaml zzcwv() {
        return this.bgx;
    }
}
