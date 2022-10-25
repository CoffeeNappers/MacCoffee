package com.my.target.core.models;

import android.content.Context;
import com.my.target.Tracer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: AdData.java */
/* loaded from: classes2.dex */
public final class c extends b {
    private static final com.my.target.core.utils.i<String, String> a = new com.my.target.core.utils.i<>();
    private String c;
    private JSONObject d;
    private String e;
    private final long f;
    private final long g;
    private boolean i;
    private final ArrayList<com.my.target.core.models.sections.i> h = new ArrayList<>();
    private final com.my.target.core.utils.j b = new com.my.target.core.utils.j();

    public static com.my.target.core.utils.i<String, String> a() {
        return a;
    }

    public c(long j) {
        this.g = j;
        this.f = System.currentTimeMillis() + j;
    }

    public final String b() {
        return this.c;
    }

    public final void a(String str) {
        this.c = str;
    }

    public final JSONObject c() {
        return this.d;
    }

    public final void a(JSONObject jSONObject) {
        this.d = jSONObject;
    }

    public final boolean d() {
        return System.currentTimeMillis() > this.f;
    }

    public final String e() {
        return this.e;
    }

    public final void b(String str) {
        this.e = str;
    }

    public final boolean a(com.my.target.core.models.sections.i iVar) {
        boolean z = false;
        if (this.h.contains(iVar)) {
            return false;
        }
        if (this.h.size() == 0 || iVar.d() == -1) {
            this.h.add(iVar);
        } else {
            Iterator<com.my.target.core.models.sections.i> it = this.h.iterator();
            int i = 0;
            while (it.hasNext()) {
                com.my.target.core.models.sections.i next = it.next();
                if (next.d() > iVar.d() || next.d() == -1) {
                    this.h.add(i, iVar);
                    z = true;
                    break;
                }
                i++;
            }
            if (!z) {
                this.h.add(iVar);
            }
        }
        return true;
    }

    public final com.my.target.core.models.sections.i c(String str) {
        Iterator<com.my.target.core.models.sections.i> it = this.h.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.sections.i next = it.next();
            if (next.e().equals(str)) {
                return next;
            }
        }
        return null;
    }

    public final ArrayList<com.my.target.core.models.sections.i> f() {
        return new ArrayList<>(this.h);
    }

    public final boolean g() {
        Iterator<com.my.target.core.models.sections.i> it = this.h.iterator();
        while (it.hasNext()) {
            if (it.next().b() > 0) {
                return true;
            }
        }
        return false;
    }

    public final void a(com.my.target.core.models.banners.d dVar, Context context) {
        this.b.a(dVar, context);
    }

    public static String b(com.my.target.core.models.banners.d dVar, Context context) {
        com.my.target.core.async.a.a(dVar.getStats(), "click", context);
        return dVar.getTrackingLink();
    }

    public final boolean a(com.my.target.core.a aVar, com.my.target.core.models.sections.b bVar, com.my.target.core.models.banners.d dVar, Context context) {
        String id = dVar.getId();
        if (bVar.m(id)) {
            boolean n = bVar.n(id);
            try {
                JSONArray jSONArray = this.d.getJSONObject(bVar.e()).getJSONArray("banners");
                int length = jSONArray.length();
                for (int i = 0; i < length; i++) {
                    JSONObject jSONObject = (JSONObject) jSONArray.get(i);
                    if (jSONObject.getString("bannerID").equals(id)) {
                        jSONObject.put("hasNotification", false);
                        Tracer.d("Changed notification in raw data for banner " + id);
                    }
                }
            } catch (JSONException e) {
                Tracer.d("Error updating cache notification for section=" + bVar.e() + " and bannerId=" + id + ", " + e);
            }
            try {
                this.d.put("html_wrapper", this.e);
                String jSONObject2 = this.d.toString();
                this.d.remove("html_wrapper");
                com.my.target.core.factories.b.a(this.g, aVar.d(), jSONObject2, context).b();
            } catch (JSONException e2) {
                e2.printStackTrace();
            }
            return n;
        }
        return false;
    }

    public static void a(com.my.target.core.models.banners.d dVar, com.my.target.core.models.sections.i iVar, Context context) {
        if (iVar.e() != null) {
            Tracer.d("Ad shows. adId: " + dVar.getId() + " in section " + iVar.e());
        } else {
            Tracer.d("Ad shows. adId: " + dVar.getId());
        }
        com.my.target.core.async.a.a(dVar.getStats(), "playbackStarted", context);
    }

    public static void a(Set<i> set, float f, Context context) {
        Iterator<i> it = set.iterator();
        while (it.hasNext()) {
            i next = it.next();
            if (next.a() <= f) {
                com.my.target.core.async.a.a(next, context);
                it.remove();
            }
        }
    }

    public static void a(com.my.target.core.models.banners.d dVar, String str, Context context) {
        com.my.target.core.async.a.a(dVar.getStats(), str, context);
    }

    public static void a(com.my.target.core.models.sections.i iVar, String str, Context context) {
        com.my.target.core.async.a.a(iVar.h(), str, context);
    }

    public static void c(com.my.target.core.models.banners.d dVar, Context context) {
        if (dVar != null) {
            Tracer.d("Ad shows. adId: " + dVar.getId());
            com.my.target.core.async.a.a(dVar.getStats(), "playbackStarted", context);
        }
    }

    public final void h() {
        com.my.target.core.models.sections.i c = c("nativeads");
        if (c instanceof com.my.target.core.models.sections.h) {
            com.my.target.core.models.sections.h hVar = (com.my.target.core.models.sections.h) c;
            if (hVar.b() > 0) {
                Iterator<com.my.target.core.models.banners.h> it = hVar.g().iterator();
                while (it.hasNext()) {
                    com.my.target.core.models.banners.h next = it.next();
                    a.a(next.getId(), next.getId());
                }
            }
        }
    }

    public final void i() {
        this.i = true;
    }

    public final boolean j() {
        return this.i;
    }
}
