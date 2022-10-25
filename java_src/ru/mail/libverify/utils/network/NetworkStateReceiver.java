package ru.mail.libverify.utils.network;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.NonNull;
import java.util.concurrent.atomic.AtomicReference;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.api.k;
import ru.mail.libverify.utils.d;
/* loaded from: classes3.dex */
public class NetworkStateReceiver extends BroadcastReceiver {
    private static final AtomicReference<b> a = new AtomicReference<>(b.a(null, a.NONE));

    private static void a(@NonNull Context context, boolean z) {
        b a2;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager == null) {
            d.a("NetworkStateReceiver", "no available network found (ConnectivityManager is null)");
            a2 = b.a(context, a.NONE);
        } else {
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo != null && activeNetworkInfo.isConnected()) {
                a2 = activeNetworkInfo.getType() == 1 ? b.a(context, a.WIFI) : activeNetworkInfo.isRoaming() ? b.a(context, a.ROAMING) : b.a(context, a.CELLULAR);
            } else if (activeNetworkInfo == null || !activeNetworkInfo.isConnectedOrConnecting()) {
                d.b("NetworkStateReceiver", "no available network found (%s)", activeNetworkInfo);
                a2 = b.a(context, a.NONE);
            } else {
                a2 = b.a(context, a.CONNECTING);
            }
        }
        d.b("NetworkStateReceiver", "check network %s (fire event %s)", a2, Boolean.valueOf(z));
        if (a.getAndSet(a2) == a2 || !VerificationFactory.hasInstallation(context)) {
            return;
        }
        d.c("NetworkStateReceiver", "state changed to %s on %s", a2.a, a2.b);
        if (!z) {
            return;
        }
        try {
            k.h(context).a(a(context));
        } catch (Throwable th) {
            d.a("NetworkStateReceiver", "failed to process network state change", th);
        }
    }

    public static boolean a() {
        return a.get().a != a.NONE;
    }

    public static boolean a(@NonNull Context context) {
        a(context, false);
        return a();
    }

    public static void b(@NonNull Context context) {
        a(context, true);
    }

    public static void c(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, NetworkStateReceiver.class), 1, 1);
            d.c("NetworkStateReceiver", "enabled");
        } catch (Throwable th) {
            d.a("NetworkStateReceiver", "failed to enable", th);
        }
    }

    public static void d(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, NetworkStateReceiver.class), 2, 1);
            d.c("NetworkStateReceiver", "disabled");
        } catch (Throwable th) {
            d.a("NetworkStateReceiver", "failed to disable", th);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (context == null || intent == null || !"android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
            return;
        }
        a(context, true);
    }
}
