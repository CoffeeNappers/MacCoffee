package com.my.target.core.facades;

import android.content.Context;
import com.my.target.Tracer;
import com.my.target.core.facades.c;
import com.my.target.core.net.b;
import com.my.target.nativeads.models.ImageData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* compiled from: InterstitialSliderAppwallAd.java */
/* loaded from: classes2.dex */
public final class f implements c {
    private final com.my.target.core.models.sections.e a;
    private final ArrayList<com.my.target.core.models.banners.f> b;
    private final com.my.target.core.models.c c;
    private final Context d;
    private c.a e;
    private b.a f = new b.a() { // from class: com.my.target.core.facades.f.1
        @Override // com.my.target.core.net.b.a
        public final void onLoad() {
            if (f.a(f.this)) {
                if (f.this.e != null) {
                    f.this.e.onLoad(f.this);
                    return;
                }
                return;
            }
            Tracer.d("InterstitialSliderAppwallAd: failed to load images");
            if (f.this.e != null) {
                f.this.e.onError("Failed to load all images", f.this);
            }
        }
    };
    private boolean g;

    public final ArrayList<com.my.target.core.models.banners.f> b() {
        return this.b;
    }

    public final com.my.target.core.models.sections.e c() {
        return this.a;
    }

    public f(com.my.target.core.models.sections.e eVar, com.my.target.core.models.c cVar, Context context) {
        this.a = eVar;
        this.b = eVar.g();
        this.c = cVar;
        this.d = context;
        Tracer.i("InterstitialSliderAppwallAd created. Version: 4.6.4");
    }

    @Override // com.my.target.core.facades.c
    public final boolean a() {
        Iterator<com.my.target.core.models.banners.f> it = this.b.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.f next = it.next();
            if ((next.d() != null && next.d().getData() != null) || (next.e() != null && next.e().getData() != null)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.my.target.core.facades.c
    public final void a(c.a aVar) {
        this.e = aVar;
    }

    public final void a(com.my.target.core.models.banners.d dVar) {
        if (this.c != null) {
            com.my.target.core.models.c.c(dVar, this.d);
        }
        if (this.e != null && !this.g) {
            this.e.onDisplay(this);
            this.g = true;
        }
    }

    public final void b(com.my.target.core.models.banners.d dVar) {
        if (this.c != null) {
            this.c.a(dVar, this.d);
        }
        if (this.e != null) {
            this.e.onClick(this);
        }
    }

    public final void d() {
        if (this.e != null) {
            this.e.onDismiss(this);
        }
    }

    @Override // com.my.target.core.facades.g
    public final void load() {
        ArrayList<com.my.target.core.models.banners.f> arrayList = this.b;
        ArrayList arrayList2 = new ArrayList();
        Iterator<com.my.target.core.models.banners.f> it = arrayList.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.f next = it.next();
            if (next.b() != null && !next.b().isEmpty()) {
                ImageData imageData = next.b().get(0);
                arrayList2.add(imageData);
                next.b(imageData);
            }
            if (next.c() != null && !next.c().isEmpty()) {
                ImageData imageData2 = next.c().get(0);
                arrayList2.add(imageData2);
                next.c(imageData2);
            }
        }
        if (this.a.k() != null) {
            arrayList2.add(this.a.k());
        }
        if (arrayList2.size() > 0) {
            com.my.target.core.net.b.a().a(arrayList2, this.d, this.f);
        } else if (this.e != null) {
            this.e.onError("No ad", this);
        }
    }

    static /* synthetic */ boolean a(f fVar) {
        boolean z;
        boolean z2;
        Iterator<com.my.target.core.models.banners.f> it = fVar.b.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.f next = it.next();
            List<ImageData> c = next.c();
            List<ImageData> b = next.b();
            if (c != null) {
                boolean z3 = false;
                for (ImageData imageData : c) {
                    z3 = imageData.getBitmap() != null ? true : z3;
                }
                z = z3;
            } else {
                z = false;
            }
            if (b != null) {
                Iterator<ImageData> it2 = b.iterator();
                while (true) {
                    z2 = z;
                    if (!it2.hasNext()) {
                        break;
                    }
                    z = it2.next().getBitmap() != null ? true : z2;
                }
            } else {
                z2 = z;
            }
            if (!z2) {
                it.remove();
            }
        }
        return !fVar.b.isEmpty();
    }
}
