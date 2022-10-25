package com.my.target.core.models.banners;

import com.my.target.nativeads.banners.NativeAppwallBanner;
import com.my.target.nativeads.models.ImageData;
/* compiled from: AppwallBanner.java */
/* loaded from: classes2.dex */
public final class b extends a implements NativeAppwallBanner {
    private ImageData A;
    private String a;
    private String b;
    private String c;
    private String d;
    private String e;
    private String f;
    private int g;
    private int h;
    private int i;
    private int j;
    private int k;
    private float l;
    private boolean m;
    private boolean n;
    private boolean o;
    private boolean p;
    private boolean q;
    private boolean r;
    private boolean s;
    private ImageData t;
    private ImageData u;
    private ImageData v;
    private ImageData w;
    private ImageData x;
    private ImageData y;
    private ImageData z;

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getTitle() {
        return this.a;
    }

    public final void a(String str) {
        this.a = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getDescription() {
        return this.b;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getIcon() {
        return this.t;
    }

    public final void b(String str) {
        this.b = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getBubbleId() {
        return this.c;
    }

    public final void c(String str) {
        this.c = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getLabelType() {
        return this.d;
    }

    public final void d(String str) {
        this.d = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getStatus() {
        return this.e;
    }

    public final void e(String str) {
        this.e = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final String getPaidType() {
        return this.f;
    }

    public final void f(String str) {
        this.f = str;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final int getMrgsId() {
        return this.g;
    }

    public final void a(int i) {
        this.g = i;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final int getVotes() {
        return this.h;
    }

    public final void b(int i) {
        this.h = i;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final float getRating() {
        return this.l;
    }

    public final void a(float f) {
        this.l = f;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isHasNotification() {
        return this.m;
    }

    public final void a(boolean z) {
        this.m = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isMain() {
        return this.n;
    }

    public final void b(boolean z) {
        this.n = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isRequireCategoryHighlight() {
        return this.o;
    }

    public final void c(boolean z) {
        this.o = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isItemHighlight() {
        return this.p;
    }

    public final void d(boolean z) {
        this.p = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isBanner() {
        return this.q;
    }

    public final void e(boolean z) {
        this.q = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isRequireWifi() {
        return this.r;
    }

    public final void f(boolean z) {
        this.r = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final boolean isSubItem() {
        return this.s;
    }

    public final void g(boolean z) {
        this.s = z;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final int getCoins() {
        return this.i;
    }

    public final void c(int i) {
        this.i = i;
    }

    public final void a(ImageData imageData) {
        this.x = imageData;
    }

    public final void b(ImageData imageData) {
        this.t = imageData;
    }

    public final void c(ImageData imageData) {
        this.u = imageData;
    }

    public final void d(ImageData imageData) {
        this.v = imageData;
    }

    public final void e(ImageData imageData) {
        this.w = imageData;
    }

    public final void f(ImageData imageData) {
        this.y = imageData;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getCoinsIcon() {
        return this.u;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getLabelIcon() {
        return this.v;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getGotoAppIcon() {
        return this.w;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getStatusIcon() {
        return this.x;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getBubbleIcon() {
        return this.y;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final int getCoinsIconBgColor() {
        return this.j;
    }

    public final void d(int i) {
        this.j = i;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final int getCoinsIconTextColor() {
        return this.k;
    }

    public final void e(int i) {
        this.k = i;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getItemHighlightIcon() {
        return this.z;
    }

    public final void g(ImageData imageData) {
        this.z = imageData;
    }

    @Override // com.my.target.nativeads.banners.NativeAppwallBanner
    public final ImageData getCrossNotifIcon() {
        return this.A;
    }

    public final void h(ImageData imageData) {
        this.A = imageData;
    }

    public b(String str, String str2) {
        super(str, str2);
        this.j = -552418;
        this.k = -1;
    }

    public final String toString() {
        return "AppwallBanner {title='" + this.a + "', description='" + this.b + "'}";
    }
}
