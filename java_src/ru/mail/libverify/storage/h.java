package ru.mail.libverify.storage;

import android.content.Context;
import android.location.Location;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Locale;
/* loaded from: classes3.dex */
final class h implements k {
    private final String a;
    private final String b;
    private final String c;
    private final Locale d;
    private final k e;
    private final String f;
    private final String g;

    /* JADX INFO: Access modifiers changed from: package-private */
    public h(@NonNull k kVar) {
        this.e = kVar;
        this.b = kVar.b();
        this.a = kVar.a();
        this.c = kVar.e();
        this.d = kVar.u();
        this.f = kVar.o();
        this.g = kVar.v();
    }

    @Override // ru.mail.libverify.storage.k
    public final String a() {
        return this.a;
    }

    @Override // ru.mail.libverify.storage.k
    public final String a(@NonNull String str, @NonNull String str2) {
        throw new DecryptionError(new IllegalStateException());
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.utils.a a(@NonNull String str) {
        return this.e.a(str);
    }

    @Override // ru.mail.libverify.storage.k
    public final String b() {
        return this.b;
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean b(@Nullable String str) {
        return false;
    }

    @Override // ru.mail.libverify.storage.k
    public final String c() {
        return this.e.c();
    }

    @Override // ru.mail.libverify.storage.k
    public final Context d() {
        return this.e.d();
    }

    @Override // ru.mail.libverify.storage.k
    public final String e() {
        return this.c;
    }

    @Override // ru.mail.libverify.storage.k
    public final String f() {
        return ru.mail.libverify.utils.m.a(this.c);
    }

    @Override // ru.mail.libverify.storage.k
    public final String g() {
        return this.e.g();
    }

    @Override // ru.mail.libverify.storage.k
    public final String h() {
        return this.e.h();
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.utils.k i() {
        return this.e.i();
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean j() {
        return this.e.j();
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean k() {
        return false;
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean l() {
        return this.e.l();
    }

    @Override // ru.mail.libverify.storage.k
    public final void m() {
    }

    @Override // ru.mail.libverify.storage.k
    public final Location n() {
        return this.e.n();
    }

    @Override // ru.mail.libverify.storage.k
    public final String o() {
        return this.f;
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.accounts.d p() {
        return this.e.p();
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.accounts.b q() {
        return this.e.q();
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.sms.c r() {
        return this.e.r();
    }

    @Override // ru.mail.libverify.storage.k
    public final String s() {
        return this.d.getLanguage();
    }

    @Override // ru.mail.libverify.storage.k
    public final String t() {
        return ru.mail.libverify.utils.m.a(this.d);
    }

    @Override // ru.mail.libverify.storage.k
    public final Locale u() {
        return this.d;
    }

    @Override // ru.mail.libverify.storage.k
    public final String v() {
        return this.g;
    }

    @Override // ru.mail.libverify.storage.k
    public final String w() {
        return this.e.w();
    }

    @Override // ru.mail.libverify.storage.k
    public final String x() {
        return this.e.x();
    }
}
