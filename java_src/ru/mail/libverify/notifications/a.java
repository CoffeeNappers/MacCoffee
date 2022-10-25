package ru.mail.libverify.notifications;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import ru.mail.libverify.api.ac;
/* loaded from: classes3.dex */
final class a implements ac.b {
    private static Handler a = new Handler(Looper.getMainLooper());
    private final WeakReference<b> b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(b bVar) {
        this.b = new WeakReference<>(bVar);
    }

    @Override // ru.mail.libverify.api.ac.b
    public final void a(final ac.a aVar) {
        final b bVar = this.b.get();
        if (bVar == null) {
            return;
        }
        a.post(new Runnable() { // from class: ru.mail.libverify.notifications.a.1
            @Override // java.lang.Runnable
            public final void run() {
                bVar.a(aVar);
            }
        });
    }
}
