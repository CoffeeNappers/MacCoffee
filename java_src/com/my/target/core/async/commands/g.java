package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.core.async.commands.c;
import java.util.ArrayList;
/* compiled from: LoadVideoServiceCommand.java */
/* loaded from: classes2.dex */
public final class g extends e {
    private final ArrayList<com.my.target.core.models.d> g;

    /* JADX WARN: Multi-variable type inference failed */
    public g(com.my.target.core.models.c cVar, ArrayList<com.my.target.core.models.d> arrayList, com.my.target.core.a aVar, Context context) {
        super(context);
        this.c = cVar;
        this.g = arrayList;
        this.f = aVar;
    }

    @Override // com.my.target.core.async.commands.e, com.my.target.core.async.commands.c, com.my.target.core.async.commands.a
    protected final void c() {
        a(this.g, (com.my.target.core.models.c) this.c, new c.a());
    }
}
