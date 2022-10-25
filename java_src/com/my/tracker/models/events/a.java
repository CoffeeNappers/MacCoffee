package com.my.tracker.models.events;

import java.util.ArrayList;
import java.util.List;
/* compiled from: AbstractEvent.java */
/* loaded from: classes2.dex */
public abstract class a implements c {
    private long a;
    private String b;
    private String c;
    private String d;
    private String e;
    private String f;
    private List<Long> g;
    private long h;
    private long i;
    private long j;

    @Override // com.my.tracker.models.events.c
    public final String a() {
        return this.b;
    }

    @Override // com.my.tracker.models.events.c
    public final String b() {
        return this.c;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void a(String str) {
        if (str != null) {
            this.c = str;
        } else {
            this.c = "";
        }
    }

    @Override // com.my.tracker.models.events.c
    public final String c() {
        return this.d;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void b(String str) {
        if (str != null) {
            this.d = str;
        } else {
            this.d = "";
        }
    }

    @Override // com.my.tracker.models.events.c
    public final String d() {
        return this.e;
    }

    @Override // com.my.tracker.models.events.c
    public final String e() {
        return this.f;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void c(String str) {
        if (str != null) {
            this.f = str;
        } else {
            this.f = "";
        }
    }

    @Override // com.my.tracker.models.events.c
    public final List<Long> f() {
        return this.g;
    }

    @Override // com.my.tracker.models.events.c
    public final long g() {
        if (this.g == null || this.g.size() <= 0) {
            return 0L;
        }
        return this.g.get(0).longValue();
    }

    @Override // com.my.tracker.models.events.c
    public final long h() {
        return this.h;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void a(long j) {
        this.h = j;
    }

    @Override // com.my.tracker.models.events.c
    public final long i() {
        return this.i;
    }

    public final void b(long j) {
        this.i = j;
    }

    public final long j() {
        return this.a;
    }

    @Override // com.my.tracker.models.events.c
    public final void c(long j) {
        this.a = j;
    }

    public a(String str) {
        this(str, null);
    }

    public a(String str, List<Long> list) {
        this.a = -1L;
        this.c = "";
        this.d = "";
        this.e = "";
        this.f = "";
        this.h = 0L;
        this.i = 0L;
        this.j = 0L;
        this.b = str;
        if (list == null) {
            list = new ArrayList<>();
            list.add(Long.valueOf(System.currentTimeMillis() / 1000));
        }
        this.g = list;
    }
}
