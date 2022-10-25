package com.my.target.core.models.sections;

import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* compiled from: InstreamAudioSection.java */
/* loaded from: classes2.dex */
public final class g extends a<com.my.target.core.models.banners.a> {
    @Nullable
    private List<c> i;

    public g(String str, int i) {
        super("instreamaudioads", str, i);
        this.i = new ArrayList();
        for (String str2 : com.my.target.core.enums.a.a) {
            this.i.add(new c(str2));
        }
    }

    @Override // com.my.target.core.models.sections.a, com.my.target.core.models.sections.i
    public final int b() {
        int i = 0;
        if (this.i == null) {
            return 0;
        }
        Iterator<c> it = this.i.iterator();
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

    public final c c(String str) {
        if (this.i != null) {
            for (c cVar : this.i) {
                if (str.equals(cVar.e())) {
                    return cVar;
                }
            }
        }
        return null;
    }
}
