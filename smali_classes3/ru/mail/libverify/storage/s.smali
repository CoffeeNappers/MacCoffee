.class final Lru/mail/libverify/storage/s;
.super Ljava/lang/Object;


# static fields
.field private static a:Lru/mail/libverify/requests/response/SmsInfo;


# direct methods
.method static declared-synchronized a(Landroid/content/Context;Lru/mail/libverify/requests/response/SmsInfo;)V
    .locals 10
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/requests/response/SmsInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const-class v1, Lru/mail/libverify/storage/s;

    monitor-enter v1

    :try_start_0
    sput-object p1, Lru/mail/libverify/storage/s;->a:Lru/mail/libverify/requests/response/SmsInfo;

    invoke-static {p0}, Lru/mail/libverify/storage/s;->c(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    if-nez p1, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v3, Ljava/io/File;

    invoke-static {p0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const-string/jumbo v4, "SMS_TEMPLATES_TMP"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v0

    :cond_0
    const-string/jumbo v2, "SmsTemplatesStorage"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "sms info delete result "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    monitor-exit v1

    return-void

    :cond_2
    :try_start_1
    const-string/jumbo v0, "SmsTemplatesStorage"

    const-string/jumbo v3, "start file write"

    invoke-static {v0, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {p1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lru/mail/libverify/utils/m;->a(Ljava/io/File;Ljava/lang/String;)V

    const-string/jumbo v0, "SmsTemplatesStorage"

    const-string/jumbo v2, "file write competed (%d ms)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v4, v8, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v2, "SmsTemplatesStorage"

    const-string/jumbo v3, "Failed to write sms info file"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized a(Landroid/content/Context;)Z
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-class v1, Lru/mail/libverify/storage/s;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Lru/mail/libverify/storage/s;->c(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized b(Landroid/content/Context;)Lru/mail/libverify/requests/response/SmsInfo;
    .locals 10
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const-class v1, Lru/mail/libverify/storage/s;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lru/mail/libverify/storage/s;->a:Lru/mail/libverify/requests/response/SmsInfo;

    if-eqz v0, :cond_0

    sget-object v0, Lru/mail/libverify/storage/s;->a:Lru/mail/libverify/requests/response/SmsInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    invoke-static {p0}, Lru/mail/libverify/storage/s;->c(Landroid/content/Context;)Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "SmsTemplatesStorage"

    const-string/jumbo v2, "start file read"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {p0}, Lru/mail/libverify/storage/s;->c(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    const-class v4, Lru/mail/libverify/requests/response/SmsInfo;

    invoke-static {v0, v4}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/SmsInfo;

    sput-object v0, Lru/mail/libverify/storage/s;->a:Lru/mail/libverify/requests/response/SmsInfo;

    const-string/jumbo v0, "SmsTemplatesStorage"

    const-string/jumbo v4, "file read competed (%d ms)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v2, v8, v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v6

    invoke-static {v0, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_1
    :try_start_3
    sget-object v0, Lru/mail/libverify/storage/s;->a:Lru/mail/libverify/requests/response/SmsInfo;

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v2, "SmsTemplatesStorage"

    const-string/jumbo v3, "Failed to read sms info file"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static c(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, "SMS_TEMPLATES"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
