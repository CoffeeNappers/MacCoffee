package com.my.tracker.models.events;

import android.text.TextUtils;
import com.my.tracker.utils.b;
import com.vkontakte.android.data.ServerKeys;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: UpdateEvent.java */
/* loaded from: classes2.dex */
public final class j extends a {
    public j(String str, String str2, String str3, String str4, List<Long> list) {
        super("update", list);
        if (str != null) {
            b(str);
        }
        if (str2 != null) {
            a(str2);
        }
        if (!TextUtils.isEmpty(str3)) {
            b.C0239b c0239b = new b.C0239b(str4);
            c0239b.a("installer", str3);
            str4 = c0239b.toString();
        }
        if (!com.my.tracker.utils.b.a(str4)) {
            c(str4);
        }
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, a());
            jSONObject.put(JsonMarshaller.TIMESTAMP, g());
            String c = c();
            if (!TextUtils.isEmpty(c)) {
                jSONObject.put("appbuild", c);
            }
            String b = b();
            if (!TextUtils.isEmpty(b)) {
                jSONObject.put("appver", b);
            }
            jSONObject.putOpt("installer", new b.a(e()).a("installer"));
        } catch (JSONException e) {
        }
        return jSONObject;
    }
}
