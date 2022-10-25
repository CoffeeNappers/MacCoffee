package com.my.target.core.models.banners;

import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.models.VideoData;
import java.util.ArrayList;
import java.util.List;
/* compiled from: VideoBanner.java */
/* loaded from: classes2.dex */
public class m extends a {
    private float a;
    private boolean b;
    private float c;
    private List<VideoData> d;
    private float e;
    private float f;
    private boolean g;
    private boolean h;
    private ImageData i;
    private String j;
    private String k;
    private boolean l;
    private boolean m;
    private boolean n;
    private boolean o;

    public final float a() {
        return this.e;
    }

    public final float b() {
        return this.f;
    }

    public final void a(float f) {
        this.e = f;
    }

    public final void b(float f) {
        this.f = f;
    }

    public final boolean c() {
        return this.m;
    }

    public final boolean d() {
        return this.n;
    }

    public final void a(boolean z) {
        this.m = z;
    }

    public final void b(boolean z) {
        this.n = z;
    }

    public final void c(boolean z) {
        this.o = z;
    }

    public final boolean e() {
        return this.o;
    }

    public m(String str, String str2) {
        super(str, str2);
        this.g = true;
        this.h = true;
        this.d = new ArrayList();
    }

    public final float f() {
        return this.a;
    }

    public final void c(float f) {
        this.a = f;
    }

    public final boolean g() {
        return this.b;
    }

    public final void d(boolean z) {
        this.b = z;
    }

    public final float h() {
        return this.c;
    }

    public final void d(float f) {
        this.c = f;
    }

    public final boolean i() {
        return this.g;
    }

    public final void e(boolean z) {
        this.g = z;
    }

    public final void f(boolean z) {
        this.h = z;
    }

    public final ImageData j() {
        return this.i;
    }

    public final void a(ImageData imageData) {
        this.i = imageData;
    }

    public final String k() {
        return this.j;
    }

    public final void a(String str) {
        this.j = str;
    }

    public final String l() {
        return this.k;
    }

    public final void b(String str) {
        this.k = str;
    }

    public final List<VideoData> m() {
        return this.d;
    }

    public final void a(List<VideoData> list) {
        this.d = list;
    }

    public final boolean n() {
        return this.l;
    }

    public final void g(boolean z) {
        this.l = z;
    }

    @Override // com.my.target.core.models.banners.a
    public synchronized boolean addStat(com.my.target.core.models.k kVar) {
        boolean addStat;
        if (kVar.c().equals("playheadReachedValue")) {
            com.my.target.core.models.i iVar = (com.my.target.core.models.i) kVar;
            if (iVar.b() != 0.0f) {
                iVar.a((iVar.b() * this.a) / 100.0f);
            }
            addStat = super.addStat(iVar);
        } else {
            addStat = super.addStat(kVar);
        }
        return addStat;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("VideoBanner{");
        sb.append("id=").append(this.id);
        sb.append(", duration=").append(this.a);
        sb.append(", allowClose=").append(this.b);
        sb.append(", allowCloseDelay=").append(this.c);
        sb.append(", videoDatas=").append(this.d);
        sb.append(", autoPlay=").append(this.g);
        sb.append(", hasCtaButton=").append(this.h);
        sb.append(", preview=").append(this.i);
        sb.append('}');
        return sb.toString();
    }
}
