package com.my.target.core.async;

import android.content.Context;
import android.webkit.URLUtil;
import com.my.target.Tracer;
import com.my.target.core.factories.b;
import com.my.target.core.models.i;
import com.my.target.core.models.k;
import com.vkontakte.android.TimeUtils;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
/* compiled from: Sender.java */
/* loaded from: classes2.dex */
public final class a {
    public static boolean a = true;
    private static long b;

    private static void a(String str, String str2, float f, Context context) {
        try {
            str = URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException | IllegalArgumentException e) {
            Tracer.d(e.toString());
        }
        if (str != null && URLUtil.isNetworkUrl(str)) {
            Tracer.d("add stat type: " + str2 + (f == -1.0f ? "" : " value: " + f) + " url: " + str);
            b.a(str, context).b();
            return;
        }
        Tracer.d("invalid stat url: " + str);
    }

    public static void a(String str, Context context) {
        a(str, null, -1.0f, context);
    }

    public static void a(k kVar, Context context) {
        if (kVar instanceof i) {
            a(kVar.d(), kVar.c(), ((i) kVar).a(), context);
        } else {
            a(kVar.d(), kVar.c(), -1.0f, context);
        }
    }

    public static void a(List<k> list, String str, Context context) {
        for (k kVar : list) {
            if (kVar.c().equals(str)) {
                a(kVar.d(), kVar.c(), -1.0f, context);
            }
        }
    }

    public static void a(List<String> list, Context context) {
        for (String str : list) {
            a(str, context);
        }
    }

    public static void a(String str, String str2, String str3, String str4, String str5, Context context) {
        Tracer.d("add log message level: 40");
        if (b < System.currentTimeMillis()) {
            b.a(str + " with data", str2, 40, str3 + " with data", null, str4, str5, context).b();
            b = System.currentTimeMillis() + TimeUtils.DAY;
            return;
        }
        b.a(str, str2, 40, str3, null, str5, context).b();
    }

    public static void a(String str, String str2, int i, String str3, String str4, Context context) {
        if (a) {
            Tracer.d("add log message level: " + i);
            b.a(str, str2, i, str3, null, str4, context).b();
        }
    }

    public static void a(String str, String str2, Throwable th, String str3, Context context) {
        if (a) {
            Tracer.d("add log message level: 50");
            b.a(str, str2, 50, null, th, str3, context).b();
        }
    }
}
