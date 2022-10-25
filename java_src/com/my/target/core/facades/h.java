package com.my.target.core.facades;

import android.content.Context;
import com.my.target.ads.CustomParams;
import com.my.target.core.models.banners.j;
import com.my.target.core.models.sections.i;
import java.util.ArrayList;
import org.json.JSONObject;
/* compiled from: StandardAd.java */
/* loaded from: classes2.dex */
public final class h extends com.my.target.core.facades.a {
    private final com.my.target.core.a a;
    private boolean b;
    private i c;
    private a d;

    /* compiled from: StandardAd.java */
    /* loaded from: classes2.dex */
    public interface a {
        void onLoad(h hVar);

        void onNoAd(String str, h hVar);
    }

    public final String a() {
        return this.a.c();
    }

    public final void a(a aVar) {
        this.d = aVar;
    }

    public final boolean b() {
        return this.b;
    }

    public h(int i, String str, Context context, CustomParams customParams, Boolean bool) {
        this.b = true;
        this.a = new com.my.target.core.a(i, str);
        if (customParams != null) {
            this.a.a(customParams);
        }
        this.b = bool.booleanValue();
        init(this.a, context);
    }

    public final String c() {
        if (this.adData != null) {
            return this.adData.e();
        }
        return null;
    }

    public final JSONObject d() {
        if (this.adData != null) {
            return this.adData.c();
        }
        return null;
    }

    public final String e() {
        if (this.c != null) {
            return this.c.c();
        }
        return null;
    }

    public final ArrayList<j> f() {
        if (this.c != null) {
            return this.c.g();
        }
        return null;
    }

    public final String g() {
        if (this.adData != null) {
            return this.adData.b();
        }
        return null;
    }

    public final void a(String str) {
        com.my.target.core.models.banners.d b;
        if (this.c == null || this.adData == null || (b = this.c.b(str)) == null) {
            return;
        }
        this.adData.a(b, this.context);
    }

    public final com.my.target.core.models.sections.j h() {
        if (this.c == null || !"standard".equals(this.c.a())) {
            return null;
        }
        return (com.my.target.core.models.sections.j) this.c;
    }

    public final void b(String str) {
        com.my.target.core.models.banners.d dVar = null;
        if (this.c != null) {
            dVar = this.c.b(str);
        }
        if (dVar != null) {
            com.my.target.core.models.c.c(dVar, this.context);
        }
    }

    public final h i() {
        h hVar = new h(this.a.d(), this.a.c(), this.context, this.a.b(), Boolean.valueOf(this.b));
        hVar.setTrackingEnvironmentEnabled(this.a.f());
        return hVar;
    }

    public final com.my.target.core.models.j j() {
        if (this.c == null || !"standard".equals(this.c.a())) {
            return null;
        }
        return ((com.my.target.core.models.sections.j) this.c).i();
    }

    @Override // com.my.target.core.facades.a
    protected final void onLoad(com.my.target.core.models.c cVar) {
        if (this.d != null) {
            if (cVar.g() && cVar.e() != null) {
                this.c = cVar.c(this.a.c());
                if (this.c == null) {
                    this.d.onNoAd("No ad", this);
                    return;
                } else {
                    this.d.onLoad(this);
                    return;
                }
            }
            this.d.onNoAd("No ad", this);
        }
    }

    @Override // com.my.target.core.facades.a
    protected final void onLoadError(String str) {
        if (this.d != null) {
            this.d.onNoAd(str, this);
        }
    }
}
