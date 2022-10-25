package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzaj;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
class zzbh {
    private static zzaj.zza zzam(Object obj) throws JSONException {
        return zzdm.zzat(zzan(obj));
    }

    static Object zzan(Object obj) throws JSONException {
        if (obj instanceof JSONArray) {
            throw new RuntimeException("JSONArrays are not supported");
        }
        if (JSONObject.NULL.equals(obj)) {
            throw new RuntimeException("JSON nulls are not supported");
        }
        if (!(obj instanceof JSONObject)) {
            return obj;
        }
        JSONObject jSONObject = (JSONObject) obj;
        HashMap hashMap = new HashMap();
        Iterator<String> keys = jSONObject.keys();
        while (keys.hasNext()) {
            String next = keys.next();
            hashMap.put(next, zzan(jSONObject.get(next)));
        }
        return hashMap;
    }

    public static zzafw.zzc zzpm(String str) throws JSONException {
        zzaj.zza zzam = zzam(new JSONObject(str));
        zzafw.zzd zzckw = zzafw.zzc.zzckw();
        for (int i = 0; i < zzam.zzxz.length; i++) {
            zzckw.zzc(zzafw.zza.zzcku().zzb(com.google.android.gms.internal.zzah.INSTANCE_NAME.toString(), zzam.zzxz[i]).zzb(com.google.android.gms.internal.zzah.FUNCTION.toString(), zzdm.zzpx(zzn.zzcdw())).zzb(zzn.zzcdx(), zzam.zzya[i]).zzckv());
        }
        return zzckw.zzcky();
    }
}
