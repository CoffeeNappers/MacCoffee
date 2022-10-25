package com.google.android.gms.internal;

import android.support.v4.util.SimpleArrayMap;
import com.google.android.gms.internal.zzjb;
import com.vkontakte.android.data.ServerKeys;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzjf implements zzjb.zza<com.google.android.gms.ads.internal.formats.zzf> {
    private final boolean zzciy;

    public zzjf(boolean z) {
        this.zzciy = z;
    }

    private void zza(zzjb zzjbVar, JSONObject jSONObject, SimpleArrayMap<String, Future<com.google.android.gms.ads.internal.formats.zzc>> simpleArrayMap) throws JSONException {
        simpleArrayMap.put(jSONObject.getString("name"), zzjbVar.zza(jSONObject, "image_value", this.zzciy));
    }

    private void zza(JSONObject jSONObject, SimpleArrayMap<String, String> simpleArrayMap) throws JSONException {
        simpleArrayMap.put(jSONObject.getString("name"), jSONObject.getString("string_value"));
    }

    private <K, V> SimpleArrayMap<K, V> zzc(SimpleArrayMap<K, Future<V>> simpleArrayMap) throws InterruptedException, ExecutionException {
        SimpleArrayMap<K, V> simpleArrayMap2 = new SimpleArrayMap<>();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < simpleArrayMap.size()) {
                simpleArrayMap2.put(simpleArrayMap.keyAt(i2), simpleArrayMap.valueAt(i2).get());
                i = i2 + 1;
            } else {
                return simpleArrayMap2;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzjb.zza
    /* renamed from: zzd */
    public com.google.android.gms.ads.internal.formats.zzf zza(zzjb zzjbVar, JSONObject jSONObject) throws JSONException, InterruptedException, ExecutionException {
        SimpleArrayMap<String, Future<com.google.android.gms.ads.internal.formats.zzc>> simpleArrayMap = new SimpleArrayMap<>();
        SimpleArrayMap<String, String> simpleArrayMap2 = new SimpleArrayMap<>();
        zzlt<com.google.android.gms.ads.internal.formats.zza> zzf = zzjbVar.zzf(jSONObject);
        JSONArray jSONArray = jSONObject.getJSONArray("custom_assets");
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
            String string = jSONObject2.getString(ServerKeys.TYPE);
            if ("string".equals(string)) {
                zza(jSONObject2, simpleArrayMap2);
            } else if ("image".equals(string)) {
                zza(zzjbVar, jSONObject2, simpleArrayMap);
            } else {
                String valueOf = String.valueOf(string);
                zzkx.zzdi(valueOf.length() != 0 ? "Unknown custom asset type: ".concat(valueOf) : new String("Unknown custom asset type: "));
            }
        }
        return new com.google.android.gms.ads.internal.formats.zzf(jSONObject.getString("custom_template_id"), zzc(simpleArrayMap), simpleArrayMap2, zzf.get());
    }
}
