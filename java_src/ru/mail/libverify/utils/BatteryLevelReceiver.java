package ru.mail.libverify.utils;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.VerificationFactory;
/* loaded from: classes3.dex */
public class BatteryLevelReceiver extends BroadcastReceiver {
    private static volatile boolean a = false;

    public static void a(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, BatteryLevelReceiver.class), 1, 1);
            d.c("BatteryLevelReceiver", "enabled");
        } catch (Throwable th) {
            d.a("BatteryLevelReceiver", "failed to enable", th);
        }
    }

    public static boolean a() {
        return a;
    }

    public static void b(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, BatteryLevelReceiver.class), 2, 1);
            d.c("BatteryLevelReceiver", "disabled");
        } catch (Throwable th) {
            d.a("BatteryLevelReceiver", "failed to disable", th);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (context == null || intent == null || !VerificationFactory.hasInstallation(context)) {
            return;
        }
        d.b("BatteryLevelReceiver", "onReceive %s", intent.getAction());
        String action = intent.getAction();
        char c = 65535;
        switch (action.hashCode()) {
            case -1980154005:
                if (action.equals("android.intent.action.BATTERY_OKAY")) {
                    c = 2;
                    break;
                }
                break;
            case -1886648615:
                if (action.equals("android.intent.action.ACTION_POWER_DISCONNECTED")) {
                    c = 3;
                    break;
                }
                break;
            case 490310653:
                if (action.equals("android.intent.action.BATTERY_LOW")) {
                    c = 0;
                    break;
                }
                break;
            case 1019184907:
                if (action.equals("android.intent.action.ACTION_POWER_CONNECTED")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                a = true;
                SettingsCheckService.a(context, true);
                return;
            case 1:
            case 2:
                a = false;
                SettingsCheckService.a(context, false);
                return;
            default:
                return;
        }
    }
}
