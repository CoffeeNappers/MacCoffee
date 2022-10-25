package ru.mail.libverify.utils;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import java.util.Calendar;
import java.util.Random;
/* loaded from: classes3.dex */
public class AlarmReceiver extends BroadcastReceiver {
    private static PendingIntent a(@NonNull Context context, @NonNull String str) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("package_changed");
        intent.putExtra("package_change_type", str);
        return PendingIntent.getBroadcast(context, 0, intent, 134217728);
    }

    public static void a(@NonNull Context context) {
        a(context, g(context), 172800000, true, true);
    }

    public static void a(@NonNull Context context, int i) {
        a(context, h(context), i, true, true);
    }

    private static void a(@NonNull Context context, @NonNull PendingIntent pendingIntent, int i, boolean z, boolean z2) {
        try {
            d.c("AlarmReceiver", "set up alarm %s", pendingIntent);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
            alarmManager.cancel(pendingIntent);
            Calendar calendar = Calendar.getInstance();
            calendar.add(14, z ? new Random().nextInt(i / 2) + (i / 2) : i);
            if (z2) {
                alarmManager.setInexactRepeating(1, calendar.getTimeInMillis(), i, pendingIntent);
            } else {
                alarmManager.set(1, calendar.getTimeInMillis(), pendingIntent);
            }
        } catch (Throwable th) {
            c.a("AlarmReceiver", "error in setup an alarm logic", th);
        }
    }

    public static void a(@NonNull Context context, @NonNull String str, int i) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("unblock_notification");
        intent.putExtra("notification_id", str);
        a(context, PendingIntent.getBroadcast(context, 0, intent, 0), i, false, false);
    }

    public static void b(@NonNull Context context) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("refresh_push_token_once");
        a(context, PendingIntent.getBroadcast(context, 0, intent, 0), 30000, true, false);
    }

    public static void c(@NonNull Context context) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("app_started");
        a(context, PendingIntent.getBroadcast(context, 0, intent, 0), 600000, true, false);
    }

    public static void d(@NonNull Context context) {
        a(context, a(context, "package_change_removed"), 3600000, false, false);
    }

    public static void e(@NonNull Context context) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("check_sms_templates");
        a(context, PendingIntent.getBroadcast(context, 0, intent, 0), 300000, true, false);
    }

    public static void f(@NonNull Context context) {
        a(context, a(context, "package_change_updated"), 3600000, false, false);
    }

    private static PendingIntent g(@NonNull Context context) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("refresh_push_token");
        return PendingIntent.getBroadcast(context, 0, intent, 0);
    }

    private static PendingIntent h(@NonNull Context context) {
        Intent intent = new Intent(context, AlarmReceiver.class);
        intent.setAction("check_settings");
        return PendingIntent.getBroadcast(context, 0, intent, 0);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00e5, code lost:
        if (r3.equals("package_change_removed") != false) goto L24;
     */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onReceive(android.content.Context r6, android.content.Intent r7) {
        /*
            Method dump skipped, instructions count: 336
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.utils.AlarmReceiver.onReceive(android.content.Context, android.content.Intent):void");
    }
}
