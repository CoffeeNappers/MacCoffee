.class final Lru/mail/libverify/api/ad$45;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->i(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$45;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$45;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    const/4 v4, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$45;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$45;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v1

    if-nez v1, :cond_1

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "notification id %s doesn\'t exist"

    new-array v2, v4, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/ad$45;->a:Ljava/lang/String;

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v2, "notification %s show settings"

    new-array v3, v4, [Ljava/lang/Object;

    aput-object v1, v3, v7

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$45;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->p(Lru/mail/libverify/api/ad;)Lru/mail/libverify/notifications/c;

    move-result-object v0

    invoke-virtual {v0, v1, v4}, Lru/mail/libverify/notifications/c;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$45;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v3, Lru/mail/libverify/statistics/a;->NotificationPopup_SettingsOpened:Lru/mail/libverify/statistics/a;

    new-instance v4, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v4, v7}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v5, "PushSender"

    iget-object v6, v1, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    iget-object v4, v4, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v3, v4}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0
.end method
