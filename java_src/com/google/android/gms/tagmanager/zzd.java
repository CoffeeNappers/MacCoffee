package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.tagmanager.DataLayer;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.Map;
/* loaded from: classes2.dex */
class zzd implements DataLayer.zzb {
    private final Context zzahs;

    public zzd(Context context) {
        this.zzahs = context;
    }

    @Override // com.google.android.gms.tagmanager.DataLayer.zzb
    public void zzaz(Map<String, Object> map) {
        String queryParameter;
        Object obj;
        Object obj2 = map.get("gtm.url");
        Object obj3 = (obj2 != null || (obj = map.get("gtm")) == null || !(obj instanceof Map)) ? obj2 : ((Map) obj).get("url");
        if (obj3 == null || !(obj3 instanceof String) || (queryParameter = Uri.parse((String) obj3).getQueryParameter(ArgKeys.REFERRER)) == null) {
            return;
        }
        zzbf.zzah(this.zzahs, queryParameter);
    }
}
