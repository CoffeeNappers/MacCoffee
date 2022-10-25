package ru.mail.libverify.utils;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.api.aa;
/* loaded from: classes3.dex */
public class SettingsCheckService extends IntentService {
    public SettingsCheckService() {
        super("SettingsCheckService");
        setIntentRedelivery(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context) {
        a(context, "package_updated", null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context, @NonNull String str) {
        a(context, "unblock_notification", "notification_id", str);
    }

    private static void a(@NonNull Context context, @NonNull String str, @Nullable String str2, @Nullable String str3) {
        d.c("SettingsCheckService", "start settings checking action %s (param : %s, value : %s)", str, str2, str3);
        Intent intent = new Intent(context, SettingsCheckService.class);
        intent.setAction(str);
        if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str3)) {
            intent.putExtra(str2, str3);
        }
        try {
            context.startService(intent);
        } catch (Throwable th) {
            d.a("SettingsCheckService", "failed to start settings service", th);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context, boolean z) {
        a(context, "battery_check", "battery_level", Boolean.toString(z));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void b(@NonNull Context context) {
        a(context, "package_removed", null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void c(@NonNull Context context) {
        a(context, "timer_check", null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void d(@NonNull Context context) {
        a(context, "restart_check", null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void e(@NonNull Context context) {
        a(context, "sms_templates_check", null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void f(@NonNull Context context) {
        a(context, "app_started", null, null);
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        d.c("SettingsCheckService", "service destroyed");
        super.onDestroy();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        boolean z;
        aa.a aVar;
        char c = 0;
        if (!VerificationFactory.hasInstallation(this) || intent == null) {
            return;
        }
        try {
            String action = intent.getAction();
            switch (action.hashCode()) {
                case -885491626:
                    if (action.equals("battery_check")) {
                        z = false;
                        break;
                    }
                    z = true;
                    break;
                case 529905078:
                    if (action.equals("unblock_notification")) {
                        z = true;
                        break;
                    }
                    z = true;
                    break;
                default:
                    z = true;
                    break;
            }
            switch (z) {
                case false:
                    ru.mail.libverify.api.k.d(this).b(Boolean.parseBoolean(intent.getStringExtra("battery_level")));
                    return;
                case true:
                    ru.mail.libverify.api.k.d(this).h(intent.getStringExtra("notification_id"));
                    return;
                default:
                    aa d = ru.mail.libverify.api.k.d(this);
                    String action2 = intent.getAction();
                    switch (action2.hashCode()) {
                        case -1126482532:
                            if (action2.equals("sms_templates_check")) {
                                c = 5;
                                break;
                            }
                            c = 65535;
                            break;
                        case -474358056:
                            if (action2.equals("restart_check")) {
                                c = 4;
                                break;
                            }
                            c = 65535;
                            break;
                        case -50264178:
                            if (action2.equals("timer_check")) {
                                c = 2;
                                break;
                            }
                            c = 65535;
                            break;
                        case 180229570:
                            if (action2.equals("package_updated")) {
                                break;
                            }
                            c = 65535;
                            break;
                        case 1144303715:
                            if (action2.equals("app_started")) {
                                c = 3;
                                break;
                            }
                            c = 65535;
                            break;
                        case 1506495847:
                            if (action2.equals("package_removed")) {
                                c = 1;
                                break;
                            }
                            c = 65535;
                            break;
                        default:
                            c = 65535;
                            break;
                    }
                    switch (c) {
                        case 0:
                            aVar = aa.a.PACKAGE_UPDATED;
                            break;
                        case 1:
                            aVar = aa.a.PACKAGE_REMOVED;
                            break;
                        case 2:
                            aVar = aa.a.TIMER;
                            break;
                        case 3:
                        case 4:
                            aVar = aa.a.RESTART;
                            break;
                        case 5:
                            aVar = aa.a.SMS_TEMPLATES_CHECK;
                            break;
                        default:
                            c.a("SettingsCheckService", "failed to process action", new IllegalArgumentException("unknown intent action"));
                            aVar = aa.a.UNKNOWN;
                            break;
                    }
                    d.a(aVar);
                    return;
            }
        } catch (Throwable th) {
            c.a("SettingsCheckService", "failed to process intent", th);
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("SettingsCheckService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }
}
