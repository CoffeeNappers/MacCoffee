package ru.mail.libverify.gcm;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.google.android.gms.gcm.GcmListenerService;
import ru.mail.libverify.api.k;
import ru.mail.libverify.utils.c;
import ru.mail.libverify.utils.d;
/* loaded from: classes3.dex */
public class GcmMessageHandlerService extends GcmListenerService {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context, String str, Bundle bundle) {
        if (TextUtils.isEmpty(str) || bundle == null) {
            d.a("GcmHandlerService", "wrong message received (either 'from' or 'data' is empty)");
        } else if (!TextUtils.equals(str, "297109036349")) {
            d.a("GcmHandlerService", "wrong message received (sender id %s is not equal to required sender id %s)", str, "297109036349");
        } else {
            String string = bundle.getString("server_info");
            if (!TextUtils.isEmpty(string)) {
                try {
                    k.a(context).b(string);
                } catch (Throwable th) {
                    c.a("GcmHandlerService", th, "handle server info error", new Object[0]);
                }
            }
            String string2 = bundle.getString("fetcher_info");
            if (!TextUtils.isEmpty(string2)) {
                try {
                    k.a(context).c(string2);
                } catch (Throwable th2) {
                    c.a("GcmHandlerService", th2, "handle fetcher info error", new Object[0]);
                }
            }
            String string3 = bundle.getString("data");
            if (TextUtils.isEmpty(string3)) {
                d.a("GcmHandlerService", "wrong message received (message data is empty)");
                return;
            }
            d.c("GcmHandlerService", "message received from %s with text %s", str, string3);
            try {
                k.a(context).a(string3);
            } catch (Throwable th3) {
                c.a("GcmHandlerService", th3, "handle message error", new Object[0]);
            }
        }
    }

    @Override // com.google.android.gms.gcm.GcmListenerService
    public void onDeletedMessages() {
        super.onDeletedMessages();
        d.c("GcmHandlerService", "messages deleted");
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        d.c("GcmHandlerService", "service destroyed");
    }

    @Override // com.google.android.gms.gcm.GcmListenerService
    public void onMessageReceived(String str, Bundle bundle) {
        super.onMessageReceived(str, bundle);
        a(this, str, bundle);
    }

    @Override // com.google.android.gms.gcm.GcmListenerService
    public void onMessageSent(String str) {
        super.onMessageSent(str);
        d.c("GcmHandlerService", "message sent msgid %s", str);
    }

    @Override // com.google.android.gms.gcm.GcmListenerService
    public void onSendError(String str, String str2) {
        super.onSendError(str, str2);
        d.a("GcmHandlerService", "send error msgid %s : %s", str, str2);
    }
}
