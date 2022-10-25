package com.my.tracker.models.events;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.data.ServerKeys;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: LevelEvent.java */
/* loaded from: classes2.dex */
public final class e extends a {
    public e(int i, String str) {
        super("level_achieved");
        JSONObject jSONObject;
        if (i != -1) {
            try {
                if (TextUtils.isEmpty(str)) {
                    jSONObject = new JSONObject();
                } else {
                    jSONObject = new JSONObject(str);
                }
                jSONObject.put("level", String.valueOf(i));
                c(jSONObject.toString());
            } catch (JSONException e) {
                com.my.tracker.a.a(e.getMessage());
            }
        } else if (str != null) {
            c(str);
        }
    }

    public e(String str, List<Long> list, long j) {
        super("level_achieved", list);
        a(j);
        if (str != null) {
            c(str);
        }
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, a());
            jSONObject.put("timestamps", new JSONArray((Collection) f()));
            String e = e();
            if (!TextUtils.isEmpty(e)) {
                jSONObject.put(NativeProtocol.WEB_DIALOG_PARAMS, new JSONObject(e));
            }
        } catch (JSONException e2) {
            com.my.tracker.a.a(e2.getMessage());
        }
        return jSONObject;
    }
}
