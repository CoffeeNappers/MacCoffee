.class abstract Lru/mail/libverify/notifications/e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/notifications/e$d;,
        Lru/mail/libverify/notifications/e$c;,
        Lru/mail/libverify/notifications/e$b;,
        Lru/mail/libverify/notifications/e$a;
    }
.end annotation


# instance fields
.field a:I

.field protected final b:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/notifications/e;->a:I

    iput-object p1, p0, Lru/mail/libverify/notifications/e;->b:Landroid/content/Context;

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/notifications/e$d;

    invoke-direct {v0, p0}, Lru/mail/libverify/notifications/e$d;-><init>(Landroid/content/Context;)V

    const-string/jumbo v1, "notification_id"

    invoke-virtual {v0, v1, p1}, Lru/mail/libverify/notifications/e$d;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/notifications/e$a;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e$a;->a()Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method static b(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/notifications/e$b;

    const-string/jumbo v1, "action_delete"

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/notifications/e$b;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string/jumbo v1, "notification_id"

    invoke-virtual {v0, v1, p1}, Lru/mail/libverify/notifications/e$b;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/notifications/e$a;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e$a;->a()Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract a()Lru/mail/libverify/notifications/NotificationId;
.end method

.method protected a(Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 5

    const/16 v4, 0x5dc

    const/4 v3, 0x2

    const/4 v2, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/e;->e()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/notifications/e;->d()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    :goto_0
    invoke-virtual {p0}, Lru/mail/libverify/notifications/e;->e()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    const-string/jumbo v0, "msg"

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Lru/mail/libverify/notifications/e;->d()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {p1, v2, v1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    :goto_1
    return-void

    :cond_1
    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0

    :cond_2
    invoke-static {v3}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {p1, v2, v4, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_1
.end method

.method public abstract b()Ljava/lang/String;
.end method

.method protected abstract c()Landroid/support/v4/app/NotificationCompat$Builder;
.end method

.method public abstract d()Z
.end method

.method public abstract e()Z
.end method

.method public abstract f()Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method
