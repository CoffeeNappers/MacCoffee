package com.my.target.core.factories;

import android.content.Context;
import android.text.TextUtils;
import com.my.target.core.async.commands.i;
import com.my.target.core.async.commands.j;
import com.my.target.core.utils.g;
import com.my.target.core.utils.h;
import java.util.ArrayList;
/* compiled from: CommandsFactory.java */
/* loaded from: classes2.dex */
public final class b {
    public static com.my.target.core.async.commands.b<Boolean> a(long j, int i, String str, Context context) {
        return new j(j, i, str, context);
    }

    public static com.my.target.core.async.commands.b<Void> a(String str, String str2, int i, String str3, Throwable th, String str4, Context context) {
        return a(str, str2, i, str3, th, null, str4, context);
    }

    public static com.my.target.core.async.commands.b<Void> a(String str, String str2, int i, String str3, Throwable th, String str4, String str5, Context context) {
        String str6;
        long currentTimeMillis = System.currentTimeMillis();
        if (str == null) {
            str6 = th != null ? th.getClass().getName() : "";
        } else {
            str6 = str;
        }
        String a = h.a(str6, h.a(currentTimeMillis), str2, i, str3, th, str4, str5, com.my.target.core.net.a.a());
        String a2 = h.a(h.b(a, currentTimeMillis, com.my.target.core.net.a.a().d()), currentTimeMillis, com.my.target.core.net.a.a().c());
        g a3 = com.my.target.core.net.a.a();
        StringBuilder sb = new StringBuilder();
        sb.append(a3.b());
        sb.append("://");
        sb.append(a3.a());
        if (a3.g() != 0 && a3.g() != 80 && a3.g() != -1) {
            sb.append(":").append(a3.g());
        }
        sb.append(a3.e());
        sb.append("/admanmobile/");
        String sb2 = sb.toString();
        if (!TextUtils.isEmpty(com.my.target.core.net.a.b)) {
            sb2 = com.my.target.core.net.a.b;
        }
        return new com.my.target.core.async.commands.h(sb2, a2, a, context);
    }

    public static com.my.target.core.async.commands.b<String> a(String str, Context context) {
        return new i(str, context);
    }

    public static com.my.target.core.async.commands.b<com.my.target.core.models.c> a(com.my.target.core.models.c cVar, ArrayList<com.my.target.core.models.d> arrayList, com.my.target.core.a aVar, Context context) {
        return new com.my.target.core.async.commands.g(cVar, arrayList, aVar, context);
    }
}
