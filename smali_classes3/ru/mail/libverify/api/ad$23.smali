.class final Lru/mail/libverify/api/ad$23;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/s;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
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

    iput-object p1, p0, Lru/mail/libverify/api/ad$23;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$23;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final a(Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 3
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$23;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-interface {v0, p1, v1, v2}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    return-void
.end method

.method public final b()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$23;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->z()Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method public final b(Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    .locals 1
    .param p1    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$23;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;)V

    return-void
.end method
