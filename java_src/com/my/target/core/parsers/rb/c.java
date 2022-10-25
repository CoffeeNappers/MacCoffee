package com.my.target.core.parsers.rb;

import android.content.Context;
import android.text.TextUtils;
import com.my.target.core.models.sections.i;
import com.my.target.core.parsers.a;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: RBJSONParser.java */
/* loaded from: classes2.dex */
public class c {
    public static void a(JSONObject jSONObject, com.my.target.core.models.c cVar, String str, ArrayList<String> arrayList, Context context, com.my.target.core.models.d dVar) {
        if (jSONObject.has("html_wrapper")) {
            cVar.b(jSONObject.optString("html_wrapper"));
            jSONObject.remove("html_wrapper");
        }
        cVar.a(jSONObject);
        JSONArray names = jSONObject.names();
        if (names != null) {
            int length = names.length();
            a.C0235a c0235a = new a.C0235a(context);
            c0235a.b = cVar.b();
            c0235a.d = "Parsing";
            c0235a.c = c.class.getName();
            c0235a.e = "root";
            for (int i = 0; i < length; i++) {
                String b = a.b(i, names, "root", c0235a);
                if (!TextUtils.isEmpty(b) && com.my.target.core.enums.b.a(b) != null) {
                    boolean z = false;
                    if (str == null || str.equals(b) || ((str.equals("appwall") && "showcaseApps".equals(b)) || "showcaseGames".equals(b) || "showcase".equals(b))) {
                        z = true;
                    }
                    if (z) {
                        i a = d.a(b, jSONObject, cVar, arrayList, c0235a, dVar, str);
                        if (a != null) {
                            cVar.a(a);
                        } else {
                            jSONObject.remove(b);
                            return;
                        }
                    } else {
                        jSONObject.remove(b);
                        return;
                    }
                }
            }
        }
    }
}
