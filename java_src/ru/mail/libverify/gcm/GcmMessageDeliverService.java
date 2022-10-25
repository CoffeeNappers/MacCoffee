package ru.mail.libverify.gcm;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.content.WakefulBroadcastReceiver;
import com.vkontakte.android.data.ServerKeys;
import ru.mail.libverify.utils.d;
/* loaded from: classes3.dex */
public class GcmMessageDeliverService extends IntentService {
    public GcmMessageDeliverService() {
        super("GcmMessageDeliverService");
    }

    public static void a(@NonNull Context context, String str, Bundle bundle) {
        Intent intent = new Intent(context, GcmMessageDeliverService.class);
        intent.putExtra(ServerKeys.FROM, str);
        intent.putExtra("data", bundle);
        WakefulBroadcastReceiver.startWakefulService(context, intent);
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        d.c("GcmDeliverService", "service destroyed");
        super.onDestroy();
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent == null) {
            return;
        }
        try {
            GcmMessageHandlerService.a(this, intent.getStringExtra(ServerKeys.FROM), intent.getBundleExtra("data"));
        } finally {
            WakefulBroadcastReceiver.completeWakefulIntent(intent);
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("GcmDeliverService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }
}
