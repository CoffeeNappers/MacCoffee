package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzamg implements Iterable<zzamk> {
    private static final zzaij<zzamk> biR = new zzaij<>(Collections.emptyList(), null);
    private final zzamf bhC;
    private final zzaml biS;
    private zzaij<zzamk> biT;

    private zzamg(zzaml zzamlVar, zzamf zzamfVar) {
        this.bhC = zzamfVar;
        this.biS = zzamlVar;
        this.biT = null;
    }

    private zzamg(zzaml zzamlVar, zzamf zzamfVar, zzaij<zzamk> zzaijVar) {
        this.bhC = zzamfVar;
        this.biS = zzamlVar;
        this.biT = zzaijVar;
    }

    public static zzamg zza(zzaml zzamlVar, zzamf zzamfVar) {
        return new zzamg(zzamlVar, zzamfVar);
    }

    private void zzczu() {
        if (this.biT == null) {
            if (this.bhC.equals(zzamh.zzczx())) {
                this.biT = biR;
                return;
            }
            ArrayList arrayList = new ArrayList();
            boolean z = false;
            for (zzamk zzamkVar : this.biS) {
                z = z || this.bhC.zzm(zzamkVar.zzcqy());
                arrayList.add(new zzamk(zzamkVar.a(), zzamkVar.zzcqy()));
            }
            if (z) {
                this.biT = new zzaij<>(arrayList, this.bhC);
            } else {
                this.biT = biR;
            }
        }
    }

    public static zzamg zzn(zzaml zzamlVar) {
        return new zzamg(zzamlVar, zzamo.b());
    }

    @Override // java.lang.Iterable
    public Iterator<zzamk> iterator() {
        zzczu();
        return this.biT == biR ? this.biS.iterator() : this.biT.iterator();
    }

    public zzalz zza(zzalz zzalzVar, zzaml zzamlVar, zzamf zzamfVar) {
        if (this.bhC.equals(zzamh.zzczx()) || this.bhC.equals(zzamfVar)) {
            zzczu();
            if (this.biT == biR) {
                return this.biS.zzl(zzalzVar);
            }
            zzamk zzbn = this.biT.zzbn(new zzamk(zzalzVar, zzamlVar));
            if (zzbn == null) {
                return null;
            }
            return zzbn.a();
        }
        throw new IllegalArgumentException("Index not available in IndexedNode!");
    }

    public boolean zzb(zzamf zzamfVar) {
        return this.bhC.equals(zzamfVar);
    }

    public zzaml zzcqy() {
        return this.biS;
    }

    public Iterator<zzamk> zzcrl() {
        zzczu();
        return this.biT == biR ? this.biS.zzcrl() : this.biT.zzcrl();
    }

    public zzamk zzczv() {
        if (!(this.biS instanceof zzama)) {
            return null;
        }
        zzczu();
        if (this.biT != biR) {
            return this.biT.zzcrn();
        }
        zzalz zzczg = ((zzama) this.biS).zzczg();
        return new zzamk(zzczg, this.biS.zzm(zzczg));
    }

    public zzamk zzczw() {
        if (!(this.biS instanceof zzama)) {
            return null;
        }
        zzczu();
        if (this.biT != biR) {
            return this.biT.zzcro();
        }
        zzalz zzczh = ((zzama) this.biS).zzczh();
        return new zzamk(zzczh, this.biS.zzm(zzczh));
    }

    public zzamg zzh(zzalz zzalzVar, zzaml zzamlVar) {
        zzaml zze = this.biS.zze(zzalzVar, zzamlVar);
        if (this.biT != biR || this.bhC.zzm(zzamlVar)) {
            if (this.biT == null || this.biT == biR) {
                return new zzamg(zze, this.bhC, null);
            }
            zzaij<zzamk> zzbl = this.biT.zzbl(new zzamk(zzalzVar, this.biS.zzm(zzalzVar)));
            if (!zzamlVar.isEmpty()) {
                zzbl = zzbl.zzbm(new zzamk(zzalzVar, zzamlVar));
            }
            return new zzamg(zze, this.bhC, zzbl);
        }
        return new zzamg(zze, this.bhC, biR);
    }

    public zzamg zzo(zzaml zzamlVar) {
        return new zzamg(this.biS.zzg(zzamlVar), this.bhC, this.biT);
    }
}
