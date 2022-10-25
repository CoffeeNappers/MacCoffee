package com.my.tracker.models.events;

import com.facebook.internal.NativeProtocol;
import io.reactivex.annotations.SchedulerSupport;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: CustomEvent.java */
/* loaded from: classes2.dex */
public final class b extends a {
    public b(String str, String str2) {
        this(str, str2, null, 0L);
    }

    public b(String str, String str2, List<Long> list, long j) {
        super(SchedulerSupport.CUSTOM, list);
        a(j);
        if (str != null) {
            a(str);
        }
        if (str2 != null) {
            c(str2);
        }
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("name", b());
            jSONObject.put("timestamps", new JSONArray((Collection) f()));
            long h = h();
            if (h > 0) {
                jSONObject.put("timestamps_skipped", h);
            }
            String e = e();
            if (e != null && !e.equals("")) {
                jSONObject.put(NativeProtocol.WEB_DIALOG_PARAMS, new JSONObject(e));
            }
        } catch (JSONException e2) {
        }
        return jSONObject;
    }
}
