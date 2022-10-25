package com.my.tracker.models.events;

import android.text.TextUtils;
import com.my.tracker.utils.b;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: ReferrerEvent.java */
/* loaded from: classes2.dex */
public final class g extends a {
    public g(String str, String str2, String str3, List<Long> list) {
        super("install_referrer", list);
        if (str != null) {
            b(str);
        }
        if (!TextUtils.isEmpty(str2)) {
            b.C0239b c0239b = new b.C0239b(str3);
            c0239b.a("installer", str2);
            str3 = c0239b.toString();
        }
        if (!com.my.tracker.utils.b.a(str3)) {
            c(str3);
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
                jSONObject.put(ArgKeys.REFERRER, c());
            }
            jSONObject.putOpt("installer", new b.a(e()).a("installer"));
        } catch (JSONException e) {
        }
        return jSONObject;
    }
}
