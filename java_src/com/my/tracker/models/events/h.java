package com.my.tracker.models.events;

import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: SessionEvent.java */
/* loaded from: classes2.dex */
public final class h extends a {
    private final ArrayList<Long[]> a;

    public h() {
        super("session");
        b(g());
        this.a = new ArrayList<>();
    }

    public h(long j, long j2) {
        super("session");
        b(j);
        a(j2);
        this.a = new ArrayList<>();
    }

    @Override // com.my.tracker.models.events.c
    public final JSONObject k() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, a());
            JSONArray jSONArray = new JSONArray();
            Iterator<Long[]> it = this.a.iterator();
            while (it.hasNext()) {
                Long[] next = it.next();
                JSONArray jSONArray2 = new JSONArray();
                jSONArray2.put(next[0]);
                jSONArray2.put(next[1]);
                jSONArray.put(jSONArray2);
            }
            jSONObject.put("timestamps", jSONArray);
            if (h() > 0) {
                jSONObject.put("timestamps_skipped", h());
            }
            String e = e();
            if (e != null && !e.equals("")) {
                jSONObject.put(NativeProtocol.WEB_DIALOG_PARAMS, new JSONObject(e));
            }
        } catch (JSONException e2) {
        }
        return jSONObject;
    }

    public final void a(Long[] lArr) {
        this.a.add(lArr);
    }
}
