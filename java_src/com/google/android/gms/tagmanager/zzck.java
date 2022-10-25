package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzck extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.RANDOM.toString();
    private static final String aGt = com.google.android.gms.internal.zzah.MIN.toString();
    private static final String aGu = com.google.android.gms.internal.zzah.MAX.toString();

    public zzck() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        double d;
        double d2;
        zzaj.zza zzaVar = map.get(aGt);
        zzaj.zza zzaVar2 = map.get(aGu);
        if (zzaVar != null && zzaVar != zzdm.zzchm() && zzaVar2 != null && zzaVar2 != zzdm.zzchm()) {
            zzdl zzh = zzdm.zzh(zzaVar);
            zzdl zzh2 = zzdm.zzh(zzaVar2);
            if (zzh != zzdm.zzchk() && zzh2 != zzdm.zzchk()) {
                double doubleValue = zzh.doubleValue();
                d = zzh2.doubleValue();
                if (doubleValue <= d) {
                    d2 = doubleValue;
                    return zzdm.zzat(Long.valueOf(Math.round(((d - d2) * Math.random()) + d2)));
                }
            }
        }
        d = 2.147483647E9d;
        d2 = 0.0d;
        return zzdm.zzat(Long.valueOf(Math.round(((d - d2) * Math.random()) + d2)));
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
