package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakz;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzajh implements Iterable<Map.Entry<zzajq, zzaml>> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzajh bda;
    private final zzakz<zzaml> bdb;

    static {
        $assertionsDisabled = !zzajh.class.desiredAssertionStatus();
        bda = new zzajh(new zzakz(null));
    }

    private zzajh(zzakz<zzaml> zzakzVar) {
        this.bdb = zzakzVar;
    }

    private zzaml zza(zzajq zzajqVar, zzakz<zzaml> zzakzVar, zzaml zzamlVar) {
        zzaml zza;
        zzaml zzamlVar2;
        if (zzakzVar.getValue() != null) {
            return zzamlVar.zzl(zzajqVar, zzakzVar.getValue());
        }
        zzaml zzamlVar3 = null;
        Iterator<Map.Entry<zzalz, zzakz<zzaml>>> it = zzakzVar.zzcxf().iterator();
        zzaml zzamlVar4 = zzamlVar;
        while (it.hasNext()) {
            Map.Entry<zzalz, zzakz<zzaml>> next = it.next();
            zzakz<zzaml> value = next.getValue();
            zzalz key = next.getKey();
            if (!key.zzczb()) {
                zza = zza(zzajqVar.zza(key), value, zzamlVar4);
                zzamlVar2 = zzamlVar3;
            } else if (!$assertionsDisabled && value.getValue() == null) {
                throw new AssertionError("Priority writes must always be leaf nodes");
            } else {
                zzamlVar2 = value.getValue();
                zza = zzamlVar4;
            }
            zzamlVar3 = zzamlVar2;
            zzamlVar4 = zza;
        }
        return (zzamlVar4.zzao(zzajqVar).isEmpty() || zzamlVar3 == null) ? zzamlVar4 : zzamlVar4.zzl(zzajqVar.zza(zzalz.zzcyz()), zzamlVar3);
    }

    public static zzajh zzca(Map<String, Object> map) {
        zzakz zzcxe = zzakz.zzcxe();
        Iterator<Map.Entry<String, Object>> it = map.entrySet().iterator();
        while (true) {
            zzakz zzakzVar = zzcxe;
            if (it.hasNext()) {
                Map.Entry<String, Object> next = it.next();
                zzcxe = zzakzVar.zza(new zzajq(next.getKey()), new zzakz(zzamm.zzbt(next.getValue())));
            } else {
                return new zzajh(zzakzVar);
            }
        }
    }

    public static zzajh zzcb(Map<zzajq, zzaml> map) {
        zzakz zzcxe = zzakz.zzcxe();
        Iterator<Map.Entry<zzajq, zzaml>> it = map.entrySet().iterator();
        while (true) {
            zzakz zzakzVar = zzcxe;
            if (it.hasNext()) {
                Map.Entry<zzajq, zzaml> next = it.next();
                zzcxe = zzakzVar.zza(next.getKey(), new zzakz(next.getValue()));
            } else {
                return new zzajh(zzakzVar);
            }
        }
    }

    public static zzajh zzcue() {
        return bda;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj != null && obj.getClass() == getClass()) {
            return ((zzajh) obj).zzda(true).equals(zzda(true));
        }
        return false;
    }

    public int hashCode() {
        return zzda(true).hashCode();
    }

    public boolean isEmpty() {
        return this.bdb.isEmpty();
    }

    @Override // java.lang.Iterable
    public Iterator<Map.Entry<zzajq, zzaml>> iterator() {
        return this.bdb.iterator();
    }

    public String toString() {
        String valueOf = String.valueOf(zzda(true).toString());
        return new StringBuilder(String.valueOf(valueOf).length() + 15).append("CompoundWrite{").append(valueOf).append("}").toString();
    }

    public zzajh zza(zzalz zzalzVar, zzaml zzamlVar) {
        return zze(new zzajq(zzalzVar), zzamlVar);
    }

    public zzajh zzb(final zzajq zzajqVar, zzajh zzajhVar) {
        return (zzajh) zzajhVar.bdb.zzb((zzakz<zzaml>) this, new zzakz.zza<zzaml, zzajh>() { // from class: com.google.android.gms.internal.zzajh.1
            @Override // com.google.android.gms.internal.zzakz.zza
            public zzajh zza(zzajq zzajqVar2, zzaml zzamlVar, zzajh zzajhVar2) {
                return zzajhVar2.zze(zzajqVar.zzh(zzajqVar2), zzamlVar);
            }
        });
    }

    public zzaml zzb(zzaml zzamlVar) {
        return zza(zzajq.zzcvg(), this.bdb, zzamlVar);
    }

    public zzaml zzcuf() {
        return this.bdb.getValue();
    }

    public List<zzamk> zzcug() {
        ArrayList arrayList = new ArrayList();
        if (this.bdb.getValue() != null) {
            for (zzamk zzamkVar : this.bdb.getValue()) {
                arrayList.add(new zzamk(zzamkVar.a(), zzamkVar.zzcqy()));
            }
        } else {
            Iterator<Map.Entry<zzalz, zzakz<zzaml>>> it = this.bdb.zzcxf().iterator();
            while (it.hasNext()) {
                Map.Entry<zzalz, zzakz<zzaml>> next = it.next();
                zzakz<zzaml> value = next.getValue();
                if (value.getValue() != null) {
                    arrayList.add(new zzamk(next.getKey(), value.getValue()));
                }
            }
        }
        return arrayList;
    }

    public Map<zzalz, zzajh> zzcuh() {
        HashMap hashMap = new HashMap();
        Iterator<Map.Entry<zzalz, zzakz<zzaml>>> it = this.bdb.zzcxf().iterator();
        while (it.hasNext()) {
            Map.Entry<zzalz, zzakz<zzaml>> next = it.next();
            hashMap.put(next.getKey(), new zzajh(next.getValue()));
        }
        return hashMap;
    }

    public zzajh zzd(zzajq zzajqVar) {
        return zzajqVar.isEmpty() ? bda : new zzajh(this.bdb.zza(zzajqVar, zzakz.zzcxe()));
    }

    public Map<String, Object> zzda(final boolean z) {
        final HashMap hashMap = new HashMap();
        this.bdb.zza(new zzakz.zza<zzaml, Void>() { // from class: com.google.android.gms.internal.zzajh.2
            @Override // com.google.android.gms.internal.zzakz.zza
            public Void zza(zzajq zzajqVar, zzaml zzamlVar, Void r6) {
                hashMap.put(zzajqVar.zzcvh(), zzamlVar.getValue(z));
                return null;
            }
        });
        return hashMap;
    }

    public zzajh zze(zzajq zzajqVar, zzaml zzamlVar) {
        if (zzajqVar.isEmpty()) {
            return new zzajh(new zzakz(zzamlVar));
        }
        zzajq zzag = this.bdb.zzag(zzajqVar);
        if (zzag == null) {
            return new zzajh(this.bdb.zza(zzajqVar, new zzakz<>(zzamlVar)));
        }
        zzajq zza = zzajq.zza(zzag, zzajqVar);
        zzaml zzak = this.bdb.zzak(zzag);
        zzalz zzcvm = zza.zzcvm();
        if (zzcvm != null && zzcvm.zzczb() && zzak.zzao(zza.zzcvl()).isEmpty()) {
            return this;
        }
        return new zzajh(this.bdb.zzb(zzag, (zzajq) zzak.zzl(zza, zzamlVar)));
    }

    public boolean zze(zzajq zzajqVar) {
        return zzf(zzajqVar) != null;
    }

    public zzaml zzf(zzajq zzajqVar) {
        zzajq zzag = this.bdb.zzag(zzajqVar);
        if (zzag != null) {
            return this.bdb.zzak(zzag).zzao(zzajq.zza(zzag, zzajqVar));
        }
        return null;
    }

    public zzajh zzg(zzajq zzajqVar) {
        if (zzajqVar.isEmpty()) {
            return this;
        }
        zzaml zzf = zzf(zzajqVar);
        return zzf != null ? new zzajh(new zzakz(zzf)) : new zzajh(this.bdb.zzai(zzajqVar));
    }
}
