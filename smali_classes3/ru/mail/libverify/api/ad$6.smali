.class final Lru/mail/libverify/api/ad$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->a(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$6;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$6;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    const/4 v10, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    sget v1, Lru/mail/libverify/api/w$a;->a:I

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->a(I)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/ae;

    iget-object v2, p0, Lru/mail/libverify/api/ad$6;->a:Ljava/lang/String;

    invoke-interface {v0, v2, v10}, Lru/mail/libverify/api/ae;->a(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/t;->b()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/gcm/ServerNotificationMessage;

    iget-object v2, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v2, v2, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lru/mail/libverify/api/ad$6;->a:Ljava/lang/String;

    iget-object v3, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v3, v3, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->verify_code:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v1, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v1

    iget-object v1, v1, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/statistics/c;

    sget-object v3, Lru/mail/libverify/statistics/a;->NotificationPopup_EqualSmsReceived:Lru/mail/libverify/statistics/a;

    new-instance v4, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v4, v10}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v5, "PushSender"

    iget-object v6, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->sender:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    const-string/jumbo v5, "SmsTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, v0, Lru/mail/libverify/gcm/ServerNotificationMessage;->timestamp:J

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Lru/mail/libverify/statistics/b;->b(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    iget-object v4, v4, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v1, v3, v4}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/w;->a()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/t;->a()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$6;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/sms/SmsItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lru/mail/libverify/api/ad$6;->b:Ljava/lang/String;

    iget-object v5, p0, Lru/mail/libverify/api/ad$6;->a:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Lru/mail/libverify/sms/SmsItem;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lru/mail/libverify/api/a;->a(Lru/mail/libverify/sms/SmsItem;)V

    :cond_3
    return-void
.end method
