package ru.mail.libverify.requests;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import ru.mail.libverify.requests.ActionDescriptor;
import ru.mail.libverify.requests.i;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.utils.ServerException;
import ru.mail.libverify.utils.json.JsonParseException;
/* loaded from: classes3.dex */
public final class c implements b {
    final ru.mail.libverify.requests.a a;
    private Map<String, a> b;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class a {
        final ActionDescriptor a;
        final e b;
        final String c;
        Future d;

        public a(@NonNull ru.mail.libverify.requests.a aVar, @NonNull ActionDescriptor actionDescriptor) {
            e dVar;
            this.a = actionDescriptor;
            if (actionDescriptor.type == null) {
                throw new IllegalArgumentException();
            }
            switch (actionDescriptor.type) {
                case UPDATE_SETTINGS:
                    dVar = new o(aVar.a(), actionDescriptor.a());
                    break;
                case PUSH_STATUS:
                    dVar = new k(aVar.a(), actionDescriptor.a());
                    break;
                case ATTEMPT:
                    dVar = new d(aVar.a(), actionDescriptor.a());
                    break;
                default:
                    throw new IllegalArgumentException("Provided request type is not supported by the ActionExecutor");
            }
            this.b = dVar;
            this.c = this.b.j();
        }

        public a(@NonNull e eVar) {
            ActionDescriptor actionDescriptor;
            if (eVar instanceof o) {
                actionDescriptor = new ActionDescriptor(ActionDescriptor.a.UPDATE_SETTINGS, eVar.c());
            } else if (eVar instanceof k) {
                actionDescriptor = new ActionDescriptor(ActionDescriptor.a.PUSH_STATUS, eVar.c());
            } else if (!(eVar instanceof d)) {
                throw new IllegalArgumentException("Provided request is not supported by the ActionExecutor");
            } else {
                actionDescriptor = new ActionDescriptor(ActionDescriptor.a.ATTEMPT, eVar.c());
            }
            this.a = actionDescriptor;
            this.b = eVar;
            this.c = this.b.j();
        }
    }

    public c(@NonNull ru.mail.libverify.requests.a aVar) {
        this.a = aVar;
    }

    static /* synthetic */ void a(c cVar, Throwable th, a aVar) {
        ru.mail.libverify.utils.c.a("ActionExecutor", th, "Action %s failed", Integer.valueOf(aVar.c.hashCode()));
        cVar.a(aVar);
    }

    private boolean b(@NonNull final a aVar) {
        if (!this.a.a().j()) {
            ru.mail.libverify.utils.d.c("ActionExecutor", "Action %s start delayed", Integer.valueOf(aVar.c.hashCode()));
            return false;
        }
        aVar.a.attemptCount++;
        aVar.a.lastAttemptTimestamp = System.currentTimeMillis();
        aVar.d = aVar.b.a(this.a.b(), new i.b<ClientApiResponseBase>() { // from class: ru.mail.libverify.requests.c.3
            @Override // ru.mail.libverify.requests.i.b
            public final Handler a() {
                return c.this.a.c();
            }

            @Override // ru.mail.libverify.requests.i.b
            public final void a(Future<ClientApiResponseBase> future) {
                if (future.isCancelled()) {
                    return;
                }
                try {
                    ru.mail.libverify.utils.d.c("ActionExecutor", "Action %s completed", Integer.valueOf(aVar.c.hashCode()));
                    c.this.a(aVar);
                    c.this.a.a(future.get());
                } catch (ExecutionException e) {
                    Throwable cause = e.getCause();
                    if (cause == null) {
                        c.a(c.this, e, aVar);
                        return;
                    }
                    boolean z = cause instanceof ServerException;
                    boolean z2 = cause instanceof IOException;
                    if (z || z2) {
                        aVar.d = null;
                        c.this.a(false);
                        if (z) {
                            ru.mail.libverify.utils.d.a("ActionExecutor", e, "Action %s failed by server", Integer.valueOf(aVar.c.hashCode()));
                        } else {
                            ru.mail.libverify.utils.d.b("ActionExecutor", e, "Action %s failed by network", Integer.valueOf(aVar.c.hashCode()));
                        }
                    } else {
                        c.a(c.this, e, aVar);
                    }
                    c.this.a.a(aVar.b, cause);
                } catch (Throwable th) {
                    c.a(c.this, th, aVar);
                }
            }
        });
        ru.mail.libverify.utils.d.c("ActionExecutor", "Action id %s url %s started (attemptCount %d)", Integer.valueOf(aVar.c.hashCode()), aVar.c, Integer.valueOf(aVar.a.attemptCount));
        return true;
    }

    private void d() {
        if (this.b != null) {
            return;
        }
        this.b = new HashMap();
        String a2 = this.a.d().a("serializable_actions_data");
        if (TextUtils.isEmpty(a2)) {
            return;
        }
        try {
            for (ActionDescriptor actionDescriptor : ru.mail.libverify.utils.json.a.b(a2, ActionDescriptor.class)) {
                a aVar = new a(this.a, actionDescriptor);
                this.b.put(aVar.c, aVar);
                this.a.a(aVar.b);
            }
        } catch (Throwable th) {
            ru.mail.libverify.utils.c.a("ActionExecutor", "Failed to read saved items", th);
            b();
        }
    }

    @Override // ru.mail.libverify.requests.b
    public final void a() {
        a(true);
    }

    final void a(@NonNull a aVar) {
        this.b.remove(aVar.c);
        this.a.b(aVar.b);
        c();
    }

    @Override // ru.mail.libverify.requests.b
    public final void a(@NonNull e eVar) {
        d();
        a aVar = new a(eVar);
        if (this.b.containsKey(aVar.c)) {
            ru.mail.libverify.utils.d.c("ActionExecutor", "request %s dropped as a duplicate", Integer.valueOf(aVar.c.hashCode()));
            return;
        }
        this.b.put(aVar.c, aVar);
        this.a.a(aVar.b);
        c();
        if (b(aVar)) {
            return;
        }
        this.a.c().postDelayed(new Runnable() { // from class: ru.mail.libverify.requests.c.1
            @Override // java.lang.Runnable
            public final void run() {
                c.this.a(false);
            }
        }, 500L);
    }

    final void a(boolean z) {
        boolean z2;
        d();
        boolean z3 = false;
        Iterator it = new ArrayList(this.b.values()).iterator();
        while (true) {
            z2 = z3;
            if (!it.hasNext()) {
                break;
            }
            z3 = a((a) it.next(), z) | z2;
        }
        if (z2) {
            c();
        }
    }

    final boolean a(@NonNull final a aVar, boolean z) {
        if (aVar.a.attemptCount > 10) {
            ru.mail.libverify.utils.d.b("ActionExecutor", "Action %s dropped by max attempt count", Integer.valueOf(aVar.c.hashCode()));
            a(aVar);
            return true;
        }
        long currentTimeMillis = System.currentTimeMillis() - aVar.a.lastAttemptTimestamp;
        if (currentTimeMillis < 0) {
            ru.mail.libverify.utils.d.b("ActionExecutor", "Action %s dropped by wrong timestamp", Integer.valueOf(aVar.c.hashCode()));
            a(aVar);
            return true;
        }
        if (aVar.d != null) {
            if (!z) {
                return false;
            }
            ru.mail.libverify.utils.d.c("ActionExecutor", "Action %s cancelled", Integer.valueOf(aVar.c.hashCode()));
            aVar.d.cancel(true);
            aVar.d = null;
            aVar.a.attemptCount = 0;
        }
        int i = aVar.a.attemptCount * 500 * aVar.a.attemptCount;
        if (currentTimeMillis > i) {
            return b(aVar);
        }
        long j = i - currentTimeMillis;
        ru.mail.libverify.utils.d.c("ActionExecutor", "Action %s will be started after %d ms", Integer.valueOf(aVar.c.hashCode()), Long.valueOf(j));
        this.a.c().postDelayed(new Runnable() { // from class: ru.mail.libverify.requests.c.2
            @Override // java.lang.Runnable
            public final void run() {
                if (c.this.a(aVar, false)) {
                    c.this.c();
                }
            }
        }, j);
        return false;
    }

    @Override // ru.mail.libverify.requests.b
    public final void b() {
        if (this.b == null) {
            return;
        }
        for (a aVar : this.b.values()) {
            if (aVar.d != null) {
                aVar.d.cancel(true);
                aVar.d = null;
                this.a.b(aVar.b);
            }
        }
        this.b.clear();
        c();
    }

    final void c() {
        ArrayList arrayList = new ArrayList();
        for (a aVar : this.b.values()) {
            if (aVar.a.attemptCount <= 10) {
                arrayList.add(aVar.a);
            }
        }
        try {
            this.a.d().a("serializable_actions_data", ru.mail.libverify.utils.json.a.a(arrayList)).a();
        } catch (JsonParseException e) {
            ru.mail.libverify.utils.c.a("ActionExecutor", "failed to save actions", e);
        }
    }
}
