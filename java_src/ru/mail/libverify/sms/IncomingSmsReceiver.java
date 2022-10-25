package ru.mail.libverify.sms;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.content.WakefulBroadcastReceiver;
/* loaded from: classes3.dex */
public class IncomingSmsReceiver extends WakefulBroadcastReceiver {
    public static void a(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, IncomingSmsReceiver.class), 1, 1);
            ru.mail.libverify.utils.d.c("SmsReceiver", "enabled");
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("SmsReceiver", "failed to enable", th);
        }
    }

    public static void b(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, IncomingSmsReceiver.class), 2, 1);
            ru.mail.libverify.utils.d.c("SmsReceiver", "disabled");
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("SmsReceiver", "failed to disable", th);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Intent intent2 = new Intent(intent);
        intent2.setClass(context, SmsHandlingService.class);
        startWakefulService(context, intent2);
        setResult(-1, null, null);
    }
}
