package ru.mail.libverify.api;

import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.Collections;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import ru.mail.libverify.R;
import ru.mail.libverify.api.ad;
import ru.mail.libverify.utils.LogReceiver;
/* loaded from: classes3.dex */
public final class k {
    private static volatile ad a = null;
    private static ru.mail.libverify.storage.m b = null;
    private static volatile boolean c = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public static VerificationApi a(@NonNull Context context, @NonNull String str, @NonNull String str2, @Nullable LogReceiver logReceiver, @Nullable UncaughtExceptionListener uncaughtExceptionListener) {
        if (a == null) {
            synchronized (ad.class) {
                if (a == null) {
                    if (b == null) {
                        b = a(context, str, str2);
                    } else {
                        b.a(context.getApplicationContext(), str, str2);
                    }
                    c = true;
                    a = new ad(b, Collections.singletonList(new ru.mail.libverify.statistics.d(b)), logReceiver, uncaughtExceptionListener);
                }
            }
        }
        if (!c) {
            synchronized (ad.class) {
                b.a(context.getApplicationContext(), str, str2);
            }
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public static VerificationApi a(@NonNull Context context, @Nullable LogReceiver logReceiver, @Nullable UncaughtExceptionListener uncaughtExceptionListener) {
        String string = context.getString(R.string.libverify_application_name);
        String string2 = context.getString(R.string.libverify_application_key);
        if (TextUtils.isEmpty(string) || TextUtils.isEmpty(string2)) {
            throw new IllegalArgumentException("Both application name and application key must be added to an application resources. See VerificationFactory class documentation.");
        }
        return a(context, string, string2, logReceiver, uncaughtExceptionListener);
    }

    public static j a(@NonNull Context context) {
        return i(context);
    }

    @NonNull
    private static ru.mail.libverify.storage.m a(@NonNull Context context, @NonNull String str, @NonNull String str2) {
        return (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) ? new ru.mail.libverify.storage.m(context.getApplicationContext()) : new ru.mail.libverify.storage.m(context.getApplicationContext(), str, str2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a() {
        if (a != null) {
            synchronized (ad.class) {
                if (a != null) {
                    ad adVar = a;
                    ru.mail.libverify.utils.d.b("VerificationApi", "shutdown started");
                    ad.d dVar = adVar.d;
                    ExecutorService executorService = dVar.a;
                    if (executorService != null) {
                        executorService.shutdownNow();
                        try {
                            if (!executorService.awaitTermination(5000L, TimeUnit.MILLISECONDS)) {
                                ru.mail.libverify.utils.d.a("VerificationApi", "worker wait for shutdown failure");
                            }
                        } catch (InterruptedException e) {
                            ru.mail.libverify.utils.d.a("VerificationApi", "worker shutdown failure");
                        }
                    }
                    ExecutorService executorService2 = dVar.b;
                    if (executorService2 != null) {
                        executorService2.shutdownNow();
                        try {
                            if (!executorService2.awaitTermination(5000L, TimeUnit.MILLISECONDS)) {
                                ru.mail.libverify.utils.d.a("VerificationApi", "connection wait for shutdown failure");
                            }
                        } catch (InterruptedException e2) {
                            ru.mail.libverify.utils.d.a("VerificationApi", "connection shutdown failure");
                        }
                    }
                    try {
                        Thread.sleep(1000L);
                    } catch (InterruptedException e3) {
                        e3.printStackTrace();
                    }
                    if (Build.VERSION.SDK_INT < 18) {
                        adVar.c.quit();
                    } else {
                        adVar.c.quitSafely();
                    }
                    adVar.g();
                    adVar.a.z().a();
                    adVar.a.H();
                    adVar.a.a((ru.mail.libverify.storage.u) null);
                    ru.mail.libverify.utils.d.b("VerificationApi", "shutdown completed");
                    a = null;
                    b = null;
                    c = false;
                }
            }
        }
    }

    public static l b(@NonNull Context context) {
        return i(context);
    }

    public static i c(@NonNull Context context) {
        return i(context);
    }

    public static aa d(@NonNull Context context) {
        return i(context);
    }

    public static ac e(@NonNull Context context) {
        return i(context);
    }

    public static o f(@NonNull Context context) {
        return i(context);
    }

    @Nullable
    public static ab g(@NonNull final Context context) {
        return new ab() { // from class: ru.mail.libverify.api.k.1
            @Override // ru.mail.libverify.api.ab
            public final void a(@NonNull String str, @NonNull String str2) {
                ad adVar = k.a;
                if (adVar != null) {
                    adVar.a(str, str2);
                } else if (!ru.mail.libverify.storage.m.a(context, str)) {
                } else {
                    k.i(context).a(str, str2);
                }
            }

            @Override // ru.mail.libverify.api.ab
            public final void a_(@NonNull String str) {
                ad adVar = k.a;
                if (adVar != null) {
                    adVar.a_(str);
                }
            }
        };
    }

    @Nullable
    public static n h(@NonNull Context context) {
        return i(context);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public static ad i(@NonNull Context context) {
        if (a == null) {
            synchronized (VerificationFactory.class) {
                if (a == null) {
                    a = new ad(j(context), Collections.singletonList(new ru.mail.libverify.statistics.d(j(context))), null, null);
                }
            }
        }
        return a;
    }

    @NonNull
    private static ru.mail.libverify.storage.m j(@NonNull Context context) {
        if (b == null) {
            synchronized (VerificationFactory.class) {
                if (b == null) {
                    b = a(context, context.getString(R.string.libverify_application_name), context.getString(R.string.libverify_application_key));
                }
            }
        }
        return b;
    }
}
