package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
class zzfp implements zzfe {
    private int zzh(Map<String, String> map) throws NullPointerException, NumberFormatException {
        int parseInt = Integer.parseInt(map.get("playbackState"));
        if (parseInt < 0 || 3 < parseInt) {
            return 0;
        }
        return parseInt;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        zzmi zzmiVar;
        if (!zzdr.zzbhe.get().booleanValue()) {
            return;
        }
        zzmi zzxn = zzmdVar.zzxn();
        if (zzxn == null) {
            try {
                zzmi zzmiVar2 = new zzmi(zzmdVar, Float.parseFloat(map.get("duration")));
                zzmdVar.zza(zzmiVar2);
                zzmiVar = zzmiVar2;
            } catch (NullPointerException | NumberFormatException e) {
                zzkx.zzb("Unable to parse videoMeta message.", e);
                com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "VideoMetaGmsgHandler.onGmsg");
                return;
            }
        } else {
            zzmiVar = zzxn;
        }
        boolean equals = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("muted"));
        float parseFloat = Float.parseFloat(map.get("currentTime"));
        int zzh = zzh(map);
        String str = map.get("aspectRatio");
        float parseFloat2 = TextUtils.isEmpty(str) ? 0.0f : Float.parseFloat(str);
        if (zzkx.zzbi(3)) {
            zzkx.zzdg(new StringBuilder(String.valueOf(str).length() + 79).append("Video Meta GMSG: isMuted : ").append(equals).append(" , playbackState : ").append(zzh).append(" , aspectRatio : ").append(str).toString());
        }
        zzmiVar.zza(parseFloat, zzh, equals, parseFloat2);
    }
}
