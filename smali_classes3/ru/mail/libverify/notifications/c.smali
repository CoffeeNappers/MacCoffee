.class public final Lru/mail/libverify/notifications/c;
.super Ljava/lang/Object;


# instance fields
.field public final a:Landroid/app/NotificationManager;

.field public final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/notifications/e;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lru/mail/libverify/notifications/d;


# direct methods
.method public constructor <init>(Lru/mail/libverify/notifications/d;)V
    .locals 2
    .param p1    # Lru/mail/libverify/notifications/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/notifications/c;->b:Ljava/util/HashMap;

    iput-object p1, p0, Lru/mail/libverify/notifications/c;->c:Lru/mail/libverify/notifications/d;

    invoke-interface {p1}, Lru/mail/libverify/notifications/d;->b()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lru/mail/libverify/notifications/c;->a:Landroid/app/NotificationManager;

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/notifications/c;Lru/mail/libverify/notifications/e;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/notifications/c;->a(Lru/mail/libverify/notifications/e;)V

    return-void
.end method

.method private a(Lru/mail/libverify/notifications/e;)V
    .locals 7
    .param p1    # Lru/mail/libverify/notifications/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x2

    invoke-virtual {p1}, Lru/mail/libverify/notifications/e;->c()Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/notifications/e;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, v0, Landroid/app/Notification;->defaults:I

    and-int/lit8 v1, v1, -0x3

    iput v1, v0, Landroid/app/Notification;->defaults:I

    iget v1, v0, Landroid/app/Notification;->defaults:I

    and-int/lit8 v1, v1, -0x2

    iput v1, v0, Landroid/app/Notification;->defaults:I

    :goto_0
    invoke-virtual {p1}, Lru/mail/libverify/notifications/e;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lru/mail/libverify/notifications/e;->a()Lru/mail/libverify/notifications/NotificationId;

    move-result-object v2

    invoke-virtual {v2}, Lru/mail/libverify/notifications/NotificationId;->a()I

    :try_start_0
    const-string/jumbo v2, "NotificationBarManager"

    const-string/jumbo v3, "safeNotify tag %s id %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lru/mail/libverify/notifications/c;->a:Landroid/app/NotificationManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3, v0}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget v0, p1, Lru/mail/libverify/notifications/e;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lru/mail/libverify/notifications/e;->a:I

    return-void

    :cond_0
    new-array v1, v2, [J

    fill-array-data v1, :array_0

    iput-object v1, v0, Landroid/app/Notification;->vibrate:[J

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "NotificationBarManager"

    const-string/jumbo v2, "safeNotify error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    nop

    :array_0
    .array-data 8
        0x1f4
        0x1f4
    .end array-data
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/notifications/c;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lru/mail/libverify/notifications/NotificationId;->SMS_CODE:Lru/mail/libverify/notifications/NotificationId;

    :try_start_0
    const-string/jumbo v1, "NotificationBarManager"

    const-string/jumbo v2, "cancel tag %s id %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v0}, Lru/mail/libverify/notifications/NotificationId;->a()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/notifications/c;->a:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/NotificationId;->a()I

    move-result v0

    invoke-virtual {v1, p1, v0}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :goto_1
    const-string/jumbo v1, "NotificationBarManager"

    const-string/jumbo v2, "cancel"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public final a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V
    .locals 7
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/notifications/f;

    iget-object v1, p0, Lru/mail/libverify/notifications/c;->c:Lru/mail/libverify/notifications/d;

    invoke-interface {v1}, Lru/mail/libverify/notifications/d;->b()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lru/mail/libverify/notifications/f;-><init>(Landroid/content/Context;Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V

    iget-object v1, p0, Lru/mail/libverify/notifications/c;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v0}, Lru/mail/libverify/notifications/c;->a(Lru/mail/libverify/notifications/e;)V

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->e()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->f()Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v2, "NotificationBarManager"

    const-string/jumbo v3, "notification %s ongoing timeout %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->b()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/notifications/c;->c:Lru/mail/libverify/notifications/d;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->f()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v1, p1, v2}, Lru/mail/libverify/notifications/d;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;I)V

    iget-object v1, p0, Lru/mail/libverify/notifications/c;->c:Lru/mail/libverify/notifications/d;

    invoke-interface {v1}, Lru/mail/libverify/notifications/d;->a()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/notifications/c$1;

    invoke-direct {v2, p0, v0}, Lru/mail/libverify/notifications/c$1;-><init>(Lru/mail/libverify/notifications/c;Lru/mail/libverify/notifications/e;)V

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e;->f()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
