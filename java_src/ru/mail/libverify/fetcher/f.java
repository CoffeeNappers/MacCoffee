package ru.mail.libverify.fetcher;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.gcm.ServerInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.requests.response.FetcherInfo;
import ru.mail.libverify.storage.DecryptionError;
import ru.mail.libverify.storage.k;
import ru.mail.libverify.utils.json.JsonParseException;
/* loaded from: classes3.dex */
public final class f implements d {
    final k a;
    final e b;
    b c = b.NOT_ACTIVE;
    FetcherInfo d;
    private final ru.mail.libverify.fetcher.a e;

    /* loaded from: classes3.dex */
    private class a implements ru.mail.libverify.fetcher.b {
        private a() {
        }

        /* synthetic */ a(f fVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a() {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.3
                @Override // java.lang.Runnable
                public final void run() {
                    f.this.b.a(f.this.a(b.SUSPENDED_TEMPORARY));
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@Nullable Long l) {
            f.this.a(l);
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@NonNull final String str, @NonNull final String str2) {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.1
                @Override // java.lang.Runnable
                public final void run() {
                    try {
                        f.this.b.a(f.this.a.a(str, str2));
                    } catch (DecryptionError e) {
                        ru.mail.libverify.utils.c.a("FetcherManager", "fetcher message decryption error", e);
                        f.this.a();
                    } catch (Exception e2) {
                        ru.mail.libverify.utils.c.a("FetcherManager", "unexpected error during fetcher message decryption", e2);
                        f.this.a();
                    }
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@NonNull final ServerInfo serverInfo) {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.2
                @Override // java.lang.Runnable
                public final void run() {
                    f.this.b.a(serverInfo);
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@NonNull final ru.mail.libverify.requests.e eVar, @NonNull final Throwable th) {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.5
                @Override // java.lang.Runnable
                public final void run() {
                    f.this.b.a(eVar, th);
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@NonNull final ClientApiResponseBase clientApiResponseBase) {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.6
                @Override // java.lang.Runnable
                public final void run() {
                    f.this.b.a(clientApiResponseBase);
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void a(@Nullable FetcherInfo fetcherInfo) {
            if (fetcherInfo == null) {
                ru.mail.libverify.utils.d.b("FetcherManager", "empty fetcher info has been skipped");
            } else {
                f.this.b(fetcherInfo);
            }
        }

        @Override // ru.mail.libverify.fetcher.b
        public final void b() {
            f.this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.a.4
                @Override // java.lang.Runnable
                public final void run() {
                    f.this.b.b(f.this.a(b.ACTIVE));
                }
            });
        }

        @Override // ru.mail.libverify.fetcher.b
        public final ExecutorService c() {
            return f.this.b.b();
        }

        @Override // ru.mail.libverify.fetcher.b
        public final ExecutorService d() {
            return f.this.b.c();
        }

        @Override // ru.mail.libverify.fetcher.b
        public final boolean e() {
            boolean z;
            synchronized (f.this) {
                z = f.this.e() && f.this.c != b.SUSPENDED_OTHER_SERVICE;
            }
            return z;
        }

        @Override // ru.mail.libverify.fetcher.b
        public final boolean f() {
            return f.this.b.e();
        }

        @Override // ru.mail.libverify.fetcher.b
        public final int g() {
            int i = 0;
            synchronized (f.this) {
                f.this.f();
                if (f.this.e()) {
                    long currentTimeMillis = System.currentTimeMillis() - f.this.d.getTimestamp();
                    if (currentTimeMillis <= f.this.d.getTimeout()) {
                        i = (int) (f.this.d.getTimeout() - currentTimeMillis);
                    }
                }
            }
            return i;
        }

        @Override // ru.mail.libverify.fetcher.b
        public final String h() {
            String url;
            synchronized (f.this) {
                f.this.f();
                url = f.this.e() ? f.this.d.getUrl() : null;
            }
            return url;
        }

        @Override // ru.mail.libverify.fetcher.b
        public final long i() {
            long j = 0;
            synchronized (f.this) {
                f.this.f();
                if (!f.this.e()) {
                    ru.mail.libverify.utils.d.b("FetcherManager", "no valid fetcher info to get timestamp");
                } else if (f.this.d.getLastModified() != 0) {
                    j = f.this.d.getLastModified();
                } else {
                    ru.mail.libverify.utils.d.b("FetcherManager", "no last modified timestamp, use current time");
                    j = f.this.d.getTimestamp();
                }
            }
            return j;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public enum b {
        NOT_ACTIVE,
        SUSPENDED_TEMPORARY,
        SUSPENDED_OTHER_SERVICE,
        ACTIVE
    }

    public f(@NonNull k kVar, @NonNull e eVar) {
        this.a = kVar;
        this.b = eVar;
        this.e = new c(kVar, new a(this, (byte) 0));
    }

    private synchronized boolean a(b bVar, @Nullable String str, boolean z) {
        boolean z2 = true;
        synchronized (this) {
            f();
            b bVar2 = this.c;
            b bVar3 = this.c;
            switch (bVar) {
                case NOT_ACTIVE:
                    this.c = b.NOT_ACTIVE;
                    this.e.b();
                    if (bVar3 == b.NOT_ACTIVE) {
                        z2 = false;
                        break;
                    }
                    break;
                case SUSPENDED_TEMPORARY:
                    if (!e()) {
                        this.c = b.NOT_ACTIVE;
                        this.e.b();
                        if (bVar3 == b.NOT_ACTIVE) {
                            z2 = false;
                            break;
                        }
                    } else if (bVar3 != b.SUSPENDED_OTHER_SERVICE) {
                        this.c = b.SUSPENDED_TEMPORARY;
                        this.e.b();
                        z2 = false;
                        break;
                    } else {
                        this.c = b.SUSPENDED_OTHER_SERVICE;
                        this.e.b();
                        z2 = false;
                        break;
                    }
                    break;
                case SUSPENDED_OTHER_SERVICE:
                    if (!e()) {
                        this.c = b.NOT_ACTIVE;
                        this.e.b();
                        if (bVar3 == b.NOT_ACTIVE) {
                            z2 = false;
                            break;
                        }
                    } else {
                        boolean b2 = this.a.b(str);
                        ru.mail.libverify.utils.d.b("FetcherManager", "this is the last installed libverify instance %s", Boolean.valueOf(b2));
                        if (!b2) {
                            this.c = b.SUSPENDED_OTHER_SERVICE;
                            this.e.b();
                            z2 = false;
                            break;
                        } else {
                            this.c = b.NOT_ACTIVE;
                            this.e.c();
                            z2 = false;
                            break;
                        }
                    }
                    break;
                case ACTIVE:
                    if (e()) {
                        if (bVar3 != b.SUSPENDED_TEMPORARY) {
                            if (bVar3 == b.SUSPENDED_OTHER_SERVICE && !z) {
                                if (!TextUtils.isEmpty(str)) {
                                    this.c = b.ACTIVE;
                                    this.e.a();
                                    break;
                                } else {
                                    this.c = b.SUSPENDED_OTHER_SERVICE;
                                    this.e.b();
                                    z2 = false;
                                    break;
                                }
                            } else {
                                this.c = b.ACTIVE;
                                this.e.a();
                                if (bVar3 == b.ACTIVE && !z) {
                                    z2 = false;
                                    break;
                                }
                            }
                        } else {
                            this.c = b.ACTIVE;
                            this.e.a();
                            z2 = false;
                            break;
                        }
                    } else {
                        this.c = b.NOT_ACTIVE;
                        this.e.b();
                        if (bVar3 == b.NOT_ACTIVE) {
                            z2 = false;
                            break;
                        }
                    }
                    break;
                default:
                    throw new IllegalArgumentException();
            }
            ru.mail.libverify.utils.d.c("FetcherManager", "fetcher state %s -> %s, publish %s", bVar2, this.c, Boolean.valueOf(z2));
            if (bVar2 != this.c) {
                c(this.d);
            }
        }
        return z2;
    }

    private void c(@Nullable FetcherInfo fetcherInfo) {
        if (fetcherInfo == null) {
            this.b.a().d("fetcher_manager_info").d("fetcher_state").a();
            return;
        }
        try {
            this.b.a().a("fetcher_manager_info", ru.mail.libverify.utils.json.a.a(fetcherInfo)).a("fetcher_state", this.c.toString()).a();
        } catch (JsonParseException e) {
            ru.mail.libverify.utils.c.a("FetcherManager", "failed to save fetcher info", e);
        }
    }

    @Override // ru.mail.libverify.fetcher.d
    public final void a() {
        ru.mail.libverify.utils.d.c("FetcherManager", "reset and stop fetcher");
        b((FetcherInfo) null);
        a(null, false);
    }

    final synchronized void a(@Nullable Long l) {
        if (l != null) {
            f();
            if (this.d == null) {
                ru.mail.libverify.utils.d.a("FetcherManager", "failed to update last modified time (there is no saved info)");
            } else {
                ru.mail.libverify.utils.d.b("FetcherManager", "update fetcher info last modified %d", l);
                this.d.setLastModified(l);
                c(this.d);
            }
        }
    }

    @Override // ru.mail.libverify.fetcher.d
    public final void a(@NonNull String str) {
        if (TextUtils.equals(str, this.a.d().getPackageName())) {
            ru.mail.libverify.utils.d.a("FetcherManager", "package name %s matches with local", str);
            return;
        }
        ru.mail.libverify.utils.d.c("FetcherManager", "remote fetcher from %s started", str);
        boolean a2 = a(b.SUSPENDED_OTHER_SERVICE, str, false);
        ru.mail.libverify.utils.d.c("FetcherManager", "activate fetcher, publish = %s, package = %s", Boolean.valueOf(a2), str);
        this.b.a(a2);
    }

    final void a(@Nullable String str, boolean z) {
        boolean a2 = a(b.ACTIVE, str, z);
        ru.mail.libverify.utils.d.c("FetcherManager", "activate fetcher, publish = %s, package = %s", Boolean.valueOf(a2), str);
        if (this.c == b.ACTIVE) {
            this.b.b(a2);
        } else {
            this.b.a(a2);
        }
    }

    @Override // ru.mail.libverify.fetcher.d
    public final synchronized void a(@Nullable final FetcherInfo fetcherInfo) {
        if (fetcherInfo == null) {
            ru.mail.libverify.utils.d.b("FetcherManager", "empty fetcher info has been skipped");
        } else {
            this.b.d().post(new Runnable() { // from class: ru.mail.libverify.fetcher.f.1
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.utils.d.c("FetcherManager", "update fetcher info started");
                    f.this.b(fetcherInfo);
                    f.this.a(null, true);
                    ru.mail.libverify.utils.d.c("FetcherManager", "update fetcher info completed");
                }
            });
        }
    }

    final synchronized boolean a(b bVar) {
        return a(bVar, null, false);
    }

    @Override // ru.mail.libverify.fetcher.d
    public final synchronized void b() {
        ru.mail.libverify.utils.d.c("FetcherManager", "run fetcher with check");
        f();
        b(this.d);
        a(null, false);
    }

    @Override // ru.mail.libverify.fetcher.d
    public final void b(@NonNull String str) {
        if (TextUtils.equals(str, this.a.d().getPackageName())) {
            ru.mail.libverify.utils.d.a("FetcherManager", "package name %s matches with local", str);
            return;
        }
        ru.mail.libverify.utils.d.c("FetcherManager", "remote fetcher from %s stopped", str);
        a(str, false);
    }

    final synchronized void b(@Nullable FetcherInfo fetcherInfo) {
        f();
        FetcherInfo fetcherInfo2 = this.d;
        FetcherInfo fetcherInfo3 = this.d;
        if (fetcherInfo != null && fetcherInfo3 != null && fetcherInfo.getLastModified() == 0) {
            fetcherInfo.setLastModified(Long.valueOf(fetcherInfo3.getLastModified()));
        }
        this.d = fetcherInfo;
        c(this.d);
        ru.mail.libverify.utils.d.c("FetcherManager", "fetcher info updated %s -> %s", fetcherInfo2, this.d);
    }

    @Override // ru.mail.libverify.fetcher.d
    public final void c() {
        ru.mail.libverify.utils.d.c("FetcherManager", "pause fetcher");
        this.b.a(a(b.SUSPENDED_TEMPORARY));
    }

    @Override // ru.mail.libverify.fetcher.d
    public final synchronized void d() {
        ru.mail.libverify.utils.d.c("FetcherManager", "check and activate fetcher");
        a(null, true);
    }

    final synchronized boolean e() {
        boolean z;
        f();
        if (this.d != null && this.d.getStatus() == FetcherInfo.Status.ENABLED && !TextUtils.isEmpty(this.d.getUrl())) {
            if (this.d.getTimeout() >= 0) {
                z = true;
            }
        }
        z = false;
        return z;
    }

    final void f() {
        if (this.d != null) {
            return;
        }
        String a2 = this.b.a().a("fetcher_manager_info");
        if (TextUtils.isEmpty(a2)) {
            return;
        }
        String a3 = this.b.a().a("fetcher_state");
        if (!TextUtils.isEmpty(a3)) {
            this.c = b.valueOf(a3);
        }
        try {
            this.d = (FetcherInfo) ru.mail.libverify.utils.json.a.a(a2, FetcherInfo.class);
            ru.mail.libverify.utils.d.c("FetcherManager", "fetcher info loaded %s state %s", this.d, this.c);
        } catch (JsonParseException e) {
            this.c = b.NOT_ACTIVE;
            this.b.a().d("fetcher_manager_info").d("fetcher_state").a();
            ru.mail.libverify.utils.c.a("FetcherManager", "failed to load fetcher state", e);
        }
    }
}
