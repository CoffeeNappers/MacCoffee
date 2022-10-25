package com.my.target.core.models.banners;

import com.my.target.nativeads.models.ImageData;
import java.util.List;
/* compiled from: FSImageBanner.java */
/* loaded from: classes2.dex */
public final class f extends a {
    private ImageData a;
    private ImageData b;
    private List<ImageData> c;
    private List<ImageData> d;
    private ImageData e;
    private boolean f;

    public final void a(boolean z) {
        this.f = z;
    }

    public f(String str, String str2) {
        super(str, str2);
        this.f = true;
    }

    public final ImageData a() {
        return this.e;
    }

    public final void a(ImageData imageData) {
        this.e = imageData;
    }

    public final List<ImageData> b() {
        return this.c;
    }

    public final void a(List<ImageData> list) {
        this.c = list;
    }

    public final List<ImageData> c() {
        return this.d;
    }

    public final void b(List<ImageData> list) {
        this.d = list;
    }

    public final ImageData d() {
        return this.a;
    }

    public final void b(ImageData imageData) {
        this.a = imageData;
    }

    public final ImageData e() {
        return this.b;
    }

    public final void c(ImageData imageData) {
        this.b = imageData;
    }
}
