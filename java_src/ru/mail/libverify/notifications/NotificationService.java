package ru.mail.libverify.notifications;

import android.app.IntentService;
import android.content.Intent;
import android.text.TextUtils;
import java.util.Locale;
import ru.mail.libverify.api.k;
/* loaded from: classes3.dex */
public class NotificationService extends IntentService {
    public NotificationService() {
        super("NotificationService");
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        ru.mail.libverify.utils.d.c("NotificationService", "service destroyed");
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent == null) {
            return;
        }
        String action = intent.getAction();
        if (TextUtils.isEmpty(action)) {
            ru.mail.libverify.utils.d.a("NotificationService", "Wrong action type detected");
            return;
        }
        String stringExtra = intent.getStringExtra("notification_id");
        ru.mail.libverify.utils.d.c("NotificationService", "received extra %s from notification %s", action, stringExtra);
        char c = 65535;
        switch (action.hashCode()) {
            case -964594249:
                if (action.equals("action_confirm")) {
                    c = 2;
                    break;
                }
                break;
            case 1064330403:
                if (action.equals("action_cancel")) {
                    c = 1;
                    break;
                }
                break;
            case 1096596436:
                if (action.equals("action_delete")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
                k.f(this).g(stringExtra);
                return;
            case 2:
                k.f(this).f(stringExtra);
                return;
            default:
                ru.mail.libverify.utils.c.a("NotificationService", "wrong action type", new IllegalArgumentException(String.format(Locale.US, "Wrong action type %s for NotificationService detected", action)));
                return;
        }
    }
}
