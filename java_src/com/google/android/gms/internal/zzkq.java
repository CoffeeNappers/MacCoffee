package com.google.android.gms.internal;

import android.os.Bundle;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzkq {
    private final long zzctg;
    private String zzctj;
    private String zzctk;
    private final List<String> zzcth = new ArrayList();
    private final Map<String, zzb> zzcti = new HashMap();
    private boolean zzctl = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zza {
        private final List<String> zzctm;
        private final Bundle zzctn;

        public zza(List<String> list, Bundle bundle) {
            this.zzctm = list;
            this.zzctn = bundle;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zzb {
        final List<zza> zzctp = new ArrayList();

        zzb() {
        }

        public void zza(zza zzaVar) {
            this.zzctp.add(zzaVar);
        }
    }

    public zzkq(String str, long j) {
        this.zzctk = str;
        this.zzctg = j;
        zzcv(str);
    }

    private void zzcv(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.optInt("status", -1) != 1) {
                this.zzctl = false;
                zzkx.zzdi("App settings could not be fetched successfully.");
                return;
            }
            this.zzctl = true;
            this.zzctj = jSONObject.optString("app_id");
            JSONArray optJSONArray = jSONObject.optJSONArray("ad_unit_id_settings");
            if (optJSONArray == null) {
                return;
            }
            for (int i = 0; i < optJSONArray.length(); i++) {
                zzk(optJSONArray.getJSONObject(i));
            }
        } catch (JSONException e) {
            zzkx.zzc("Exception occurred while processing app setting json", e);
            com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "AppSettings.parseAppSettingsJson");
        }
    }

    private void zzk(JSONObject jSONObject) throws JSONException {
        JSONObject optJSONObject;
        JSONArray optJSONArray;
        JSONObject jSONObject2;
        JSONArray optJSONArray2;
        String optString = jSONObject.optString("format");
        String optString2 = jSONObject.optString("ad_unit_id");
        if (TextUtils.isEmpty(optString) || TextUtils.isEmpty(optString2)) {
            return;
        }
        if ("interstitial".equalsIgnoreCase(optString)) {
            this.zzcth.add(optString2);
        } else if ("rewarded".equalsIgnoreCase(optString) && (optJSONObject = jSONObject.optJSONObject("mediation_config")) != null && (optJSONArray = optJSONObject.optJSONArray("ad_networks")) != null) {
            for (int i = 0; i < optJSONArray.length() && (optJSONArray2 = (jSONObject2 = optJSONArray.getJSONObject(i)).optJSONArray("adapters")) != null; i++) {
                ArrayList arrayList = new ArrayList();
                for (int i2 = 0; i2 < optJSONArray2.length(); i2++) {
                    arrayList.add(optJSONArray2.getString(i2));
                }
                JSONObject optJSONObject2 = jSONObject2.optJSONObject("data");
                if (optJSONObject2 == null) {
                    return;
                }
                Bundle bundle = new Bundle();
                Iterator<String> keys = optJSONObject2.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    bundle.putString(next, optJSONObject2.getString(next));
                }
                zza zzaVar = new zza(arrayList, bundle);
                zzb zzbVar = this.zzcti.containsKey(optString2) ? this.zzcti.get(optString2) : new zzb();
                zzbVar.zza(zzaVar);
                this.zzcti.put(optString2, zzbVar);
            }
        }
    }

    public long zzum() {
        return this.zzctg;
    }

    public boolean zzun() {
        return this.zzctl;
    }

    public String zzuo() {
        return this.zzctk;
    }

    public String zzup() {
        return this.zzctj;
    }
}
