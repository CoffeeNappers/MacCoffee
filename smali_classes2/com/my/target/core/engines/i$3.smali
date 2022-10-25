.class final Lcom/my/target/core/engines/i$3;
.super Ljava/lang/Object;
.source "StandardAdEngine.java"

# interfaces
.implements Lcom/my/target/core/facades/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/i;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/i;)V
    .locals 0

    .prologue
    .line 493
    iput-object p1, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoad(Lcom/my/target/core/facades/h;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 497
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 499
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 500
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0, v1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)Lcom/my/target/core/facades/h;

    .line 501
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0, p1}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)V

    .line 503
    :cond_0
    return-void
.end method

.method public final onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/h;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 508
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-ne v0, p2, :cond_0

    .line 510
    invoke-virtual {p2, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 511
    iget-object v0, p0, Lcom/my/target/core/engines/i$3;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0, v1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)Lcom/my/target/core/facades/h;

    .line 513
    :cond_0
    return-void
.end method
