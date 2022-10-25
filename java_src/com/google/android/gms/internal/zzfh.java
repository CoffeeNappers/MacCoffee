package com.google.android.gms.internal;

import com.facebook.appevents.AppEventsConstants;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzfh implements zzfe {
    private final zzfi zzbqr;

    public zzfh(zzfi zzfiVar) {
        this.zzbqr = zzfiVar;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        float f;
        boolean equals = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("transparentBackground"));
        boolean equals2 = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("blur"));
        try {
        } catch (NumberFormatException e) {
            zzkx.zzb("Fail to parse float", e);
        }
        if (map.get("blurRadius") != null) {
            f = Float.parseFloat(map.get("blurRadius"));
            this.zzbqr.zzg(equals);
            this.zzbqr.zza(equals2, f);
        }
        f = 0.0f;
        this.zzbqr.zzg(equals);
        this.zzbqr.zza(equals2, f);
    }
}
