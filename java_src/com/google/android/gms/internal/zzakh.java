package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzakh {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzala<zzake> bfW;
    private zzajh bfT = zzajh.zzcue();
    private List<zzake> bfU = new ArrayList();
    private Long bfV = -1L;

    static {
        $assertionsDisabled = !zzakh.class.desiredAssertionStatus();
        bfW = new zzala<zzake>() { // from class: com.google.android.gms.internal.zzakh.2
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zza */
            public boolean zzbs(zzake zzakeVar) {
                return zzakeVar.isVisible();
            }
        };
    }

    private static zzajh zza(List<zzake> list, zzala<zzake> zzalaVar, zzajq zzajqVar) {
        zzajh zzcue = zzajh.zzcue();
        Iterator<zzake> it = list.iterator();
        while (true) {
            zzajh zzajhVar = zzcue;
            if (it.hasNext()) {
                zzake next = it.next();
                if (zzalaVar.zzbs(next)) {
                    zzajq zzcrc = next.zzcrc();
                    if (next.zzcwg()) {
                        if (zzajqVar.zzi(zzcrc)) {
                            zzajhVar = zzajhVar.zze(zzajq.zza(zzajqVar, zzcrc), next.zzcwe());
                        } else if (zzcrc.zzi(zzajqVar)) {
                            zzajhVar = zzajhVar.zze(zzajq.zzcvg(), next.zzcwe().zzao(zzajq.zza(zzcrc, zzajqVar)));
                        }
                    } else if (zzajqVar.zzi(zzcrc)) {
                        zzajhVar = zzajhVar.zzb(zzajq.zza(zzajqVar, zzcrc), next.zzcwf());
                    } else if (zzcrc.zzi(zzajqVar)) {
                        zzajq zza = zzajq.zza(zzcrc, zzajqVar);
                        if (zza.isEmpty()) {
                            zzajhVar = zzajhVar.zzb(zzajq.zzcvg(), next.zzcwf());
                        } else {
                            zzaml zzf = next.zzcwf().zzf(zza);
                            if (zzf != null) {
                                zzajhVar = zzajhVar.zze(zzajq.zzcvg(), zzf);
                            }
                        }
                    }
                }
                zzcue = zzajhVar;
            } else {
                return zzajhVar;
            }
        }
    }

    private boolean zza(zzake zzakeVar, zzajq zzajqVar) {
        if (zzakeVar.zzcwg()) {
            return zzakeVar.zzcrc().zzi(zzajqVar);
        }
        Iterator<Map.Entry<zzajq, zzaml>> it = zzakeVar.zzcwf().iterator();
        while (it.hasNext()) {
            if (zzakeVar.zzcrc().zzh(it.next().getKey()).zzi(zzajqVar)) {
                return true;
            }
        }
        return false;
    }

    private void zzcwk() {
        this.bfT = zza(this.bfU, bfW, zzajq.zzcvg());
        if (this.bfU.size() > 0) {
            this.bfV = Long.valueOf(this.bfU.get(this.bfU.size() - 1).zzcwd());
        } else {
            this.bfV = -1L;
        }
    }

    public zzamk zza(zzajq zzajqVar, zzaml zzamlVar, zzamk zzamkVar, boolean z, zzamf zzamfVar) {
        zzamk zzamkVar2 = null;
        zzajh zzg = this.bfT.zzg(zzajqVar);
        zzaml zzf = zzg.zzf(zzajq.zzcvg());
        if (zzf == null) {
            if (zzamlVar != null) {
                zzf = zzg.zzb(zzamlVar);
            }
            return zzamkVar2;
        }
        for (zzamk zzamkVar3 : zzf) {
            if (zzamfVar.zza(zzamkVar3, zzamkVar, z) <= 0 || (zzamkVar2 != null && zzamfVar.zza(zzamkVar3, zzamkVar2, z) >= 0)) {
                zzamkVar3 = zzamkVar2;
            }
            zzamkVar2 = zzamkVar3;
        }
        return zzamkVar2;
    }

    public zzaml zza(zzajq zzajqVar, zzajq zzajqVar2, zzaml zzamlVar, zzaml zzamlVar2) {
        if (!$assertionsDisabled && zzamlVar == null && zzamlVar2 == null) {
            throw new AssertionError("Either existingEventSnap or existingServerSnap must exist");
        }
        zzajq zzh = zzajqVar.zzh(zzajqVar2);
        if (this.bfT.zze(zzh)) {
            return null;
        }
        zzajh zzg = this.bfT.zzg(zzh);
        return zzg.isEmpty() ? zzamlVar2.zzao(zzajqVar2) : zzg.zzb(zzamlVar2.zzao(zzajqVar2));
    }

    public zzaml zza(zzajq zzajqVar, zzalz zzalzVar, zzald zzaldVar) {
        zzajq zza = zzajqVar.zza(zzalzVar);
        zzaml zzf = this.bfT.zzf(zza);
        if (zzf != null) {
            return zzf;
        }
        if (!zzaldVar.zzf(zzalzVar)) {
            return null;
        }
        return this.bfT.zzg(zza).zzb(zzaldVar.zzcqy().zzm(zzalzVar));
    }

    public zzaml zza(final zzajq zzajqVar, zzaml zzamlVar, final List<Long> list, final boolean z) {
        if (list.isEmpty() && !z) {
            zzaml zzf = this.bfT.zzf(zzajqVar);
            if (zzf != null) {
                return zzf;
            }
            zzajh zzg = this.bfT.zzg(zzajqVar);
            if (zzg.isEmpty()) {
                return zzamlVar;
            }
            if (zzamlVar == null && !zzg.zze(zzajq.zzcvg())) {
                return null;
            }
            if (zzamlVar == null) {
                zzamlVar = zzame.zzczq();
            }
            return zzg.zzb(zzamlVar);
        }
        zzajh zzg2 = this.bfT.zzg(zzajqVar);
        if (!z && zzg2.isEmpty()) {
            return zzamlVar;
        }
        if (!z && zzamlVar == null && !zzg2.zze(zzajq.zzcvg())) {
            return null;
        }
        zzajh zza = zza(this.bfU, new zzala<zzake>() { // from class: com.google.android.gms.internal.zzakh.1
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zza */
            public boolean zzbs(zzake zzakeVar) {
                return (zzakeVar.isVisible() || z) && !list.contains(Long.valueOf(zzakeVar.zzcwd())) && (zzakeVar.zzcrc().zzi(zzajqVar) || zzajqVar.zzi(zzakeVar.zzcrc()));
            }
        }, zzajqVar);
        if (zzamlVar == null) {
            zzamlVar = zzame.zzczq();
        }
        return zza.zzb(zzamlVar);
    }

    public void zza(zzajq zzajqVar, zzajh zzajhVar, Long l) {
        if ($assertionsDisabled || l.longValue() > this.bfV.longValue()) {
            this.bfU.add(new zzake(l.longValue(), zzajqVar, zzajhVar));
            this.bfT = this.bfT.zzb(zzajqVar, zzajhVar);
            this.bfV = l;
            return;
        }
        throw new AssertionError();
    }

    public void zza(zzajq zzajqVar, zzaml zzamlVar, Long l, boolean z) {
        if ($assertionsDisabled || l.longValue() > this.bfV.longValue()) {
            this.bfU.add(new zzake(l.longValue(), zzajqVar, zzamlVar, z));
            if (z) {
                this.bfT = this.bfT.zze(zzajqVar, zzamlVar);
            }
            this.bfV = l;
            return;
        }
        throw new AssertionError();
    }

    public zzake zzcj(long j) {
        for (zzake zzakeVar : this.bfU) {
            if (zzakeVar.zzcwd() == j) {
                return zzakeVar;
            }
        }
        return null;
    }

    public boolean zzck(long j) {
        boolean z;
        boolean z2;
        zzake zzakeVar = null;
        Iterator<zzake> it = this.bfU.iterator();
        int i = 0;
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            zzake next = it.next();
            if (next.zzcwd() == j) {
                zzakeVar = next;
                break;
            }
            i++;
        }
        if ($assertionsDisabled || zzakeVar != null) {
            this.bfU.remove(zzakeVar);
            boolean isVisible = zzakeVar.isVisible();
            int size = this.bfU.size() - 1;
            boolean z3 = false;
            while (isVisible && size >= 0) {
                zzake zzakeVar2 = this.bfU.get(size);
                if (zzakeVar2.isVisible()) {
                    if (size >= i && zza(zzakeVar2, zzakeVar.zzcrc())) {
                        z = z3;
                        z2 = false;
                    } else if (zzakeVar.zzcrc().zzi(zzakeVar2.zzcrc())) {
                        z = true;
                        z2 = isVisible;
                    }
                    size--;
                    isVisible = z2;
                    z3 = z;
                }
                z = z3;
                z2 = isVisible;
                size--;
                isVisible = z2;
                z3 = z;
            }
            if (!isVisible) {
                return false;
            }
            if (z3) {
                zzcwk();
                return true;
            } else if (zzakeVar.zzcwg()) {
                this.bfT = this.bfT.zzd(zzakeVar.zzcrc());
                return true;
            } else {
                Iterator<Map.Entry<zzajq, zzaml>> it2 = zzakeVar.zzcwf().iterator();
                while (it2.hasNext()) {
                    this.bfT = this.bfT.zzd(zzakeVar.zzcrc().zzh(it2.next().getKey()));
                }
                return true;
            }
        }
        throw new AssertionError("removeWrite called with nonexistent writeId");
    }

    public List<zzake> zzcwj() {
        ArrayList arrayList = new ArrayList(this.bfU);
        this.bfT = zzajh.zzcue();
        this.bfU = new ArrayList();
        return arrayList;
    }

    public zzaml zzj(zzajq zzajqVar, zzaml zzamlVar) {
        zzaml zzamlVar2;
        zzaml zzczq = zzame.zzczq();
        zzaml zzf = this.bfT.zzf(zzajqVar);
        if (zzf == null) {
            zzajh zzg = this.bfT.zzg(zzajqVar);
            Iterator<zzamk> it = zzamlVar.iterator();
            while (true) {
                zzamlVar2 = zzczq;
                if (!it.hasNext()) {
                    break;
                }
                zzamk next = it.next();
                zzczq = zzamlVar2.zze(next.a(), zzg.zzg(new zzajq(next.a())).zzb(next.zzcqy()));
            }
            for (zzamk zzamkVar : zzg.zzcug()) {
                zzamlVar2 = zzamlVar2.zze(zzamkVar.a(), zzamkVar.zzcqy());
            }
            return zzamlVar2;
        } else if (zzf.zzcze()) {
            return zzczq;
        } else {
            Iterator<zzamk> it2 = zzf.iterator();
            while (true) {
                zzaml zzamlVar3 = zzczq;
                if (!it2.hasNext()) {
                    return zzamlVar3;
                }
                zzamk next2 = it2.next();
                zzczq = zzamlVar3.zze(next2.a(), next2.zzcqy());
            }
        }
    }

    public zzaki zzu(zzajq zzajqVar) {
        return new zzaki(zzajqVar, this);
    }

    public zzaml zzv(zzajq zzajqVar) {
        return this.bfT.zzf(zzajqVar);
    }
}
