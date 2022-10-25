package ru.mail.libverify.utils;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.gcm.GcmRegisterService;
/* loaded from: classes3.dex */
public class SystemRestartReceiver extends BroadcastReceiver {
    public static void a(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, SystemRestartReceiver.class), 1, 1);
            d.c("SystemRestartReceiver", "enabled");
        } catch (Throwable th) {
            d.a("SystemRestartReceiver", "failed to enable", th);
        }
    }

    public static void b(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, SystemRestartReceiver.class), 2, 1);
            d.c("SystemRestartReceiver", "disabled");
        } catch (Throwable th) {
            d.a("SystemRestartReceiver", "failed to disable", th);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent != null && VerificationFactory.hasInstallation(context)) {
            GcmRegisterService.a(context);
            SettingsCheckService.d(context);
        }
    }
}
