package com.my.target.core.engines;

import android.content.Context;
import android.view.ViewGroup;
/* compiled from: AbstractAdEngine.java */
/* loaded from: classes2.dex */
public abstract class a implements b {
    protected ViewGroup a;
    protected Context b;

    public a(ViewGroup viewGroup, Context context) {
        this.a = viewGroup;
        this.b = context;
    }

    @Override // com.my.target.core.engines.b
    public void a(com.my.target.core.facades.g gVar) {
    }

    @Override // com.my.target.core.engines.b
    public void a() {
    }

    @Override // com.my.target.core.engines.b
    public void b() {
    }

    @Override // com.my.target.core.engines.b
    public void c() {
    }

    @Override // com.my.target.core.engines.b
    public void d() {
    }

    @Override // com.my.target.core.engines.b
    public void e() {
    }

    @Override // com.my.target.core.engines.b
    public void f() {
        this.b = null;
        this.a = null;
    }
}
