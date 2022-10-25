package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzfm implements zzfe {
    private final Object zzako = new Object();
    private final Map<String, zza> zzbqx = new HashMap();

    /* loaded from: classes2.dex */
    public interface zza {
        void zzbf(String str);

        void zzc(JSONObject jSONObject);
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("id");
        String str2 = map.get("fail");
        String str3 = map.get("fail_reason");
        String str4 = map.get("result");
        synchronized (this.zzako) {
            zza remove = this.zzbqx.remove(str);
            if (remove == null) {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Received result for unexpected method invocation: ".concat(valueOf) : new String("Received result for unexpected method invocation: "));
            } else if (!TextUtils.isEmpty(str2)) {
                remove.zzbf(str3);
            } else if (str4 == null) {
                remove.zzbf("No result.");
            } else {
                try {
                    remove.zzc(new JSONObject(str4));
                } catch (JSONException e) {
                    remove.zzbf(e.getMessage());
                }
            }
        }
    }
}
