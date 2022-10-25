package ru.mail.libverify.storage;

import android.support.annotation.NonNull;
import ru.mail.libverify.storage.c;
/* loaded from: classes3.dex */
final class f extends c {
    private final String a;
    private final String b;
    private volatile boolean c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public f(@NonNull c.a aVar, @NonNull String str, @NonNull String str2) {
        super(aVar);
        this.a = str;
        this.b = str2;
    }

    private void d() {
        if (!this.c) {
            synchronized (this) {
                if (!this.c) {
                    c().a("instance_app_name", this.a).a("instance_app_key", this.b).a();
                    ru.mail.libverify.utils.d.c("AppParams", "saved params %s %s", this.a, this.b);
                    this.c = true;
                }
            }
        }
    }

    @Override // ru.mail.libverify.storage.c
    public final String a() {
        d();
        return this.a;
    }

    @Override // ru.mail.libverify.storage.c
    public final String b() {
        d();
        return this.b;
    }
}
