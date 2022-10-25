package com.my.target.core.parsers;

import android.content.Context;
import com.my.target.Tracer;
/* compiled from: ParseErrorMessages.java */
/* loaded from: classes2.dex */
public final class a {

    /* compiled from: ParseErrorMessages.java */
    /* renamed from: com.my.target.core.parsers.a$a  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static class C0235a {
        public final Context a;
        public String b;
        public String c;
        public String d;
        public String e;
        public String f;

        public C0235a(Context context) {
            this.a = context;
        }
    }

    public static void a(String str, C0235a c0235a, String str2) {
        a(str + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, str2);
    }

    public static void a(String str, C0235a c0235a, Exception exc, String str2) {
        Tracer.d(str + (exc != null ? " message: " + exc.getMessage() : ""));
        com.my.target.core.async.a.a(str, c0235a.c, 40, "JSON parse exception: " + str2, c0235a.b, c0235a.a);
    }

    public static void b(String str, C0235a c0235a, String str2) {
        Tracer.d(str);
        com.my.target.core.async.a.a(str + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a.c, 40, "VAST Exception:  " + str2, c0235a.b, c0235a.a);
    }
}
