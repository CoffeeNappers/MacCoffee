package com.my.target.core.models.sections;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* compiled from: InstreamAdSection.java */
/* loaded from: classes2.dex */
public final class f extends a<com.my.target.core.models.banners.a> {
    private List<k> i;

    public f(String str, int i) {
        super("instreamads", str, i);
        this.i = new ArrayList();
        for (String str2 : com.my.target.core.enums.a.a) {
            this.i.add(new k(str2));
        }
    }

    @Override // com.my.target.core.models.sections.a, com.my.target.core.models.sections.i
    public final int b() {
        int i = 0;
        Iterator<k> it = this.i.iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                i = it.next().b() + i2;
            } else {
                return i2;
            }
        }
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(com.my.target.core.models.banners.d dVar) {
        return false;
    }

    @Override // com.my.target.core.models.sections.i
    public final boolean a(int i, com.my.target.core.models.banners.d dVar) {
        return false;
    }

    public final List<k> i() {
        return this.i;
    }

    public final k c(String str) {
        for (k kVar : this.i) {
            if (str.equals(kVar.e())) {
                return kVar;
            }
        }
        return null;
    }
}
