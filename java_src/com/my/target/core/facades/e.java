package com.my.target.core.facades;

import android.content.Context;
import com.my.target.Tracer;
import com.my.target.ads.instream.InstreamAd;
import com.my.target.core.facades.c;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.i;
import com.my.target.core.net.b;
import com.my.target.core.utils.n;
import java.util.ArrayList;
import java.util.Set;
/* compiled from: InterstitialPromoAd.java */
/* loaded from: classes2.dex */
public final class e implements c {
    private com.my.target.core.models.banners.g a;
    private com.my.target.core.models.c b;
    private Context c;
    private c.a d;
    private b.a e = new b.a() { // from class: com.my.target.core.facades.e.1
        @Override // com.my.target.core.net.b.a
        public final void onLoad() {
            if (e.this.d != null) {
                e.this.d.onLoad(e.this);
            }
        }
    };

    public e(com.my.target.core.models.banners.g gVar, com.my.target.core.models.c cVar, Context context) {
        this.a = gVar;
        this.b = cVar;
        this.c = context;
        Tracer.i("InterstitialPromoAd created. Version: 4.6.4");
    }

    @Override // com.my.target.core.facades.c
    public final boolean a() {
        return true;
    }

    @Override // com.my.target.core.facades.c
    public final void a(c.a aVar) {
        this.d = aVar;
    }

    public final void a(com.my.target.core.models.banners.d dVar) {
        if (this.b != null) {
            com.my.target.core.models.c.c(dVar, this.c);
        }
        if (this.d != null) {
            this.d.onDisplay(this);
        }
    }

    public final void b(com.my.target.core.models.banners.d dVar) {
        if (this.b != null) {
            this.b.a(dVar, this.c);
        }
        if (this.d != null) {
            this.d.onClick(this);
        }
    }

    @Override // com.my.target.core.facades.g
    public final void load() {
        ArrayList arrayList = new ArrayList();
        if (this.a.getImage() != null) {
            arrayList.add(this.a.getImage());
        }
        if (this.a.getIcon() != null) {
            arrayList.add(this.a.getIcon());
        }
        m a = this.a.a();
        if (a != null) {
            if (a.j() != null) {
                arrayList.add(a.j());
            }
            arrayList.add(n.a(a.m(), InstreamAd.DEFAULT_VIDEO_QUALITY));
        }
        if (this.a.b() != null) {
            arrayList.add(this.a.b());
        }
        if (this.a.c() != null) {
            arrayList.add(this.a.c());
        }
        if (this.a.e() != null) {
            arrayList.add(this.a.e());
        }
        if (arrayList.isEmpty()) {
            if (this.d != null) {
                this.d.onLoad(this);
                return;
            }
            return;
        }
        com.my.target.core.net.b.a().a(arrayList, this.c, this.e);
    }

    public final com.my.target.core.models.banners.g b() {
        return this.a;
    }

    public final void a(m mVar, Set<i> set, float f) {
        if (mVar != null) {
            com.my.target.core.models.c.a(set, f, this.c);
        }
    }

    public final void a(com.my.target.core.models.banners.d dVar, String str) {
        if (dVar != null) {
            com.my.target.core.models.c.a(dVar, str, this.c);
        }
    }

    public final void c() {
        if (this.d != null) {
            this.d.onVideoCompleted(this);
        }
    }

    public final void d() {
        if (this.d != null) {
            this.d.onDismiss(this);
        }
    }
}
