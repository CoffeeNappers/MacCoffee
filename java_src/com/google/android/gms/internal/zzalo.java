package com.google.android.gms.internal;

import com.google.android.gms.internal.zzals;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzalo {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static zzals.zza bib;
    private final zzals bia;

    /* loaded from: classes2.dex */
    public static class zza {
        public final zzaln bhT;
        public final List<zzalf> bhX;

        public zza(zzaln zzalnVar, List<zzalf> list) {
            this.bhT = zzalnVar;
            this.bhX = list;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzb implements zzals.zza {
        private final zzaln bhT;
        private final zzaki bid;
        private final zzaml bie;

        public zzb(zzaki zzakiVar, zzaln zzalnVar, zzaml zzamlVar) {
            this.bid = zzakiVar;
            this.bhT = zzalnVar;
            this.bie = zzamlVar;
        }

        @Override // com.google.android.gms.internal.zzals.zza
        public zzamk zza(zzamf zzamfVar, zzamk zzamkVar, boolean z) {
            return this.bid.zza(this.bie != null ? this.bie : this.bhT.zzcyo(), zzamkVar, z, zzamfVar);
        }

        @Override // com.google.android.gms.internal.zzals.zza
        public zzaml zzh(zzalz zzalzVar) {
            zzald zzcyl = this.bhT.zzcyl();
            if (zzcyl.zzf(zzalzVar)) {
                return zzcyl.zzcqy().zzm(zzalzVar);
            }
            return this.bid.zza(zzalzVar, this.bie != null ? new zzald(zzamg.zza(this.bie, zzamh.zzczx()), true, false) : this.bhT.zzcyn());
        }
    }

    static {
        $assertionsDisabled = !zzalo.class.desiredAssertionStatus();
        bib = new zzals.zza() { // from class: com.google.android.gms.internal.zzalo.1
            @Override // com.google.android.gms.internal.zzals.zza
            public zzamk zza(zzamf zzamfVar, zzamk zzamkVar, boolean z) {
                return null;
            }

            @Override // com.google.android.gms.internal.zzals.zza
            public zzaml zzh(zzalz zzalzVar) {
                return null;
            }
        };
    }

    public zzalo(zzals zzalsVar) {
        this.bia = zzalsVar;
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzajh zzajhVar, zzaki zzakiVar, zzaml zzamlVar, zzalp zzalpVar) {
        if ($assertionsDisabled || zzajhVar.zzcuf() == null) {
            Iterator<Map.Entry<zzajq, zzaml>> it = zzajhVar.iterator();
            zzaln zzalnVar2 = zzalnVar;
            while (it.hasNext()) {
                Map.Entry<zzajq, zzaml> next = it.next();
                zzajq zzh = zzajqVar.zzh(next.getKey());
                if (zza(zzalnVar, zzh.zzcvj())) {
                    zzalnVar2 = zza(zzalnVar2, zzh, next.getValue(), zzakiVar, zzamlVar, zzalpVar);
                }
            }
            Iterator<Map.Entry<zzajq, zzaml>> it2 = zzajhVar.iterator();
            while (it2.hasNext()) {
                Map.Entry<zzajq, zzaml> next2 = it2.next();
                zzajq zzh2 = zzajqVar.zzh(next2.getKey());
                if (!zza(zzalnVar, zzh2.zzcvj())) {
                    zzalnVar2 = zza(zzalnVar2, zzh2, next2.getValue(), zzakiVar, zzamlVar, zzalpVar);
                }
            }
            return zzalnVar2;
        }
        throw new AssertionError("Can't have a merge that is an overwrite");
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzajh zzajhVar, zzaki zzakiVar, zzaml zzamlVar, boolean z, zzalp zzalpVar) {
        if (!zzalnVar.zzcyn().zzcqy().isEmpty() || zzalnVar.zzcyn().zzcxh()) {
            if (!$assertionsDisabled && zzajhVar.zzcuf() != null) {
                throw new AssertionError("Can't have a merge that is an overwrite");
            }
            if (!zzajqVar.isEmpty()) {
                zzajhVar = zzajh.zzcue().zzb(zzajqVar, zzajhVar);
            }
            zzaml zzcqy = zzalnVar.zzcyn().zzcqy();
            Map<zzalz, zzajh> zzcuh = zzajhVar.zzcuh();
            zzaln zzalnVar2 = zzalnVar;
            for (Map.Entry<zzalz, zzajh> entry : zzcuh.entrySet()) {
                zzalz key = entry.getKey();
                if (zzcqy.zzk(key)) {
                    zzalnVar2 = zza(zzalnVar2, new zzajq(key), entry.getValue().zzb(zzcqy.zzm(key)), zzakiVar, zzamlVar, z, zzalpVar);
                }
            }
            for (Map.Entry<zzalz, zzajh> entry2 : zzcuh.entrySet()) {
                zzalz key2 = entry2.getKey();
                boolean z2 = !zzalnVar.zzcyn().zzf(key2) && entry2.getValue().zzcuf() == null;
                if (!zzcqy.zzk(key2) && !z2) {
                    zzalnVar2 = zza(zzalnVar2, new zzajq(key2), entry2.getValue().zzb(zzcqy.zzm(key2)), zzakiVar, zzamlVar, z, zzalpVar);
                }
            }
            return zzalnVar2;
        }
        return zzalnVar;
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzaki zzakiVar, zzals.zza zzaVar, zzalp zzalpVar) {
        zzaml zza2;
        zzamg zza3;
        zzaml zzc;
        zzald zzcyl = zzalnVar.zzcyl();
        if (zzakiVar.zzv(zzajqVar) != null) {
            return zzalnVar;
        }
        if (!zzajqVar.isEmpty()) {
            zzalz zzcvj = zzajqVar.zzcvj();
            if (!zzcvj.zzczb()) {
                zzajq zzcvk = zzajqVar.zzcvk();
                if (zzcyl.zzf(zzcvj)) {
                    zzaml zza4 = zzakiVar.zza(zzajqVar, zzcyl.zzcqy(), zzalnVar.zzcyn().zzcqy());
                    zza2 = zza4 != null ? zzcyl.zzcqy().zzm(zzcvj).zzl(zzcvk, zza4) : zzcyl.zzcqy().zzm(zzcvj);
                } else {
                    zza2 = zzakiVar.zza(zzcvj, zzalnVar.zzcyn());
                }
                zza3 = zza2 != null ? this.bia.zza(zzcyl.zzcxj(), zzcvj, zza2, zzcvk, zzaVar, zzalpVar) : zzcyl.zzcxj();
            } else if (!$assertionsDisabled && zzajqVar.size() != 1) {
                throw new AssertionError("Can't have a priority with additional path components");
            } else {
                zzaml zza5 = zzakiVar.zza(zzajqVar, zzcyl.zzcqy(), zzalnVar.zzcyn().zzcqy());
                zza3 = zza5 != null ? this.bia.zza(zzcyl.zzcxj(), zza5) : zzcyl.zzcxj();
            }
        } else if (!$assertionsDisabled && !zzalnVar.zzcyn().zzcxh()) {
            throw new AssertionError("If change path is empty, we must have complete server data");
        } else {
            if (zzalnVar.zzcyn().zzcxi()) {
                zzaml zzcyo = zzalnVar.zzcyo();
                if (!(zzcyo instanceof zzama)) {
                    zzcyo = zzame.zzczq();
                }
                zzc = zzakiVar.zzd(zzcyo);
            } else {
                zzc = zzakiVar.zzc(zzalnVar.zzcyo());
            }
            zza3 = this.bia.zza(zzalnVar.zzcyl().zzcxj(), zzamg.zza(zzc, this.bia.zzcya()), zzalpVar);
        }
        return zzalnVar.zza(zza3, zzcyl.zzcxh() || zzajqVar.isEmpty(), this.bia.zzcyr());
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzakz<Boolean> zzakzVar, zzaki zzakiVar, zzaml zzamlVar, zzalp zzalpVar) {
        if (zzakiVar.zzv(zzajqVar) != null) {
            return zzalnVar;
        }
        boolean zzcxi = zzalnVar.zzcyn().zzcxi();
        zzald zzcyn = zzalnVar.zzcyn();
        if (zzakzVar.getValue() == null) {
            zzajh zzcue = zzajh.zzcue();
            Iterator<Map.Entry<zzajq, Boolean>> it = zzakzVar.iterator();
            while (it.hasNext()) {
                zzajq key = it.next().getKey();
                zzajq zzh = zzajqVar.zzh(key);
                if (zzcyn.zzam(zzh)) {
                    zzcue = zzcue.zze(key, zzcyn.zzcqy().zzao(zzh));
                }
            }
            return zza(zzalnVar, zzajqVar, zzcue, zzakiVar, zzamlVar, zzcxi, zzalpVar);
        } else if ((zzajqVar.isEmpty() && zzcyn.zzcxh()) || zzcyn.zzam(zzajqVar)) {
            return zza(zzalnVar, zzajqVar, zzcyn.zzcqy().zzao(zzajqVar), zzakiVar, zzamlVar, zzcxi, zzalpVar);
        } else {
            if (!zzajqVar.isEmpty()) {
                return zzalnVar;
            }
            zzajh zzcue2 = zzajh.zzcue();
            for (zzamk zzamkVar : zzcyn.zzcqy()) {
                zzcue2 = zzcue2.zza(zzamkVar.a(), zzamkVar.zzcqy());
            }
            return zza(zzalnVar, zzajqVar, zzcue2, zzakiVar, zzamlVar, zzcxi, zzalpVar);
        }
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzaml zzamlVar, zzaki zzakiVar, zzaml zzamlVar2, zzalp zzalpVar) {
        zzaml zzh;
        zzald zzcyl = zzalnVar.zzcyl();
        zzb zzbVar = new zzb(zzakiVar, zzalnVar, zzamlVar2);
        if (zzajqVar.isEmpty()) {
            return zzalnVar.zza(this.bia.zza(zzalnVar.zzcyl().zzcxj(), zzamg.zza(zzamlVar, this.bia.zzcya()), zzalpVar), true, this.bia.zzcyr());
        }
        zzalz zzcvj = zzajqVar.zzcvj();
        if (zzcvj.zzczb()) {
            return zzalnVar.zza(this.bia.zza(zzalnVar.zzcyl().zzcxj(), zzamlVar), zzcyl.zzcxh(), zzcyl.zzcxi());
        }
        zzajq zzcvk = zzajqVar.zzcvk();
        zzaml zzm = zzcyl.zzcqy().zzm(zzcvj);
        if (zzcvk.isEmpty()) {
            zzh = zzamlVar;
        } else {
            zzh = zzbVar.zzh(zzcvj);
            if (zzh == null) {
                zzh = zzame.zzczq();
            } else if (!zzcvk.zzcvm().zzczb() || !zzh.zzao(zzcvk.zzcvl()).isEmpty()) {
                zzh = zzh.zzl(zzcvk, zzamlVar);
            }
        }
        return !zzm.equals(zzh) ? zzalnVar.zza(this.bia.zza(zzcyl.zzcxj(), zzcvj, zzh, zzcvk, zzbVar, zzalpVar), zzcyl.zzcxh(), this.bia.zzcyr()) : zzalnVar;
    }

    private zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzaml zzamlVar, zzaki zzakiVar, zzaml zzamlVar2, boolean z, zzalp zzalpVar) {
        zzamg zza2;
        zzald zzcyn = zzalnVar.zzcyn();
        zzals zzcyq = z ? this.bia : this.bia.zzcyq();
        if (zzajqVar.isEmpty()) {
            zza2 = zzcyq.zza(zzcyn.zzcxj(), zzamg.zza(zzamlVar, zzcyq.zzcya()), null);
        } else if (!zzcyq.zzcyr() || zzcyn.zzcxi()) {
            zzalz zzcvj = zzajqVar.zzcvj();
            if (!zzcyn.zzam(zzajqVar) && zzajqVar.size() > 1) {
                return zzalnVar;
            }
            zzajq zzcvk = zzajqVar.zzcvk();
            zzaml zzl = zzcyn.zzcqy().zzm(zzcvj).zzl(zzcvk, zzamlVar);
            zza2 = zzcvj.zzczb() ? zzcyq.zza(zzcyn.zzcxj(), zzl) : zzcyq.zza(zzcyn.zzcxj(), zzcvj, zzl, zzcvk, bib, null);
        } else if (!$assertionsDisabled && zzajqVar.isEmpty()) {
            throw new AssertionError("An empty path should have been caught in the other branch");
        } else {
            zzalz zzcvj2 = zzajqVar.zzcvj();
            zza2 = zzcyq.zza(zzcyn.zzcxj(), zzcyn.zzcxj().zzh(zzcvj2, zzcyn.zzcqy().zzm(zzcvj2).zzl(zzajqVar.zzcvk(), zzamlVar)), null);
        }
        zzaln zzb2 = zzalnVar.zzb(zza2, zzcyn.zzcxh() || zzajqVar.isEmpty(), zzcyq.zzcyr());
        return zza(zzb2, zzajqVar, zzakiVar, new zzb(zzakiVar, zzb2, zzamlVar2), zzalpVar);
    }

    private void zza(zzaln zzalnVar, zzaln zzalnVar2, List<zzalf> list) {
        zzald zzcyl = zzalnVar2.zzcyl();
        if (zzcyl.zzcxh()) {
            boolean z = zzcyl.zzcqy().zzcze() || zzcyl.zzcqy().isEmpty();
            if (list.isEmpty() && zzalnVar.zzcyl().zzcxh() && ((!z || zzcyl.zzcqy().equals(zzalnVar.zzcym())) && zzcyl.zzcqy().zzczf().equals(zzalnVar.zzcym().zzczf()))) {
                return;
            }
            list.add(zzalf.zza(zzcyl.zzcxj()));
        }
    }

    private static boolean zza(zzaln zzalnVar, zzalz zzalzVar) {
        return zzalnVar.zzcyl().zzf(zzalzVar);
    }

    private zzaln zzb(zzaln zzalnVar, zzajq zzajqVar, zzaki zzakiVar, zzaml zzamlVar, zzalp zzalpVar) {
        zzald zzcyn = zzalnVar.zzcyn();
        return zza(zzalnVar.zzb(zzcyn.zzcxj(), zzcyn.zzcxh() || zzajqVar.isEmpty(), zzcyn.zzcxi()), zzajqVar, zzakiVar, bib, zzalpVar);
    }

    public zzaln zza(zzaln zzalnVar, zzajq zzajqVar, zzaki zzakiVar, zzaml zzamlVar, zzalp zzalpVar) {
        if (zzakiVar.zzv(zzajqVar) != null) {
            return zzalnVar;
        }
        zzb zzbVar = new zzb(zzakiVar, zzalnVar, zzamlVar);
        zzamg zzcxj = zzalnVar.zzcyl().zzcxj();
        if (zzajqVar.isEmpty() || zzajqVar.zzcvj().zzczb()) {
            zzcxj = this.bia.zza(zzcxj, zzamg.zza(zzalnVar.zzcyn().zzcxh() ? zzakiVar.zzc(zzalnVar.zzcyo()) : zzakiVar.zzd(zzalnVar.zzcyn().zzcqy()), this.bia.zzcya()), zzalpVar);
        } else {
            zzalz zzcvj = zzajqVar.zzcvj();
            zzaml zza2 = zzakiVar.zza(zzcvj, zzalnVar.zzcyn());
            if (zza2 == null && zzalnVar.zzcyn().zzf(zzcvj)) {
                zza2 = zzcxj.zzcqy().zzm(zzcvj);
            }
            if (zza2 != null) {
                zzcxj = this.bia.zza(zzcxj, zzcvj, zza2, zzajqVar.zzcvk(), zzbVar, zzalpVar);
            } else if (zza2 == null && zzalnVar.zzcyl().zzcqy().zzk(zzcvj)) {
                zzcxj = this.bia.zza(zzcxj, zzcvj, zzame.zzczq(), zzajqVar.zzcvk(), zzbVar, zzalpVar);
            }
            if (zzcxj.zzcqy().isEmpty() && zzalnVar.zzcyn().zzcxh()) {
                zzaml zzc = zzakiVar.zzc(zzalnVar.zzcyo());
                if (zzc.zzcze()) {
                    zzcxj = this.bia.zza(zzcxj, zzamg.zza(zzc, this.bia.zzcya()), zzalpVar);
                }
            }
        }
        return zzalnVar.zza(zzcxj, zzalnVar.zzcyn().zzcxh() || zzakiVar.zzv(zzajq.zzcvg()) != null, this.bia.zzcyr());
    }

    public zza zza(zzaln zzalnVar, zzakn zzaknVar, zzaki zzakiVar, zzaml zzamlVar) {
        zzaln zzb2;
        zzalp zzalpVar = new zzalp();
        switch (zzaknVar.zzcwq()) {
            case Overwrite:
                zzakp zzakpVar = (zzakp) zzaknVar;
                if (zzakpVar.zzcwp().zzcwr()) {
                    zzb2 = zza(zzalnVar, zzakpVar.zzcrc(), zzakpVar.zzcwv(), zzakiVar, zzamlVar, zzalpVar);
                    break;
                } else if (!$assertionsDisabled && !zzakpVar.zzcwp().zzcws()) {
                    throw new AssertionError();
                } else {
                    zzb2 = zza(zzalnVar, zzakpVar.zzcrc(), zzakpVar.zzcwv(), zzakiVar, zzamlVar, zzakpVar.zzcwp().zzcwt() || (zzalnVar.zzcyn().zzcxi() && !zzakpVar.zzcrc().isEmpty()), zzalpVar);
                    break;
                }
            case Merge:
                zzakm zzakmVar = (zzakm) zzaknVar;
                if (zzakmVar.zzcwp().zzcwr()) {
                    zzb2 = zza(zzalnVar, zzakmVar.zzcrc(), zzakmVar.zzcwo(), zzakiVar, zzamlVar, zzalpVar);
                    break;
                } else if (!$assertionsDisabled && !zzakmVar.zzcwp().zzcws()) {
                    throw new AssertionError();
                } else {
                    zzb2 = zza(zzalnVar, zzakmVar.zzcrc(), zzakmVar.zzcwo(), zzakiVar, zzamlVar, zzakmVar.zzcwp().zzcwt() || zzalnVar.zzcyn().zzcxi(), zzalpVar);
                    break;
                }
                break;
            case AckUserWrite:
                zzakk zzakkVar = (zzakk) zzaknVar;
                if (zzakkVar.zzcwn()) {
                    zzb2 = zza(zzalnVar, zzakkVar.zzcrc(), zzakiVar, zzamlVar, zzalpVar);
                    break;
                } else {
                    zzb2 = zza(zzalnVar, zzakkVar.zzcrc(), zzakkVar.zzcwm(), zzakiVar, zzamlVar, zzalpVar);
                    break;
                }
            case ListenComplete:
                zzb2 = zzb(zzalnVar, zzaknVar.zzcrc(), zzakiVar, zzamlVar, zzalpVar);
                break;
            default:
                String valueOf = String.valueOf(zzaknVar.zzcwq());
                throw new AssertionError(new StringBuilder(String.valueOf(valueOf).length() + 19).append("Unknown operation: ").append(valueOf).toString());
        }
        ArrayList arrayList = new ArrayList(zzalpVar.zzcyp());
        zza(zzalnVar, zzb2, arrayList);
        return new zza(zzb2, arrayList);
    }
}
