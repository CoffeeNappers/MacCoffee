package com.my.tracker.factories;

import com.my.tracker.models.events.c;
import com.my.tracker.models.events.e;
import com.my.tracker.models.events.f;
import com.my.tracker.models.events.g;
import com.my.tracker.models.events.i;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: EventsFactory.java */
/* loaded from: classes2.dex */
public final class b {
    public static c a(String str, Map<String, String> map) {
        return new com.my.tracker.models.events.b(str, a(map));
    }

    public static c b(String str, Map<String, String> map) {
        return new i(str, a(map));
    }

    public static c a(String str, String str2, long j) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(Long.valueOf(j));
        return new g(str, str2, null, arrayList);
    }

    public static c a(JSONObject jSONObject, JSONObject jSONObject2, String str, Map<String, String> map) {
        return new f(jSONObject, jSONObject2, str, a(map));
    }

    public static c a(int i, Map<String, String> map) {
        return new e(i, a(map));
    }

    private static String a(Map<String, String> map) {
        if (map != null && !map.isEmpty()) {
            try {
                JSONObject jSONObject = new JSONObject();
                for (Map.Entry entry : new TreeMap(map).entrySet()) {
                    jSONObject.put((String) entry.getKey(), entry.getValue());
                }
                return jSONObject.toString();
            } catch (JSONException e) {
                com.my.tracker.a.a(e.toString());
            }
        }
        return "";
    }

    public static boolean a(String str, String str2) {
        if (str2 == null || str2.length() < 64) {
            return true;
        }
        com.my.tracker.a.c("Length of field of event " + str + " is more than 64, event rejected");
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean c(java.lang.String r3, java.util.Map<java.lang.String, java.lang.String> r4) {
        /*
            java.util.TreeMap r0 = new java.util.TreeMap
            r0.<init>(r4)
            java.util.Set r0 = r0.entrySet()
            java.util.Iterator r2 = r0.iterator()
        Ld:
            boolean r0 = r2.hasNext()
            if (r0 == 0) goto L33
            java.lang.Object r0 = r2.next()
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0
            java.lang.Object r1 = r0.getKey()
            java.lang.String r1 = (java.lang.String) r1
            boolean r1 = a(r3, r1)
            if (r1 == 0) goto L31
            java.lang.Object r0 = r0.getValue()
            java.lang.String r0 = (java.lang.String) r0
            boolean r0 = a(r3, r0)
            if (r0 != 0) goto Ld
        L31:
            r0 = 0
        L32:
            return r0
        L33:
            r0 = 1
            goto L32
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.tracker.factories.b.c(java.lang.String, java.util.Map):boolean");
    }
}
