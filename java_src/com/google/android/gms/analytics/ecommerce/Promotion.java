package com.google.android.gms.analytics.ecommerce;

import com.google.android.gms.analytics.zzg;
import com.google.android.gms.common.internal.zzaa;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class Promotion {
    public static final String ACTION_CLICK = "click";
    public static final String ACTION_VIEW = "view";
    Map<String, String> cB = new HashMap();

    void put(String str, String str2) {
        zzaa.zzb(str, "Name should be non-null");
        this.cB.put(str, str2);
    }

    public Promotion setCreative(String str) {
        put("cr", str);
        return this;
    }

    public Promotion setId(String str) {
        put("id", str);
        return this;
    }

    public Promotion setName(String str) {
        put("nm", str);
        return this;
    }

    public Promotion setPosition(String str) {
        put("ps", str);
        return this;
    }

    public String toString() {
        return zzg.zzar(this.cB);
    }

    public Map<String, String> zzep(String str) {
        HashMap hashMap = new HashMap();
        for (Map.Entry<String, String> entry : this.cB.entrySet()) {
            String valueOf = String.valueOf(str);
            String valueOf2 = String.valueOf(entry.getKey());
            hashMap.put(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf), entry.getValue());
        }
        return hashMap;
    }
}
