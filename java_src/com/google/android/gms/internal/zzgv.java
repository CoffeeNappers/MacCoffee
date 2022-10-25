package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzgv {
    public List<String> zza(JSONObject jSONObject, String str) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray(str);
        if (optJSONArray != null) {
            ArrayList arrayList = new ArrayList(optJSONArray.length());
            for (int i = 0; i < optJSONArray.length(); i++) {
                arrayList.add(optJSONArray.getString(i));
            }
            return Collections.unmodifiableList(arrayList);
        }
        return null;
    }

    public void zza(Context context, String str, zzko zzkoVar, String str2, boolean z, List<String> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        String str3 = z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO;
        for (String str4 : list) {
            String replaceAll = str4.replaceAll("@gw_adlocid@", str2).replaceAll("@gw_adnetrefresh@", str3).replaceAll("@gw_qdata@", zzkoVar.zzcsk.zzbvp).replaceAll("@gw_sdkver@", str).replaceAll("@gw_sessid@", com.google.android.gms.ads.internal.zzu.zzgq().getSessionId()).replaceAll("@gw_seqnum@", zzkoVar.zzcjx);
            if (!TextUtils.isEmpty(zzkoVar.zzcsl)) {
                replaceAll = replaceAll.replaceAll("@gw_adnetstatus@", zzkoVar.zzcsl);
            }
            if (zzkoVar.zzbwm != null) {
                replaceAll = replaceAll.replaceAll("@gw_adnetid@", zzkoVar.zzbwm.zzbut).replaceAll("@gw_allocid@", zzkoVar.zzbwm.zzbuv);
            }
            Future future = (Future) new zzll(context, str, replaceAll).zzrz();
        }
    }
}
