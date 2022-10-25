package ru.mail.libverify.notifications;

import android.app.Notification;
import android.app.NotificationManager;
import android.support.annotation.NonNull;
import java.util.HashMap;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* loaded from: classes3.dex */
public final class c {
    public final NotificationManager a;
    public final HashMap<String, e> b = new HashMap<>();
    private final d c;

    public c(@NonNull d dVar) {
        this.c = dVar;
        this.a = (NotificationManager) dVar.b().getSystemService("notification");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@NonNull e eVar) {
        Notification build = eVar.c().build();
        if (eVar.d()) {
            build.defaults &= -3;
            build.defaults &= -2;
        } else {
            build.vibrate = new long[]{500, 500};
        }
        String b = eVar.b();
        eVar.a().a();
        try {
            ru.mail.libverify.utils.d.b("NotificationBarManager", "safeNotify tag %s id %d", b, 1);
            this.a.notify(b, 1, build);
        } catch (SecurityException e) {
            ru.mail.libverify.utils.d.a("NotificationBarManager", "safeNotify error", e);
        }
        eVar.a++;
    }

    public final void a(@NonNull String str) {
        this.b.remove(str);
        NotificationId notificationId = NotificationId.SMS_CODE;
        try {
            ru.mail.libverify.utils.d.b("NotificationBarManager", "cancel tag %s id %d", str, Integer.valueOf(notificationId.a()));
            this.a.cancel(str, notificationId.a());
        } catch (NullPointerException | SecurityException e) {
            ru.mail.libverify.utils.d.a("NotificationBarManager", "cancel", e);
        }
    }

    public final void a(@NonNull ServerNotificationMessage serverNotificationMessage, boolean z) {
        Integer f;
        final f fVar = new f(this.c.b(), serverNotificationMessage, z);
        this.b.put(fVar.b(), fVar);
        a(fVar);
        if (!fVar.e() || (f = fVar.f()) == null) {
            return;
        }
        ru.mail.libverify.utils.d.c("NotificationBarManager", "notification %s ongoing timeout %d", fVar.b(), f);
        this.c.a(serverNotificationMessage, fVar.f().intValue());
        this.c.a().postDelayed(new Runnable() { // from class: ru.mail.libverify.notifications.c.1
            @Override // java.lang.Runnable
            public final void run() {
                boolean z2;
                c cVar = c.this;
                e eVar = fVar;
                if (cVar.b.get(eVar.b()) != eVar) {
                    ru.mail.libverify.utils.d.b("NotificationBarManager", "%s has been already removed or substituted by another notification", eVar.b());
                    z2 = false;
                } else {
                    z2 = true;
                }
                if (!z2) {
                    return;
                }
                c.this.a(fVar);
                ru.mail.libverify.utils.d.c("NotificationBarManager", "ongoing timeout for %s expired, silent = %s, ongoing = %s", fVar.b(), Boolean.valueOf(fVar.d()), Boolean.valueOf(fVar.e()));
            }
        }, fVar.f().intValue());
    }
}
