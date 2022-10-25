package com.my.target.core.models.sections;

import com.my.target.core.models.banners.d;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* compiled from: AbstractSection.java */
/* loaded from: classes2.dex */
public abstract class a<T extends com.my.target.core.models.banners.d> extends com.my.target.core.models.b implements i<T> {
    protected final String a;
    protected String b;
    protected int c;
    protected String e;
    protected String g;
    protected int d = 0;
    protected ArrayList<T> f = new ArrayList<>();
    protected ArrayList<com.my.target.core.models.k> h = new ArrayList<>();

    @Override // com.my.target.core.models.sections.i
    public final String a() {
        return this.a;
    }

    @Override // com.my.target.core.models.sections.i
    public int b() {
        return this.d;
    }

    @Override // com.my.target.core.models.sections.i
    public final String c() {
        return this.e;
    }

    @Override // com.my.target.core.models.sections.i
    public final int d() {
        return this.c;
    }

    @Override // com.my.target.core.models.sections.i
    public final String e() {
        return this.b;
    }

    @Override // com.my.target.core.models.sections.i
    public final void a(String str) {
        this.g = str;
    }

    @Override // com.my.target.core.models.sections.i
    public final String f() {
        return this.g;
    }

    public a(String str, String str2, int i) {
        this.a = str;
        this.b = str2;
        this.c = i;
    }

    @Override // com.my.target.core.models.sections.i
    public final T b(String str) {
        Iterator<T> it = this.f.iterator();
        while (it.hasNext()) {
            T next = it.next();
            if (next.getId().equals(str)) {
                return next;
            }
        }
        return null;
    }

    @Override // com.my.target.core.models.sections.i
    public final ArrayList<T> g() {
        return new ArrayList<>(this.f);
    }

    public final synchronized boolean a(com.my.target.core.models.k kVar) {
        boolean z;
        if (!this.h.contains(kVar)) {
            this.h.add(kVar);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    @Override // com.my.target.core.models.sections.i
    public final ArrayList<com.my.target.core.models.k> h() {
        return new ArrayList<>(this.h);
    }

    public final void a(List<com.my.target.core.models.k> list) {
        for (com.my.target.core.models.k kVar : list) {
            a(kVar);
        }
    }
}
