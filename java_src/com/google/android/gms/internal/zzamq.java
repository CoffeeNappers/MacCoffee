package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class zzamq {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzajq bjj;
    private final zzajq bjk;
    private final zzaml bjl;

    static {
        $assertionsDisabled = !zzamq.class.desiredAssertionStatus();
    }

    public zzamq(zzaja zzajaVar) {
        zzajq zzajqVar = null;
        List<String> zzctm = zzajaVar.zzctm();
        this.bjj = zzctm != null ? new zzajq(zzctm) : null;
        List<String> zzctn = zzajaVar.zzctn();
        this.bjk = zzctn != null ? new zzajq(zzctn) : zzajqVar;
        this.bjl = zzamm.zzbt(zzajaVar.zzcto());
    }

    private zzaml zzb(zzajq zzajqVar, zzaml zzamlVar, zzaml zzamlVar2) {
        boolean z = true;
        int compareTo = this.bjj == null ? 1 : zzajqVar.compareTo(this.bjj);
        int compareTo2 = this.bjk == null ? -1 : zzajqVar.compareTo(this.bjk);
        boolean z2 = this.bjj != null && zzajqVar.zzi(this.bjj);
        if (this.bjk == null || !zzajqVar.zzi(this.bjk)) {
            z = false;
        }
        if (compareTo <= 0 || compareTo2 >= 0 || z) {
            if (compareTo > 0 && z && zzamlVar2.zzcze()) {
                return zzamlVar2;
            }
            if (compareTo > 0 && compareTo2 == 0) {
                if (!$assertionsDisabled && !z) {
                    throw new AssertionError();
                }
                if (!$assertionsDisabled && zzamlVar2.zzcze()) {
                    throw new AssertionError();
                }
                return zzamlVar.zzcze() ? zzame.zzczq() : zzamlVar;
            } else if (!z2 && !z) {
                if (!$assertionsDisabled && compareTo2 <= 0 && compareTo > 0) {
                    throw new AssertionError();
                }
                return zzamlVar;
            } else {
                HashSet hashSet = new HashSet();
                Iterator<zzamk> it = zzamlVar.iterator();
                while (it.hasNext()) {
                    hashSet.add(it.next().a());
                }
                Iterator<zzamk> it2 = zzamlVar2.iterator();
                while (it2.hasNext()) {
                    hashSet.add(it2.next().a());
                }
                ArrayList<zzalz> arrayList = new ArrayList(hashSet.size() + 1);
                arrayList.addAll(hashSet);
                if (!zzamlVar2.zzczf().isEmpty() || !zzamlVar.zzczf().isEmpty()) {
                    arrayList.add(zzalz.zzcyz());
                }
                zzaml zzamlVar3 = zzamlVar;
                for (zzalz zzalzVar : arrayList) {
                    zzaml zzm = zzamlVar.zzm(zzalzVar);
                    zzaml zzb = zzb(zzajqVar.zza(zzalzVar), zzamlVar.zzm(zzalzVar), zzamlVar2.zzm(zzalzVar));
                    zzamlVar3 = zzb != zzm ? zzamlVar3.zze(zzalzVar, zzb) : zzamlVar3;
                }
                return zzamlVar3;
            }
        }
        return zzamlVar2;
    }

    public String toString() {
        String valueOf = String.valueOf(this.bjj);
        String valueOf2 = String.valueOf(this.bjk);
        String valueOf3 = String.valueOf(this.bjl);
        return new StringBuilder(String.valueOf(valueOf).length() + 55 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length()).append("RangeMerge{optExclusiveStart=").append(valueOf).append(", optInclusiveEnd=").append(valueOf2).append(", snap=").append(valueOf3).append("}").toString();
    }

    public zzaml zzr(zzaml zzamlVar) {
        return zzb(zzajq.zzcvg(), zzamlVar, this.bjl);
    }
}
