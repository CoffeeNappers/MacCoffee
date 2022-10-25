.class public final Lru/mail/libverify/statistics/b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/statistics/b$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/statistics/c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    return-void
.end method

.method public static b(J)Ljava/lang/String;
    .locals 4

    const v2, 0x15180

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    const-string/jumbo v0, "-1"

    :goto_0
    return-object v0

    :cond_0
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    long-to-int v1, v0

    const/16 v0, 0xa

    if-gt v1, v0, :cond_1

    const-string/jumbo v0, "S"

    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/16 v0, 0x3c

    if-gt v1, v0, :cond_2

    const-string/jumbo v0, "S"

    div-int/lit8 v1, v1, 0x5

    mul-int/lit8 v1, v1, 0x5

    goto :goto_1

    :cond_2
    const/16 v0, 0x258

    if-gt v1, v0, :cond_3

    const-string/jumbo v0, "M"

    div-int/lit8 v1, v1, 0x3c

    goto :goto_1

    :cond_3
    const/16 v0, 0xe10

    if-gt v1, v0, :cond_4

    const-string/jumbo v0, "M"

    div-int/lit8 v1, v1, 0x3c

    div-int/lit8 v1, v1, 0xa

    mul-int/lit8 v1, v1, 0xa

    goto :goto_1

    :cond_4
    if-gt v1, v2, :cond_5

    const-string/jumbo v0, "H"

    div-int/lit16 v1, v1, 0xe10

    goto :goto_1

    :cond_5
    const-string/jumbo v0, "D"

    div-int/2addr v1, v2

    goto :goto_1
.end method


# virtual methods
.method public final a()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Reset:Lru/mail/libverify/statistics/a;

    invoke-interface {v0, v2}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final a(J)V
    .locals 9

    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_StatusSubmitted:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "SubmitTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, p1

    invoke-static {v6, v7}, Lru/mail/libverify/statistics/b;->b(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2
    .param p1    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    invoke-interface {v0, p1, p2}, Lru/mail/libverify/statistics/c;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final a(Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 6
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_ServerCompleted:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "PushSender"

    iget-object v5, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "PushDelivery"

    iget-object v5, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v5}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public final a(Lru/mail/libverify/gcm/ServerNotificationMessage;Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 11
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v10, 0x0

    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_Duplication:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v3, v10}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "PushDelivery"

    const-string/jumbo v5, "%s_%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    aput-object v7, v6, v10

    const/4 v7, 0x1

    iget-object v8, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "PushTime"

    iget-wide v6, p2, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    iget-wide v8, p1, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Lru/mail/libverify/statistics/b;->b(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .locals 10
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v9, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getOwner()Lru/mail/libverify/requests/e;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Response must have non null owner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->API_Request_Failure:Lru/mail/libverify/statistics/a;

    new-instance v3, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v3, v9}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v4, "Method"

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getOwner()Lru/mail/libverify/requests/e;

    move-result-object v5

    invoke-virtual {v5}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    const-string/jumbo v4, "StatusCode"

    const-string/jumbo v5, "%s_%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v7

    aput-object v7, v6, v9

    const/4 v7, 0x1

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDetailStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v3

    iget-object v3, v3, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v2, v3}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_1
    return-void
.end method
