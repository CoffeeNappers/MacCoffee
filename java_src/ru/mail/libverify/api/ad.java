package ru.mail.libverify.api;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.IOException;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import ru.mail.libverify.accounts.d;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.api.aa;
import ru.mail.libverify.api.ac;
import ru.mail.libverify.api.r;
import ru.mail.libverify.api.w;
import ru.mail.libverify.gcm.NotificationInfo;
import ru.mail.libverify.gcm.ServerInfo;
import ru.mail.libverify.gcm.ServerNotificationMessage;
import ru.mail.libverify.ipc.c;
import ru.mail.libverify.ipc.e;
import ru.mail.libverify.ipc.f;
import ru.mail.libverify.ipc.h;
import ru.mail.libverify.requests.k;
import ru.mail.libverify.requests.response.CallInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.requests.response.FetcherInfo;
import ru.mail.libverify.requests.response.PushStatusApiResponse;
import ru.mail.libverify.requests.response.SmsInfo;
import ru.mail.libverify.requests.response.UpdateSettingsApiResponse;
import ru.mail.libverify.sms.SmsItem;
import ru.mail.libverify.statistics.b;
import ru.mail.libverify.utils.ClientException;
import ru.mail.libverify.utils.LogReceiver;
import ru.mail.libverify.utils.ServerException;
import ru.mail.libverify.utils.c;
import ru.mail.libverify.utils.json.JsonParseException;
import ru.mail.libverify.utils.permissions.a;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class ad implements VerificationApi, aa, ab, ac, ru.mail.libverify.api.i, j, l, n, o {
    private static final TimeUnit e = TimeUnit.SECONDS;
    final ru.mail.libverify.storage.l a;
    final ru.mail.libverify.utils.b b;
    final HandlerThread c;
    private final w f;
    private final ru.mail.libverify.statistics.b i;
    private final t j;
    private final ru.mail.libverify.requests.b k;
    private final ru.mail.libverify.fetcher.d l;
    private final ru.mail.libverify.api.a m;
    private final ru.mail.libverify.api.e n;
    private final h o;
    private final e p;
    private v r;
    private ru.mail.libverify.storage.o s;
    private ThreadPoolExecutor t;
    private ru.mail.libverify.notifications.c u;
    private r v;
    private String[] w;
    private final HashSet<VerificationApi.VerificationStateChangedListener> g = new HashSet<>();
    private final HashSet<VerificationApi.SmsCodeNotificationListener> h = new HashSet<>();
    private final HashSet<String> q = new HashSet<>();
    final d d = new d(this, (byte) 0);

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: ru.mail.libverify.api.ad$58  reason: invalid class name */
    /* loaded from: classes3.dex */
    public static /* synthetic */ class AnonymousClass58 {
        static final /* synthetic */ int[] b;
        static final /* synthetic */ int[] d;

        static {
            try {
                e[NotificationInfo.a.COMPLETED.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            try {
                e[NotificationInfo.a.UNKNOWN.ordinal()] = 2;
            } catch (NoSuchFieldError e3) {
            }
            d = new int[aa.a.values().length];
            try {
                d[aa.a.PACKAGE_UPDATED.ordinal()] = 1;
            } catch (NoSuchFieldError e4) {
            }
            try {
                d[aa.a.PACKAGE_REMOVED.ordinal()] = 2;
            } catch (NoSuchFieldError e5) {
            }
            try {
                d[aa.a.RESTART.ordinal()] = 3;
            } catch (NoSuchFieldError e6) {
            }
            try {
                d[aa.a.TIMER.ordinal()] = 4;
            } catch (NoSuchFieldError e7) {
            }
            try {
                d[aa.a.SMS_TEMPLATES_CHECK.ordinal()] = 5;
            } catch (NoSuchFieldError e8) {
            }
            try {
                d[aa.a.UNKNOWN.ordinal()] = 6;
            } catch (NoSuchFieldError e9) {
            }
            c = new int[k.b.values().length];
            try {
                c[k.b.GCM.ordinal()] = 1;
            } catch (NoSuchFieldError e10) {
            }
            try {
                c[k.b.FETCHER.ordinal()] = 2;
            } catch (NoSuchFieldError e11) {
            }
            try {
                c[k.b.UNKNOWN.ordinal()] = 3;
            } catch (NoSuchFieldError e12) {
            }
            b = new int[f.c.values().length];
            try {
                b[f.c.OK.ordinal()] = 1;
            } catch (NoSuchFieldError e13) {
            }
            try {
                b[f.c.CONNECTION_TIMEOUT_EXPIRED.ordinal()] = 2;
            } catch (NoSuchFieldError e14) {
            }
            try {
                b[f.c.GENERAL_FAILURE.ordinal()] = 3;
            } catch (NoSuchFieldError e15) {
            }
            try {
                b[f.c.FAILED_TO_FIND_READY_SERVICE.ordinal()] = 4;
            } catch (NoSuchFieldError e16) {
            }
            try {
                b[f.c.FAILED_TO_FIND_TARGET_SESSION.ordinal()] = 5;
            } catch (NoSuchFieldError e17) {
            }
            a = new int[ServerNotificationMessage.Message.b.values().length];
            try {
                a[ServerNotificationMessage.Message.b.MESSAGE.ordinal()] = 1;
            } catch (NoSuchFieldError e18) {
            }
            try {
                a[ServerNotificationMessage.Message.b.PING.ordinal()] = 2;
            } catch (NoSuchFieldError e19) {
            }
            try {
                a[ServerNotificationMessage.Message.b.VERIFIED.ordinal()] = 3;
            } catch (NoSuchFieldError e20) {
            }
            try {
                a[ServerNotificationMessage.Message.b.UNKNOWN.ordinal()] = 4;
            } catch (NoSuchFieldError e21) {
            }
        }
    }

    /* loaded from: classes3.dex */
    private class a implements ru.mail.libverify.api.b {
        private a() {
        }

        /* synthetic */ a(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.api.b
        public final void a() {
            SmsInfo L;
            ru.mail.libverify.utils.d.c("VerificationApi", "account check logic requested sms info");
            if (!ad.this.a.K().interceptAlienSms().booleanValue() || (L = ad.this.a.L()) == null) {
                ad.this.a(ru.mail.libverify.requests.o.b(ad.this.a));
            } else {
                ad.this.m.a(L);
            }
        }

        @Override // ru.mail.libverify.api.b
        public final void a(@NonNull String str) {
            if (TextUtils.isEmpty(str)) {
                ru.mail.libverify.utils.d.a("VerificationApi", "empty alien sms");
            } else if (!ad.this.a.K().interceptAlienSms().booleanValue()) {
                ru.mail.libverify.utils.d.a("VerificationApi", "alien sms interception blocked");
            } else {
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.Instance_Alien_Sms_Intercepted);
                }
                ad.this.a(ru.mail.libverify.requests.o.c(ad.this.a, str));
            }
        }

        @Override // ru.mail.libverify.api.b
        public final void a(@NonNull String str, @Nullable String str2, VerificationApi.AccountCheckResult accountCheckResult) {
            ru.mail.libverify.utils.d.c("VerificationApi", "account check completed with result %s for %s", accountCheckResult, str);
            ad.this.a(ru.mail.libverify.requests.o.a(ad.this.a, str, str2));
            ru.mail.libverify.statistics.b bVar = ad.this.i;
            boolean z = accountCheckResult == VerificationApi.AccountCheckResult.OK && !TextUtils.isEmpty(str2);
            for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                cVar.a(ru.mail.libverify.statistics.a.Check_Account_Completed, new b.a((byte) 0).a("Result", accountCheckResult.toString()).a("SmsFound", Boolean.toString(z)).a);
            }
            if (ad.this.a.K().useSafetyNet().booleanValue()) {
                ad.this.n.b();
            }
        }

        @Override // ru.mail.libverify.api.b
        public final void b() {
            ad.this.a.a(this, false, 0);
        }

        @Override // ru.mail.libverify.api.b
        public final void c() {
            ad.this.a.a(this);
        }

        @Override // ru.mail.libverify.api.b
        public final ru.mail.libverify.storage.o d() {
            return ad.this.k();
        }

        @Override // ru.mail.libverify.api.b
        public final ExecutorService e() {
            return ad.this.i();
        }

        @Override // ru.mail.libverify.api.b
        public final Handler f() {
            return ad.this.b;
        }
    }

    /* loaded from: classes3.dex */
    private class b implements ru.mail.libverify.requests.a {
        private b() {
        }

        /* synthetic */ b(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.requests.a
        public final ru.mail.libverify.storage.k a() {
            return ad.this.a;
        }

        @Override // ru.mail.libverify.requests.a
        public final void a(@NonNull ru.mail.libverify.requests.e eVar) {
            if (eVar instanceof ru.mail.libverify.requests.k) {
                ad.this.a.a(eVar, true, 8);
            } else {
                ad.this.a.a(eVar, false, 8);
            }
        }

        @Override // ru.mail.libverify.requests.a
        public final void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th) {
            ru.mail.libverify.utils.d.a("VerificationApi", th, "action received server failure in api %s", eVar.l());
            ad.a(ad.this, eVar, th);
        }

        @Override // ru.mail.libverify.requests.a
        public final void a(@NonNull ClientApiResponseBase clientApiResponseBase) {
            try {
                ru.mail.libverify.requests.e owner = clientApiResponseBase.getOwner();
                if (owner == null) {
                    throw new IllegalArgumentException("Owner request can't be null");
                }
                if (clientApiResponseBase.getStatus() != ClientApiResponseBase.Status.OK) {
                    ad.this.i.a(clientApiResponseBase);
                    if (clientApiResponseBase.getStatus() != ClientApiResponseBase.Status.ERROR) {
                        return;
                    }
                    if (clientApiResponseBase.getDetailStatus() != ClientApiResponseBase.DetailStatus.UNKNOWN_LIBVERIFY && clientApiResponseBase.getDetailStatus() != ClientApiResponseBase.DetailStatus.UNDEFINED_PHONE) {
                        return;
                    }
                    ad.a(ad.this, true);
                    ad.w(ad.this);
                } else if (!(clientApiResponseBase instanceof UpdateSettingsApiResponse)) {
                    if (!(clientApiResponseBase instanceof PushStatusApiResponse)) {
                        return;
                    }
                    ad.this.i.a(((ru.mail.libverify.requests.k) owner).b.statusTimestamp);
                    ad.this.l.a(((PushStatusApiResponse) clientApiResponseBase).getFetcherInfo());
                } else {
                    UpdateSettingsApiResponse updateSettingsApiResponse = (UpdateSettingsApiResponse) clientApiResponseBase;
                    int updateSettingsTimeout = updateSettingsApiResponse.getUpdateSettingsTimeout();
                    ad.this.k().a("api_last_sent_push_token", ((ru.mail.libverify.requests.o) owner).b).a("api_settings_timestamp", System.currentTimeMillis());
                    if (updateSettingsTimeout > 0) {
                        ad.this.a.a(updateSettingsTimeout);
                        ad.this.k().a("api_settings_timeout", updateSettingsTimeout);
                    }
                    ad.this.k().a();
                    ad.this.a.a(updateSettingsApiResponse.getFeatures());
                    if (updateSettingsApiResponse.hasSmsInfo()) {
                        ad.this.m.a(updateSettingsApiResponse.getSmsInfo());
                        if (ad.this.a.K().interceptAlienSms().booleanValue()) {
                            ad.this.a.a(updateSettingsApiResponse.getSmsInfo());
                        }
                    }
                    if (!ad.this.a.K().interceptAlienSms().booleanValue()) {
                        ad.this.a.a((SmsInfo) null);
                    } else if (!ad.this.a.M()) {
                        ad.this.a.E();
                    }
                    ad.this.l.a(updateSettingsApiResponse.getFetcherInfo());
                    if (TextUtils.isEmpty(updateSettingsApiResponse.getAppCheckId())) {
                        return;
                    }
                    ad.this.n.a(updateSettingsApiResponse.getAppCheckId());
                }
            } catch (Exception e) {
                ru.mail.libverify.utils.c.a("VerificationApi", "api request process error", e);
            }
        }

        @Override // ru.mail.libverify.requests.a
        public final ExecutorService b() {
            return ad.this.i();
        }

        @Override // ru.mail.libverify.requests.a
        public final void b(@NonNull ru.mail.libverify.requests.e eVar) {
            ad.this.a.a(eVar);
        }

        @Override // ru.mail.libverify.requests.a
        public final Handler c() {
            return ad.this.b;
        }

        @Override // ru.mail.libverify.requests.a
        public final ru.mail.libverify.storage.o d() {
            return ad.this.k();
        }
    }

    /* loaded from: classes3.dex */
    private class c implements ru.mail.libverify.api.f {
        private c() {
        }

        /* synthetic */ c(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.api.f
        public final void a() {
            ad.this.a(ru.mail.libverify.requests.o.i(ad.this.a));
        }

        @Override // ru.mail.libverify.api.f
        public final void a(@Nullable String str, ru.mail.libverify.api.d dVar) {
            ru.mail.libverify.statistics.b bVar = ad.this.i;
            String dVar2 = dVar.toString();
            for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                cVar.a(ru.mail.libverify.statistics.a.Check_Application_Completed, new b.a((byte) 0).a("Result", dVar2).a);
            }
            if (!TextUtils.isEmpty(str)) {
                ad.this.a(ru.mail.libverify.requests.o.a(ad.this.a, str));
            }
        }

        @Override // ru.mail.libverify.api.f
        public final ru.mail.libverify.storage.o b() {
            return ad.this.k();
        }

        @Override // ru.mail.libverify.api.f
        public final ExecutorService c() {
            return ad.this.i();
        }

        @Override // ru.mail.libverify.api.f
        public final Handler d() {
            return ad.this.b;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class d implements ru.mail.libverify.fetcher.e {
        volatile ExecutorService a;
        volatile ExecutorService b;

        private d() {
        }

        /* synthetic */ d(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.fetcher.e
        public final ru.mail.libverify.storage.o a() {
            return ad.this.k();
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void a(@NonNull String str) {
            ServerNotificationMessage[] serverNotificationMessageArr;
            ru.mail.libverify.utils.d.c("VerificationApi", "received message from fetcher: %s", str);
            try {
                for (ServerNotificationMessage serverNotificationMessage : (ServerNotificationMessage[]) ru.mail.libverify.utils.json.a.a(str, ServerNotificationMessage[].class)) {
                    serverNotificationMessage.deliveryMethod = k.b.FETCHER;
                    ad.a(ad.this, serverNotificationMessage);
                }
            } catch (JsonParseException e) {
                ru.mail.libverify.utils.c.a("VerificationApi", "failed to parse fetcher json", e);
            }
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void a(@NonNull ServerInfo serverInfo) {
            ad.this.a(serverInfo, k.b.FETCHER);
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th) {
            ru.mail.libverify.utils.d.a("VerificationApi", th, "fetcher received server failure in api %s", eVar.l());
            ad.a(ad.this, eVar, th);
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void a(@NonNull ClientApiResponseBase clientApiResponseBase) {
            ad.this.i.a(clientApiResponseBase);
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void a(boolean z) {
            ru.mail.libverify.utils.d.b("VerificationApi", "fetcher stopped, publish = %s", Boolean.valueOf(z));
            ad.this.a.b(z);
            if (!z || ad.this.f.d()) {
                ru.mail.libverify.utils.d.b("VerificationApi", "fetcher started, did't published");
                return;
            }
            ad.b(ad.this, false);
            for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                cVar.a(ru.mail.libverify.statistics.a.Instance_Fetcher_Stopped);
            }
        }

        @Override // ru.mail.libverify.fetcher.e
        public final ExecutorService b() {
            if (this.b == null) {
                synchronized (this) {
                    if (this.b == null) {
                        this.b = Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: ru.mail.libverify.api.ad.d.1
                            @Override // java.util.concurrent.ThreadFactory
                            public final Thread newThread(@NonNull Runnable runnable) {
                                Thread thread = new Thread(runnable);
                                thread.setName("libverify_fetcher_connection");
                                thread.setUncaughtExceptionHandler(ad.this.o);
                                return thread;
                            }
                        });
                    }
                }
            }
            return this.b;
        }

        @Override // ru.mail.libverify.fetcher.e
        public final void b(boolean z) {
            ru.mail.libverify.utils.d.b("VerificationApi", "fetcher started, publish = %s", Boolean.valueOf(z));
            ad.this.a.I();
            if (!z || ad.this.f.d()) {
                ru.mail.libverify.utils.d.b("VerificationApi", "fetcher started, did't published");
                return;
            }
            ad.b(ad.this, true);
            for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                cVar.a(ru.mail.libverify.statistics.a.Instance_Fetcher_Started);
            }
        }

        @Override // ru.mail.libverify.fetcher.e
        public final ExecutorService c() {
            if (this.a == null) {
                synchronized (this) {
                    if (this.a == null) {
                        this.a = Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: ru.mail.libverify.api.ad.d.2
                            @Override // java.util.concurrent.ThreadFactory
                            public final Thread newThread(@NonNull Runnable runnable) {
                                Thread thread = new Thread(runnable);
                                thread.setName("libverify_fetcher_worker");
                                thread.setUncaughtExceptionHandler(ad.this.o);
                                return thread;
                            }
                        });
                    }
                }
            }
            return this.a;
        }

        @Override // ru.mail.libverify.fetcher.e
        public final Handler d() {
            return ad.this.b;
        }

        @Override // ru.mail.libverify.fetcher.e
        public final boolean e() {
            return ad.this.f.d();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class e implements RejectedExecutionHandler {
        private final UncaughtExceptionListener b;

        private e(UncaughtExceptionListener uncaughtExceptionListener) {
            this.b = uncaughtExceptionListener;
        }

        /* synthetic */ e(ad adVar, UncaughtExceptionListener uncaughtExceptionListener, byte b) {
            this(uncaughtExceptionListener);
        }

        @Override // java.util.concurrent.RejectedExecutionHandler
        public final void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
            if (threadPoolExecutor.isShutdown()) {
                ru.mail.libverify.utils.d.b("VerificationApi", "discard runnable %s on executor %s as it was shut down", runnable, threadPoolExecutor);
                return;
            }
            IllegalStateException illegalStateException = new IllegalStateException(String.format("discard runnable %s on executor %s as it was shut down", runnable, threadPoolExecutor));
            ru.mail.libverify.utils.d.a("VerificationApi", "wrong libverify instance object state", illegalStateException);
            ad.this.i.a((Thread) null, illegalStateException);
            if (this.b == null) {
                return;
            }
            this.b.uncaughtException(null, illegalStateException);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class f implements v {
        private ru.mail.libverify.sms.k b;
        private ru.mail.libverify.sms.g c;
        private HashMap<String, Boolean> d;

        private f() {
        }

        /* synthetic */ f(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.api.v
        public final Handler a() {
            return ad.this.b;
        }

        @Override // ru.mail.libverify.api.v
        public final void a(@NonNull String str, @NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
            ArrayList<VerificationApi.VerificationStateChangedListener> arrayList;
            ae a;
            if (ad.this.f.c(str)) {
                ru.mail.libverify.utils.d.c("VerificationApi", "session %s state changed to %s", str, verificationStateDescriptor);
                synchronized (ad.this) {
                    arrayList = new ArrayList(ad.this.g);
                }
                for (VerificationApi.VerificationStateChangedListener verificationStateChangedListener : arrayList) {
                    verificationStateChangedListener.onStateChanged(str, verificationStateDescriptor);
                }
            } else if (ad.this.a.K().backgroundVerify().booleanValue() && (a = ad.this.f.a(str, w.a.b)) != null && a.i().completedSuccessfully()) {
                ad.this.f.d(str);
                a.b();
                ru.mail.libverify.statistics.b bVar = ad.this.i;
                if (a != null) {
                    for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                        cVar.a(ru.mail.libverify.statistics.a.Verification_Completed_Background, new b.a((byte) 0).a("ServiceName", a.k()).a("VerificationSource", a.i().getSource().toString()).a);
                    }
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "temporary session %s state has been removed after completion (%s)", str, verificationStateDescriptor);
            }
        }

        @Override // ru.mail.libverify.api.v
        public final void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th) {
            ru.mail.libverify.utils.d.a("VerificationApi", th, "session received server failure in api %s", eVar.l());
            ad.a(ad.this, eVar, th);
        }

        @Override // ru.mail.libverify.api.v
        public final void a(@NonNull ClientApiResponseBase clientApiResponseBase) {
            ru.mail.libverify.utils.d.a("VerificationApi", "session received server error in api %s", clientApiResponseBase.getOwner().l());
            ad.this.i.a(clientApiResponseBase);
        }

        @Override // ru.mail.libverify.api.v
        public final void a(@Nullable FetcherInfo fetcherInfo) {
            ad.this.l.a(fetcherInfo);
        }

        @Override // ru.mail.libverify.api.v
        public final boolean a(@NonNull String str) {
            boolean z;
            if (this.d == null) {
                this.d = new HashMap<>();
            }
            Boolean bool = this.d.get(str);
            if (bool != null) {
                return bool.booleanValue();
            }
            ru.mail.libverify.utils.d.c("VerificationApi", "check phone is able to intercept calls");
            if (!ru.mail.libverify.utils.m.b(ad.this.a.d(), "android.permission.READ_PHONE_STATE")) {
                ru.mail.libverify.utils.d.b("VerificationApi", "can't intercept calls to %s (%s)", str, "no permission");
                z = false;
            } else if (!ad.this.a.p().m()) {
                ru.mail.libverify.utils.d.b("VerificationApi", "can't intercept calls to %s (%s)", str, "no ready sim");
                z = false;
            } else if (ad.this.a.p().a(str) == d.a.c) {
                ru.mail.libverify.utils.d.b("VerificationApi", "can't intercept calls to %s (%s)", str, "no matched sim");
                z = false;
            } else {
                z = true;
            }
            Boolean valueOf = Boolean.valueOf(z);
            this.d.put(str, valueOf);
            return valueOf.booleanValue();
        }

        @Override // ru.mail.libverify.api.v
        public final ru.mail.libverify.sms.k b() {
            if (this.b == null) {
                this.b = new ru.mail.libverify.sms.m(new ru.mail.libverify.sms.l() { // from class: ru.mail.libverify.api.ad.f.1
                    @Override // ru.mail.libverify.sms.l
                    public final Handler a() {
                        return ad.this.b;
                    }

                    @Override // ru.mail.libverify.sms.l
                    public final Context b() {
                        return ad.this.a.d();
                    }
                });
            }
            return this.b;
        }

        @Override // ru.mail.libverify.api.v
        public final ru.mail.libverify.sms.g c() {
            if (this.c == null) {
                this.c = new ru.mail.libverify.sms.h(ad.this.a.d(), ad.this.b, ad.this.i());
            }
            return this.c;
        }

        @Override // ru.mail.libverify.api.v
        public final ru.mail.libverify.storage.o d() {
            return ad.this.k();
        }

        @Override // ru.mail.libverify.api.v
        public final ExecutorService e() {
            return ad.this.i();
        }
    }

    /* loaded from: classes3.dex */
    private class g implements c.a {
        private g() {
        }

        /* synthetic */ g(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.utils.c.a
        public final void a(final Throwable th) {
            final Thread currentThread = Thread.currentThread();
            ad.this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.g.1
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.statistics.b bVar = ad.this.i;
                    Thread thread = currentThread;
                    Throwable th2 = th;
                    for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                        cVar.b(thread, th2);
                    }
                }
            });
        }
    }

    /* loaded from: classes3.dex */
    private class h implements Thread.UncaughtExceptionHandler {
        private final UncaughtExceptionListener b;

        private h(UncaughtExceptionListener uncaughtExceptionListener) {
            this.b = uncaughtExceptionListener;
        }

        /* synthetic */ h(ad adVar, UncaughtExceptionListener uncaughtExceptionListener, byte b) {
            this(uncaughtExceptionListener);
        }

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public final void uncaughtException(Thread thread, Throwable th) {
            ru.mail.libverify.utils.d.a("VerificationApi", th, "FATAL ERROR due to libverify unhandled exception in thread %s (%d)", thread.getName(), Long.valueOf(thread.getId()));
            if (this.b != null) {
                this.b.uncaughtException(thread, th);
            }
            ad.this.i.a(thread, th);
        }
    }

    /* loaded from: classes3.dex */
    private class i implements ru.mail.libverify.storage.u {
        private i() {
        }

        /* synthetic */ i(ad adVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.storage.u
        public final void a() {
            ad.this.i().submit(new Runnable() { // from class: ru.mail.libverify.api.ad.i.1
                @Override // java.lang.Runnable
                public final void run() {
                    ad.this.a.A();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ad(@NonNull ru.mail.libverify.storage.l lVar, @NonNull List<ru.mail.libverify.statistics.c> list, @Nullable LogReceiver logReceiver, @Nullable UncaughtExceptionListener uncaughtExceptionListener) {
        lVar.d();
        ru.mail.libverify.utils.d.a(logReceiver);
        m.a(lVar.d());
        this.a = lVar;
        this.a.a((ru.mail.libverify.storage.u) new i(this, (byte) 0));
        ru.mail.libverify.statistics.b bVar = new ru.mail.libverify.statistics.b();
        bVar.a.addAll(list);
        this.i = bVar;
        this.o = new h(this, uncaughtExceptionListener, (byte) 0);
        this.p = new e(this, uncaughtExceptionListener, (byte) 0);
        ru.mail.libverify.utils.c.a = new g(this, (byte) 0);
        HandlerThread handlerThread = new HandlerThread("libverify_worker");
        handlerThread.setUncaughtExceptionHandler(this.o);
        handlerThread.start();
        this.c = handlerThread;
        this.b = new ru.mail.libverify.utils.b(this.c.getLooper());
        this.j = new u(new s() { // from class: ru.mail.libverify.api.ad.23
            @Override // ru.mail.libverify.api.s
            public final Handler a() {
                return ad.this.b;
            }

            @Override // ru.mail.libverify.api.s
            public final void a(@NonNull ServerNotificationMessage serverNotificationMessage) {
                ad.this.a.a(serverNotificationMessage, false, 12);
            }

            @Override // ru.mail.libverify.api.s
            public final ru.mail.libverify.storage.o b() {
                return ad.this.a.z();
            }

            @Override // ru.mail.libverify.api.s
            public final void b(@NonNull ServerNotificationMessage serverNotificationMessage) {
                ad.this.a.a(serverNotificationMessage);
            }
        });
        this.f = new x(new y() { // from class: ru.mail.libverify.api.ad.34
            private z b;

            @Override // ru.mail.libverify.api.y
            public final Handler a() {
                return ad.this.b;
            }

            @Override // ru.mail.libverify.api.y
            public final void a(@NonNull ae aeVar) {
                ad.this.a.a(aeVar, true, 13);
            }

            @Override // ru.mail.libverify.api.y
            public final z b() {
                if (this.b == null) {
                    this.b = new z() { // from class: ru.mail.libverify.api.ad.34.1
                        @Override // ru.mail.libverify.api.z
                        public final ae a(@NonNull String str) {
                            return new af(ad.this.l(), ad.this.a, str);
                        }
                    };
                }
                return this.b;
            }

            @Override // ru.mail.libverify.api.y
            public final void b(@NonNull ae aeVar) {
                ad.this.a.a(aeVar);
                if (!aeVar.i().completedSuccessfully()) {
                    ad.this.l.a();
                    return;
                }
                if (ad.this.a.K().useSafetyNet().booleanValue()) {
                    ad.this.n.b();
                }
                ad.this.l.d();
            }

            @Override // ru.mail.libverify.api.y
            public final ru.mail.libverify.storage.o c() {
                return ad.this.k();
            }
        });
        this.k = new ru.mail.libverify.requests.c(new b(this, (byte) 0));
        this.m = new ru.mail.libverify.api.c(this.a, new a(this, (byte) 0));
        this.l = new ru.mail.libverify.fetcher.f(this.a, this.d);
        this.n = new ru.mail.libverify.api.g(this.a, new c(this, (byte) 0));
        ru.mail.libverify.utils.d.b("VerificationApi", "prepare internal members %d", Integer.valueOf(hashCode()));
        i().prestartAllCoreThreads();
        i().submit(new Runnable() { // from class: ru.mail.libverify.api.ad.1
            @Override // java.lang.Runnable
            public final void run() {
                ad.this.a.A();
                ad.this.a.a(ad.b(ad.this));
                ad.this.a.F();
            }
        });
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.12
            @Override // java.lang.Runnable
            public final void run() {
                ad.this.k.a();
                ad.this.m.a();
                ad.this.n.a();
                ad.this.l.b();
                ad.g(ad.this);
                ad.h(ad.this);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@NonNull List<k.c> list, @NonNull ServerNotificationMessage serverNotificationMessage, String str) {
        ru.mail.libverify.statistics.b bVar = this.i;
        if (serverNotificationMessage.message != null) {
            for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                cVar.a(ru.mail.libverify.statistics.a.PushNotification_Completed, new b.a((byte) 0).a("PushSender", serverNotificationMessage.sender).a("PushCompletion", Arrays.toString(list.toArray())).a("PushDelivery", serverNotificationMessage.deliveryMethod.toString()).a);
            }
        }
        a(new ru.mail.libverify.requests.k(this.a, list, serverNotificationMessage.message.session_id, serverNotificationMessage.deliveryMethod, k.a.SMS_CODE, str, serverNotificationMessage.timestamp));
    }

    static /* synthetic */ void a(ad adVar, final Runnable runnable) {
        String[] strArr = adVar.w;
        if (strArr == null || strArr.length == 0) {
            runnable.run();
            return;
        }
        HashSet hashSet = new HashSet(Arrays.asList(h()));
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            if (hashSet.contains(str) && !adVar.q.contains(str)) {
                arrayList.add(str);
                adVar.q.add(str);
            }
        }
        adVar.w = null;
        final String[] strArr2 = (String[]) arrayList.toArray(new String[arrayList.size()]);
        ru.mail.libverify.utils.permissions.a.a(adVar.a.d(), strArr2, new a.InterfaceC0287a() { // from class: ru.mail.libverify.api.ad.52
            @Override // ru.mail.libverify.utils.permissions.a.InterfaceC0287a
            public final void a(String str2) {
                ru.mail.libverify.utils.d.b("VerificationApi", "permission %s granted", str2);
            }

            @Override // ru.mail.libverify.utils.permissions.a.InterfaceC0287a
            public final void a(boolean z) {
                ru.mail.libverify.utils.d.b("VerificationApi", "permission request %s completed (%s)", Arrays.toString(strArr2), Boolean.valueOf(z));
                ad.this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.52.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        if (runnable != null) {
                            runnable.run();
                        }
                    }
                });
            }

            @Override // ru.mail.libverify.utils.permissions.a.InterfaceC0287a
            public final void b(String str2) {
                ru.mail.libverify.utils.d.a("VerificationApi", "permission %s denied", str2);
            }
        });
    }

    static /* synthetic */ void a(ad adVar, String str) {
        ru.mail.libverify.utils.d.c("VerificationApi", "received fetcher info %s", str);
        try {
            FetcherInfo fetcherInfo = (FetcherInfo) ru.mail.libverify.utils.json.a.a(str, FetcherInfo.class);
            try {
                ru.mail.libverify.utils.d.c("VerificationApi", "received fetcher info %s", fetcherInfo);
                adVar.l.a(fetcherInfo);
            } catch (Exception e2) {
                ru.mail.libverify.utils.c.a("VerificationApi", "failed to process fetcher info", e2);
            }
        } catch (JsonParseException e3) {
            ru.mail.libverify.utils.c.a("VerificationApi", "failed to parse fetcher info json", e3);
        }
    }

    static /* synthetic */ void a(ad adVar, String str, int i2) {
        adVar.a(ru.mail.libverify.requests.o.a(adVar.a, str, i2));
    }

    static /* synthetic */ void a(ad adVar, String str, k.b bVar) {
        ru.mail.libverify.utils.d.c("VerificationApi", "received server info %s from %s", str, bVar);
        try {
            adVar.a((ServerInfo) ru.mail.libverify.utils.json.a.a(str, ServerInfo.class), bVar);
        } catch (JsonParseException e2) {
            ru.mail.libverify.utils.c.a("VerificationApi", "failed to parse server info json", e2);
        }
    }

    static /* synthetic */ void a(ad adVar, final ServerNotificationMessage serverNotificationMessage) {
        String str;
        boolean z;
        boolean z2;
        ru.mail.libverify.utils.d.c("VerificationApi", "process message %s", serverNotificationMessage);
        try {
            serverNotificationMessage.timestamp = System.currentTimeMillis();
            ru.mail.libverify.statistics.b bVar = adVar.i;
            ServerNotificationMessage.Message message = serverNotificationMessage.message;
            if (message != null) {
                for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                    cVar.a(ru.mail.libverify.statistics.a.PushNotification_Received, new b.a((byte) 0).a("PushSender", serverNotificationMessage.sender).a("PushType", message.type.toString()).a("PushFlags", message.delivery_flags != null ? Arrays.toString(message.delivery_flags.toArray()) : null).a("PushDelivery", serverNotificationMessage.deliveryMethod.toString()).a("PushWithConfirm", Boolean.toString(message.a())).a);
                }
            }
            ServerNotificationMessage.Message message2 = serverNotificationMessage.message;
            ArrayList arrayList = new ArrayList();
            if (!TextUtils.equals(adVar.a.p().g(), message2.imsi)) {
                ru.mail.libverify.utils.d.a("VerificationApi", "%s provided imsis are not equal to local imsi", adVar.a.toString());
                arrayList.add(k.c.IMSI_NOT_MATCH);
            }
            if (!TextUtils.equals(adVar.a.p().h(), message2.imei)) {
                ru.mail.libverify.utils.d.a("VerificationApi", "%s provided imeis are not equal to local imeis", adVar.a.toString());
                arrayList.add(k.c.IMEI_NOT_MATCH);
            }
            if (!TextUtils.equals(ru.mail.libverify.utils.m.a(adVar.a.e()), message2.application_id)) {
                ru.mail.libverify.utils.d.a("VerificationApi", "%s provided id is not equal to local id", adVar.a.toString());
                arrayList.add(k.c.APPLICATION_ID_NOT_MATCH);
                str = message2.application_id;
            } else {
                str = null;
            }
            if (arrayList.isEmpty()) {
                z = true;
            } else {
                adVar.a(arrayList, serverNotificationMessage, str);
                z = false;
            }
            if (!z) {
                return;
            }
            ServerNotificationMessage.Message message3 = serverNotificationMessage.message;
            switch (message3.type) {
                case MESSAGE:
                    ServerNotificationMessage.Message message4 = serverNotificationMessage.message;
                    if (TextUtils.isEmpty(message4.from) || TextUtils.isEmpty(message4.text)) {
                        ru.mail.libverify.utils.d.a("VerificationApi", "ether text or from field is undefined");
                        return;
                    }
                    boolean z3 = message4.delivery_flags.contains(ServerNotificationMessage.Message.a.IPC) && !TextUtils.isEmpty(message4.session_id);
                    final boolean contains = message4.delivery_flags.contains(ServerNotificationMessage.Message.a.SMS);
                    final boolean z4 = message4.delivery_flags.contains(ServerNotificationMessage.Message.a.POPUP) && ru.mail.libverify.utils.h.a(adVar.a.d());
                    if (!z3 && !z4 && !contains) {
                        ru.mail.libverify.utils.d.a("VerificationApi", "all notifications blocked by flags");
                        adVar.a(Arrays.asList(k.c.SMS_ACCESS_ERROR, k.c.IPC_ACCESS_ERROR), serverNotificationMessage, (String) null);
                        return;
                    }
                    ServerNotificationMessage b2 = adVar.j.b(serverNotificationMessage.a());
                    if (serverNotificationMessage.equals(b2)) {
                        adVar.i.a(b2, serverNotificationMessage);
                        z2 = false;
                    } else {
                        adVar.j.a(serverNotificationMessage.a(), serverNotificationMessage);
                        z2 = true;
                    }
                    if (!z2) {
                        ru.mail.libverify.utils.d.b("VerificationApi", "message %s has been already registered", serverNotificationMessage);
                        return;
                    } else if (z3) {
                        final ServerNotificationMessage.Message message5 = serverNotificationMessage.message;
                        ru.mail.libverify.utils.d.c("VerificationApi", "post ipc message to session %s", message5.session_id);
                        ru.mail.libverify.ipc.f fVar = new ru.mail.libverify.ipc.f(adVar.a.d(), adVar, new f.b() { // from class: ru.mail.libverify.api.ad.4
                            @Override // ru.mail.libverify.ipc.f.b
                            public final void a(final f.c cVar2) {
                                ad.this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.4.1
                                    @Override // java.lang.Runnable
                                    public final void run() {
                                        boolean z5 = false;
                                        ru.mail.libverify.utils.d.c("VerificationApi", "connection to session %s status %s", message5.session_id, cVar2.toString());
                                        HashSet hashSet = new HashSet();
                                        switch (AnonymousClass58.b[cVar2.ordinal()]) {
                                            case 1:
                                                hashSet.add(k.c.DELIVERED);
                                                break;
                                            case 2:
                                            case 3:
                                            case 4:
                                            case 5:
                                                hashSet.add(k.c.IPC_ACCESS_ERROR);
                                                if (!z4) {
                                                    if (contains) {
                                                        ru.mail.libverify.utils.d.b("VerificationApi", "failed to write sms");
                                                        hashSet.add(k.c.SMS_ACCESS_ERROR);
                                                        break;
                                                    }
                                                } else {
                                                    z5 = ad.this.a(serverNotificationMessage, true);
                                                    hashSet.add(k.c.DELIVERED);
                                                    break;
                                                }
                                                break;
                                            default:
                                                throw new IllegalStateException("State should be defined before calling onConnectResult() callback");
                                        }
                                        ad.this.a(new ArrayList(hashSet), serverNotificationMessage, (String) null);
                                        if (!z5) {
                                            ad.c(ad.this, serverNotificationMessage);
                                        }
                                        ad.this.a.a(ad.this);
                                    }
                                });
                            }
                        });
                        adVar.a.a(adVar, true, 0);
                        fVar.a(new h.a(fVar.b, message5.session_id, message5.text), message5.requester_package_name);
                        return;
                    } else if (z4) {
                        adVar.a(serverNotificationMessage, false);
                        adVar.a(Collections.singletonList(k.c.DELIVERED), serverNotificationMessage, (String) null);
                        return;
                    } else {
                        ru.mail.libverify.utils.d.b("VerificationApi", "failed to write sms");
                        adVar.a(Collections.singletonList(k.c.SMS_ACCESS_ERROR), serverNotificationMessage, (String) null);
                        return;
                    }
                case PING:
                    ru.mail.libverify.utils.d.c("VerificationApi", "ping message %s", serverNotificationMessage);
                    switch (serverNotificationMessage.deliveryMethod) {
                        case GCM:
                            adVar.a(ru.mail.libverify.requests.o.f(adVar.a));
                            return;
                        case FETCHER:
                            adVar.a(ru.mail.libverify.requests.o.g(adVar.a));
                            return;
                        case UNKNOWN:
                            adVar.a(ru.mail.libverify.requests.o.a(adVar.a));
                            return;
                        default:
                            throw new IllegalArgumentException();
                    }
                case VERIFIED:
                    ru.mail.libverify.utils.d.c("VerificationApi", "verified message %s", serverNotificationMessage);
                    ae a2 = adVar.f.a(serverNotificationMessage.message.session_id, w.a.a);
                    if (a2 == null) {
                        return;
                    }
                    a2.e();
                    return;
                default:
                    throw new IllegalArgumentException("unexpected message type " + message3.type);
            }
        } catch (Exception e2) {
            ru.mail.libverify.utils.c.a("VerificationApi", e2, "failed to process server notification", new Object[0]);
        }
    }

    static /* synthetic */ void a(ad adVar, ru.mail.libverify.requests.e eVar, Throwable th) {
        try {
            ru.mail.libverify.utils.d.b("VerificationApi", "handle server failure", th);
            if (th instanceof ServerException) {
                ServerException serverException = (ServerException) th;
                for (ru.mail.libverify.statistics.c cVar : adVar.i.a) {
                    ru.mail.libverify.statistics.a aVar = ru.mail.libverify.statistics.a.Server_Failure;
                    b.a aVar2 = new b.a((byte) 0);
                    aVar2.a.put("Code", Integer.toString(serverException.a));
                    cVar.a(aVar, aVar2.a("Method", eVar.l()).a);
                }
            } else if (!(th instanceof IOException)) {
                if (!(th instanceof ClientException)) {
                    adVar.i.a(Thread.currentThread(), th);
                    return;
                }
                ClientException clientException = (ClientException) th;
                for (ru.mail.libverify.statistics.c cVar2 : adVar.i.a) {
                    cVar2.a(ru.mail.libverify.statistics.a.Server_Failure, new b.a((byte) 0).a("Code", clientException.toString()).a("Method", eVar.l()).a);
                }
            } else if (adVar.a.j() && eVar.h()) {
                ru.mail.libverify.utils.d.b("VerificationApi", "switched to the next api url");
                IOException iOException = (IOException) th;
                for (ru.mail.libverify.statistics.c cVar3 : adVar.i.a) {
                    cVar3.a(ru.mail.libverify.statistics.a.Server_Switched_To_Next_Api_Host, new b.a((byte) 0).a("Code", iOException.toString()).a("Method", eVar.l()).a);
                }
            }
        } catch (Throwable th2) {
            ru.mail.libverify.utils.d.a("VerificationApi", "failed to process server failure", th2);
        }
    }

    static /* synthetic */ void a(ad adVar, boolean z) {
        ru.mail.libverify.utils.d.b("VerificationApi", "instance reset started (drop installation = %s)", Boolean.valueOf(z));
        if (z) {
            adVar.a.y();
            adVar.a.z().d("api_last_sent_push_token").d("api_settings_timestamp");
            adVar.m.b();
            adVar.n.c();
        }
        adVar.f.c();
        adVar.j.c();
        ru.mail.libverify.notifications.c j = adVar.j();
        j.b.clear();
        try {
            ru.mail.libverify.utils.d.b("NotificationBarManager", "cancel all");
            j.a.cancelAll();
        } catch (NullPointerException | SecurityException e2) {
            ru.mail.libverify.utils.d.a("NotificationBarManager", "cancel all", e2);
        }
        adVar.k.b();
        adVar.a.B();
        adVar.l.a();
        adVar.a.z().a();
        ru.mail.libverify.utils.d.b("VerificationApi", "instance reset completed");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@NonNull ServerInfo serverInfo, k.b bVar) {
        try {
            ru.mail.libverify.utils.d.c("VerificationApi", "received server info %s from %s", serverInfo, bVar);
            if (serverInfo.call_info != null) {
                CallInfo callInfo = serverInfo.call_info;
                for (ae aeVar : this.f.a(w.a.a)) {
                    aeVar.a(callInfo);
                    for (ru.mail.libverify.statistics.c cVar : this.i.a) {
                        cVar.a(ru.mail.libverify.statistics.a.Session_Call_Info_Received, new b.a((byte) 0).a("PushDelivery", bVar.toString()).a("PushTime", ru.mail.libverify.statistics.b.b(System.currentTimeMillis() - aeVar.j())).a);
                    }
                }
            } else if (serverInfo.notification_info != null) {
                NotificationInfo notificationInfo = serverInfo.notification_info;
                ArrayList<ServerNotificationMessage> arrayList = new ArrayList(this.j.b());
                switch (notificationInfo.action) {
                    case COMPLETED:
                        for (ServerNotificationMessage serverNotificationMessage : arrayList) {
                            if (serverNotificationMessage.message != null && TextUtils.equals(ru.mail.libverify.utils.m.a(serverNotificationMessage.message.session_id), notificationInfo.session_id)) {
                                this.j.a(serverNotificationMessage.a());
                                j().a(serverNotificationMessage.a());
                                this.i.a(serverNotificationMessage);
                                ru.mail.libverify.utils.d.c("VerificationApi", "removed message %s", serverNotificationMessage.a());
                            }
                        }
                        break;
                    default:
                        throw new IllegalArgumentException("Action = " + notificationInfo.action);
                }
            }
            if (!(serverInfo.confirm_required == 1)) {
                return;
            }
            String str = null;
            if (serverInfo.call_info != null) {
                str = serverInfo.call_info.getHashedSessionId();
            } else if (serverInfo.notification_info != null) {
                str = serverInfo.notification_info.session_id;
            }
            if (TextUtils.isEmpty(str)) {
                return;
            }
            a(new ru.mail.libverify.requests.k(this.a, Collections.singletonList(k.c.DELIVERED), str, bVar, k.a.SERVER_INFO, null, System.currentTimeMillis()));
        } catch (Exception e2) {
            ru.mail.libverify.utils.c.a("VerificationApi", "failed to process server info", e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public <T extends ClientApiResponseBase> void a(ru.mail.libverify.requests.e<T> eVar) {
        try {
            this.k.a(eVar);
        } catch (Exception e2) {
            ru.mail.libverify.utils.c.a("VerificationApi", e2, "failed to create %s", eVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(@NonNull final ServerNotificationMessage serverNotificationMessage, boolean z) {
        ArrayList<VerificationApi.SmsCodeNotificationListener> arrayList;
        if (z && this.j.b(serverNotificationMessage.a()) == null) {
            ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", serverNotificationMessage.a());
            return false;
        }
        ru.mail.libverify.utils.d.c("VerificationApi", "show popup %s", serverNotificationMessage);
        j().a(serverNotificationMessage, false);
        ru.mail.libverify.ipc.f fVar = new ru.mail.libverify.ipc.f(this.a.d(), this, new f.b() { // from class: ru.mail.libverify.api.ad.5
            @Override // ru.mail.libverify.ipc.f.b
            public final void a(f.c cVar) {
                ru.mail.libverify.utils.d.c("VerificationApi", "post cancel notification result %s for %s ", cVar, serverNotificationMessage);
            }
        });
        fVar.a(new c.a(fVar.b, serverNotificationMessage.a(), serverNotificationMessage.timestamp), (String) null);
        synchronized (this) {
            arrayList = new ArrayList(this.h);
        }
        ru.mail.libverify.utils.d.c("VerificationApi", "notify sms listeners count %d", Integer.valueOf(arrayList.size()));
        for (VerificationApi.SmsCodeNotificationListener smsCodeNotificationListener : arrayList) {
            smsCodeNotificationListener.onNotification(serverNotificationMessage.message.text);
        }
        return true;
    }

    static /* synthetic */ int b(ad adVar) {
        Integer c2 = adVar.a.z().c("api_settings_timeout");
        if (c2 != null) {
            Integer m = adVar.m();
            if (m != null && c2.intValue() > m.intValue()) {
                c2 = Integer.valueOf(c2.intValue() - m.intValue());
            }
        } else {
            c2 = 86400000;
        }
        ru.mail.libverify.utils.d.b("VerificationApi", "timeout for the next settings check %d", c2);
        return c2.intValue();
    }

    static /* synthetic */ void b(ad adVar, final boolean z) {
        if (!adVar.a.K().singleFetcher().booleanValue()) {
            ru.mail.libverify.utils.d.b("VerificationApi", "fetcher communication disabled");
            return;
        }
        ru.mail.libverify.utils.d.c("VerificationApi", "fetcher started result %s", Boolean.valueOf(z));
        ru.mail.libverify.ipc.f fVar = new ru.mail.libverify.ipc.f(adVar.a.d(), adVar, new f.b() { // from class: ru.mail.libverify.api.ad.17
            @Override // ru.mail.libverify.ipc.f.b
            public final void a(f.c cVar) {
                ru.mail.libverify.utils.d.c("VerificationApi", "post fetcher started result %s with started %s", cVar, Boolean.valueOf(z));
            }
        });
        if (z) {
            fVar.a(new e.a(fVar.b, fVar.a, e.b.a), (String) null);
        } else {
            fVar.a(new e.a(fVar.b, fVar.a, e.b.b), (String) null);
        }
    }

    static /* synthetic */ void c(ad adVar, ServerNotificationMessage serverNotificationMessage) {
        adVar.j.a(serverNotificationMessage.a());
    }

    static /* synthetic */ void g(ad adVar) {
        String o = adVar.a.o();
        String a2 = adVar.a.z().a("api_last_sent_push_token");
        ru.mail.libverify.utils.d.c("VerificationApi", "update push token %s -> %s", a2, o);
        if (TextUtils.isEmpty(o)) {
            if (adVar.a.C() || adVar.a.z().a("api_no_gcm_service_sent") != null) {
                return;
            }
            adVar.a(ru.mail.libverify.requests.o.h(adVar.a));
            adVar.k().a("api_no_gcm_service_sent", Long.toString(System.currentTimeMillis())).a();
        } else if (!TextUtils.equals(a2, o)) {
            adVar.a(ru.mail.libverify.requests.o.a(adVar.a));
            ru.mail.libverify.statistics.b bVar = adVar.i;
            boolean z = !TextUtils.isEmpty(a2);
            for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                cVar.a(ru.mail.libverify.statistics.a.PushToken_Received, new b.a((byte) 0).a("PushTokenRenewed", Boolean.toString(z)).a);
            }
        }
    }

    static /* synthetic */ void h(ad adVar) {
        ru.mail.libverify.utils.d.c("VerificationApi", "session processing started (count = %d)", Integer.valueOf(adVar.f.b()));
        for (ae aeVar : adVar.f.a(w.a.a)) {
            aeVar.a();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(16)
    public static String[] h() {
        return new String[]{"android.permission.READ_SMS", "android.permission.RECEIVE_SMS", "android.permission.READ_CALL_LOG", "android.permission.CALL_PHONE", "android.permission.READ_PHONE_STATE", "android.permission.GET_ACCOUNTS", "android.permission.READ_CONTACTS", "android.permission.ACCESS_COARSE_LOCATION"};
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ThreadPoolExecutor i() {
        if (this.t == null) {
            this.t = new ThreadPoolExecutor(3, 3, 120L, e, new LinkedBlockingQueue());
            this.t.allowCoreThreadTimeOut(true);
            this.t.setRejectedExecutionHandler(this.p);
            this.t.setThreadFactory(new ThreadFactory() { // from class: ru.mail.libverify.api.ad.44
                private AtomicInteger b = new AtomicInteger(0);

                @Override // java.util.concurrent.ThreadFactory
                public final Thread newThread(@NonNull Runnable runnable) {
                    Thread thread = new Thread(runnable);
                    thread.setName("libverify_background_worker" + this.b.incrementAndGet());
                    thread.setPriority(8);
                    thread.setUncaughtExceptionHandler(ad.this.o);
                    return thread;
                }
            });
        }
        return this.t;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ru.mail.libverify.notifications.c j() {
        if (this.u == null) {
            this.u = new ru.mail.libverify.notifications.c(new ru.mail.libverify.notifications.d() { // from class: ru.mail.libverify.api.ad.59
                @Override // ru.mail.libverify.notifications.d
                public final Handler a() {
                    return ad.this.b;
                }

                @Override // ru.mail.libverify.notifications.d
                public final void a(@NonNull ServerNotificationMessage serverNotificationMessage, int i2) {
                    if (ad.this.j.b(serverNotificationMessage.a()) == null) {
                        ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", serverNotificationMessage.a());
                    } else {
                        ad.this.a.a(serverNotificationMessage.a(), i2);
                    }
                }

                @Override // ru.mail.libverify.notifications.d
                public final Context b() {
                    return ad.this.a.d();
                }
            });
        }
        return this.u;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ru.mail.libverify.storage.o k() {
        if (this.s == null) {
            this.s = new ru.mail.libverify.storage.d(this.a.z(), this.b);
        }
        return this.s;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public v l() {
        if (this.r == null) {
            this.r = new f(this, (byte) 0);
            i().submit(new Runnable() { // from class: ru.mail.libverify.api.ad.60
                @Override // java.lang.Runnable
                public final void run() {
                    ad.this.a.x();
                }
            });
        }
        return this.r;
    }

    private Integer m() {
        Long b2 = this.a.z().b("api_settings_timestamp");
        if (b2 == null) {
            return null;
        }
        long currentTimeMillis = System.currentTimeMillis() - b2.longValue();
        if (currentTimeMillis < 0) {
            return null;
        }
        return Integer.valueOf((int) currentTimeMillis);
    }

    static /* synthetic */ void q(ad adVar) {
        adVar.i().submit(new Runnable() { // from class: ru.mail.libverify.api.ad.19
            @Override // java.lang.Runnable
            public final void run() {
                ad.this.a.p();
                ad.this.a.q().b();
            }
        });
    }

    static /* synthetic */ void r(ad adVar) {
        ru.mail.libverify.utils.d.c("VerificationApi", "sessions notified (count = %d) network available", Integer.valueOf(adVar.f.b()));
        for (ae aeVar : adVar.f.a(w.a.a)) {
            aeVar.f();
        }
    }

    static /* synthetic */ r s(ad adVar) {
        if (adVar.v == null) {
            adVar.v = new r(adVar.a, new q() { // from class: ru.mail.libverify.api.ad.54
                @Override // ru.mail.libverify.api.q
                public final Handler a() {
                    return ad.this.b;
                }

                @Override // ru.mail.libverify.api.q
                public final void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th) {
                    ru.mail.libverify.utils.d.a("VerificationApi", th, "phone checker received server failure in api %s", eVar.l());
                    ad.a(ad.this, eVar, th);
                }

                @Override // ru.mail.libverify.api.q
                public final void a(@NonNull ClientApiResponseBase clientApiResponseBase) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "phone checker received server error in api %s", clientApiResponseBase.getOwner().l());
                    ad.this.i.a(clientApiResponseBase);
                }

                @Override // ru.mail.libverify.api.q
                public final ExecutorService b() {
                    return ad.this.i();
                }

                @Override // ru.mail.libverify.api.q
                public final void c() {
                    ru.mail.libverify.utils.d.c("VerificationApi", "phone checker started new session");
                    for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                        cVar.a(ru.mail.libverify.statistics.a.PhoneChecker_New_Check_Started);
                    }
                }
            });
        }
        return adVar.v;
    }

    static /* synthetic */ void t(ad adVar) {
        adVar.a(ru.mail.libverify.requests.o.m(adVar.a));
    }

    static /* synthetic */ boolean u(ad adVar) {
        Integer m = adVar.m();
        ru.mail.libverify.utils.d.b("VerificationApi", "elapsed time since the last settings check %s", m);
        return m == null || m.intValue() >= 86400000;
    }

    static /* synthetic */ void w(ad adVar) {
        ru.mail.libverify.utils.d.b("VerificationApi", "cancel started");
        adVar.b.removeCallbacksAndMessages(null);
        adVar.g();
        adVar.a.H();
        ru.mail.libverify.utils.d.b("VerificationApi", "cancel completed");
    }

    @Override // ru.mail.libverify.api.i
    public final void a() {
        ru.mail.libverify.utils.d.c("VerificationApi", "execute check fetcher state");
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.53
            @Override // java.lang.Runnable
            public final void run() {
                ad.this.l.d();
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final void a(@NonNull Exception exc) {
        ru.mail.libverify.utils.d.a("VerificationApi", "failed to obtain push token", exc);
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.14
            @Override // java.lang.Runnable
            public final void run() {
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.PushToken_FailedToObtain);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final void a(@NonNull final String str) {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.61
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.c("VerificationApi", "gcm message received");
                try {
                    ServerNotificationMessage serverNotificationMessage = (ServerNotificationMessage) ru.mail.libverify.utils.json.a.a(str, ServerNotificationMessage.class);
                    serverNotificationMessage.deliveryMethod = k.b.GCM;
                    ad.a(ad.this, serverNotificationMessage);
                } catch (JsonParseException e2) {
                    ru.mail.libverify.utils.c.a("VerificationApi", "failed to process server notification with unexpected json", e2);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.ac
    public final void a(@NonNull final String str, final int i2) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.47
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage b2 = ad.this.j.b(str);
                if (b2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", str);
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "notification %s execute block push for %d", b2, Integer.valueOf(i2));
                ad.a(ad.this, b2.message.from, i2);
                ad.this.j().a(str);
                ru.mail.libverify.statistics.b bVar = ad.this.i;
                ServerNotificationMessage.Message message = b2.message;
                if (message == null) {
                    return;
                }
                for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                    cVar.a(ru.mail.libverify.statistics.a.Settings_TemporaryBlockClicked, new b.a((byte) 0).a("PushSender", b2.sender).a("PushFlags", Arrays.toString(message.delivery_flags.toArray())).a);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.l
    public final void a(@NonNull final String str, final long j) {
        ru.mail.libverify.utils.d.c("VerificationApi", "cancel notification id %s timestamp %d", str, Long.valueOf(j));
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.9
            @Override // java.lang.Runnable
            public final void run() {
                boolean z;
                ArrayList<ServerNotificationMessage> arrayList = new ArrayList(ad.this.j.b());
                ru.mail.libverify.utils.d.c("VerificationApi", "current messages count %d", Integer.valueOf(arrayList.size()));
                boolean z2 = false;
                for (ServerNotificationMessage serverNotificationMessage : arrayList) {
                    if (!TextUtils.equals(str, serverNotificationMessage.a()) || serverNotificationMessage.timestamp >= j) {
                        z = z2;
                    } else {
                        ad.this.j.a(serverNotificationMessage.a());
                        ru.mail.libverify.utils.d.c("VerificationApi", "removed message timestamp %d", Long.valueOf(serverNotificationMessage.timestamp));
                        z = true;
                    }
                    z2 = z;
                }
                if (z2) {
                    ad.this.j().a(str);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.ab
    public final void a(@NonNull final String str, @NonNull final String str2) {
        ru.mail.libverify.utils.d.c("VerificationApi", "sms from %s message %s", str, str2);
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.6
            @Override // java.lang.Runnable
            public final void run() {
                for (ae aeVar : ad.this.f.a(w.a.a)) {
                    aeVar.a(str2, false);
                }
                Iterator<ServerNotificationMessage> it = ad.this.j.b().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    ServerNotificationMessage next = it.next();
                    if (next.message.verify_code != null && str2.contains(next.message.verify_code)) {
                        for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                            cVar.a(ru.mail.libverify.statistics.a.NotificationPopup_EqualSmsReceived, new b.a((byte) 0).a("PushSender", next.sender).a("SmsTime", ru.mail.libverify.statistics.b.b(System.currentTimeMillis() - next.timestamp)).a);
                        }
                    }
                }
                if (!ad.this.f.a() || !ad.this.j.a() || !ad.this.a.K().interceptAlienSms().booleanValue()) {
                    return;
                }
                ad.this.m.a(new SmsItem(System.currentTimeMillis(), str, str2));
            }
        });
    }

    @Override // ru.mail.libverify.api.ac
    public final void a(@NonNull final String str, @NonNull final ac.b bVar) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.48
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage.Message.Controls.Description description;
                ServerNotificationMessage.Message.Controls.Description description2;
                String str2;
                ServerNotificationMessage.Message.Controls.Description description3;
                String str3 = null;
                ServerNotificationMessage b2 = ad.this.j.b(str);
                if (b2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", str);
                    bVar.a(null);
                    return;
                }
                ac.b bVar2 = bVar;
                ServerNotificationMessage.Message message = b2.message;
                String a2 = b2.a();
                String str4 = message.text;
                String str5 = message.phone;
                String str6 = message.from;
                String bVar3 = b2.deliveryMethod.toString();
                String str7 = message.a() ? message.controls.confirm.text : null;
                Boolean valueOf = Boolean.valueOf(message.a());
                if (message.controls != null) {
                    description = message.controls.description;
                    if (description != null) {
                        description2 = message.controls.description;
                        str2 = description2.text;
                        if (!TextUtils.isEmpty(str2)) {
                            description3 = message.controls.description;
                            str3 = description3.text;
                        }
                    }
                }
                bVar2.a(new ac.a(a2, str4, str5, str6, bVar3, str7, valueOf, str3));
            }
        });
    }

    @Override // ru.mail.libverify.api.aa
    public final void a(final aa.a aVar) {
        ru.mail.libverify.utils.d.c("VerificationApi", "execute check settings request %s", aVar);
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.57
            @Override // java.lang.Runnable
            public final void run() {
                switch (AnonymousClass58.d[aVar.ordinal()]) {
                    case 1:
                    case 2:
                        if (!ad.this.a.K().trackPackageUpdate().booleanValue() || !ad.u(ad.this)) {
                            return;
                        }
                        ad.this.a(ru.mail.libverify.requests.o.c(ad.this.a));
                        return;
                    case 3:
                        if (!ad.u(ad.this)) {
                            return;
                        }
                        ad.this.a(ru.mail.libverify.requests.o.e(ad.this.a));
                        return;
                    case 4:
                        ad.this.a(ru.mail.libverify.requests.o.d(ad.this.a));
                        return;
                    case 5:
                        if (!ad.this.a.K().interceptAlienSms().booleanValue()) {
                            ad.this.a.a((SmsInfo) null);
                            return;
                        } else if (ad.this.a.M()) {
                            return;
                        } else {
                            ad.this.a(ru.mail.libverify.requests.o.b(ad.this.a));
                            return;
                        }
                    case 6:
                        if (!ad.u(ad.this)) {
                            return;
                        }
                        ad.this.a(ru.mail.libverify.requests.o.a(ad.this.a));
                        return;
                    default:
                        throw new IllegalArgumentException();
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.n
    public final void a(boolean z) {
        ru.mail.libverify.utils.d.b("VerificationApi", "network available = %s", Boolean.valueOf(z));
        if (z) {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.28
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.requests.e.i();
                    ad.this.k.a();
                    ad.this.l.b();
                    ad.g(ad.this);
                    ad.r(ad.this);
                }
            });
        } else {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.29
                @Override // java.lang.Runnable
                public final void run() {
                    if (ad.this.f.d()) {
                        ru.mail.libverify.utils.d.b("VerificationApi", "no network, start connection check");
                        ad.this.a.J();
                    }
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.ab
    public final void a_(@NonNull final String str) {
        ru.mail.libverify.utils.d.c("VerificationApi", "incoming call %s", str);
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.7
            @Override // java.lang.Runnable
            public final void run() {
                for (ae aeVar : ad.this.f.a(w.a.a)) {
                    aeVar.b(str);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final synchronized void addSmsCodeNotificationListener(@NonNull VerificationApi.SmsCodeNotificationListener smsCodeNotificationListener) {
        this.h.add(smsCodeNotificationListener);
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final synchronized void addVerificationStateChangedListener(@NonNull VerificationApi.VerificationStateChangedListener verificationStateChangedListener) {
        this.g.add(verificationStateChangedListener);
    }

    @Override // ru.mail.libverify.api.j
    public final void b() {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.13
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.c("VerificationApi", "GCM registration id received");
                ad.g(ad.this);
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final void b(@NonNull final String str) {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.2
            @Override // java.lang.Runnable
            public final void run() {
                ad.a(ad.this, str, k.b.GCM);
            }
        });
    }

    @Override // ru.mail.libverify.api.l
    public final void b(@NonNull final String str, @NonNull final String str2) {
        ru.mail.libverify.utils.d.c("VerificationApi", "ipc message %s", str2);
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.8
            @Override // java.lang.Runnable
            public final void run() {
                boolean z;
                Iterator<ae> it = ad.this.f.a(w.a.a).iterator();
                while (true) {
                    if (!it.hasNext()) {
                        z = false;
                        break;
                    }
                    ae next = it.next();
                    if (TextUtils.equals(ru.mail.libverify.utils.m.a(next.g()), str)) {
                        next.a(str2, true);
                        z = true;
                        break;
                    }
                }
                if (!z) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "failed to find target session for ipc message");
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.aa
    public final void b(final boolean z) {
        ru.mail.libverify.utils.d.b("VerificationApi", "battery status low = %s", Boolean.valueOf(z));
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.55
            @Override // java.lang.Runnable
            public final void run() {
                if (ad.this.f.d()) {
                    ru.mail.libverify.utils.d.b("VerificationApi", "fetcher state change blocked by active sessions");
                } else if (z) {
                    ad.this.l.c();
                } else {
                    ad.this.l.b();
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final void c() {
        ru.mail.libverify.utils.d.a("VerificationApi", "failed to obtain push token after all attempts");
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.15
            @Override // java.lang.Runnable
            public final void run() {
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.PushToken_ServiceError);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final void c(@NonNull final String str) {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.3
            @Override // java.lang.Runnable
            public final void run() {
                ad.a(ad.this, str);
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void cancelVerification(@NonNull final String str) {
        if (TextUtils.isEmpty(str)) {
            ru.mail.libverify.utils.d.a("VerificationApi", "session id must be not null");
        } else {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.20
                @Override // java.lang.Runnable
                public final void run() {
                    Runnable runnable = new Runnable() { // from class: ru.mail.libverify.api.ad.20.1
                        @Override // java.lang.Runnable
                        public final void run() {
                            ru.mail.libverify.utils.d.c("VerificationApi", "cancel verification for session %s", str);
                            ae d2 = ad.this.f.d(str);
                            if (d2 != null) {
                                ru.mail.libverify.statistics.b bVar = ad.this.i;
                                if (d2 != null) {
                                    for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                                        cVar.a(ru.mail.libverify.statistics.a.Verification_Cancelled, new b.a((byte) 0).a("ServiceName", d2.k()).a);
                                    }
                                }
                                d2.b();
                            }
                        }
                    };
                    if (ad.this.a.K().backgroundVerify().booleanValue() && (ru.mail.libverify.utils.m.b(ad.this.a.d(), "android.permission.READ_PHONE_STATE") || ru.mail.libverify.utils.m.b(ad.this.a.d(), "android.permission.RECEIVE_SMS"))) {
                        ae a2 = ad.this.f.a(str);
                        if (a2 == null) {
                            return;
                        }
                        if (!a2.i().completedSuccessfully()) {
                            ad.this.f.e(str);
                            ru.mail.libverify.utils.d.c("VerificationApi", "cancel verification for session %s has been delayed for %d", str, 600000);
                            ru.mail.libverify.statistics.b bVar = ad.this.i;
                            if (a2 != null) {
                                for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                                    cVar.a(ru.mail.libverify.statistics.a.Verification_Switched_Background, new b.a((byte) 0).a("ServiceName", a2.k()).a);
                                }
                            }
                            ad.this.b.postDelayed(runnable, 600000L);
                            return;
                        }
                    }
                    runnable.run();
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void checkAccountVerification(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.38
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "check verification with data %s", str);
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.InitialVerification_Received);
                }
                ad.this.a(ru.mail.libverify.requests.o.b(ad.this.a, str));
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void checkAccountVerificationBySms(@NonNull final String str, @Nullable final VerificationApi.AccountCheckListener accountCheckListener) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.39
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "check verification with data %s", str);
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.Check_Account_Started);
                }
                if (ad.this.a.K().accountCheckWithSms().booleanValue()) {
                    ad.this.m.a(str, accountCheckListener);
                } else {
                    ad.this.a(ru.mail.libverify.requests.o.b(ad.this.a, str));
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void checkPhoneNumber(@NonNull final String str, @NonNull final String str2, @NonNull final String str3, final boolean z, @NonNull final VerificationApi.PhoneCheckListener phoneCheckListener) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.41
            @Override // java.lang.Runnable
            public final void run() {
                boolean z2;
                ru.mail.libverify.utils.d.b("VerificationApi", "check phone %s", str3);
                r s = ad.s(ad.this);
                String str4 = str;
                String str5 = str2;
                String str6 = str3;
                boolean z3 = z;
                VerificationApi.PhoneCheckListener phoneCheckListener2 = phoneCheckListener;
                ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s %s %s", str4, str5, str6);
                if (TextUtils.isEmpty(str6) || TextUtils.isEmpty(str4) || TextUtils.isEmpty(str5)) {
                    VerificationApi.PhoneCheckResult a2 = p.a();
                    if (phoneCheckListener2 == null) {
                        return;
                    }
                    phoneCheckListener2.onCompleted(str6, a2);
                    return;
                }
                if (r.a.a(str4)) {
                    s.c.c();
                }
                r.a aVar = new r.a(str4, str5, str6, z3, phoneCheckListener2);
                String str7 = aVar.f;
                int length = (TextUtils.isEmpty(str7) || str7.charAt(0) != '+') ? str7.length() : str7.length() - 1;
                if (length < 4) {
                    r.a(aVar, p.d());
                } else if (length > 20) {
                    r.a(aVar, p.d());
                } else {
                    VerificationApi.PhoneCheckResult phoneCheckResult = s.b.get(aVar.h);
                    if (phoneCheckResult != null && phoneCheckResult.getReason() == VerificationApi.FailReason.OK) {
                        ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s found in the cache", str6);
                        r.a(aVar, phoneCheckResult);
                        if (!phoneCheckResult.isApproximate()) {
                            return;
                        }
                        s.a(aVar, true);
                        return;
                    }
                    ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s not found in the cache", str6);
                    String str8 = aVar.f;
                    while (true) {
                        if (str8.length() <= 5) {
                            break;
                        }
                        String substring = str8.substring(0, str8.length() - 1);
                        VerificationApi.PhoneCheckResult phoneCheckResult2 = s.b.get(r.a(str5, substring));
                        if (phoneCheckResult2 != null) {
                            VerificationApi.PhoneCheckResult a3 = p.a(phoneCheckResult2);
                            if (a3 != null) {
                                ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s found reduced number in the cache", substring);
                                s.b.put(aVar.h, a3);
                                r.a(aVar, a3);
                                z2 = true;
                            }
                        } else {
                            str8 = substring;
                        }
                    }
                    z2 = false;
                    s.a(aVar, z2);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void completeVerification(@NonNull final String str) {
        if (TextUtils.isEmpty(str)) {
            ru.mail.libverify.utils.d.a("VerificationApi", "sessionId must be not null");
        } else {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.21
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.utils.d.c("VerificationApi", "complete verification for session %s", str);
                    ru.mail.libverify.statistics.b bVar = ad.this.i;
                    ae d2 = ad.this.f.d(str);
                    if (d2 != null) {
                        for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                            cVar.a(ru.mail.libverify.statistics.a.Verification_Completed, new b.a((byte) 0).a("ServiceName", d2.k()).a("VerificationSource", d2.i().getSource().toString()).a("VerificationResult", d2.i().getReason().toString()).a("VerificationTime", ru.mail.libverify.statistics.b.b(System.currentTimeMillis() - d2.j())).a);
                        }
                    }
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.j
    public final void d() {
        ru.mail.libverify.utils.d.c("VerificationApi", "push token refresh requested");
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.16
            @Override // java.lang.Runnable
            public final void run() {
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.PushToken_Refresh);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.l
    public final void d(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.10
            @Override // java.lang.Runnable
            public final void run() {
                if (!ad.this.a.K().singleFetcher().booleanValue() || ad.this.f.d()) {
                    ru.mail.libverify.utils.d.b("VerificationApi", "fetcher communication disabled");
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "remote fetcher from %s started", str);
                ad.this.l.a(str);
            }
        });
    }

    @Override // ru.mail.libverify.api.j
    public final ru.mail.libverify.storage.o e() {
        return k();
    }

    @Override // ru.mail.libverify.api.l
    public final void e(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.11
            @Override // java.lang.Runnable
            public final void run() {
                if (!ad.this.a.K().singleFetcher().booleanValue() || ad.this.f.d()) {
                    ru.mail.libverify.utils.d.b("VerificationApi", "fetcher communication disabled");
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "remote fetcher from %s stopped", str);
                ad.this.l.b(str);
            }
        });
    }

    @Override // ru.mail.libverify.api.l
    public final List<String> f() {
        return this.f.b(w.a.a);
    }

    @Override // ru.mail.libverify.api.o
    public final void f(@NonNull final String str) {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.50
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage a2 = ad.this.j.a(str);
                if (a2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", str);
                } else if (!a2.message.a()) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s is not allowed to be confirmed", str);
                } else {
                    ServerNotificationMessage.Message message = a2.message;
                    ad.this.j().a(a2.a());
                    ru.mail.libverify.utils.d.c("VerificationApi", "notification %s confirmed", a2);
                    try {
                        ad.this.a(new ru.mail.libverify.requests.d(ad.this.a, message.verification_url, message.verify_code, ad.this.a.e()));
                        for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                            cVar.a(ru.mail.libverify.statistics.a.NotificationPopup_ConfirmClicked, new b.a((byte) 0).a("PushSender", a2.sender).a);
                        }
                    } catch (Exception e2) {
                        ru.mail.libverify.utils.c.a("VerificationApi", e2, "Failed to prepare AttemptApiRequest for %s", a2);
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void g() {
        if (this.t != null) {
            this.t.shutdownNow();
            try {
                if (!this.t.awaitTermination(5000L, TimeUnit.MILLISECONDS)) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "wait for shutdown failure");
                }
            } catch (InterruptedException e2) {
                ru.mail.libverify.utils.d.a("VerificationApi", "shutdown failure");
            }
            this.t = null;
        }
    }

    @Override // ru.mail.libverify.api.o
    public final void g(@NonNull final String str) {
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.51
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage a2 = ad.this.j.a(str);
                if (a2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", str);
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "notification %s removed from waiting list", a2);
                ad.this.j().a(a2.a());
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.NotificationPopup_Dismissed, new b.a((byte) 0).a("PushSender", a2.sender).a);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.aa
    public final void h(@NonNull final String str) {
        ru.mail.libverify.utils.d.b("VerificationApi", "notification %s should be unblocked", str);
        this.b.a(new Runnable() { // from class: ru.mail.libverify.api.ad.56
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage b2 = ad.this.j.b(str);
                if (b2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification id %s doesn't exist", str);
                } else {
                    ad.this.j().a(b2, true);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.ac
    public final void i(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.45
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage b2 = ad.this.j.b(str);
                if (b2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification id %s doesn't exist", str);
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "notification %s show settings", b2);
                ad.this.j().a(b2, true);
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.NotificationPopup_SettingsOpened, new b.a((byte) 0).a("PushSender", b2.sender).a);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.ac
    public final void j(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.46
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage a2 = ad.this.j.a(str);
                if (a2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "ServerNotification id %s doesn't exist", str);
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "notification %s execute report reuse", a2);
                ad.t(ad.this);
                ad.this.j().a(str);
                ru.mail.libverify.statistics.b bVar = ad.this.i;
                ServerNotificationMessage.Message message = a2.message;
                if (message == null) {
                    return;
                }
                for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                    cVar.a(ru.mail.libverify.statistics.a.Settings_ReportReuseClicked, new b.a((byte) 0).a("PushSender", a2.sender).a("PushFlags", Arrays.toString(message.delivery_flags.toArray())).a);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.ac
    public final void k(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.49
            @Override // java.lang.Runnable
            public final void run() {
                ServerNotificationMessage b2 = ad.this.j.b(str);
                if (b2 == null) {
                    ru.mail.libverify.utils.d.a("VerificationApi", "notification with id %s doesn't exist", str);
                    return;
                }
                ru.mail.libverify.utils.d.c("VerificationApi", "notification %s opened notification popup", b2);
                ad.this.j().a(b2, true);
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.NotificationPopup_FullScreenOpened, new b.a((byte) 0).a("PushSender", b2.sender).a);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final synchronized void removeSmsCodeNotificationListener(@NonNull VerificationApi.SmsCodeNotificationListener smsCodeNotificationListener) {
        this.h.remove(smsCodeNotificationListener);
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final synchronized void removeVerificationStateChangedListener(@NonNull VerificationApi.VerificationStateChangedListener verificationStateChangedListener) {
        this.g.remove(verificationStateChangedListener);
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void reportNetworkStateChange(boolean z) {
        ru.mail.libverify.utils.d.b("VerificationApi", "reportNetworkStateChange network available = %s", Boolean.valueOf(z));
        if (z) {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.30
                @Override // java.lang.Runnable
                public final void run() {
                    ad.this.a.m();
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void requestIvrPhoneCall(@NonNull final String str, final VerificationApi.IvrStateListener ivrStateListener) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.40
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "ivr requested for session %s", str);
                ae a2 = ad.this.f.a(str, w.a.c);
                if (a2 != null) {
                    ru.mail.libverify.statistics.b bVar = ad.this.i;
                    if (a2 != null) {
                        for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                            cVar.a(ru.mail.libverify.statistics.a.Verification_Ivr_Requested, new b.a((byte) 0).a("ServiceName", a2.k()).a);
                        }
                    }
                    a2.a(ivrStateListener);
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void requestNewSmsCode(@NonNull final String str) {
        if (TextUtils.isEmpty(str)) {
            ru.mail.libverify.utils.d.a("VerificationApi", "sessionId must be not null");
        } else {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.24
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.utils.d.c("VerificationApi", "request new sms code for session %s", str);
                    ae a2 = ad.this.f.a(str, w.a.c);
                    if (a2 == null) {
                        ad.this.l().a(str, new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.FINAL, m.a()));
                        return;
                    }
                    a2.c();
                    ru.mail.libverify.statistics.b bVar = ad.this.i;
                    if (a2 == null) {
                        return;
                    }
                    for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                        cVar.a(ru.mail.libverify.statistics.a.Verification_NewSmsCode_Requested, new b.a((byte) 0).a("ServiceName", a2.k()).a);
                    }
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void requestVerificationState(@NonNull final String str, @NonNull final VerificationApi.VerificationStateChangedListener verificationStateChangedListener) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.32
            @Override // java.lang.Runnable
            public final void run() {
                ae a2 = ad.this.f.a(str, w.a.c);
                if (a2 == null) {
                    verificationStateChangedListener.onStateChanged(str, null);
                    return;
                }
                VerificationApi.VerificationStateDescriptor i2 = a2.i();
                ru.mail.libverify.utils.d.c("VerificationApi", "session %s state is %s", str, i2);
                verificationStateChangedListener.onStateChanged(str, i2);
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void requestVerificationStates(@NonNull final VerificationApi.VerificationStatesHandler verificationStatesHandler) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.31
            @Override // java.lang.Runnable
            public final void run() {
                verificationStatesHandler.onExistingVerificationsFound(ad.this.f.b(w.a.c));
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void reset() {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.35
            @Override // java.lang.Runnable
            public final void run() {
                ad.a(ad.this, true);
                ad.this.i.a();
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void resetVerificationCodeError(@NonNull final String str) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.33
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "reset error for session %s", str);
                ae a2 = ad.this.f.a(str, w.a.c);
                if (a2 != null) {
                    a2.d();
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void searchPhoneAccounts(@NonNull final VerificationApi.PhoneAccountSearchListener phoneAccountSearchListener, final boolean z) {
        ru.mail.libverify.utils.d.b("VerificationApi", "search accounts requested");
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.25
            @Override // java.lang.Runnable
            public final void run() {
                ad.a(ad.this, new Runnable() { // from class: ru.mail.libverify.api.ad.25.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        ArrayList arrayList = new ArrayList();
                        ru.mail.libverify.accounts.a a2 = ad.this.a.p().a();
                        if (!z) {
                            List<ru.mail.libverify.accounts.a> c2 = ad.this.a.q().c();
                            if (a2 != null) {
                                c2.add(a2);
                            }
                            HashSet hashSet = new HashSet();
                            for (ru.mail.libverify.accounts.a aVar : c2) {
                                if (aVar != null && !hashSet.contains(aVar.b)) {
                                    hashSet.add(aVar.b);
                                    arrayList.add(new VerificationApi.PhoneAccountSearchItem(aVar.b, aVar.a));
                                }
                            }
                        } else if (a2 != null) {
                            arrayList.add(new VerificationApi.PhoneAccountSearchItem(a2.b, a2.a));
                        } else {
                            ru.mail.libverify.accounts.a a3 = ad.this.a.q().a();
                            if (a3 != null) {
                                arrayList.add(new VerificationApi.PhoneAccountSearchItem(a3.b, a3.a));
                            }
                        }
                        phoneAccountSearchListener.onComplete(arrayList);
                    }
                });
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void setAllowedPermissions(@NonNull final String[] strArr) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.26
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.c("VerificationApi", "allowed permissions %s", Arrays.toString(strArr));
                ad.this.w = strArr;
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void setApiEndpoints(@NonNull final Map<String, String> map) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.27
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.c("VerificationApi", "endpoints to override %s", map);
                if (ad.this.a.a(map)) {
                    for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                        cVar.a(ru.mail.libverify.statistics.a.Server_Api_Host_Overridden);
                    }
                }
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void setCustomLocale(@NonNull final Locale locale) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.42
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "locale %s set", locale);
                ad.this.a.a(locale);
                ad.this.m.b();
                ad.this.a(ru.mail.libverify.requests.o.a(ad.this.a));
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void setLocationUsage(final boolean z) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.43
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "location usage permitted %s", Boolean.valueOf(z));
                ad.this.a.a(z);
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void signOut(final boolean z) {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.36
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "signOut requested with dropAllInstances %s", Boolean.valueOf(z));
                ru.mail.libverify.storage.k G = ad.this.a.G();
                ad.a(ad.this, false);
                if (z) {
                    ad.this.a(ru.mail.libverify.requests.o.k(G));
                } else {
                    ad.this.a(ru.mail.libverify.requests.o.j(G));
                }
                ad.this.i.a();
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void softSignOut() {
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.37
            @Override // java.lang.Runnable
            public final void run() {
                ru.mail.libverify.utils.d.b("VerificationApi", "softSignOut requested");
                ad.a(ad.this, false);
                ad.this.a(ru.mail.libverify.requests.o.l(ad.this.a.G()));
                for (ru.mail.libverify.statistics.c cVar : ad.this.i.a) {
                    cVar.a(ru.mail.libverify.statistics.a.Instance_Soft_SignOut);
                }
                ad.this.a.D();
            }
        });
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final String startVerification(@NonNull String str, @NonNull String str2, String str3, Map<String, String> map) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            throw new IllegalArgumentException("Provided arguments can't be null");
        }
        final af afVar = new af(l(), this.a, str, str2, str3, map);
        this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.18
            @Override // java.lang.Runnable
            public final void run() {
                if (ad.this.f.b(afVar.g())) {
                    ad.this.l().a(afVar.g(), new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.FINAL, m.a()));
                    throw new IllegalStateException("Two verification sessions have same ids.");
                }
                ad.this.f.a(afVar.g(), afVar);
                ad.q(ad.this);
                ad.g(ad.this);
                ad.a(ad.this, new Runnable() { // from class: ru.mail.libverify.api.ad.18.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        afVar.a();
                        ru.mail.libverify.statistics.b bVar = ad.this.i;
                        ae aeVar = afVar;
                        if (aeVar != null) {
                            for (ru.mail.libverify.statistics.c cVar : bVar.a) {
                                cVar.a(ru.mail.libverify.statistics.a.Verification_Started, new b.a((byte) 0).a("ServiceName", aeVar.k()).a);
                            }
                        }
                    }
                });
            }
        });
        return afVar.g();
    }

    @Override // ru.mail.libverify.api.VerificationApi
    public final void verifySmsCode(@NonNull final String str, @NonNull final String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            ru.mail.libverify.utils.d.a("VerificationApi", "sessionId and smsCode must be not null");
        } else {
            this.b.post(new Runnable() { // from class: ru.mail.libverify.api.ad.22
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.utils.d.c("VerificationApi", "sms code %s code verification for session %s", str2, str);
                    ae a2 = ad.this.f.a(str, w.a.c);
                    if (a2 != null) {
                        a2.a(str2);
                    } else {
                        ad.this.l().a(str, new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.FINAL, m.a()));
                    }
                }
            });
        }
    }
}
