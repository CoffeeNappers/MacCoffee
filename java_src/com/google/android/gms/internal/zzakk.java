package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakn;
/* loaded from: classes2.dex */
public class zzakk extends zzakn {
    private final boolean bgf;
    private final zzakz<Boolean> bgg;

    public zzakk(zzajq zzajqVar, zzakz<Boolean> zzakzVar, boolean z) {
        super(zzakn.zza.AckUserWrite, zzako.bgp, zzajqVar);
        this.bgg = zzakzVar;
        this.bgf = z;
    }

    public String toString() {
        return String.format("AckUserWrite { path=%s, revert=%s, affectedTree=%s }", zzcrc(), Boolean.valueOf(this.bgf), this.bgg);
    }

    @Override // com.google.android.gms.internal.zzakn
    public zzakn zzc(zzalz zzalzVar) {
        if (!this.aZr.isEmpty()) {
            zzann.zzb(this.aZr.zzcvj().equals(zzalzVar), "operationForChild called for unrelated child.");
            return new zzakk(this.aZr.zzcvk(), this.bgg, this.bgf);
        } else if (this.bgg.getValue() == null) {
            return new zzakk(zzajq.zzcvg(), this.bgg.zzai(new zzajq(zzalzVar)), this.bgf);
        } else {
            zzann.zzb(this.bgg.zzcxf().isEmpty(), "affectedTree should not have overlapping affected paths.");
            return this;
        }
    }

    public zzakz<Boolean> zzcwm() {
        return this.bgg;
    }

    public boolean zzcwn() {
        return this.bgf;
    }
}
