package ru.mail.libverify.ipc;

import android.os.Handler;
import android.os.Messenger;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.l;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class a extends Handler {
    protected final l a;
    protected InterfaceC0284a b;
    protected Messenger c;
    volatile boolean d = false;
    private Messenger e;

    /* renamed from: ru.mail.libverify.ipc.a$a  reason: collision with other inner class name */
    /* loaded from: classes3.dex */
    interface InterfaceC0284a {
        void a(boolean z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(@NonNull l lVar) {
        this.a = lVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final Messenger a() {
        if (this.e == null) {
            this.e = new Messenger(this);
        }
        return this.e;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(@NonNull Messenger messenger, @NonNull InterfaceC0284a interfaceC0284a) {
        if (this.c != null) {
            throw new IllegalStateException("can't call postDataToService twice");
        }
        this.c = messenger;
        this.b = interfaceC0284a;
        b();
    }

    protected abstract void b();
}
