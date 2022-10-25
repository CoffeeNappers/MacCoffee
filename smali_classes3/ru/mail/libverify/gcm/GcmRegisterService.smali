.class public Lru/mail/libverify/gcm/GcmRegisterService;
.super Landroid/app/IntentService;


# instance fields
.field private final a:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "GcmRegisterService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/gcm/GcmRegisterService;->a:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lru/mail/libverify/gcm/GcmRegisterService;->setIntentRedelivery(Z)V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "gcm_token_refresh"

    invoke-static {p0, v0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public static a(Lru/mail/libverify/storage/o;)V
    .locals 2
    .param p0    # Lru/mail/libverify/storage/o;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "clear regId"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "gcm_registration_id"

    invoke-interface {p0, v0}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "gcm_app_version"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v0, 0x0

    const-string/jumbo v2, "GcmRegisterService"

    const-string/jumbo v3, "Gcm register method invoked with action %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p1, v4, v0

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p0}, Lru/mail/libverify/utils/m;->g(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v2, "GcmRegisterService"

    const-string/jumbo v3, "GCM: start gcm registration service"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lru/mail/libverify/gcm/GcmRegisterService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v2

    const-string/jumbo v3, "GcmRegisterService"

    const-string/jumbo v4, "GCM: start gcm service result %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v2, "GcmRegisterService"

    const-string/jumbo v3, "failed to start gcm service"

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Lru/mail/libverify/storage/o;)Z
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/storage/o;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1}, Lru/mail/libverify/gcm/GcmRegisterService;->c(Landroid/content/Context;Lru/mail/libverify/storage/o;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "GCM Device has already registered in GCM"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;Lru/mail/libverify/storage/o;)Ljava/lang/String;
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/storage/o;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const-string/jumbo v1, "gcm_registration_id"

    invoke-interface {p1, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v1, "GcmRegisterService"

    const-string/jumbo v2, "registration not found"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v2, "gcm_app_version"

    invoke-interface {p1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v1, "GcmRegisterService"

    const-string/jumbo v2, "app version changed."

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "gcm_package_updated"

    invoke-static {p0, v0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method private static c(Landroid/content/Context;Lru/mail/libverify/storage/o;)Z
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/storage/o;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1}, Lru/mail/libverify/gcm/GcmRegisterService;->b(Landroid/content/Context;Lru/mail/libverify/storage/o;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 11

    const/4 v1, 0x0

    const/16 v10, 0x14

    const/4 v0, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "gcm_token_refresh"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    invoke-static {p0}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;)Lru/mail/libverify/api/j;

    move-result-object v3

    if-nez v2, :cond_2

    invoke-interface {v3}, Lru/mail/libverify/api/j;->e()Lru/mail/libverify/storage/o;

    move-result-object v4

    invoke-static {p0, v4}, Lru/mail/libverify/gcm/GcmRegisterService;->c(Landroid/content/Context;Lru/mail/libverify/storage/o;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "GCM registration has already successfully completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3}, Lru/mail/libverify/api/j;->b()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "GcmRegisterService"

    const-string/jumbo v2, "failed to register Gcm"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    :try_start_1
    invoke-interface {v3}, Lru/mail/libverify/api/j;->e()Lru/mail/libverify/storage/o;

    move-result-object v4

    invoke-static {v4}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Lru/mail/libverify/storage/o;)V

    if-eqz v2, :cond_3

    invoke-interface {v3}, Lru/mail/libverify/api/j;->d()V

    :cond_3
    move v2, v0

    :goto_1
    if-ge v2, v10, :cond_0

    mul-int v0, v2, v2

    mul-int/lit16 v0, v0, 0x7530

    if-eqz v0, :cond_4

    mul-int v0, v2, v2

    mul-int/lit16 v0, v0, 0x7530

    int-to-long v4, v0

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v6, "wait backoff timeout %d before next attempt %d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v0, v6, v7}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v6, p0, Lru/mail/libverify/gcm/GcmRegisterService;->a:Ljava/lang/Object;

    monitor-enter v6
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    iget-object v0, p0, Lru/mail/libverify/gcm/GcmRegisterService;->a:Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_4
    :try_start_4
    invoke-static {p0}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v0

    const-string/jumbo v4, "297109036349"

    const-string/jumbo v5, "GCM"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v5, v6}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v0

    :goto_2
    :try_start_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string/jumbo v1, "GcmRegisterService"

    const-string/jumbo v2, "Gcm registration id %s was received and stored in shared preferences"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v1, v2, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v3}, Lru/mail/libverify/api/j;->e()Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-static {p0}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;)I

    move-result v2

    const-string/jumbo v4, "GcmRegisterService"

    const-string/jumbo v5, "save regId %s on app version %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v7, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v4, "gcm_registration_id"

    invoke-interface {v1, v4, v0}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "gcm_app_version"

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    invoke-interface {v3}, Lru/mail/libverify/api/j;->b()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    :catch_1
    move-exception v0

    :try_start_6
    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "failed to wait for the next attempt"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v6

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v0

    :catch_2
    move-exception v0

    const-string/jumbo v4, "GcmRegisterService"

    const-string/jumbo v5, "GCM service access error"

    invoke-static {v4, v5, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_2

    :catch_3
    move-exception v0

    const-string/jumbo v1, "GcmRegisterService"

    const-string/jumbo v2, "not enough permissions to register GCM channel or other error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v3, v0}, Lru/mail/libverify/api/j;->a(Ljava/lang/Exception;)V

    goto/16 :goto_0

    :cond_5
    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v4, "failed to get Gcm registration id on attempt %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v0, v2, 0x1

    if-lt v0, v10, :cond_6

    invoke-interface {v3}, Lru/mail/libverify/api/j;->c()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0

    :cond_6
    move v2, v0

    goto/16 :goto_1
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/IntentService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/IntentService;->onTaskRemoved(Landroid/content/Intent;)V

    const-string/jumbo v0, "GcmRegisterService"

    const-string/jumbo v1, "task removed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
