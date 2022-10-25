package ru.mail.libverify.fetcher;

import android.support.annotation.NonNull;
import java.util.concurrent.Future;
import ru.mail.libverify.storage.k;
/* loaded from: classes3.dex */
final class c implements a {
    final k a;
    final b b;
    private final Object c = new Object();
    private final Runnable d = new Runnable() { // from class: ru.mail.libverify.fetcher.c.1
        /* JADX WARN: Removed duplicated region for block: B:104:0x0217  */
        /* JADX WARN: Removed duplicated region for block: B:116:0x0236 A[Catch: InterruptedException -> 0x023b, Exception -> 0x0250, all -> 0x0269, TryCatch #6 {all -> 0x0269, blocks: (B:3:0x0006, B:9:0x0018, B:10:0x0027, B:12:0x002d, B:38:0x00f5, B:63:0x017d, B:25:0x0092, B:74:0x01a7, B:83:0x01da, B:116:0x0236, B:117:0x023a, B:112:0x022c, B:125:0x0251, B:119:0x023c, B:98:0x0204, B:91:0x01f0), top: B:166:0x0006 }] */
        /* JADX WARN: Removed duplicated region for block: B:161:0x029f  */
        /* JADX WARN: Removed duplicated region for block: B:29:0x009c A[ADDED_TO_REGION] */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void run() {
            /*
                Method dump skipped, instructions count: 674
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.fetcher.c.AnonymousClass1.run():void");
        }
    };
    private Future e;

    /* JADX INFO: Access modifiers changed from: package-private */
    public c(@NonNull k kVar, @NonNull b bVar) {
        this.a = kVar;
        this.b = bVar;
    }

    private boolean b(int i) {
        int g = this.b.g() + (i * 500 * i);
        ru.mail.libverify.utils.d.b("FetcherExecutor", "wait timeout %d on attempt (%d)", Integer.valueOf(g), Integer.valueOf(i));
        if (g < 0) {
            return false;
        }
        if (g == 0) {
            return true;
        }
        synchronized (this.c) {
            try {
                this.c.wait(g);
            } catch (InterruptedException e) {
                ru.mail.libverify.utils.d.a("FetcherExecutor", "fetcher thread was interrupted");
                throw e;
            }
        }
        return true;
    }

    private void d() {
        if (this.e != null) {
            this.e.cancel(true);
            try {
                this.e.get();
            } catch (Exception e) {
                ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher thread stopped");
            }
            this.e = null;
        }
    }

    @Override // ru.mail.libverify.fetcher.a
    public final void a() {
        ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher thread start requested, future %s", this.e);
        if (this.e == null) {
            this.e = this.b.d().submit(this.d);
        }
    }

    final boolean a(int i) {
        if (!this.b.e()) {
            ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher start not allowed");
            return false;
        } else if (i >= 20) {
            ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher request max attempts reached");
            return false;
        } else {
            boolean f = this.b.f();
            if (!f && !b(i)) {
                ru.mail.libverify.utils.d.a("FetcherExecutor", "fetcher timeout check failed");
                return false;
            } else if (!this.b.e()) {
                ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher start blocked");
                return false;
            } else if (!this.a.j()) {
                ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher start blocked, no network");
                return false;
            } else if (f || !this.a.l()) {
                return true;
            } else {
                ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher start blocked, low battery");
                return false;
            }
        }
    }

    @Override // ru.mail.libverify.fetcher.a
    public final void b() {
        ru.mail.libverify.utils.d.b("FetcherExecutor", "fetcher thread stop requested, future %s", this.e);
        d();
    }

    @Override // ru.mail.libverify.fetcher.a
    public final void c() {
        d();
        a();
    }
}
