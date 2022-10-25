package ru.mail.libverify.notifications;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import ru.mail.libverify.R;
import ru.mail.libverify.gcm.ServerNotificationMessage;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class f extends e {
    private final ServerNotificationMessage c;
    private final boolean d;

    /* JADX INFO: Access modifiers changed from: package-private */
    public f(@NonNull Context context, @NonNull ServerNotificationMessage serverNotificationMessage, boolean z) {
        super(context);
        this.c = serverNotificationMessage;
        this.d = z;
    }

    @Override // ru.mail.libverify.notifications.e
    public final NotificationId a() {
        return NotificationId.SMS_CODE;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.notifications.e
    public final void a(NotificationCompat.Builder builder) {
        super.a(builder);
        ServerNotificationMessage.Message message = this.c.message;
        if (!TextUtils.isEmpty(message.public_text)) {
            NotificationCompat.Builder builder2 = new NotificationCompat.Builder(this.b);
            builder2.setContentTitle(message.from);
            builder2.setContentText(message.public_text);
            builder2.setTicker(message.public_text);
            builder2.setWhen(this.c.timestamp);
            builder2.setContentIntent(PendingIntent.getActivity(this.b, 0, new Intent(), 0));
            builder2.setSmallIcon(R.drawable.libverify_ic_sms_white);
            builder2.setDeleteIntent(b(this.b, this.c.a()));
            builder2.setContentIntent(a(this.b, this.c.a()));
            builder2.setStyle(new NotificationCompat.BigTextStyle().bigText(message.public_text));
            builder.setPublicVersion(builder2.build());
        }
        builder.setContentTitle(message.from);
        builder.setContentText(message.text);
        builder.setTicker(message.text);
        builder.setWhen(this.c.timestamp);
        builder.setContentIntent(PendingIntent.getActivity(this.b, 0, new Intent(), 0));
        builder.setSmallIcon(R.drawable.libverify_ic_sms_white);
        builder.setDeleteIntent(b(this.b, this.c.a()));
        builder.setContentIntent(a(this.b, this.c.a()));
        builder.setStyle(new NotificationCompat.BigTextStyle().bigText(message.text));
    }

    @Override // ru.mail.libverify.notifications.e
    public final String b() {
        return this.c.a();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.notifications.e
    public final NotificationCompat.Builder c() {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this.b);
        a(builder);
        return builder;
    }

    @Override // ru.mail.libverify.notifications.e
    public final boolean d() {
        return this.d || this.a > 0;
    }

    @Override // ru.mail.libverify.notifications.e
    public final boolean e() {
        return f() != null;
    }

    @Override // ru.mail.libverify.notifications.e
    @Nullable
    public final Integer f() {
        if (this.c.hold_timeout == null || this.c.hold_timeout.intValue() == 0) {
            return null;
        }
        long abs = Math.abs(System.currentTimeMillis() - this.c.server_timestamp);
        if (abs > 1800000) {
            ru.mail.libverify.utils.d.b("SmsCodeNotification", "notification %s, outdated by server timeout (%d)", this.c.a(), Long.valueOf(abs));
            return null;
        }
        long currentTimeMillis = System.currentTimeMillis() - this.c.timestamp;
        if (currentTimeMillis < 0) {
            ru.mail.libverify.utils.d.b("SmsCodeNotification", "notification %s, outdated by local timeout (%d)", this.c.a(), Long.valueOf(currentTimeMillis));
            return null;
        }
        int min = Math.min(this.c.hold_timeout.intValue(), 120000) - ((int) currentTimeMillis);
        ru.mail.libverify.utils.d.c("SmsCodeNotification", "notification %s, local diff %d, server diff %d, ongoing timeout %d", this.c.a(), Long.valueOf(currentTimeMillis), Long.valueOf(abs), Integer.valueOf(min));
        if (min <= 0) {
            return null;
        }
        return Integer.valueOf(min);
    }
}
