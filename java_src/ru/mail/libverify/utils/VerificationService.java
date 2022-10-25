package ru.mail.libverify.utils;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.support.annotation.NonNull;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes3.dex */
public class VerificationService extends IntentService {
    private static final ConcurrentHashMap<Object, a> a = new ConcurrentHashMap<>();
    private static volatile long b = 0;
    private static PowerManager.WakeLock c;
    private final long d;

    /* loaded from: classes3.dex */
    private static class a {
        final boolean a;

        private a(boolean z) {
            this.a = z;
        }

        /* synthetic */ a(boolean z, byte b) {
            this(z);
        }
    }

    public VerificationService() {
        super("VerificationService");
        setIntentRedelivery(true);
        this.d = System.currentTimeMillis();
    }

    public static void a() {
        d.c("VerificationService", "releaseAll");
        a.clear();
        b();
        synchronized (a) {
            a.notify();
        }
    }

    private static synchronized void a(@NonNull Context context) {
        synchronized (VerificationService.class) {
            try {
                if (c == null || !c.isHeld()) {
                    PowerManager.WakeLock newWakeLock = ((PowerManager) context.getSystemService("power")).newWakeLock(1, "VerificationService");
                    c = newWakeLock;
                    newWakeLock.acquire(300000L);
                    c.setReferenceCounted(false);
                    b = System.currentTimeMillis();
                    d.b("VerificationService", "wake lock acquired (timestamp: %d)", Long.valueOf(b));
                } else {
                    d.b("VerificationService", "wake lock has been already acquired");
                }
            } catch (Throwable th) {
                d.a("VerificationService", "failed to acquire wake lock", th);
            }
        }
    }

    public static void a(@NonNull Context context, @NonNull Object obj, boolean z) {
        d.c("VerificationService", "acquire " + obj);
        if (!a.containsKey(obj)) {
            a aVar = new a(z, (byte) 0);
            a.put(obj, aVar);
            if (aVar.a) {
                a(context);
            }
            try {
                context.startService(new Intent(context, VerificationService.class));
            } catch (Throwable th) {
                d.a("VerificationService", "failed to start verification service", th);
            }
        }
    }

    public static void a(@NonNull Object obj) {
        a remove = a.remove(obj);
        d.c("VerificationService", "release %s, action %s", obj, remove);
        if (remove == null) {
            d.a("VerificationService", "no actions to release for owner %s", obj);
            return;
        }
        d.c("VerificationService", "release owner %s with action %s", obj, remove);
        if (a.size() != 0) {
            return;
        }
        synchronized (a) {
            a.notify();
        }
        if (!remove.a) {
            return;
        }
        b();
    }

    private static synchronized void b() {
        synchronized (VerificationService.class) {
            try {
                if (c != null) {
                    if (c.isHeld()) {
                        c.release();
                        c.release();
                    }
                    d.b("VerificationService", "wake lock released (held for time: %d)", Long.valueOf(System.currentTimeMillis() - b));
                    c = null;
                    b = 0L;
                }
            } finally {
            }
        }
    }

    private static synchronized void c() {
        synchronized (VerificationService.class) {
            try {
                if (c != null && c.isHeld()) {
                    long currentTimeMillis = System.currentTimeMillis() - b;
                    if (currentTimeMillis < 0 || currentTimeMillis > 300000) {
                        b();
                    }
                }
            } finally {
            }
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        d.c("VerificationService", "service destroyed");
        a.clear();
        b();
        super.onDestroy();
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        d.c("VerificationService", "onHandleIntent started");
        while (a.size() > 0) {
            d.c("VerificationService", "onHandleIntent wait loop " + Integer.toString(a.size()));
            try {
                synchronized (a) {
                    a.wait(30000L);
                }
                long currentTimeMillis = System.currentTimeMillis() - this.d;
                if (currentTimeMillis < 0 || currentTimeMillis > 1800000) {
                    d.c("VerificationService", "onHandleIntent wait for keep alive operation expired");
                    break;
                }
                c();
            } catch (InterruptedException e) {
                d.a("VerificationService", "onHandleIntent wait failed", e);
            }
        }
        d.c("VerificationService", "onHandleIntent completed");
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("VerificationService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }
}
