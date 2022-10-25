.class final Lru/mail/libverify/api/ad$28;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->a(Z)V
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

    iput-object p1, p0, Lru/mail/libverify/api/ad$28;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    invoke-static {}, Lru/mail/libverify/requests/e;->i()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$28;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->c(Lru/mail/libverify/api/ad;)Lru/mail/libverify/requests/b;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/requests/b;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$28;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/fetcher/d;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$28;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->g(Lru/mail/libverify/api/ad;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$28;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->r(Lru/mail/libverify/api/ad;)V

    return-void
.end method
