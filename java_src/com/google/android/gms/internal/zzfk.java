package com.google.android.gms.internal;

import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzfk implements zzfe {
    static final Map<String, Integer> zzbqv = com.google.android.gms.common.util.zzf.zza("resize", 1, "playVideo", 2, "storePicture", 3, "createCalendarEvent", 4, "setOrientationProperties", 5, "closeResizedAd", 6);
    private final com.google.android.gms.ads.internal.zze zzbqt;
    private final zzhq zzbqu;

    public zzfk(com.google.android.gms.ads.internal.zze zzeVar, zzhq zzhqVar) {
        this.zzbqt = zzeVar;
        this.zzbqu = zzhqVar;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        int intValue = zzbqv.get(map.get("a")).intValue();
        if (intValue != 5 && this.zzbqt != null && !this.zzbqt.zzfe()) {
            this.zzbqt.zzy(null);
            return;
        }
        switch (intValue) {
            case 1:
                this.zzbqu.execute(map);
                return;
            case 2:
            default:
                zzkx.zzdh("Unknown MRAID command called.");
                return;
            case 3:
                new zzhs(zzmdVar, map).execute();
                return;
            case 4:
                new zzhp(zzmdVar, map).execute();
                return;
            case 5:
                new zzhr(zzmdVar, map).execute();
                return;
            case 6:
                this.zzbqu.zzt(true);
                return;
        }
    }
}
