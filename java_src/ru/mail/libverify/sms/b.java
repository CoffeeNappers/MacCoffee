package ru.mail.libverify.sms;

import ru.mail.libverify.sms.m;
/* loaded from: classes3.dex */
public final class b {
    final long a;
    final m.b b;
    final String c;
    public final String d;

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(long j, m.b bVar, String str, String str2) {
        this.a = j;
        this.b = bVar;
        this.c = str;
        this.d = str2;
    }

    private static String a(String str) {
        return str == null ? "null" : "[" + str.length() + "]";
    }

    public final String toString() {
        return "{" + this.b + ":" + a(this.c) + ":" + a(this.d) + "}";
    }
}
