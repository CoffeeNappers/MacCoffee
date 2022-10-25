.class final Lru/mail/libverify/api/ad$4$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$4;->a(Lru/mail/libverify/ipc/f$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/ipc/f$c;

.field final synthetic b:Lru/mail/libverify/api/ad$4;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$4;Lru/mail/libverify/ipc/f$c;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iput-object p2, p0, Lru/mail/libverify/api/ad$4$1;->a:Lru/mail/libverify/ipc/f$c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    const/4 v0, 0x0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "connection to session %s status %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v4, v4, Lru/mail/libverify/api/ad$4;->a:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iget-object v4, v4, Lru/mail/libverify/gcm/ServerNotificationMessage$Message;->session_id:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v4, 0x1

    iget-object v5, p0, Lru/mail/libverify/api/ad$4$1;->a:Lru/mail/libverify/ipc/f$c;

    invoke-virtual {v5}, Lru/mail/libverify/ipc/f$c;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sget-object v2, Lru/mail/libverify/api/ad$58;->b:[I

    iget-object v3, p0, Lru/mail/libverify/api/ad$4$1;->a:Lru/mail/libverify/ipc/f$c;

    invoke-virtual {v3}, Lru/mail/libverify/ipc/f$c;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "State should be defined before calling onConnectResult() callback"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    sget-object v2, Lru/mail/libverify/requests/k$c;->DELIVERED:Lru/mail/libverify/requests/k$c;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_0
    iget-object v2, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v2, v2, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v1, v1, Lru/mail/libverify/api/ad$4;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-static {v2, v3, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Ljava/util/List;Lru/mail/libverify/gcm/ServerNotificationMessage;)V

    if-nez v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v0, v0, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v1, v1, Lru/mail/libverify/api/ad$4;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->c(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)V

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v0, v0, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v1, v1, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_1
    sget-object v2, Lru/mail/libverify/requests/k$c;->IPC_ACCESS_ERROR:Lru/mail/libverify/requests/k$c;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-boolean v2, v2, Lru/mail/libverify/api/ad$4;->b:Z

    if-eqz v2, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v0, v0, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    iget-object v2, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-object v2, v2, Lru/mail/libverify/api/ad$4;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-static {v0, v2}, Lru/mail/libverify/api/ad;->b(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)Z

    move-result v0

    sget-object v2, Lru/mail/libverify/requests/k$c;->DELIVERED:Lru/mail/libverify/requests/k$c;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lru/mail/libverify/api/ad$4$1;->b:Lru/mail/libverify/api/ad$4;

    iget-boolean v2, v2, Lru/mail/libverify/api/ad$4;->d:Z

    if-eqz v2, :cond_0

    const-string/jumbo v2, "VerificationApi"

    const-string/jumbo v3, "failed to write sms"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lru/mail/libverify/requests/k$c;->SMS_ACCESS_ERROR:Lru/mail/libverify/requests/k$c;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
