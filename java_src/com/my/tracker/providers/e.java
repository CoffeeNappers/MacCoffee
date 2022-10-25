package com.my.tracker.providers;

import android.content.Context;
import android.os.Looper;
/* compiled from: FingerprintDataProvider.java */
/* loaded from: classes2.dex */
public final class e extends a {
    private static e a;
    private c b = new c();
    private f c = new f();
    private h d = new h();
    private g e = new g();
    private b f = new b();
    private d g = new d();

    public static e a() {
        if (a == null) {
            a = new e();
        }
        return a;
    }

    public final h b() {
        return this.d;
    }

    public final g c() {
        return this.e;
    }

    public final b d() {
        return this.f;
    }

    public final d e() {
        return this.g;
    }

    public final void b(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("FingerprintDataProvider: You must not call collectData method from main thread");
            return;
        }
        this.b.b(context);
        this.c.b(context);
        this.d.b(context);
        this.e.b(context);
        this.g.b(context);
        this.f.b(context);
    }

    public final void a(com.my.tracker.builders.a aVar) {
        this.b.a(aVar);
        this.c.a(aVar);
        this.d.a(aVar);
        this.e.a(aVar);
        this.f.a(aVar);
        this.g.a(aVar);
    }

    @Override // com.my.tracker.providers.a
    public final void a(Context context) {
        super.a(context);
        this.b.a(context);
        this.c.a(context);
        this.d.a(context);
        this.e.a(context);
        this.g.a(context);
        this.f.a(context);
    }
}
