package com.google.android.gms.internal;

import java.util.Map;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public class zzft implements zzfe {
    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        int i;
        zzfr zzhj = com.google.android.gms.ads.internal.zzu.zzhj();
        if (map.containsKey("abort")) {
            if (zzhj.zze(zzmdVar)) {
                return;
            }
            zzkx.zzdi("Precache abort but no preload task running.");
            return;
        }
        String str = map.get("src");
        if (str == null) {
            zzkx.zzdi("Precache video action is missing the src parameter.");
            return;
        }
        try {
            i = Integer.parseInt(map.get("player"));
        } catch (NumberFormatException e) {
            i = 0;
        }
        String str2 = map.containsKey("mimetype") ? map.get("mimetype") : "";
        if (zzhj.zzf(zzmdVar)) {
            zzkx.zzdi("Precache task already running.");
            return;
        }
        com.google.android.gms.common.internal.zzc.zzu(zzmdVar.zzec());
        Future future = (Future) new zzfq(zzmdVar, zzmdVar.zzec().zzamp.zza(zzmdVar, i, str2), str).zzrz();
    }
}
