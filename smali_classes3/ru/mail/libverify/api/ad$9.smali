.class final Lru/mail/libverify/api/ad$9;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->a(Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:J

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;J)V
    .locals 1

    iput-object p1, p0, Lru/mail/libverify/api/ad$9;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$9;->a:Ljava/lang/String;

    iput-wide p3, p0, Lru/mail/libverify/api/ad$9;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lru/mail/libverify/api/ad$9;->c:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/api/t;->b()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v4, "current messages count %d"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v1, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v2

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v5, p0, Lru/mail/libverify/api/ad$9;->a:Ljava/lang/String;

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-wide v6, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    iget-wide v8, p0, Lru/mail/libverify/api/ad$9;->b:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_2

    iget-object v1, p0, Lru/mail/libverify/api/ad$9;->c:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v1

    invoke-virtual {v0}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lru/mail/libverify/api/t;->a(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v5, "removed message timestamp %d"

    new-array v6, v3, [Ljava/lang/Object;

    iget-wide v8, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v1, v5, v6}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v3

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$9;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->p(Lru/mail/libverify/api/ad;)Lru/mail/libverify/notifications/c;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$9;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lru/mail/libverify/notifications/c;->a(Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_1
.end method
