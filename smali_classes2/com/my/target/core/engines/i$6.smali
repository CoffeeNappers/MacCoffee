.class final Lcom/my/target/core/engines/i$6;
.super Ljava/lang/Object;
.source "StandardAdEngine.java"

# interfaces
.implements Lcom/my/target/core/communication/js/b;


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
    .line 391
    iput-object p1, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 6

    .prologue
    .line 395
    move-object v0, p1

    check-cast v0, Lcom/my/target/core/communication/js/events/e;

    .line 396
    const-string/jumbo v1, "JS error"

    .line 397
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/my/target/core/communication/js/events/e;->b()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/my/target/core/communication/js/events/e;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 398
    :goto_0
    const-string/jumbo v4, ""

    .line 399
    iget-object v1, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/facades/h;->g()Ljava/lang/String;

    move-result-object v4

    .line 400
    :cond_0
    invoke-interface {p1}, Lcom/my/target/core/communication/js/events/f;->a()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "onError"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 402
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x28

    const-string/jumbo v3, "JSError"

    iget-object v5, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    iget-object v5, v5, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 403
    iget-object v0, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 405
    iget-object v0, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->f(Lcom/my/target/core/engines/i;)Lcom/my/target/core/engines/i$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->c()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "JS error"

    iget-object v2, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v2}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    .line 412
    :cond_1
    :goto_1
    return-void

    .line 406
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "JS init error"

    iget-object v2, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    invoke-static {v2}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    goto :goto_1

    .line 410
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1e

    const-string/jumbo v3, "JSError"

    iget-object v5, p0, Lcom/my/target/core/engines/i$6;->a:Lcom/my/target/core/engines/i;

    iget-object v5, v5, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_1

    :cond_4
    move-object v0, v1

    goto/16 :goto_0
.end method
