package com.my.target.core.models.sections;

import com.my.target.core.models.l;
import com.my.target.nativeads.models.ImageData;
/* compiled from: FullscreenSection.java */
/* loaded from: classes2.dex */
public final class d extends a<com.my.target.core.models.banners.a> {
    private final l i;
    private ImageData j;
    private ImageData k;
    private ImageData l;
    private boolean m;
    private boolean n;
    private float o;
    private boolean p;
    private String q;
    private String r;
    private boolean s;
    private boolean t;
    private int u;
    private boolean v;

    public final float i() {
        return this.o;
    }

    public final String j() {
        return this.r;
    }

    public final ImageData k() {
        return this.j;
    }

    public final ImageData l() {
        return this.k;
    }

    public final String m() {
        return this.q;
    }

    public final ImageData n() {
        return this.l;
    }

    public final int o() {
        return this.u;
    }

    public final l p() {
        return this.i;
    }

    public final boolean q() {
        return this.s;
    }

    public final boolean r() {
        return this.t;
    }

    public final boolean s() {
        return this.v;
    }

    public final boolean t() {
        return this.n;
    }

    public final boolean u() {
        return this.m;
    }

    public final void a(boolean z) {
        this.v = z;
    }

    public final boolean v() {
        return this.p;
    }

    public final void b(boolean z) {
        this.s = z;
    }

    public final void a(float f) {
        this.o = f;
    }

    public final void c(boolean z) {
        this.t = z;
    }

    public final void c(String str) {
        this.r = str;
    }

    public final void a(ImageData imageData) {
        this.j = imageData;
    }

    public final void d(boolean z) {
        this.n = z;
    }

    public final void e(boolean z) {
        this.m = z;
    }

    public final void b(ImageData imageData) {
        this.k = imageData;
    }

    public final void d(String str) {
        this.q = str;
    }

    public final void f(boolean z) {
        this.p = z;
    }

    public final void c(ImageData imageData) {
        this.l = imageData;
    }

    public final void a(int i) {
        this.u = i;
    }

    public d(String str, int i) {
        super("fullscreen", str, i);
        this.p = true;
        this.q = "Replay";
        this.r = "Close";
        this.s = true;
        this.t = true;
        this.i = new l();
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (dVar instanceof com.my.target.core.models.banners.f) {
            if (b(dVar.getId()) == null) {
                this.f.add((com.my.target.core.models.banners.f) dVar);
                this.d++;
                return true;
            }
        } else if ((dVar instanceof com.my.target.core.models.banners.g) && b(dVar.getId()) == null) {
            this.f.add((com.my.target.core.models.banners.g) dVar);
            this.d++;
            return true;
        }
        return false;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return a(dVar);
    }
}
