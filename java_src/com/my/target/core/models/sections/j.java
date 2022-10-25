package com.my.target.core.models.sections;
/* compiled from: StandardSection.java */
/* loaded from: classes2.dex */
public final class j extends a<com.my.target.core.models.banners.j> {
    private final com.my.target.core.models.j i;
    private int j;
    private boolean k;
    private boolean l;
    private int m;
    private boolean n;

    public final com.my.target.core.models.j i() {
        return this.i;
    }

    public final boolean j() {
        return this.n;
    }

    public final void a(boolean z) {
        this.n = z;
    }

    public j(String str, int i) {
        super("standard", str, i);
        this.n = true;
        this.i = new com.my.target.core.models.j();
        this.j = 60;
        this.k = true;
        this.l = true;
        this.m = 1;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (!(dVar instanceof com.my.target.core.models.banners.j) || b(dVar.getId()) != null) {
            return false;
        }
        this.f.add((com.my.target.core.models.banners.j) dVar);
        this.d++;
        return true;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return a(dVar);
    }

    public final void a(int i) {
        this.j = i;
    }

    public final void b(boolean z) {
        this.k = z;
    }

    public final void c(boolean z) {
        this.l = z;
    }

    public final void b(int i) {
        this.m = i;
    }

    public final int k() {
        return this.j;
    }

    public final boolean l() {
        return this.k;
    }

    public final boolean m() {
        return this.l;
    }

    public final int n() {
        return this.m;
    }
}
