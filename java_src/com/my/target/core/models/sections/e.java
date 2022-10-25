package com.my.target.core.models.sections;

import com.my.target.nativeads.models.ImageData;
/* compiled from: FullscreenSliderSection.java */
/* loaded from: classes2.dex */
public final class e extends a<com.my.target.core.models.banners.f> {
    private ImageData i;
    private int j;
    private int k;
    private int l;

    public final int i() {
        return this.k;
    }

    public final int j() {
        return this.l;
    }

    public final ImageData k() {
        return this.i;
    }

    public final int l() {
        return this.j;
    }

    public final void a(int i) {
        this.k = i;
    }

    public final void b(int i) {
        this.l = i;
    }

    public final void a(ImageData imageData) {
        this.i = imageData;
    }

    public final void c(int i) {
        this.j = i;
    }

    public e(String str, int i) {
        super("fullscreenslider", str, i);
        this.j = -1;
        this.k = -14696781;
        this.l = -16368537;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (!(dVar instanceof com.my.target.core.models.banners.f) || b(dVar.getId()) != null) {
            return false;
        }
        this.f.add((com.my.target.core.models.banners.f) dVar);
        this.d++;
        return true;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return a(dVar);
    }
}
