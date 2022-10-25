package com.my.target.core;

import com.my.target.ads.CustomParams;
import com.vkontakte.android.TimeUtils;
/* compiled from: AdParams.java */
/* loaded from: classes2.dex */
public final class a {
    private int a;
    private String b;
    private CustomParams c;
    private boolean e;
    private long d = TimeUtils.DAY;
    private boolean f = true;
    private boolean g = true;

    public final long a() {
        return this.d;
    }

    public final CustomParams b() {
        return this.c;
    }

    public final String c() {
        return this.b;
    }

    public final int d() {
        return this.a;
    }

    public final boolean e() {
        return this.e;
    }

    public final boolean f() {
        return this.g;
    }

    public final boolean g() {
        return this.f;
    }

    public final void a(long j) {
        this.d = j;
    }

    public final void h() {
        this.e = true;
    }

    public final void a(CustomParams customParams) {
        this.c = customParams;
    }

    public final void a(boolean z) {
        this.g = z;
    }

    public final void i() {
        this.f = false;
    }

    public a(int i, String str) {
        this.a = 0;
        this.a = i;
        this.b = str;
    }
}
