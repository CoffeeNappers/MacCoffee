.class final Lru/mail/libverify/api/ad$55;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->b(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Z)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$55;->b:Lru/mail/libverify/api/ad;

    iput-boolean p2, p0, Lru/mail/libverify/api/ad$55;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad$55;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/w;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher state change blocked by active sessions"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-boolean v0, p0, Lru/mail/libverify/api/ad$55;->a:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$55;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->c()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$55;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->b()V

    goto :goto_0
.end method
