package ru.mail.libverify.sms;

import android.app.IntentService;
import android.content.Intent;
import android.os.Build;
import android.support.v4.content.WakefulBroadcastReceiver;
import android.telephony.SmsMessage;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import ru.mail.libverify.api.ab;
/* loaded from: classes3.dex */
public class SmsHandlingService extends IntentService {
    public SmsHandlingService() {
        super("SmsHandlingService");
    }

    private static String a(SmsMessage[] smsMessageArr) {
        StringBuilder sb = new StringBuilder(160);
        for (SmsMessage smsMessage : smsMessageArr) {
            sb.append(smsMessage.getMessageBody());
        }
        return sb.toString();
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        ru.mail.libverify.utils.d.c("SmsHandlingService", "service destroyed");
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent == null || intent.getExtras() == null) {
            ru.mail.libverify.utils.d.a("SmsHandlingService", "Incoming intent is null");
            return;
        }
        try {
            if (intent.hasExtra("pdus")) {
                ru.mail.libverify.utils.d.c("SmsHandlingService", "Incoming sms dump %s", ru.mail.libverify.utils.m.a(intent.getExtras()));
                ab g = ru.mail.libverify.api.k.g(this);
                Object[] objArr = (Object[]) intent.getSerializableExtra("pdus");
                String stringExtra = intent.getStringExtra("format");
                int length = objArr.length;
                SmsMessage[] smsMessageArr = new SmsMessage[length];
                for (int i = 0; i < length; i++) {
                    byte[] bArr = (byte[]) objArr[i];
                    if (Build.VERSION.SDK_INT < 23 || TextUtils.isEmpty(stringExtra)) {
                        smsMessageArr[i] = SmsMessage.createFromPdu(bArr);
                    } else {
                        smsMessageArr[i] = SmsMessage.createFromPdu(bArr, stringExtra);
                    }
                }
                if (length <= 0) {
                    ru.mail.libverify.utils.d.a("SmsHandlingService", "received message is empty");
                } else {
                    String displayOriginatingAddress = smsMessageArr[0].getDisplayOriginatingAddress();
                    String a = a(smsMessageArr);
                    if (TextUtils.isEmpty(displayOriginatingAddress) || TextUtils.isEmpty(a)) {
                        ru.mail.libverify.utils.d.a("SmsHandlingService", "received ether message or phoneNumber is empty");
                    } else {
                        ru.mail.libverify.utils.d.c("SmsHandlingService", "received message");
                        g.a(displayOriginatingAddress, a);
                    }
                }
            } else if (!intent.hasExtra("state") || !TextUtils.equals(intent.getStringExtra("state"), TelephonyManager.EXTRA_STATE_RINGING)) {
                ru.mail.libverify.utils.d.c("SmsHandlingService", "empty intent");
            } else {
                ab g2 = ru.mail.libverify.api.k.g(this);
                ru.mail.libverify.utils.d.c("SmsHandlingService", "received call");
                String string = intent.getExtras().getString("incoming_number");
                if (!TextUtils.isEmpty(string)) {
                    g2.a_(string);
                }
            }
        } catch (Throwable th) {
            try {
                ru.mail.libverify.utils.d.a("SmsHandlingService", "failed to process incoming sms %s", th.getMessage());
            } finally {
                ru.mail.libverify.utils.d.c("SmsHandlingService", "releasing wakelock");
                WakefulBroadcastReceiver.completeWakefulIntent(intent);
            }
        }
    }
}
