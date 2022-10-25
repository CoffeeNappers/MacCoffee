package com.my.target.core.models.sections;
/* compiled from: NativeAdSection.java */
/* loaded from: classes2.dex */
public final class h extends a<com.my.target.core.models.banners.h> {
    private String i;
    private String j;
    private boolean k;
    private boolean l;

    public final boolean i() {
        return this.l;
    }

    public final void a(boolean z) {
        this.l = z;
    }

    public h(String str, int i) {
        super("nativeads", str, i);
        this.k = true;
        this.i = "Close";
        this.j = "Replay";
        this.l = false;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (!(dVar instanceof com.my.target.core.models.banners.h) || b(dVar.getId()) != null) {
            return false;
        }
        this.f.add((com.my.target.core.models.banners.h) dVar);
        this.d++;
        return true;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return a(dVar);
    }

    public final boolean j() {
        return this.k;
    }

    public final void b(boolean z) {
        this.k = z;
    }

    public final String k() {
        return this.i;
    }

    public final void c(String str) {
        this.i = str;
    }

    public final String l() {
        return this.j;
    }

    public final void d(String str) {
        this.j = str;
    }
}
