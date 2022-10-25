package ru.mail.libverify.storage;

import android.support.annotation.NonNull;
import ru.mail.libverify.storage.c;
/* loaded from: classes3.dex */
final class t extends c {
    private String a;
    private String b;
    private volatile boolean c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public t(@NonNull c.a aVar) {
        super(aVar);
    }

    private void d() {
        if (!this.c) {
            synchronized (this) {
                if (!this.c) {
                    this.a = c().a("instance_app_name");
                    this.b = c().a("instance_app_key");
                    ru.mail.libverify.utils.d.c("AppParams", "loaded params %s %s", this.a, this.b);
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
