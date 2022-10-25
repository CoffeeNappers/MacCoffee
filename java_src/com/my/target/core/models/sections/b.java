package com.my.target.core.models.sections;

import java.util.ArrayList;
import java.util.Iterator;
/* compiled from: AppwallSection.java */
/* loaded from: classes2.dex */
public final class b extends a<com.my.target.core.models.banners.b> {
    private String i;
    private boolean j;
    private String k;
    private String l;
    private String m;
    private String n;
    private String o;
    private String p;
    private String q;
    private String r;
    private String s;
    private ArrayList<com.my.target.core.models.g> t;

    public final void c(String str) {
        this.i = str;
    }

    public final void d(String str) {
        this.k = str;
    }

    public final void e(String str) {
        this.l = str;
    }

    public final void f(String str) {
        this.m = str;
    }

    public final String i() {
        return this.n;
    }

    public final void g(String str) {
        this.n = str;
    }

    public final void h(String str) {
        this.r = str;
    }

    public final String j() {
        return this.s;
    }

    public final void i(String str) {
        this.s = str;
    }

    public final void j(String str) {
        this.o = str;
    }

    public final String k() {
        return this.p;
    }

    public final void k(String str) {
        this.p = str;
    }

    public final String l() {
        return this.q;
    }

    public final void l(String str) {
        this.q = str;
    }

    public b(String str, int i) {
        super("appwall", str, i);
        this.j = false;
        this.t = new ArrayList<>();
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (!(dVar instanceof com.my.target.core.models.banners.b) || b(dVar.getId()) != null) {
            return false;
        }
        com.my.target.core.models.banners.b bVar = (com.my.target.core.models.banners.b) dVar;
        this.f.add(bVar);
        this.d++;
        if (!bVar.isHasNotification() || this.j) {
            return true;
        }
        this.j = true;
        return true;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return a(dVar);
    }

    public final boolean m(String str) {
        Iterator it = this.f.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.b bVar = (com.my.target.core.models.banners.b) it.next();
            if (bVar.getId().equals(str)) {
                return bVar.isHasNotification();
            }
        }
        return false;
    }

    public final boolean n(String str) {
        Iterator it = this.f.iterator();
        boolean z = false;
        while (it.hasNext()) {
            com.my.target.core.models.banners.b bVar = (com.my.target.core.models.banners.b) it.next();
            if (bVar.getId().equals(str)) {
                bVar.a(false);
            }
            z = !z ? bVar.isHasNotification() : z;
        }
        if (z != this.j) {
            this.j = z;
            return true;
        }
        return false;
    }

    public final boolean a(com.my.target.core.models.g gVar) {
        if (o(gVar.a()) == null) {
            this.t.add(gVar);
            return true;
        }
        return false;
    }

    public final com.my.target.core.models.g o(String str) {
        Iterator<com.my.target.core.models.g> it = this.t.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.g next = it.next();
            if (next.a().equals(str)) {
                return next;
            }
        }
        return null;
    }
}
