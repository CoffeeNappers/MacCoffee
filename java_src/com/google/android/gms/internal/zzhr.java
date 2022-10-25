package com.google.android.gms.internal;

import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzhr {
    private final zzmd zzbnz;
    private final boolean zzbyr;
    private final String zzbys;

    public zzhr(zzmd zzmdVar, Map<String, String> map) {
        this.zzbnz = zzmdVar;
        this.zzbys = map.get("forceOrientation");
        if (map.containsKey("allowOrientationChange")) {
            this.zzbyr = Boolean.parseBoolean(map.get("allowOrientationChange"));
        } else {
            this.zzbyr = true;
        }
    }

    public void execute() {
        if (this.zzbnz == null) {
            zzkx.zzdi("AdWebView is null");
        } else {
            this.zzbnz.setRequestedOrientation("portrait".equalsIgnoreCase(this.zzbys) ? com.google.android.gms.ads.internal.zzu.zzgo().zzvx() : "landscape".equalsIgnoreCase(this.zzbys) ? com.google.android.gms.ads.internal.zzu.zzgo().zzvw() : this.zzbyr ? -1 : com.google.android.gms.ads.internal.zzu.zzgo().zzvy());
        }
    }
}
