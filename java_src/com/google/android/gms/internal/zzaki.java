package com.google.android.gms.internal;

import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class zzaki {
    private final zzajq bgb;
    private final zzakh bgc;

    public zzaki(zzajq zzajqVar, zzakh zzakhVar) {
        this.bgb = zzajqVar;
        this.bgc = zzakhVar;
    }

    public zzamk zza(zzaml zzamlVar, zzamk zzamkVar, boolean z, zzamf zzamfVar) {
        return this.bgc.zza(this.bgb, zzamlVar, zzamkVar, z, zzamfVar);
    }

    public zzaml zza(zzajq zzajqVar, zzaml zzamlVar, zzaml zzamlVar2) {
        return this.bgc.zza(this.bgb, zzajqVar, zzamlVar, zzamlVar2);
    }

    public zzaml zza(zzalz zzalzVar, zzald zzaldVar) {
        return this.bgc.zza(this.bgb, zzalzVar, zzaldVar);
    }

    public zzaml zza(zzaml zzamlVar, List<Long> list) {
        return zza(zzamlVar, list, false);
    }

    public zzaml zza(zzaml zzamlVar, List<Long> list, boolean z) {
        return this.bgc.zza(this.bgb, zzamlVar, list, z);
    }

    public zzaki zzb(zzalz zzalzVar) {
        return new zzaki(this.bgb.zza(zzalzVar), this.bgc);
    }

    public zzaml zzc(zzaml zzamlVar) {
        return zza(zzamlVar, Collections.emptyList());
    }

    public zzaml zzd(zzaml zzamlVar) {
        return this.bgc.zzj(this.bgb, zzamlVar);
    }

    public zzaml zzv(zzajq zzajqVar) {
        return this.bgc.zzv(this.bgb.zzh(zzajqVar));
    }
}
