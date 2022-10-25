package com.my.target.core.parsers.rb;

import android.text.TextUtils;
import com.my.target.core.models.sections.g;
import com.my.target.core.models.sections.i;
import com.my.target.core.models.sections.k;
import com.my.target.core.parsers.a;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: RBSectionParser.java */
/* loaded from: classes2.dex */
public class d {
    public static i a(String str, JSONObject jSONObject, com.my.target.core.models.c cVar, ArrayList<String> arrayList, a.C0235a c0235a, com.my.target.core.models.d dVar, String str2) {
        JSONArray a;
        JSONArray a2;
        c0235a.d = "Parsing section";
        c0235a.e = str;
        c0235a.c = d.class.getName();
        JSONObject a3 = a.a(jSONObject, str, c0235a, true);
        if (a3 == null) {
            return null;
        }
        Integer valueOf = Integer.valueOf(a.a(a3, "index", c0235a, 0, false));
        i c = cVar.c(str);
        if (c == null) {
            c = com.my.target.core.factories.e.a(str, valueOf.intValue());
        }
        if (c == null) {
            return null;
        }
        JSONObject a4 = a.a(a3, "settings", c0235a, false);
        if (a4 != null) {
            e.a(c, a4, str2, c0235a);
        }
        if ("instreamads".equals(str)) {
            c0235a.d = "Parsing instream section";
            if (!(c instanceof com.my.target.core.models.sections.f)) {
                return null;
            }
            com.my.target.core.models.sections.f fVar = (com.my.target.core.models.sections.f) c;
            JSONObject a5 = a.a(a3, "sections", c0235a, true);
            if (a5 == null) {
                return null;
            }
            JSONArray names = a5.names();
            int length = names.length();
            for (int i = 0; i < length; i++) {
                String b = a.b(i, names, "sections", c0235a);
                if (b != null && com.my.target.core.enums.a.a(b) && (a2 = a.a(a5, b, c0235a)) != null) {
                    a(fVar.c(b), a2, c0235a, dVar, arrayList, str2);
                }
            }
            return c;
        } else if ("instreamaudioads".equals(str)) {
            c0235a.d = "Parsing audio section";
            if (!(c instanceof g)) {
                return null;
            }
            g gVar = (g) c;
            JSONObject a6 = a.a(a3, "sections", c0235a, true);
            if (a6 == null) {
                return null;
            }
            JSONArray names2 = a6.names();
            int length2 = names2.length();
            for (int i2 = 0; i2 < length2; i2++) {
                String b2 = a.b(i2, names2, "sections", c0235a);
                if (b2 != null && com.my.target.core.enums.a.a(b2) && (a = a.a(a6, b2, c0235a)) != null) {
                    a(gVar.c(b2), a, c0235a, dVar, arrayList, str2);
                }
            }
            return c;
        } else {
            JSONArray a7 = a.a(a3, "banners", c0235a);
            if (a7 != null) {
                a(c, a7, c0235a, dVar, arrayList, str2);
            }
            if (c.b() != 0) {
                return c;
            }
            return null;
        }
    }

    private static void a(i iVar, JSONArray jSONArray, a.C0235a c0235a, com.my.target.core.models.d dVar, ArrayList<String> arrayList, String str) {
        int i;
        c0235a.d = "Parsing banners to section";
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        int length = jSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            JSONObject a = a.a(i2, jSONArray, "banners", c0235a);
            if ("additionalData".equals(a.a(a, ServerKeys.TYPE, c0235a, "", false))) {
                com.my.target.core.models.d a2 = a(a, iVar, i2, c0235a, dVar);
                if (a2 != null) {
                    if (a2.c() != -1) {
                        arrayList2.add(a2);
                    } else {
                        arrayList3.add(a2);
                        if (a2.n() || a2.o()) {
                            if (iVar instanceof k) {
                                ((k) iVar).a(a2);
                            } else if (iVar instanceof com.my.target.core.models.sections.c) {
                                ((com.my.target.core.models.sections.c) iVar).a(a2);
                            }
                        } else {
                            dVar.b(a2);
                        }
                    }
                }
            } else {
                com.my.target.core.models.banners.d a3 = b.a(a, iVar, arrayList, c0235a, str);
                if (a3 != null) {
                    a3.addStats(dVar.a());
                    arrayList4.add(a3);
                }
            }
        }
        if (dVar.p() != null) {
            int i3 = dVar.p().get();
            Iterator it = arrayList4.iterator();
            while (true) {
                i = i3;
                if (!it.hasNext()) {
                    break;
                }
                i3 = iVar.a(i, (com.my.target.core.models.banners.d) it.next()) ? i + 1 : i;
            }
            dVar.p().set(i);
        } else {
            Iterator it2 = arrayList4.iterator();
            while (it2.hasNext()) {
                iVar.a((com.my.target.core.models.banners.d) it2.next());
            }
        }
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            com.my.target.core.models.d dVar2 = (com.my.target.core.models.d) it3.next();
            Iterator it4 = arrayList3.iterator();
            while (true) {
                if (it4.hasNext()) {
                    com.my.target.core.models.d dVar3 = (com.my.target.core.models.d) it4.next();
                    if (dVar2.c() == dVar3.d()) {
                        dVar3.a(dVar2);
                        break;
                    }
                }
            }
        }
    }

    private static com.my.target.core.models.d a(JSONObject jSONObject, i iVar, int i, a.C0235a c0235a, com.my.target.core.models.d dVar) {
        if (dVar.h() >= 5) {
            return null;
        }
        c0235a.d = "Parsing additional data";
        String a = a.a(jSONObject, "url", c0235a, "", true);
        if (TextUtils.isEmpty(a)) {
            return null;
        }
        com.my.target.core.models.d dVar2 = new com.my.target.core.models.d(a);
        dVar2.c(dVar.h() + 1);
        dVar2.b(iVar.e());
        dVar2.b(a.a(jSONObject, "id", c0235a, dVar.d(), false));
        dVar2.a(a.b(jSONObject, "doAfter", c0235a, false));
        dVar2.a(a.a(jSONObject, "doOnEmptyResponseFromId", c0235a, -1, false));
        dVar2.b(a.b(jSONObject, "isMidrollPoint", c0235a, false));
        if (!dVar2.n() || !dVar2.o()) {
            if (i == 0 && dVar2.h() == 1) {
                dVar2.a(new AtomicInteger(0));
            } else {
                dVar2.a(dVar.p());
            }
        }
        float a2 = (float) a.a(jSONObject, "point", c0235a, -1.0d, false);
        if (a2 >= 0.0f) {
            dVar2.a(a2);
        }
        float a3 = (float) a.a(jSONObject, "pointP", c0235a, -1.0d, false);
        if (a3 >= 0.0f) {
            dVar2.b(a3);
        }
        if (a2 < 0.0f && a3 < 0.0f) {
            if (dVar.f() != 0.0f) {
                dVar2.a(dVar.f());
            } else {
                dVar2.b(50.0f);
            }
        }
        if (!TextUtils.isEmpty(dVar.i())) {
            dVar2.b(dVar.i());
        } else {
            dVar2.b(iVar.e());
        }
        Iterator<com.my.target.core.models.k> it = f.a(jSONObject, c0235a).iterator();
        while (it.hasNext()) {
            dVar2.a(it.next());
        }
        Iterator<com.my.target.core.models.k> it2 = f.b(jSONObject, c0235a).iterator();
        while (it2.hasNext()) {
            dVar2.c(it2.next());
        }
        Iterator<com.my.target.core.models.k> it3 = dVar.a().iterator();
        while (it3.hasNext()) {
            dVar2.a(it3.next());
        }
        Iterator<com.my.target.core.models.k> it4 = dVar.j().iterator();
        while (it4.hasNext()) {
            dVar2.b(it4.next());
        }
        return dVar2;
    }
}
