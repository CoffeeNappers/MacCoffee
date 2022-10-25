package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakn;
/* loaded from: classes2.dex */
public class zzakm extends zzakn {
    private final zzajh bgh;

    public zzakm(zzako zzakoVar, zzajq zzajqVar, zzajh zzajhVar) {
        super(zzakn.zza.Merge, zzakoVar, zzajqVar);
        this.bgh = zzajhVar;
    }

    public String toString() {
        return String.format("Merge { path=%s, source=%s, children=%s }", zzcrc(), zzcwp(), this.bgh);
    }

    @Override // com.google.android.gms.internal.zzakn
    public zzakn zzc(zzalz zzalzVar) {
        if (!this.aZr.isEmpty()) {
            if (!this.aZr.zzcvj().equals(zzalzVar)) {
                return null;
            }
            return new zzakm(this.bgj, this.aZr.zzcvk(), this.bgh);
        }
        zzajh zzg = this.bgh.zzg(new zzajq(zzalzVar));
        if (zzg.isEmpty()) {
            return null;
        }
        return zzg.zzcuf() != null ? new zzakp(this.bgj, zzajq.zzcvg(), zzg.zzcuf()) : new zzakm(this.bgj, zzajq.zzcvg(), zzg);
    }

    public zzajh zzcwo() {
        return this.bgh;
    }
}
