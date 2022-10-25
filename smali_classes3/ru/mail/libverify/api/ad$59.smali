.class final Lru/mail/libverify/api/ad$59;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/notifications/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->j()Lru/mail/libverify/notifications/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$59;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$59;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final a(Lru/mail/libverify/gcm/ServerNotificationMessage;I)V
    .locals 5
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$59;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "notification with id %s doesn\'t exist"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$59;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/gcm/ServerNotificationMessage;->a()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lru/mail/libverify/storage/l;->a(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public final b()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$59;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method
