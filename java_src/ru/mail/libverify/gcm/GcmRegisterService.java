package ru.mail.libverify.gcm;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.google.android.gms.iid.InstanceID;
import java.io.IOException;
import ru.mail.libverify.api.j;
import ru.mail.libverify.api.k;
import ru.mail.libverify.storage.o;
import ru.mail.libverify.utils.c;
import ru.mail.libverify.utils.d;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public class GcmRegisterService extends IntentService {
    private final Object a;

    public GcmRegisterService() {
        super("GcmRegisterService");
        this.a = new Object();
        setIntentRedelivery(true);
    }

    public static void a(@NonNull Context context) {
        a(context, "gcm_token_refresh");
    }

    public static void a(@NonNull o oVar) {
        d.c("GcmRegisterService", "clear regId");
        oVar.d("gcm_registration_id").d("gcm_app_version").a();
    }

    private static boolean a(@NonNull Context context, @Nullable String str) {
        d.c("GcmRegisterService", "Gcm register method invoked with action %s", str);
        if (!m.g(context)) {
            return false;
        }
        d.c("GcmRegisterService", "GCM: start gcm registration service");
        Intent intent = new Intent(context, GcmRegisterService.class);
        intent.setAction(str);
        try {
            d.c("GcmRegisterService", "GCM: start gcm service result %s", context.startService(intent));
            return true;
        } catch (Throwable th) {
            d.a("GcmRegisterService", "failed to start gcm service", th);
            return false;
        }
    }

    public static boolean a(@NonNull Context context, @NonNull o oVar) {
        if (c(context, oVar)) {
            d.c("GcmRegisterService", "GCM Device has already registered in GCM");
            return true;
        }
        return a(context, (String) null);
    }

    public static String b(@NonNull Context context, @NonNull o oVar) {
        String a = oVar.a("gcm_registration_id");
        if (TextUtils.isEmpty(a)) {
            d.b("GcmRegisterService", "registration not found");
            return null;
        } else if (TextUtils.equals(oVar.a("gcm_app_version"), Integer.toString(m.a(context)))) {
            return a;
        } else {
            d.c("GcmRegisterService", "app version changed.");
            return null;
        }
    }

    public static void b(@NonNull Context context) {
        a(context, "gcm_package_updated");
    }

    private static boolean c(@NonNull Context context, @NonNull o oVar) {
        return !TextUtils.isEmpty(b(context, oVar));
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        d.c("GcmRegisterService", "service destroyed");
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        String str;
        if (intent == null) {
            return;
        }
        try {
            boolean equals = TextUtils.equals(intent.getAction(), "gcm_token_refresh");
            j a = k.a(this);
            if (!equals && c(this, a.e())) {
                d.c("GcmRegisterService", "GCM registration has already successfully completed");
                a.b();
                return;
            }
            a(a.e());
            if (equals) {
                a.d();
            }
            int i = 0;
            while (i < 20) {
                if (i * i * 30000 != 0) {
                    long j = i * i * 30000;
                    d.b("GcmRegisterService", "wait backoff timeout %d before next attempt %d", Long.valueOf(j), Integer.valueOf(i));
                    synchronized (this.a) {
                        try {
                            this.a.wait(j);
                        } catch (InterruptedException e) {
                            d.a("GcmRegisterService", "failed to wait for the next attempt");
                            return;
                        }
                    }
                }
                try {
                    str = InstanceID.getInstance(this).getToken("297109036349", GoogleCloudMessaging.INSTANCE_ID_SCOPE, null);
                } catch (IOException e2) {
                    d.a("GcmRegisterService", "GCM service access error", e2);
                    str = null;
                } catch (Exception e3) {
                    d.a("GcmRegisterService", "not enough permissions to register GCM channel or other error", e3);
                    a.a(e3);
                    return;
                }
                if (!TextUtils.isEmpty(str)) {
                    d.c("GcmRegisterService", "Gcm registration id %s was received and stored in shared preferences", str);
                    o e4 = a.e();
                    int a2 = m.a(this);
                    d.c("GcmRegisterService", "save regId %s on app version %s", str, Integer.valueOf(a2));
                    e4.a("gcm_registration_id", str).a("gcm_app_version", Integer.toString(a2)).a();
                    a.b();
                    return;
                }
                d.b("GcmRegisterService", "failed to get Gcm registration id on attempt %d", Integer.valueOf(i));
                int i2 = i + 1;
                if (i2 >= 20) {
                    a.c();
                }
                i = i2;
            }
        } catch (Throwable th) {
            c.a("GcmRegisterService", "failed to register Gcm", th);
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("GcmRegisterService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }

    @Override // android.app.Service
    public void onTaskRemoved(Intent intent) {
        super.onTaskRemoved(intent);
        d.c("GcmRegisterService", "task removed");
    }
}
