package com.google.android.gms.internal;

import com.google.android.gms.internal.zzals;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzalr implements zzals {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzamf bhC;
    private final zzalt big;
    private final boolean bih;
    private final int limit;

    static {
        $assertionsDisabled = !zzalr.class.desiredAssertionStatus();
    }

    public zzalr(zzalk zzalkVar) {
        this.big = new zzalt(zzalkVar);
        this.bhC = zzalkVar.zzcya();
        this.limit = zzalkVar.getLimit();
        this.bih = !zzalkVar.zzcyc();
    }

    private zzamg zza(zzamg zzamgVar, zzalz zzalzVar, zzaml zzamlVar, zzals.zza zzaVar, zzalp zzalpVar) {
        if ($assertionsDisabled || zzamgVar.zzcqy().getChildCount() == this.limit) {
            zzamk zzamkVar = new zzamk(zzalzVar, zzamlVar);
            zzamk zzczv = this.bih ? zzamgVar.zzczv() : zzamgVar.zzczw();
            boolean zza = this.big.zza(zzamkVar);
            if (!zzamgVar.zzcqy().zzk(zzalzVar)) {
                if (zzamlVar.isEmpty() || !zza || this.bhC.zza(zzczv, zzamkVar, this.bih) < 0) {
                    return zzamgVar;
                }
                if (zzalpVar != null) {
                    zzalpVar.zza(zzalf.zzd(zzczv.a(), zzczv.zzcqy()));
                    zzalpVar.zza(zzalf.zzc(zzalzVar, zzamlVar));
                }
                return zzamgVar.zzh(zzalzVar, zzamlVar).zzh(zzczv.a(), zzame.zzczq());
            }
            zzaml zzm = zzamgVar.zzcqy().zzm(zzalzVar);
            zzamk zza2 = zzaVar.zza(this.bhC, zzczv, this.bih);
            while (zza2 != null && (zza2.a().equals(zzalzVar) || zzamgVar.zzcqy().zzk(zza2.a()))) {
                zza2 = zzaVar.zza(this.bhC, zza2, this.bih);
            }
            if (zza && !zzamlVar.isEmpty() && (zza2 == null ? 1 : this.bhC.zza(zza2, zzamkVar, this.bih)) >= 0) {
                if (zzalpVar != null) {
                    zzalpVar.zza(zzalf.zza(zzalzVar, zzamlVar, zzm));
                }
                return zzamgVar.zzh(zzalzVar, zzamlVar);
            }
            if (zzalpVar != null) {
                zzalpVar.zza(zzalf.zzd(zzalzVar, zzm));
            }
            zzamg zzh = zzamgVar.zzh(zzalzVar, zzame.zzczq());
            if (!(zza2 != null && this.big.zza(zza2))) {
                return zzh;
            }
            if (zzalpVar != null) {
                zzalpVar.zza(zzalf.zzc(zza2.a(), zza2.zzcqy()));
            }
            return zzh.zzh(zza2.a(), zza2.zzcqy());
        }
        throw new AssertionError();
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzalz zzalzVar, zzaml zzamlVar, zzajq zzajqVar, zzals.zza zzaVar, zzalp zzalpVar) {
        zzaml zzczq = !this.big.zza(new zzamk(zzalzVar, zzamlVar)) ? zzame.zzczq() : zzamlVar;
        return zzamgVar.zzcqy().zzm(zzalzVar).equals(zzczq) ? zzamgVar : zzamgVar.zzcqy().getChildCount() < this.limit ? this.big.zzcyq().zza(zzamgVar, zzalzVar, zzczq, zzajqVar, zzaVar, zzalpVar) : zza(zzamgVar, zzalzVar, zzczq, zzaVar, zzalpVar);
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzamg zzamgVar2, zzalp zzalpVar) {
        zzamg zza;
        zzamk zzcyt;
        zzamk zzamkVar;
        int i;
        Iterator<zzamk> it;
        int i2;
        if (zzamgVar2.zzcqy().zzcze() || zzamgVar2.zzcqy().isEmpty()) {
            zza = zzamg.zza(zzame.zzczq(), this.bhC);
        } else {
            zzamg zzo = zzamgVar2.zzo(zzamp.c());
            if (this.bih) {
                Iterator<zzamk> zzcrl = zzamgVar2.zzcrl();
                zzamkVar = this.big.zzcyt();
                zzcyt = this.big.zzcys();
                it = zzcrl;
                i = -1;
            } else {
                Iterator<zzamk> it2 = zzamgVar2.iterator();
                zzamk zzcys = this.big.zzcys();
                zzcyt = this.big.zzcyt();
                zzamkVar = zzcys;
                i = 1;
                it = it2;
            }
            int i3 = 0;
            zza = zzo;
            boolean z = false;
            while (it.hasNext()) {
                zzamk next = it.next();
                if (!z && this.bhC.compare(zzamkVar, next) * i <= 0) {
                    z = true;
                }
                if (z && i3 < this.limit && this.bhC.compare(next, zzcyt) * i <= 0) {
                    i2 = i3 + 1;
                } else {
                    zza = zza.zzh(next.a(), zzame.zzczq());
                    i2 = i3;
                }
                zza = zza;
                i3 = i2;
            }
        }
        return this.big.zzcyq().zza(zzamgVar, zza, zzalpVar);
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzaml zzamlVar) {
        return zzamgVar;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamf zzcya() {
        return this.bhC;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzals zzcyq() {
        return this.big.zzcyq();
    }

    @Override // com.google.android.gms.internal.zzals
    public boolean zzcyr() {
        return true;
    }
}
