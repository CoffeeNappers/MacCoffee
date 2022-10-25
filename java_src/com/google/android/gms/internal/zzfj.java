package com.google.android.gms.internal;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzfj implements zzfe {
    final HashMap<String, zzlq<JSONObject>> zzbqs = new HashMap<>();

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        zzh(map.get("request_id"), map.get("fetched_ad"));
    }

    public Future<JSONObject> zzbd(String str) {
        zzlq<JSONObject> zzlqVar = new zzlq<>();
        this.zzbqs.put(str, zzlqVar);
        return zzlqVar;
    }

    public void zzbe(String str) {
        zzlq<JSONObject> zzlqVar = this.zzbqs.get(str);
        if (zzlqVar == null) {
            zzkx.e("Could not find the ad request for the corresponding ad response.");
            return;
        }
        if (!zzlqVar.isDone()) {
            zzlqVar.cancel(true);
        }
        this.zzbqs.remove(str);
    }

    public void zzh(String str, String str2) {
        zzkx.zzdg("Received ad from the cache.");
        zzlq<JSONObject> zzlqVar = this.zzbqs.get(str);
        if (zzlqVar == null) {
            zzkx.e("Could not find the ad request for the corresponding ad response.");
            return;
        }
        try {
            zzlqVar.zzh(new JSONObject(str2));
        } catch (JSONException e) {
            zzkx.zzb("Failed constructing JSON object from value passed from javascript", e);
            zzlqVar.zzh(null);
        } finally {
            this.zzbqs.remove(str);
        }
    }
}
