package com.my.target.core.parsers;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import com.facebook.internal.ServerProtocol;
import com.my.target.Tracer;
import com.my.target.core.models.c;
import com.my.target.core.models.d;
import com.my.target.core.parsers.a;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: ResponseParser.java */
/* loaded from: classes2.dex */
public class b {
    public static void a(String str, c cVar, com.my.target.core.a aVar, d dVar, Context context) {
        int indexOf;
        int i;
        int indexOf2;
        int indexOf3;
        int indexOf4;
        String trim = str != null ? str.trim() : str;
        if (trim == null || trim.equals("")) {
            Tracer.d("data is empty");
            return;
        }
        if (trim.indexOf("<!doctype html>") == 0 && (indexOf = trim.indexOf("bannersJSON:")) >= 0 && (indexOf2 = trim.indexOf("{", (i = indexOf + 12))) >= i && (indexOf3 = trim.indexOf("};", indexOf2)) >= indexOf2 + 1 && (indexOf4 = trim.indexOf("</script>", indexOf3)) >= indexOf3) {
            trim = "{\"html_wrapper\":\"" + (trim.substring(0, i) + "''};" + trim.substring(indexOf4)).replace("\"", "'") + "\"," + trim.substring(indexOf2 + 1, indexOf3);
        }
        if (com.my.target.core.parsers.vast.c.a(trim)) {
            Tracer.d("Parsing XML...");
            Tracer.d("parse VAST");
            a.C0235a c0235a = new a.C0235a(context);
            c0235a.f = com.my.target.core.parsers.vast.c.class.getSimpleName();
            c0235a.c = b.class.getName();
            c0235a.b = cVar.b();
            c0235a.d = "Parsing VAST";
            c0235a.e = "no unit";
            try {
                com.my.target.core.parsers.vast.c.a(trim, cVar, aVar, dVar, c0235a);
                return;
            } catch (Throwable th) {
                String message = th.getMessage();
                Tracer.d("parse VAST error. message: " + message);
                if (message.contains("(")) {
                    message = message.substring(0, message.indexOf("("));
                }
                com.my.target.core.async.a.a(message + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a.c, "VAST Exception:  Convert to XML error", trim, c0235a.b, c0235a.a);
                return;
            }
        }
        Tracer.d("Converting to JSON...");
        try {
            JSONObject jSONObject = new JSONObject(trim);
            Tracer.d("done");
            if (!a(jSONObject)) {
                Tracer.d("invalid json version");
                return;
            }
            Tracer.d("parse json");
            com.my.target.core.parsers.rb.c.a(jSONObject, cVar, aVar.c(), a(context), context, dVar);
            if (aVar.e()) {
                cVar.h();
            }
            Tracer.d("json parsing finished");
        } catch (Exception e) {
            Tracer.d("convert to JSON error: " + e.getMessage());
            com.my.target.core.async.a.a("Convert to JSON error", b.class.getName(), "JSON Exception: Convert to JSON error", trim, cVar.b(), context);
        }
    }

    private static boolean a(JSONObject jSONObject) {
        try {
            String string = jSONObject.getString(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION);
            Tracer.d("json version: " + string);
            int indexOf = string.indexOf(".");
            if (indexOf <= 0) {
                return false;
            }
            try {
                return Integer.parseInt(string.substring(0, indexOf), 10) == 2;
            } catch (NumberFormatException e) {
                return false;
            }
        } catch (JSONException e2) {
            return false;
        }
    }

    private static ArrayList<String> a(Context context) {
        List<ApplicationInfo> installedApplications = context.getPackageManager().getInstalledApplications(128);
        ArrayList<String> arrayList = new ArrayList<>();
        for (ApplicationInfo applicationInfo : installedApplications) {
            if ((applicationInfo.flags & 1) == 0) {
                arrayList.add(applicationInfo.packageName);
            }
        }
        return arrayList;
    }

    private b() {
    }
}
