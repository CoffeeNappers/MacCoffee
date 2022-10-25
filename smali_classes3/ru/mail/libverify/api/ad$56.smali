.class final Lru/mail/libverify/api/ad$56;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->h(Ljava/lang/String;)V
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

    iput-object p1, p0, Lru/mail/libverify/api/ad$56;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$56;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const/4 v2, 0x1

    iget-object v0, p0, Lru/mail/libverify/api/ad$56;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->n(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/t;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$56;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/t;->b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "notification id %s doesn\'t exist"

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad$56;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/api/ad$56;->b:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->p(Lru/mail/libverify/api/ad;)Lru/mail/libverify/notifications/c;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Lru/mail/libverify/notifications/c;->a(Lru/mail/libverify/gcm/ServerNotificationMessage;Z)V

    goto :goto_0
.end method
