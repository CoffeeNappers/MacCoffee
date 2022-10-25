package com.my.target.core.models.sections;

import com.my.target.core.models.banners.m;
import com.my.target.core.models.l;
import java.util.ArrayList;
/* compiled from: VideoAdSection.java */
/* loaded from: classes2.dex */
public final class k extends a<m> {
    private final l i;
    private ArrayList<com.my.target.core.models.d> j;
    private ArrayList<com.my.target.core.models.d> k;

    public final ArrayList<com.my.target.core.models.d> i() {
        return this.j;
    }

    public final ArrayList<com.my.target.core.models.d> j() {
        return this.k;
    }

    public final l k() {
        return this.i;
    }

    public k(String str) {
        super("video", str, 0);
        this.j = new ArrayList<>();
        this.k = new ArrayList<>();
        this.i = new l();
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if (("video".equals(dVar.getType()) || "statistics".equals(dVar.getType())) && b(dVar.getId()) == null) {
            this.f.add((m) dVar);
            this.d++;
            return true;
        }
        return false;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        if (("video".equals(dVar.getType()) || "statistics".equals(dVar.getType())) && b(dVar.getId()) == null) {
            if (i > this.f.size()) {
                i = this.f.size();
            }
            this.f.add(i, (m) dVar);
            this.d++;
            return true;
        }
        return false;
    }

    public final boolean a(com.my.target.core.models.d dVar) {
        if (dVar.o() && !this.k.contains(dVar)) {
            this.k.add(dVar);
            return true;
        } else if (dVar.n() && !this.j.contains(dVar)) {
            this.j.add(dVar);
            return true;
        } else {
            return false;
        }
    }

    public final com.my.target.core.models.d l() {
        if (!this.j.isEmpty()) {
            return this.j.remove(0);
        }
        return null;
    }
}
