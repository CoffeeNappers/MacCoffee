package com.google.android.gms.internal;

import com.vkontakte.android.data.UserNotification;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public final class zzez implements zzfe {
    private final zzfa zzbpi;

    public zzez(zzfa zzfaVar) {
        this.zzbpi = zzfaVar;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("name");
        if (str == null) {
            zzkx.zzdi("App event with no name parameter.");
        } else {
            this.zzbpi.onAppEvent(str, map.get(UserNotification.LAYOUT_NEWSFEED_INFO));
        }
    }
}
