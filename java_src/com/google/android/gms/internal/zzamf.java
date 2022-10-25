package com.google.android.gms.internal;

import java.util.Comparator;
/* loaded from: classes2.dex */
public abstract class zzamf implements Comparator<zzamk> {
    public static zzamf zzsy(String str) {
        if (str.equals(".value")) {
            return zzams.d();
        }
        if (str.equals(".key")) {
            return zzamh.zzczx();
        }
        if (!str.equals(".priority")) {
            return new zzamn(new zzajq(str));
        }
        throw new IllegalStateException("queryDefinition shouldn't ever be .priority since it's the default");
    }

    public int zza(zzamk zzamkVar, zzamk zzamkVar2, boolean z) {
        return z ? compare(zzamkVar2, zzamkVar) : compare(zzamkVar, zzamkVar2);
    }

    public boolean zza(zzaml zzamlVar, zzaml zzamlVar2) {
        return compare(new zzamk(zzalz.zzcyx(), zzamlVar), new zzamk(zzalz.zzcyx(), zzamlVar2)) != 0;
    }

    public zzamk zzczr() {
        return zzamk.zzczy();
    }

    public abstract zzamk zzczs();

    public abstract String zzczt();

    public abstract zzamk zzg(zzalz zzalzVar, zzaml zzamlVar);

    public abstract boolean zzm(zzaml zzamlVar);
}
