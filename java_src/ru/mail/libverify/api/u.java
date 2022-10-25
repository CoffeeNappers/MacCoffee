package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* loaded from: classes3.dex */
final class u implements t {
    private final s b;
    private HashMap<String, ServerNotificationMessage> a = null;
    private final LinkedList<ServerNotificationMessage> c = new LinkedList<>();
    private Runnable d = new Runnable() { // from class: ru.mail.libverify.api.u.1
        @Override // java.lang.Runnable
        public final void run() {
            u.this.d();
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    public u(@NonNull s sVar) {
        this.b = sVar;
    }

    private void e() {
        this.b.a().removeCallbacks(this.d);
        this.b.a().postDelayed(this.d, 200L);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void f() {
        if (this.a != null) {
            return;
        }
        this.a = new HashMap<>();
        String a = this.b.b().a("api_popup_notifications_data");
        if (TextUtils.isEmpty(a)) {
            return;
        }
        try {
            HashMap c = ru.mail.libverify.utils.json.a.c(a, ServerNotificationMessage.class);
            if (c == null) {
                return;
            }
            for (Map.Entry entry : c.entrySet()) {
                long currentTimeMillis = System.currentTimeMillis() - ((ServerNotificationMessage) entry.getValue()).timestamp;
                if (!(currentTimeMillis < 0 || currentTimeMillis > 43200000)) {
                    this.a.put(entry.getKey(), entry.getValue());
                    this.b.a((ServerNotificationMessage) entry.getValue());
                }
            }
        } catch (Throwable th) {
            c();
            ru.mail.libverify.utils.c.a("PopupMessageContainer", "Failed to read popup notifications", th);
        }
    }

    @Override // ru.mail.libverify.api.t
    public final ServerNotificationMessage a(@NonNull String str) {
        f();
        ServerNotificationMessage remove = this.a.remove(str);
        if (remove != null) {
            this.c.add(remove);
            e();
        }
        return remove;
    }

    @Override // ru.mail.libverify.api.t
    public final ServerNotificationMessage a(@NonNull String str, @NonNull ServerNotificationMessage serverNotificationMessage) {
        f();
        ServerNotificationMessage put = this.a.put(str, serverNotificationMessage);
        if (put == null) {
            this.b.a(serverNotificationMessage);
        } else {
            this.b.a(serverNotificationMessage);
            this.b.b(put);
        }
        e();
        return put;
    }

    @Override // ru.mail.libverify.api.t
    public final boolean a() {
        f();
        return this.a.isEmpty();
    }

    @Override // ru.mail.libverify.api.t
    public final Collection<ServerNotificationMessage> b() {
        f();
        return this.a.values();
    }

    @Override // ru.mail.libverify.api.t
    public final ServerNotificationMessage b(@NonNull String str) {
        f();
        return this.a.get(str);
    }

    @Override // ru.mail.libverify.api.t
    public final void c() {
        if (this.a == null) {
            return;
        }
        this.c.clear();
        this.c.addAll(this.a.values());
        this.a.clear();
        d();
    }

    final void d() {
        if (this.a == null) {
            return;
        }
        try {
            if (this.a.isEmpty()) {
                this.b.b().a("api_popup_notifications_data", "").a();
            } else {
                this.b.b().a("api_popup_notifications_data", ru.mail.libverify.utils.json.a.a(this.a)).a();
            }
        } catch (Exception e) {
            ru.mail.libverify.utils.c.a("PopupMessageContainer", "Failed to save popup notifications", e);
        }
        Iterator<ServerNotificationMessage> it = this.c.iterator();
        while (it.hasNext()) {
            this.b.b(it.next());
        }
        this.c.clear();
    }
}
