.class public Lru/mail/libverify/utils/network/NetworkCheckService;
.super Landroid/app/IntentService;


# instance fields
.field private final a:J

.field private final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string/jumbo v0, "NetworkCheckService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/utils/network/NetworkCheckService;->b:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lru/mail/libverify/utils/network/NetworkCheckService;->a:J

    return-void
.end method

.method private a()J
    .locals 6

    const-wide/16 v0, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lru/mail/libverify/utils/network/NetworkCheckService;->a:J

    sub-long/2addr v2, v4

    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/32 v0, 0x927c0

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "start network checking"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/network/NetworkCheckService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "NetworkCheckService"

    const-string/jumbo v2, "failed to start network check service"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 11

    const/4 v4, 0x1

    const-wide/16 v2, 0x0

    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "onHandleIntent started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lru/mail/libverify/utils/network/NetworkCheckService;->a()J

    move-result-wide v0

    move v6, v4

    :goto_0
    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    iget-object v7, p0, Lru/mail/libverify/utils/network/NetworkCheckService;->b:Ljava/lang/Object;

    monitor-enter v7

    :try_start_0
    const-string/jumbo v4, "NetworkCheckService"

    const-string/jumbo v5, "onHandleIntent on iteration = %d remaining time = %d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v4, v5, v8}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v8, p0, Lru/mail/libverify/utils/network/NetworkCheckService;->b:Ljava/lang/Object;

    cmp-long v4, v0, v2

    if-gez v4, :cond_2

    move-wide v0, v2

    :cond_0
    :goto_1
    invoke-virtual {v8, v0, v1}, Ljava/lang/Object;->wait(J)V

    invoke-static {p0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->b(Landroid/content/Context;)V

    invoke-static {}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->a()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "onHandleIntent internet connection detected"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_2
    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "onHandleIntent completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    mul-int v4, v6, v6

    mul-int/lit16 v4, v4, 0xc8

    int-to-long v4, v4

    cmp-long v9, v4, v0

    if-gtz v9, :cond_0

    move-wide v0, v4

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "onHandleIntent wait loop interrupted"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v7

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_3
    :try_start_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    add-int/lit8 v4, v6, 0x1

    invoke-direct {p0}, Lru/mail/libverify/utils/network/NetworkCheckService;->a()J

    move-result-wide v0

    move v6, v4

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string/jumbo v0, "NetworkCheckService"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/IntentService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method
