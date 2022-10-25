.class final Lru/mail/libverify/api/ad$12;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


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

    iput-object p1, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->c(Lru/mail/libverify/api/ad;)Lru/mail/libverify/requests/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/requests/b;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/a;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->e(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/e;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/e;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->g(Lru/mail/libverify/api/ad;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$12;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->h(Lru/mail/libverify/api/ad;)V

    return-void
.end method
