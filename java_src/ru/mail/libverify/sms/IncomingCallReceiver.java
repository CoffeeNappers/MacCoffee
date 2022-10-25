package ru.mail.libverify.sms;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.content.WakefulBroadcastReceiver;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
/* loaded from: classes3.dex */
public class IncomingCallReceiver extends WakefulBroadcastReceiver {
    public static void a(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, IncomingCallReceiver.class), 1, 1);
            ru.mail.libverify.utils.d.c("CallReceiver", "enabled");
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("CallReceiver", "failed to enable", th);
        }
    }

    public static void b(@NonNull Context context) {
        try {
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, IncomingCallReceiver.class), 2, 1);
            ru.mail.libverify.utils.d.c("CallReceiver", "disabled");
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("CallReceiver", "failed to disable", th);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent == null || !intent.hasExtra("state") || !TextUtils.equals(intent.getStringExtra("state"), TelephonyManager.EXTRA_STATE_RINGING)) {
            return;
        }
        Intent intent2 = new Intent(intent);
        intent2.setClass(context, SmsHandlingService.class);
        startWakefulService(context, intent2);
    }
}
