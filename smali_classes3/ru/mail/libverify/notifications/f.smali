.class final Lru/mail/libverify/notifications/f;
.super Lru/mail/libverify/notifications/e;


# instance fields
.field private final c:Lru/mail/libverify/gcm/ServerNotificationMessage;

.field private final d:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/notifications/e;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iput-boolean p3, p0, Lru/mail/libverify/notifications/f;->d:Z

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/notifications/NotificationId;
    .locals 1

    sget-object v0, Lru/mail/libverify/notifications/NotificationId;->SMS_CODE:Lru/mail/libverify/notifications/NotificationId;

    return-object v0
.end method

.method protected final a(Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 5

    const/4 v4, 0x0

    invoke-super {p0, p1}, Lru/mail/libverify/notifications/e;->a(Landroid/support/v4/app/NotificationCompat$Builder;)V

    iget-object v0, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v1, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->public_text:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->public_text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->public_text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-wide v2, v2, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {v2, v4, v3, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    sget v2, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    iget-object v3, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v3}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lru/mail/libverify/notifications/f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    iget-object v3, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v3}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lru/mail/libverify/notifications/f;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    new-instance v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v2}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->public_text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setPublicVersion(Landroid/app/Notification;)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_0
    iget-object v1, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-wide v2, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    invoke-virtual {p1, v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-static {v1, v4, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    sget v1, Lru/mail/libverify/R$drawable;->libverify_ic_sms_white:I

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v2}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lru/mail/libverify/notifications/f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    iget-object v2, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v2}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lru/mail/libverify/notifications/f;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    new-instance v1, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v1}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    iget-object v0, v0, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    return-void
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final c()Landroid/support/v4/app/NotificationCompat$Builder;
    .locals 2

    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lru/mail/libverify/notifications/f;->a(Landroid/support/v4/app/NotificationCompat$Builder;)V

    return-object v0
.end method

.method public final d()Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/notifications/f;->d:Z

    if-nez v0, :cond_0

    iget v0, p0, Lru/mail/libverify/notifications/e;->a:I

    if-lez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final e()Z
    .locals 1

    invoke-virtual {p0}, Lru/mail/libverify/notifications/f;->f()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final f()Ljava/lang/Integer;
    .locals 13
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v1, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->hold_timeout:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v1, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->hold_timeout:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-wide v4, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->server_timestamp:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/32 v4, 0x1b7740

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    const-string/jumbo v1, "SmsCodeNotification"

    const-string/jumbo v4, "notification %s, outdated by server timeout (%d)"

    new-array v5, v12, [Ljava/lang/Object;

    iget-object v6, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v6}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v11

    invoke-static {v1, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-wide v6, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-gez v1, :cond_3

    const-string/jumbo v1, "SmsCodeNotification"

    const-string/jumbo v2, "notification %s, outdated by local timeout (%d)"

    new-array v3, v12, [Ljava/lang/Object;

    iget-object v6, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v6}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v11

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v1, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->hold_timeout:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v6, 0x1d4c0

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    long-to-int v6, v4

    sub-int/2addr v1, v6

    const-string/jumbo v6, "SmsCodeNotification"

    const-string/jumbo v7, "notification %s, local diff %d, server diff %d, ongoing timeout %d"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, p0, Lru/mail/libverify/notifications/f;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-virtual {v9}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v8, v11

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v8, v12

    const/4 v2, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v2

    invoke-static {v6, v7, v8}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-lez v1, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0
.end method
