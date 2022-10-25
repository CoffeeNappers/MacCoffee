package com.my.target.core.models.banners;

import com.my.target.nativeads.models.ImageData;
/* compiled from: StandardBanner.java */
/* loaded from: classes2.dex */
public final class j extends a {
    private String a;
    private String b;
    private String c;
    private ImageData d;
    private ImageData e;
    private int f;
    private String g;
    private String h;
    private float i;
    private ImageData j;

    public final ImageData a() {
        return this.j;
    }

    public final String b() {
        return this.a;
    }

    public final void a(ImageData imageData) {
        this.j = imageData;
    }

    public final String c() {
        return this.b;
    }

    public final String d() {
        return this.c;
    }

    public final String e() {
        return this.h;
    }

    public final ImageData f() {
        return this.d;
    }

    public final float g() {
        return this.i;
    }

    public final int h() {
        return this.f;
    }

    public final void a(String str) {
        this.g = str;
    }

    public final void b(String str) {
        this.b = str;
    }

    public final void c(String str) {
        this.c = str;
    }

    public final void d(String str) {
        this.h = str;
    }

    public final void b(ImageData imageData) {
        this.e = imageData;
    }

    public final void c(ImageData imageData) {
        this.d = imageData;
    }

    public final void a(float f) {
        this.i = f;
    }

    public final void e(String str) {
        this.a = str;
    }

    public final void a(int i) {
        this.f = i;
    }

    public j(String str, String str2) {
        super(str, str2);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("StandardBanner{");
        sb.append("id=").append(this.id);
        sb.append("title=").append(this.a);
        sb.append('}');
        return sb.toString();
    }
}
