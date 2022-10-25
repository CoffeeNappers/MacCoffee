package com.my.target.core.models;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: AdService.java */
/* loaded from: classes2.dex */
public final class d extends b {
    private String a;
    private boolean c;
    private boolean d;
    private d g;
    private String h;
    private AtomicInteger i;
    private int m;
    private String n;
    private float o;
    private float p;
    private ArrayList<com.my.target.core.models.banners.e> q;
    private int b = -1;
    private ArrayList<d> e = new ArrayList<>();
    private int f = -1;
    private ArrayList<k> j = new ArrayList<>();
    private ArrayList<k> k = new ArrayList<>();
    private ArrayList<k> l = new ArrayList<>();

    public final ArrayList<k> a() {
        return this.j;
    }

    public final ArrayList<com.my.target.core.models.banners.e> b() {
        return this.q;
    }

    public final int c() {
        return this.f;
    }

    public final int d() {
        return this.b;
    }

    public final d e() {
        return this.g;
    }

    public final float f() {
        return this.o;
    }

    public final float g() {
        return this.p;
    }

    public final int h() {
        return this.m;
    }

    public final String i() {
        return this.h;
    }

    public final ArrayList<k> j() {
        return this.k;
    }

    public final ArrayList<k> k() {
        return this.l;
    }

    public final ArrayList<d> l() {
        return this.e;
    }

    public final String m() {
        return this.a;
    }

    public final boolean n() {
        return this.c;
    }

    public final boolean o() {
        return this.d;
    }

    public final void a(String str) {
        this.n = str;
    }

    public final void a(int i) {
        this.f = i;
    }

    public final void b(int i) {
        this.b = i;
    }

    public final void a(boolean z) {
        this.c = z;
    }

    public final void b(boolean z) {
        this.d = z;
    }

    public final void a(d dVar) {
        this.g = dVar;
    }

    public final void a(float f) {
        this.o = f;
    }

    public final void b(float f) {
        this.p = f;
    }

    public final void c(int i) {
        this.m = i;
    }

    public final void b(String str) {
        this.h = str;
    }

    public final AtomicInteger p() {
        return this.i;
    }

    public final void a(AtomicInteger atomicInteger) {
        this.i = atomicInteger;
    }

    public d(String str) {
        this.a = str;
    }

    public final void b(d dVar) {
        this.e.add(dVar);
    }

    public final void a(k kVar) {
        this.j.add(kVar);
    }

    public final void b(k kVar) {
        this.k.add(kVar);
    }

    public final void c(k kVar) {
        this.l.add(kVar);
    }

    public final void a(ArrayList<com.my.target.core.models.banners.e> arrayList) {
        if (this.q != null) {
            this.q.addAll(arrayList);
        } else {
            this.q = arrayList;
        }
    }
}
