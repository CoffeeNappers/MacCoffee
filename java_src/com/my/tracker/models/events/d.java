package com.my.tracker.models.events;

import android.text.TextUtils;
import com.my.tracker.utils.b;
import com.vkontakte.android.data.ServerKeys;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: InstallEvent.java */
/* loaded from: classes2.dex */
public final class d extends a {
    public d(long j, String str, String str2, List<Long> list) {
        super("install", list);
        b(Long.toString(j));
        if (!TextUtils.isEmpty(str)) {
            b.C0239b c0239b = new b.C0239b(str2);
            c0239b.a("installer", str);
            str2 = c0239b.toString();
        }
        if (!com.my.tracker.utils.b.a(str2)) {
            c(str2);
        }
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, a());
            jSONObject.put(JsonMarshaller.TIMESTAMP, g());
            String c = c();
            if (c != null && !c.equals("")) {
                jSONObject.put("first_install_time", Long.valueOf(c()));
            }
            jSONObject.putOpt("installer", new b.a(e()).a("installer"));
        } catch (JSONException e) {
        }
        return jSONObject;
    }
}
