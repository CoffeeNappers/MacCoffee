package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzakr implements zzaku {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzalw aZR;
    private final zzaky bgA;
    private final zzakq bgB;
    private long bgC;
    private final zzakv bgz;

    static {
        $assertionsDisabled = !zzakr.class.desiredAssertionStatus();
    }

    public zzakr(zzajj zzajjVar, zzakv zzakvVar, zzakq zzakqVar) {
        this(zzajjVar, zzakvVar, zzakqVar, new zzang());
    }

    public zzakr(zzajj zzajjVar, zzakv zzakvVar, zzakq zzakqVar, zzanf zzanfVar) {
        this.bgC = 0L;
        this.bgz = zzakvVar;
        this.aZR = zzajjVar.zzss("Persistence");
        this.bgA = new zzaky(this.bgz, this.aZR, zzanfVar);
        this.bgB = zzakqVar;
    }

    private void zzcwy() {
        this.bgC++;
        if (this.bgB.zzcl(this.bgC)) {
            if (this.aZR.zzcyu()) {
                this.aZR.zzi("Reached prune check threshold.", new Object[0]);
            }
            this.bgC = 0L;
            boolean z = true;
            long zzcrf = this.bgz.zzcrf();
            if (this.aZR.zzcyu()) {
                this.aZR.zzi(new StringBuilder(32).append("Cache size: ").append(zzcrf).toString(), new Object[0]);
            }
            while (z && this.bgB.zzi(zzcrf, this.bgA.zzcxc())) {
                zzakw zza = this.bgA.zza(this.bgB);
                if (zza.zzcwz()) {
                    this.bgz.zza(zzajq.zzcvg(), zza);
                } else {
                    z = false;
                }
                zzcrf = this.bgz.zzcrf();
                if (this.aZR.zzcyu()) {
                    this.aZR.zzi(new StringBuilder(44).append("Cache size after prune: ").append(zzcrf).toString(), new Object[0]);
                }
            }
        }
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzajq zzajqVar, zzajh zzajhVar, long j) {
        this.bgz.zza(zzajqVar, zzajhVar, j);
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzajq zzajqVar, zzaml zzamlVar, long j) {
        this.bgz.zza(zzajqVar, zzamlVar, j);
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, zzaml zzamlVar) {
        if (zzallVar.zzcye()) {
            this.bgz.zza(zzallVar.zzcrc(), zzamlVar);
        } else {
            this.bgz.zzb(zzallVar.zzcrc(), zzamlVar);
        }
        zzi(zzallVar);
        zzcwy();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, Set<zzalz> set) {
        if ($assertionsDisabled || !zzallVar.zzcye()) {
            zzakx zzl = this.bgA.zzl(zzallVar);
            if (!$assertionsDisabled && (zzl == null || !zzl.bgO)) {
                throw new AssertionError("We only expect tracked keys for currently-active queries.");
            }
            this.bgz.zza(zzl.id, set);
            return;
        }
        throw new AssertionError("We should only track keys for filtered queries.");
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, Set<zzalz> set, Set<zzalz> set2) {
        if ($assertionsDisabled || !zzallVar.zzcye()) {
            zzakx zzl = this.bgA.zzl(zzallVar);
            if (!$assertionsDisabled && (zzl == null || !zzl.bgO)) {
                throw new AssertionError("We only expect tracked keys for currently-active queries.");
            }
            this.bgz.zza(zzl.id, set, set2);
            return;
        }
        throw new AssertionError("We should only track keys for filtered queries.");
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzby(long j) {
        this.bgz.zzby(j);
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzc(zzajq zzajqVar, zzajh zzajhVar) {
        Iterator<Map.Entry<zzajq, zzaml>> it = zzajhVar.iterator();
        while (it.hasNext()) {
            Map.Entry<zzajq, zzaml> next = it.next();
            zzk(zzajqVar.zzh(next.getKey()), next.getValue());
        }
    }

    @Override // com.google.android.gms.internal.zzaku
    public List<zzake> zzcre() {
        return this.bgz.zzcre();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzcrh() {
        this.bgz.zzcrh();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzd(zzajq zzajqVar, zzajh zzajhVar) {
        this.bgz.zza(zzajqVar, zzajhVar);
        zzcwy();
    }

    @Override // com.google.android.gms.internal.zzaku
    public zzald zzf(zzall zzallVar) {
        Set<zzalz> zzab;
        boolean z;
        if (this.bgA.zzo(zzallVar)) {
            zzakx zzl = this.bgA.zzl(zzallVar);
            zzab = (zzallVar.zzcye() || zzl == null || !zzl.bgN) ? null : this.bgz.zzcb(zzl.id);
            z = true;
        } else {
            zzab = this.bgA.zzab(zzallVar.zzcrc());
            z = false;
        }
        zzaml zza = this.bgz.zza(zzallVar.zzcrc());
        if (zzab != null) {
            zzame zzczq = zzame.zzczq();
            for (zzalz zzalzVar : zzab) {
                zzczq = zzczq.zze(zzalzVar, zza.zzm(zzalzVar));
            }
            return new zzald(zzamg.zza(zzczq, zzallVar.zzcya()), z, true);
        }
        return new zzald(zzamg.zza(zza, zzallVar.zzcya()), true, false);
    }

    @Override // com.google.android.gms.internal.zzaku
    public <T> T zzf(Callable<T> callable) {
        this.bgz.beginTransaction();
        try {
            T call = callable.call();
            this.bgz.setTransactionSuccessful();
            return call;
        } finally {
        }
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzg(zzall zzallVar) {
        this.bgA.zzg(zzallVar);
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzh(zzall zzallVar) {
        this.bgA.zzh(zzallVar);
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzi(zzall zzallVar) {
        if (zzallVar.zzcye()) {
            this.bgA.zzaa(zzallVar.zzcrc());
        } else {
            this.bgA.zzn(zzallVar);
        }
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzk(zzajq zzajqVar, zzaml zzamlVar) {
        if (!this.bgA.zzad(zzajqVar)) {
            this.bgz.zza(zzajqVar, zzamlVar);
            this.bgA.zzac(zzajqVar);
        }
    }
}
