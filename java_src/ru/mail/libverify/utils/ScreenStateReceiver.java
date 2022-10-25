package ru.mail.libverify.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.PowerManager;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public class ScreenStateReceiver extends BroadcastReceiver {
    private static final AtomicReference<a> a = new AtomicReference<>();
    private static volatile PowerManager b;

    /* loaded from: classes3.dex */
    private static final class a {
        final boolean a;
        final long b;

        a(boolean z, long j) {
            this.a = z;
            this.b = j;
        }

        public final String toString() {
            return "ScreenStateInfo{isActive=" + this.a + ", timestamp=" + this.b + '}';
        }
    }

    public static void a(@NonNull Context context) {
        IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        try {
            context.registerReceiver(new ScreenStateReceiver(), intentFilter);
        } catch (Throwable th) {
            d.a("ScreenStateReceiver", "failed to register receiver", th);
        }
    }

    public static k b(@NonNull Context context) {
        k kVar;
        PowerManager c = c(context);
        if (c == null ? true : Build.VERSION.SDK_INT >= 20 ? c.isInteractive() : c.isScreenOn()) {
            kVar = new k(true, null);
        } else {
            a aVar = a.get();
            if (aVar == null || aVar.a) {
                kVar = new k(false, null);
            } else {
                long currentTimeMillis = System.currentTimeMillis() - aVar.b;
                if (currentTimeMillis < 0) {
                    currentTimeMillis = 0;
                }
                kVar = new k(false, Long.valueOf(currentTimeMillis));
            }
        }
        d.b("ScreenStateReceiver", "current state %s", kVar);
        return kVar;
    }

    private static PowerManager c(@NonNull Context context) {
        if (b == null) {
            synchronized (ScreenStateReceiver.class) {
                if (b == null) {
                    b = (PowerManager) context.getSystemService("power");
                }
            }
        }
        return b;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        a aVar = (intent == null || TextUtils.isEmpty(intent.getAction())) ? null : new a(intent.getAction().equals("android.intent.action.SCREEN_ON"), System.currentTimeMillis());
        a.set(aVar);
        d.b("ScreenStateReceiver", "received state %s", aVar);
    }
}
