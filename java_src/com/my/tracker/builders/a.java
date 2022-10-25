package com.my.tracker.builders;

import android.location.Location;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.my.tracker.models.events.c;
import com.my.tracker.providers.b;
import com.my.tracker.providers.d;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import io.reactivex.annotations.SchedulerSupport;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: JSONBuilder.java */
/* loaded from: classes2.dex */
public final class a {
    private JSONObject a = new JSONObject();
    private JSONObject b = new JSONObject();
    private JSONObject c = new JSONObject();
    private JSONObject d = new JSONObject();
    private JSONObject e = new JSONObject();
    private JSONObject f = new JSONObject();
    private JSONArray g = new JSONArray();
    private JSONArray h = new JSONArray();
    private JSONObject i = new JSONObject();
    private JSONObject j = new JSONObject();
    private JSONArray k;

    public a() {
        try {
            this.a.put("mytracker_ver", "1.3.8");
            this.a.put("app", this.b);
            this.a.put(ProfileGiftsFragment.Extra.User, this.c);
            this.a.put("device", this.d);
            this.a.put("network", this.e);
            this.a.put(FirebaseAnalytics.Param.LOCATION, this.f);
            this.a.put("events", this.g);
            this.a.put("custom_events", this.h);
            this.a.put("environment", this.i);
        } catch (JSONException e) {
        }
    }

    public final void a(String str) {
        a(this.a, "app_id", str);
    }

    public final void a(long j) {
        a(this.a, "timestamp_base", Long.valueOf(j));
    }

    public final void b(long j) {
        a(this.a, "timestamp_send", Long.valueOf(j));
    }

    public final void c(long j) {
        a(this.a, "custom_events_skipped", Long.valueOf(j));
    }

    public final void b(String str) {
        a(this.d, "device_id", str);
    }

    public final void c(String str) {
        a(this.d, "android_id", str);
    }

    public final void a(String str, int i) {
        a(this.d, "advertising_id", str);
        a(this.d, "advertising_tracking_enabled", Integer.valueOf(i));
    }

    public final void d(String str) {
        a(this.d, "mrgs_device_id", str);
    }

    public final void e(String str) {
        a(this.d, "device", str);
    }

    public final void f(String str) {
        a(this.d, "os", str);
    }

    public final void g(String str) {
        a(this.d, "manufacture", str);
    }

    public final void h(String str) {
        a(this.d, "mac", str);
    }

    public final void i(String str) {
        a(this.d, "osver", str);
    }

    public final void j(String str) {
        a(this.d, "lang", str);
    }

    public final void k(String str) {
        a(this.d, "timezone", str);
    }

    public final void l(String str) {
        a(this.d, "euname", str);
    }

    public final void a(int i) {
        a(this.d, "w", Integer.valueOf(i));
    }

    public final void b(int i) {
        a(this.d, "h", Integer.valueOf(i));
    }

    public final void c(int i) {
        a(this.d, "dpi", Integer.valueOf(i));
    }

    public final void a(float f) {
        a(this.d, "density", Float.valueOf(f));
    }

    public final void m(String str) {
        a(this.e, "sim_loc", str);
    }

    public final void n(String str) {
        a(this.e, "operator_id", str);
    }

    public final void o(String str) {
        a(this.e, "operator_name", str);
    }

    public final void p(String str) {
        a(this.e, "sim_operator_id", str);
    }

    public final void a(String str, String str2) {
        a(this.e, "connection", str);
        a(this.e, "connection_type", str2);
    }

    public final void d(int i) {
        a(this.e, "bluetooth_enabled", Integer.valueOf(i));
    }

    public final void q(String str) {
        a(this.b, "app", str);
    }

    public final void r(String str) {
        a(this.b, "appver", str);
    }

    public final void s(String str) {
        a(this.b, "appbuild", str);
    }

    public final void t(String str) {
        a(this.b, "app_lang", str);
    }

    public final void u(String str) {
        a(this.b, "mrgs_app_id", str);
    }

    public final void a(Location location, String str) {
        if (location != null) {
            try {
                this.f.put("lon", location.getLongitude());
                this.f.put("lat", location.getLatitude());
                this.f.put("accuracy", location.getAccuracy());
                this.f.put("speed", location.getSpeed());
                this.f.put(JsonMarshaller.TIMESTAMP, location.getTime() / 1000);
                if (str != null) {
                    this.f.put("location_provider", str);
                }
            } catch (JSONException e) {
            }
        }
    }

    public final void v(String str) {
        a(this.c, "mrgs_user_id", str);
    }

    public final void a(String[] strArr) {
        a(this.c, "email", new JSONArray((Collection) Arrays.asList(strArr)));
    }

    public final void b(String[] strArr) {
        a(this.c, "ok_id", new JSONArray((Collection) Arrays.asList(strArr)));
    }

    public final void c(String[] strArr) {
        a(this.c, "vk_id", new JSONArray((Collection) Arrays.asList(strArr)));
    }

    public final void d(String[] strArr) {
        a(this.c, "icq_id", new JSONArray((Collection) Arrays.asList(strArr)));
    }

    public final void e(String[] strArr) {
        a(this.c, "custom_user_id", new JSONArray((Collection) Arrays.asList(strArr)));
    }

    public final void e(int i) {
        a(this.c, "a", Integer.valueOf(i));
    }

    public final void f(int i) {
        a(this.c, "g", Integer.valueOf(i));
    }

    public final void a(List<c> list) {
        for (c cVar : list) {
            if (cVar.a().equals(SchedulerSupport.CUSTOM)) {
                this.h.put(cVar.k());
            } else {
                this.g.put(cVar.k());
            }
        }
    }

    public final void a(c cVar) {
        if (!cVar.a().equals(SchedulerSupport.CUSTOM)) {
            this.g.put(cVar.k());
        } else {
            this.h.put(cVar.k());
        }
    }

    public final void b(List<b.a> list) {
        try {
            if (this.k == null) {
                this.k = new JSONArray();
                this.a.put("apps", this.k);
            }
            for (b.a aVar : list) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("bundle", aVar.a);
                if (aVar.b > 0) {
                    jSONObject.put("first_install_time", aVar.b);
                }
                this.k.put(jSONObject);
            }
        } catch (JSONException e) {
        }
    }

    public final String toString() {
        return this.a.toString();
    }

    private static void a(JSONObject jSONObject, String str, Object obj) {
        try {
            jSONObject.put(str, obj);
        } catch (JSONException e) {
        }
    }

    public final void a(d.b bVar, d.C0238d c0238d, ArrayList<d.C0238d> arrayList) {
        JSONObject jSONObject = new JSONObject();
        if (bVar != null) {
            JSONArray jSONArray = new JSONArray();
            jSONArray.put(bVar.a);
            jSONArray.put(bVar.b);
            jSONArray.put(bVar.c);
            jSONArray.put(bVar.e);
            jSONArray.put(bVar.f);
            a(jSONObject, "current", jSONArray);
            a(this.i, UserNotification.BUTTON_STYLE_CELL, jSONObject);
        }
        JSONObject jSONObject2 = new JSONObject();
        if (c0238d != null) {
            JSONArray jSONArray2 = new JSONArray();
            jSONArray2.put(c0238d.b);
            jSONArray2.put(c0238d.a);
            jSONArray2.put(c0238d.c);
            jSONArray2.put(c0238d.d);
            jSONArray2.put(c0238d.e);
            a(jSONObject2, "current", jSONArray2);
        }
        if (arrayList != null && !arrayList.isEmpty()) {
            JSONArray jSONArray3 = new JSONArray();
            Iterator<d.C0238d> it = arrayList.iterator();
            while (it.hasNext()) {
                d.C0238d next = it.next();
                JSONArray jSONArray4 = new JSONArray();
                jSONArray4.put(next.b);
                jSONArray4.put(next.a);
                jSONArray4.put(next.f);
                jSONArray3.put(jSONArray4);
            }
            a(jSONObject2, "around", jSONArray3);
        }
        if (c0238d != null || (arrayList != null && !arrayList.isEmpty())) {
            a(this.i, "wifi", jSONObject2);
        }
    }

    public final void a() {
        a(this.j, "location_enabled", (Object) false);
        if (this.j.names().length() > 0 && !this.a.has("settings")) {
            try {
                this.a.put("settings", this.j);
            } catch (JSONException e) {
            }
        }
    }

    public final void b() {
        a(this.j, "launch_enabled", (Object) false);
        if (this.j.names().length() > 0 && !this.a.has("settings")) {
            try {
                this.a.put("settings", this.j);
            } catch (JSONException e) {
            }
        }
    }

    public final void c() {
        a(this.j, "environment_enabled", (Object) false);
        if (this.j.names().length() > 0 && !this.a.has("settings")) {
            try {
                this.a.put("settings", this.j);
            } catch (JSONException e) {
            }
        }
    }

    public final void g(int i) {
        a(this.j, "session_timeout", Integer.valueOf(i));
        if (this.j.names().length() > 0 && !this.a.has("settings")) {
            try {
                this.a.put("settings", this.j);
            } catch (JSONException e) {
            }
        }
    }
}
