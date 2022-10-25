package com.my.target.core.models.banners;

import com.my.target.nativeads.banners.NativePromoBanner;
import com.my.target.nativeads.banners.NativePromoCard;
import com.my.target.nativeads.models.ImageData;
import java.util.ArrayList;
import java.util.List;
/* compiled from: NativeAdBanner.java */
/* loaded from: classes2.dex */
public class h extends a implements NativePromoBanner {
    protected String a;
    protected String b;
    protected String c;
    protected float d;
    protected int e;
    protected String f;
    protected String g;
    protected ImageData h;
    protected ImageData i;
    protected String j;
    private m k;
    private final List<i> l;

    public final List<i> m() {
        return this.l;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public List<NativePromoCard> getCards() {
        return this.l;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getTitle() {
        return this.a;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getDescription() {
        return this.b;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getDisclaimer() {
        return this.c;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public float getRating() {
        return this.d;
    }

    public final void d(ImageData imageData) {
        this.h = imageData;
    }

    public final void e(ImageData imageData) {
        this.i = imageData;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public int getVotes() {
        return this.e;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getCategory() {
        return this.f;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getSubcategory() {
        return this.g;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public String getDomain() {
        return this.j;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public ImageData getIcon() {
        return this.h;
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public ImageData getImage() {
        return this.i;
    }

    public m a() {
        return this.k;
    }

    public final void a(String str) {
        this.f = str;
    }

    public final void b(String str) {
        this.b = str;
    }

    public final void c(String str) {
        this.c = str;
    }

    public final void d(String str) {
        this.j = str;
    }

    public final void b(float f) {
        this.d = f;
    }

    public final void e(String str) {
        this.g = str;
    }

    public final void f(String str) {
        this.a = str;
    }

    public void a(m mVar) {
        this.k = mVar;
    }

    public final void f(int i) {
        this.e = i;
    }

    public h(String str, String str2) {
        super(str, str2);
        this.l = new ArrayList();
    }

    @Override // com.my.target.nativeads.banners.NativePromoBanner
    public boolean hasVideo() {
        return this.k != null;
    }
}
