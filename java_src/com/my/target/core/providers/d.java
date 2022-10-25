package com.my.target.core.providers;

import android.content.Context;
import android.os.Looper;
import com.my.target.Tracer;
import java.util.Map;
/* compiled from: FingerprintDataProvider.java */
/* loaded from: classes2.dex */
public final class d extends a {
    private static d a;
    private b b = new b();
    private c c = new c();
    private e d = new e();
    private f e = new f();

    public static d a() {
        if (a == null) {
            a = new d();
        }
        return a;
    }

    public final b b() {
        return this.b;
    }

    public final c c() {
        return this.c;
    }

    public final synchronized void a(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Tracer.d("FingerprintDataProvider: You must not call collectData method from main thread");
        } else {
            removeAll();
            this.b.a(context);
            this.c.a(context);
            this.d.a(context);
            this.e.a(context);
            Map<String, String> map = getMap();
            this.b.putDataTo(map);
            this.c.putDataTo(map);
            this.d.putDataTo(map);
            this.e.putDataTo(map);
        }
    }
}
