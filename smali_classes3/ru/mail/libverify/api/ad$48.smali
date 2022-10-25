.class final Lru/mail/libverify/api/ad$48;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->a(Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/ac$b;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/ac$b;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$48;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$48;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$48;->b:Lru/mail/libverify/api/ac$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    const/4 v8, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$48;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$48;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v5

    if-nez v5, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "notification with id %s doesn\'t exist"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad$48;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$48;->b:Lru/mail/libverify/api/ac$b;

    invoke-interface {v0, v8}, Lru/mail/libverify/api/ac$b;->a(Lru/mail/libverify/api/ac$a;)V

    :goto_0
    return-void

    :cond_0
    iget-object v9, p0, Lru/mail/libverify/api/ad$48;->b:Lru/mail/libverify/api/ac$b;

    iget-object v10, v5, Lru/mail/libverify/gcm/ServerNotificationMessage;->message:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    new-instance v0, Lru/mail/libverify/api/ac$a;

    invoke-virtual {v5}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->text:Ljava/lang/String;

    iget-object v3, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->phone:Ljava/lang/String;

    iget-object v4, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->from:Ljava/lang/String;

    iget-object v5, v5, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v5}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->a()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v6}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->b(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;

    move-result-object v6

    invoke-static {v6}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Confirm;)Ljava/lang/String;

    move-result-object v6

    :goto_1
    invoke-virtual {v10}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->a()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    iget-object v11, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    if-eqz v11, :cond_1

    iget-object v11, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v11}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    move-result-object v11

    if-eqz v11, :cond_1

    iget-object v11, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v11}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    move-result-object v11

    invoke-static {v11}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1

    iget-object v8, v10, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->controls:Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;

    invoke-static {v8}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls;)Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;

    move-result-object v8

    invoke-static {v8}, Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;->a(Lru/mail/libverify/gcm/ServerNotificationMessage$Message$Controls$Description;)Ljava/lang/String;

    move-result-object v8

    :cond_1
    invoke-direct/range {v0 .. v8}, Lru/mail/libverify/api/ac$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Lru/mail/libverify/api/ac$b;->a(Lru/mail/libverify/api/ac$a;)V

    goto :goto_0

    :cond_2
    move-object v6, v8

    goto :goto_1
.end method
