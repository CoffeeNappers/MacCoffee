package ru.mail.libverify.storage;

import android.os.Handler;
import android.support.annotation.NonNull;
/* loaded from: classes3.dex */
public final class d implements o {
    final o a;
    private final Handler b;
    private final Runnable c = new Runnable() { // from class: ru.mail.libverify.storage.d.1
        @Override // java.lang.Runnable
        public final void run() {
            d.this.a.a();
        }
    };

    public d(@NonNull o oVar, @NonNull Handler handler) {
        this.a = oVar;
        this.b = handler;
    }

    @Override // ru.mail.libverify.storage.o
    public final String a(@NonNull String str) {
        return this.a.a(str);
    }

    @Override // ru.mail.libverify.storage.o
    public final o a(@NonNull String str, int i) {
        this.a.a(str, i);
        return this;
    }

    @Override // ru.mail.libverify.storage.o
    public final o a(@NonNull String str, long j) {
        this.a.a(str, j);
        return this;
    }

    @Override // ru.mail.libverify.storage.o
    public final o a(@NonNull String str, @NonNull String str2) {
        this.a.a(str, str2);
        return this;
    }

    @Override // ru.mail.libverify.storage.o
    public final synchronized void a() {
        this.b.removeCallbacks(this.c);
        this.b.postDelayed(this.c, 500L);
    }

    @Override // ru.mail.libverify.storage.o
    public final Long b(@NonNull String str) {
        return this.a.b(str);
    }

    @Override // ru.mail.libverify.storage.o
    public final Integer c(@NonNull String str) {
        return this.a.c(str);
    }

    @Override // ru.mail.libverify.storage.o
    public final o d(@NonNull String str) {
        return this.a.d(str);
    }
}
