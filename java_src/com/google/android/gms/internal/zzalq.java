package com.google.android.gms.internal;

import com.google.android.gms.internal.zzals;
/* loaded from: classes2.dex */
public class zzalq implements zzals {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzamf bhC;

    static {
        $assertionsDisabled = !zzalq.class.desiredAssertionStatus();
    }

    public zzalq(zzamf zzamfVar) {
        this.bhC = zzamfVar;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzalz zzalzVar, zzaml zzamlVar, zzajq zzajqVar, zzals.zza zzaVar, zzalp zzalpVar) {
        if ($assertionsDisabled || zzamgVar.zzb(this.bhC)) {
            zzaml zzcqy = zzamgVar.zzcqy();
            zzaml zzm = zzcqy.zzm(zzalzVar);
            if (zzm.zzao(zzajqVar).equals(zzamlVar.zzao(zzajqVar)) && zzm.isEmpty() == zzamlVar.isEmpty()) {
                return zzamgVar;
            }
            if (zzalpVar != null) {
                if (zzamlVar.isEmpty()) {
                    if (zzcqy.zzk(zzalzVar)) {
                        zzalpVar.zza(zzalf.zzd(zzalzVar, zzm));
                    } else if (!$assertionsDisabled && !zzcqy.zzcze()) {
                        throw new AssertionError("A child remove without an old child only makes sense on a leaf node");
                    }
                } else if (zzm.isEmpty()) {
                    zzalpVar.zza(zzalf.zzc(zzalzVar, zzamlVar));
                } else {
                    zzalpVar.zza(zzalf.zza(zzalzVar, zzamlVar, zzm));
                }
            }
            return (!zzcqy.zzcze() || !zzamlVar.isEmpty()) ? zzamgVar.zzh(zzalzVar, zzamlVar) : zzamgVar;
        }
        throw new AssertionError("The index must match the filter");
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzamg zzamgVar2, zzalp zzalpVar) {
        if ($assertionsDisabled || zzamgVar2.zzb(this.bhC)) {
            if (zzalpVar != null) {
                for (zzamk zzamkVar : zzamgVar.zzcqy()) {
                    if (!zzamgVar2.zzcqy().zzk(zzamkVar.a())) {
                        zzalpVar.zza(zzalf.zzd(zzamkVar.a(), zzamkVar.zzcqy()));
                    }
                }
                if (!zzamgVar2.zzcqy().zzcze()) {
                    for (zzamk zzamkVar2 : zzamgVar2.zzcqy()) {
                        if (zzamgVar.zzcqy().zzk(zzamkVar2.a())) {
                            zzaml zzm = zzamgVar.zzcqy().zzm(zzamkVar2.a());
                            if (!zzm.equals(zzamkVar2.zzcqy())) {
                                zzalpVar.zza(zzalf.zza(zzamkVar2.a(), zzamkVar2.zzcqy(), zzm));
                            }
                        } else {
                            zzalpVar.zza(zzalf.zzc(zzamkVar2.a(), zzamkVar2.zzcqy()));
                        }
                    }
                }
            }
            return zzamgVar2;
        }
        throw new AssertionError("Can't use IndexedNode that doesn't have filter's index");
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzaml zzamlVar) {
        return zzamgVar.zzcqy().isEmpty() ? zzamgVar : zzamgVar.zzo(zzamlVar);
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamf zzcya() {
        return this.bhC;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzals zzcyq() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzals
    public boolean zzcyr() {
        return false;
    }
}
