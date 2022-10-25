package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.Tracer;
/* compiled from: LoadAppwallAdCommand.java */
/* loaded from: classes2.dex */
public final class d extends c {
    public d(com.my.target.core.models.d dVar, com.my.target.core.a aVar, Context context) {
        super(dVar, aVar, context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Type inference failed for: r0v6, types: [T, com.my.target.core.models.c] */
    @Override // com.my.target.core.async.commands.c, com.my.target.core.async.commands.a
    public final void c() {
        String str;
        if (this.f.a() > 0) {
            Context context = this.b;
            Tracer.d("LoadAppwallAdCommand allowed to check cache record");
            com.my.target.core.utils.d a = com.my.target.core.utils.d.a(context);
            if (a == null) {
                str = null;
            } else {
                str = a.a(Integer.toString(this.f.d()), this.f.a());
            }
            if (str != null) {
                Tracer.d("Cache value retrieved successfully");
                this.c = new com.my.target.core.models.c(this.f.a());
                ((com.my.target.core.models.c) this.c).a(this.e.m());
                com.my.target.core.parsers.b.a(str, (com.my.target.core.models.c) this.c, this.f, this.e, this.b);
                ((com.my.target.core.models.c) this.c).i();
                return;
            }
        }
        super.c();
    }
}
