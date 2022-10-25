package ru.mail.libverify.ipc;

import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.l;
/* loaded from: classes3.dex */
abstract class b extends Handler {
    final l a;
    private Messenger b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(l lVar) {
        this.a = lVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final Messenger a() {
        if (this.b == null) {
            this.b = new Messenger(this);
        }
        return this.b;
    }

    protected abstract void a(@NonNull Message message);

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        super.handleMessage(message);
        if (message == null) {
            return;
        }
        a(message);
    }
}
