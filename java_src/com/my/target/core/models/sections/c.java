package com.my.target.core.models.sections;

import com.google.android.exoplayer2.util.MimeTypes;
import java.util.ArrayList;
/* compiled from: AudioAdSection.java */
/* loaded from: classes2.dex */
public final class c extends a<com.my.target.core.models.banners.c> {
    private final com.my.target.core.models.f i;
    private ArrayList<com.my.target.core.models.d> j;
    private ArrayList<com.my.target.core.models.d> k;

    public final ArrayList<com.my.target.core.models.d> i() {
        return this.j;
    }

    public final ArrayList<com.my.target.core.models.d> j() {
        return this.k;
    }

    public final com.my.target.core.models.f k() {
        return this.i;
    }

    public c(String str) {
        super(MimeTypes.BASE_TYPE_AUDIO, str, 0);
        this.j = new ArrayList<>();
        this.k = new ArrayList<>();
        this.i = new com.my.target.core.models.f();
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        if ((MimeTypes.BASE_TYPE_AUDIO.equals(dVar.getType()) || "statistics".equals(dVar.getType())) && b(dVar.getId()) == null) {
            this.f.add((com.my.target.core.models.banners.c) dVar);
            this.d++;
            return true;
        }
        return false;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        if ((MimeTypes.BASE_TYPE_AUDIO.equals(dVar.getType()) || "statistics".equals(dVar.getType())) && b(dVar.getId()) == null) {
            if (i > this.f.size()) {
                i = this.f.size();
            }
            this.f.add(i, (com.my.target.core.models.banners.c) dVar);
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
