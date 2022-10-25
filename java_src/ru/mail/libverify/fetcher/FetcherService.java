package ru.mail.libverify.fetcher;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import ru.mail.libverify.api.k;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public class FetcherService extends Service {
    public static void a(@NonNull Context context) {
        ru.mail.libverify.utils.d.b("FetcherService", "fetcher start requested");
        Intent intent = new Intent(context, FetcherService.class);
        intent.setAction("fetcher_start");
        try {
            context.startService(intent);
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("FetcherService", "failed to start fetcher service", th);
        }
    }

    public static void b(@NonNull Context context) {
        ru.mail.libverify.utils.d.b("FetcherService", "fetcher stop requested");
        Intent intent = new Intent(context, FetcherService.class);
        intent.setAction("fetcher_stop");
        try {
            context.startService(intent);
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("FetcherService", "failed to stop fetcher service", th);
        }
    }

    @Override // android.app.Service
    @Nullable
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onDestroy() {
        ru.mail.libverify.utils.d.c("FetcherService", "service destroyed");
        super.onDestroy();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        String str = null;
        super.onStartCommand(intent, i, i2);
        Object[] objArr = new Object[2];
        objArr[0] = intent == null ? null : intent.getAction();
        if (intent != null) {
            str = m.a(intent.getExtras());
        }
        objArr[1] = str;
        ru.mail.libverify.utils.d.c("FetcherService", "onStartCommand with action %s, extra %s", objArr);
        if (intent != null && intent.getAction() != null) {
            String action = intent.getAction();
            char c = 65535;
            switch (action.hashCode()) {
                case -1324782502:
                    if (action.equals("fetcher_stop")) {
                        c = 1;
                        break;
                    }
                    break;
                case 1881402122:
                    if (action.equals("fetcher_start")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    ru.mail.libverify.utils.d.b("FetcherService", "fetcher service has been started from an application");
                    break;
                case 1:
                    ru.mail.libverify.utils.d.b("FetcherService", "fetcher service has been stopped from an application");
                    stopSelf();
                    break;
                default:
                    ru.mail.libverify.utils.c.a("FetcherService", "illegal fetcher service action", new IllegalAccessException("illegal fetcher service action"));
                    stopSelf();
                    break;
            }
        } else {
            try {
                k.c(this).a();
            } catch (Throwable th) {
                ru.mail.libverify.utils.c.a("FetcherService", "failed to process fetcher start", th);
            }
        }
        return 1;
    }

    @Override // android.app.Service
    public void onTaskRemoved(Intent intent) {
        ru.mail.libverify.utils.d.c("FetcherService", "task removed");
        super.onTaskRemoved(intent);
    }
}
