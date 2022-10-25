.class final Lru/mail/libverify/api/ad$36;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->signOut(Z)V
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

    iput-object p1, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    iput-boolean p2, p0, Lru/mail/libverify/api/ad$36;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "signOut requested with dropAllInstances %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-boolean v3, p0, Lru/mail/libverify/api/ad$36;->a:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->G()Lru/mail/libverify/storage/k;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    invoke-static {v1, v4}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Z)V

    iget-boolean v1, p0, Lru/mail/libverify/api/ad$36;->a:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->k(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/statistics/b;->a()V

    return-void

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/api/ad$36;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/requests/o;->j(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    goto :goto_0
.end method
