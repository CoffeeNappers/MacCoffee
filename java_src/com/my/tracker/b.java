package com.my.tracker;

import android.text.TextUtils;
/* compiled from: TrackerParams.java */
/* loaded from: classes2.dex */
public final class b {
    private final String a;
    private volatile boolean b = true;
    private volatile boolean c = false;
    private volatile boolean d = true;
    private volatile boolean e = true;
    private volatile String f = null;
    private volatile int g = 30;
    private volatile String h = null;
    private volatile String i = null;
    private volatile String j = null;
    private volatile String[] k = null;
    private volatile String[] l = null;
    private volatile String[] m = null;
    private volatile String[] n = null;
    private volatile String[] o = null;
    private volatile int p = -1;
    private volatile int q = -1;
    private volatile String r = null;

    public final int a() {
        return this.p;
    }

    public final String b() {
        if (this.o == null || this.o.length <= 0) {
            return null;
        }
        return this.o[0];
    }

    public final String[] c() {
        if (this.o == null) {
            return null;
        }
        return (String[]) this.o.clone();
    }

    public final String d() {
        if (this.k == null || this.k.length <= 0) {
            return null;
        }
        return this.k[0];
    }

    public final String[] e() {
        if (this.k == null) {
            return null;
        }
        return (String[]) this.k.clone();
    }

    public final int f() {
        return this.q;
    }

    public final String g() {
        if (this.n == null || this.n.length <= 0) {
            return null;
        }
        return this.n[0];
    }

    public final String[] h() {
        if (this.n == null) {
            return null;
        }
        return (String[]) this.n.clone();
    }

    public final String i() {
        return this.a;
    }

    public final String j() {
        return this.r;
    }

    public final int k() {
        return this.g;
    }

    public final String l() {
        return this.h;
    }

    public final String m() {
        return this.j;
    }

    public final String n() {
        return this.i;
    }

    public final String o() {
        if (this.l == null || this.l.length <= 0) {
            return null;
        }
        return this.l[0];
    }

    public final String[] p() {
        if (this.l == null) {
            return null;
        }
        return (String[]) this.l.clone();
    }

    public final String q() {
        if (this.m == null || this.m.length <= 0) {
            return null;
        }
        return this.m[0];
    }

    public final String[] r() {
        if (this.m == null) {
            return null;
        }
        return (String[]) this.m.clone();
    }

    public final String s() {
        return this.f;
    }

    public final boolean t() {
        return this.c;
    }

    public final boolean u() {
        return this.e;
    }

    public final boolean v() {
        return this.b;
    }

    public final boolean w() {
        return this.d;
    }

    public final void a(int i) {
        this.p = i;
    }

    public final void a(String str) {
        if (TextUtils.isEmpty(str)) {
            this.o = null;
        } else {
            this.o = new String[]{str};
        }
    }

    public final void a(String[] strArr) {
        if (strArr == null) {
            this.o = null;
        } else {
            this.o = (String[]) strArr.clone();
        }
    }

    public final void x() {
        this.f = "com.my.games.vendorapp";
    }

    public final void b(String str) {
        if (TextUtils.isEmpty(str)) {
            this.k = null;
        } else {
            this.k = new String[]{str};
        }
    }

    public final void b(String[] strArr) {
        if (strArr == null) {
            this.k = null;
        } else {
            this.k = (String[]) strArr.clone();
        }
    }

    public final void b(int i) {
        this.q = i;
    }

    public final void c(String str) {
        if (TextUtils.isEmpty(str)) {
            this.n = null;
        } else {
            this.n = new String[]{str};
        }
    }

    public final void c(String[] strArr) {
        if (strArr == null) {
            this.n = null;
        } else {
            this.n = (String[]) strArr.clone();
        }
    }

    public final void d(String str) {
        this.r = str;
    }

    public final void c(int i) {
        if (i > 7200) {
            i = 7200;
        } else if (i < 30) {
            i = 30;
        }
        this.g = i;
    }

    public final void e(String str) {
        this.h = str;
    }

    public final void f(String str) {
        this.j = str;
    }

    public final void g(String str) {
        this.i = str;
    }

    public final void h(String str) {
        if (TextUtils.isEmpty(str)) {
            this.l = null;
        } else {
            this.l = new String[]{str};
        }
    }

    public final void d(String[] strArr) {
        if (strArr == null) {
            this.l = null;
        } else {
            this.l = (String[]) strArr.clone();
        }
    }

    public final void a(boolean z) {
        this.c = z;
    }

    public final void b(boolean z) {
        this.e = z;
    }

    public final void c(boolean z) {
        this.b = z;
    }

    public final void d(boolean z) {
        this.d = z;
    }

    public final void i(String str) {
        if (TextUtils.isEmpty(str)) {
            this.m = null;
        } else {
            this.m = new String[]{str};
        }
    }

    public final void e(String[] strArr) {
        if (strArr == null) {
            this.m = null;
        } else {
            this.m = (String[]) strArr.clone();
        }
    }

    public final void j(String str) {
        this.f = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(String str) {
        this.a = str;
    }

    public final void a(com.my.tracker.builders.a aVar) {
        aVar.a(this.a);
        if (this.g != 30) {
            aVar.g(this.g);
        }
        if (!this.d) {
            aVar.a();
        }
        if (!this.b) {
            aVar.b();
        }
        if (!this.e) {
            aVar.c();
        }
        if (this.h != null) {
            aVar.u(this.h);
        }
        if (this.i != null) {
            aVar.v(this.i);
        }
        if (this.j != null) {
            aVar.d(this.j);
        }
        if (this.k != null && this.k.length > 0) {
            aVar.a(this.k);
        }
        if (this.l != null && this.l.length > 0) {
            aVar.b(this.l);
        }
        if (this.m != null && this.m.length > 0) {
            aVar.c(this.m);
        }
        if (this.n != null && this.n.length > 0) {
            aVar.d(this.n);
        }
        if (this.o != null && this.o.length > 0) {
            aVar.e(this.o);
        }
        if (this.p >= 0) {
            aVar.e(this.p);
        }
        if (this.q == 0 || this.q == 1 || this.q == 2) {
            aVar.f(this.q);
        }
        if (this.r != null) {
            aVar.j(this.r);
        }
    }
}
