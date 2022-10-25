package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.Tracer;
/* compiled from: StoreAdDataCommand.java */
/* loaded from: classes2.dex */
public final class j extends a<Boolean> {
    private int e;
    private long f;
    private String g;

    @Override // com.my.target.core.async.commands.a, com.my.target.core.async.commands.b
    public final /* bridge */ /* synthetic */ String a() {
        return super.a();
    }

    public j(long j, int i, String str, Context context) {
        super(context);
        this.e = i;
        this.g = str;
        this.f = j;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [T, java.lang.Boolean] */
    /* JADX WARN: Type inference failed for: r0v8, types: [T, java.lang.Boolean] */
    @Override // com.my.target.core.async.commands.a
    protected final void c() {
        com.my.target.core.utils.d a = com.my.target.core.utils.d.a(this.b);
        if (a == null) {
            this.c = false;
            Tracer.d("StoreAdDataCommand can't open file cache");
            return;
        }
        this.c = Boolean.valueOf(a.a(Integer.toString(this.e), this.g, this.f));
        Tracer.d("StoreAdDataCommand complete with status: " + this.c);
    }
}
