package com.my.target.core.facades;

import android.content.Context;
import com.my.target.Tracer;
import com.my.target.core.facades.c;
import com.my.target.core.net.b;
import com.my.target.nativeads.models.ImageData;
import java.util.ArrayList;
import java.util.List;
/* compiled from: InterstitialImageAd.java */
/* loaded from: classes2.dex */
public final class d implements c {
    private com.my.target.core.models.banners.f a;
    private com.my.target.core.models.c b;
    private Context c;
    private c.a d;
    private b.a e = new b.a() { // from class: com.my.target.core.facades.d.1
        @Override // com.my.target.core.net.b.a
        public final void onLoad() {
            if (d.this.d != null) {
                d.this.d.onLoad(d.this);
            }
        }
    };

    public d(com.my.target.core.models.banners.f fVar, com.my.target.core.models.c cVar, Context context) {
        this.a = fVar;
        this.b = cVar;
        this.c = context;
        Tracer.i("InterstitialImageAd created. Version: 4.6.4");
    }

    private ImageData a(List<ImageData> list, int i, int i2) {
        float height;
        float f;
        if (i2 == 0) {
            Tracer.i("Display height is zero");
            return null;
        }
        float f2 = i / i2;
        ImageData imageData = null;
        float f3 = 0.0f;
        for (ImageData imageData2 : list) {
            if (imageData2.getWidth() <= 0 || imageData2.getHeight() <= 0) {
                com.my.target.core.async.a.a("Image has invalid size: w=" + imageData2.getWidth() + " h=" + imageData2.getHeight() + " in banner with id: " + this.a.getId(), getClass().getName(), 40, "JSONError", imageData2.getUrl(), this.c);
            } else {
                float width = imageData2.getWidth() / imageData2.getHeight();
                if (f2 < width) {
                    float width2 = imageData2.getWidth();
                    if (width2 > i) {
                        width2 = i;
                    }
                    float f4 = width2 / width;
                    f = width2;
                    height = f4;
                } else {
                    height = imageData2.getHeight();
                    if (height > i2) {
                        height = i2;
                    }
                    f = width * height;
                }
                float f5 = height * f;
                if (f5 <= f3) {
                    break;
                }
                imageData = imageData2;
                f3 = f5;
            }
        }
        return imageData;
    }

    @Override // com.my.target.core.facades.c
    public final boolean a() {
        if (this.a == null) {
            return false;
        }
        return (this.a.e() != null && this.a.e().getData() != null) || (this.a.d() != null && this.a.d().getData() != null);
    }

    @Override // com.my.target.core.facades.c
    public final void a(c.a aVar) {
        this.d = aVar;
    }

    @Override // com.my.target.core.facades.g
    public final void load() {
        com.my.target.core.models.banners.f fVar = this.a;
        ArrayList arrayList = new ArrayList();
        com.my.target.core.providers.d.a().b().b(this.c);
        int a = com.my.target.core.providers.d.a().b().a();
        int b = com.my.target.core.providers.d.a().b().b();
        ImageData a2 = a(fVar.b(), Math.min(a, b), Math.max(a, b));
        if (a2 != null) {
            arrayList.add(a2);
            fVar.b(a2);
        }
        ImageData a3 = a(fVar.c(), Math.max(a, b), Math.min(a, b));
        if (a3 != null) {
            arrayList.add(a3);
            fVar.c(a3);
        }
        if ((a2 != null || a3 != null) && fVar.a() != null) {
            arrayList.add(fVar.a());
        }
        if (arrayList.size() > 0) {
            com.my.target.core.net.b.a().a(arrayList, this.c, this.e);
        } else if (this.d != null) {
            this.d.onError("No ad", this);
        }
    }

    public final com.my.target.core.models.banners.f b() {
        return this.a;
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

    public final void c() {
        if (this.d != null) {
            this.d.onDismiss(this);
        }
    }
}
