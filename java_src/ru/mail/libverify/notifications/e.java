package ru.mail.libverify.notifications;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.NotificationCompat;
import java.util.Random;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class e {
    int a = 0;
    protected final Context b;

    /* loaded from: classes3.dex */
    static abstract class a {
        protected static final Random a = new Random();
        protected final Intent b;
        protected final Context c;

        a(@NonNull Context context, @NonNull Intent intent, String str) {
            this.b = intent;
            this.c = context;
            this.b.setAction(str);
        }

        public abstract PendingIntent a();

        public final a a(@NonNull String str, String str2) {
            this.b.putExtra(str, str2);
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class b extends a {
        /* JADX INFO: Access modifiers changed from: package-private */
        public b(@NonNull Context context, @NonNull String str) {
            super(context, new Intent(context, NotificationService.class), str);
        }

        @Override // ru.mail.libverify.notifications.e.a
        public final PendingIntent a() {
            return PendingIntent.getService(this.c, a.nextInt(), this.b, 268435456);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class c extends a {
        /* JADX INFO: Access modifiers changed from: package-private */
        public c(@NonNull Context context) {
            super(context, new Intent(context, SettingsActivity.class), null);
            this.b.setFlags(335544320);
        }

        @Override // ru.mail.libverify.notifications.e.a
        public final PendingIntent a() {
            return PendingIntent.getActivity(this.c, a.nextInt(), this.b, 268435456);
        }
    }

    /* loaded from: classes3.dex */
    private static class d extends a {
        d(@NonNull Context context) {
            super(context, new Intent(context, SmsCodeNotificationActivity.class), null);
            this.b.setFlags(335544320);
        }

        @Override // ru.mail.libverify.notifications.e.a
        public final PendingIntent a() {
            return PendingIntent.getActivity(this.c, a.nextInt(), this.b, 268435456);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public e(Context context) {
        this.b = context;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PendingIntent a(@NonNull Context context, @NonNull String str) {
        return new d(context).a("notification_id", str).a();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PendingIntent b(@NonNull Context context, @NonNull String str) {
        return new b(context, "action_delete").a("notification_id", str).a();
    }

    public abstract NotificationId a();

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(NotificationCompat.Builder builder) {
        if (e() || !d()) {
            builder.setPriority(2);
        } else {
            builder.setPriority(0);
        }
        builder.setOngoing(e());
        builder.setDefaults(0);
        builder.setLocalOnly(true);
        builder.setCategory("msg");
        if (d()) {
            builder.setSound(null);
            builder.setLights(-1, 0, 0);
            return;
        }
        builder.setSound(RingtoneManager.getDefaultUri(2));
        builder.setLights(-1, 1500, 1500);
    }

    public abstract String b();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract NotificationCompat.Builder c();

    public abstract boolean d();

    public abstract boolean e();

    @Nullable
    public abstract Integer f();
}
