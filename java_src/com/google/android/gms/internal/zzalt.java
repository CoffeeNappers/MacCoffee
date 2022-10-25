package com.google.android.gms.internal;

import com.google.android.gms.internal.zzals;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzalt implements zzals {
    private final zzamf bhC;
    private final zzalq bii;
    private final zzamk bij;
    private final zzamk bik;

    public zzalt(zzalk zzalkVar) {
        this.bii = new zzalq(zzalkVar.zzcya());
        this.bhC = zzalkVar.zzcya();
        this.bij = zzd(zzalkVar);
        this.bik = zze(zzalkVar);
    }

    private static zzamk zzd(zzalk zzalkVar) {
        if (zzalkVar.zzcxs()) {
            return zzalkVar.zzcya().zzg(zzalkVar.zzcxu(), zzalkVar.zzcxt());
        }
        return zzalkVar.zzcya().zzczr();
    }

    private static zzamk zze(zzalk zzalkVar) {
        if (zzalkVar.zzcxv()) {
            return zzalkVar.zzcya().zzg(zzalkVar.zzcxx(), zzalkVar.zzcxw());
        }
        return zzalkVar.zzcya().zzczs();
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzalz zzalzVar, zzaml zzamlVar, zzajq zzajqVar, zzals.zza zzaVar, zzalp zzalpVar) {
        return this.bii.zza(zzamgVar, zzalzVar, !zza(new zzamk(zzalzVar, zzamlVar)) ? zzame.zzczq() : zzamlVar, zzajqVar, zzaVar, zzalpVar);
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzamg zzamgVar2, zzalp zzalpVar) {
        zzamg zzamgVar3;
        if (!zzamgVar2.zzcqy().zzcze()) {
            zzamg zzo = zzamgVar2.zzo(zzamp.c());
            Iterator<zzamk> it = zzamgVar2.iterator();
            while (true) {
                zzamgVar3 = zzo;
                if (!it.hasNext()) {
                    break;
                }
                zzamk next = it.next();
                zzo = !zza(next) ? zzamgVar3.zzh(next.a(), zzame.zzczq()) : zzamgVar3;
            }
        } else {
            zzamgVar3 = zzamg.zza(zzame.zzczq(), this.bhC);
        }
        return this.bii.zza(zzamgVar, zzamgVar3, zzalpVar);
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamg zza(zzamg zzamgVar, zzaml zzamlVar) {
        return zzamgVar;
    }

    public boolean zza(zzamk zzamkVar) {
        return this.bhC.compare(zzcys(), zzamkVar) <= 0 && this.bhC.compare(zzamkVar, zzcyt()) <= 0;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzamf zzcya() {
        return this.bhC;
    }

    @Override // com.google.android.gms.internal.zzals
    public zzals zzcyq() {
        return this.bii;
    }

    @Override // com.google.android.gms.internal.zzals
    public boolean zzcyr() {
        return true;
    }

    public zzamk zzcys() {
        return this.bij;
    }

    public zzamk zzcyt() {
        return this.bik;
    }
}
