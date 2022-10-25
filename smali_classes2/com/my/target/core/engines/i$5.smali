.class final Lcom/my/target/core/engines/i$5;
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
    .line 381
    iput-object p1, p0, Lcom/my/target/core/engines/i$5;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 2

    .prologue
    .line 385
    iget-object v0, p0, Lcom/my/target/core/engines/i$5;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->f(Lcom/my/target/core/engines/i;)Lcom/my/target/core/engines/i$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->d()V

    .line 386
    iget-object v0, p0, Lcom/my/target/core/engines/i$5;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i$5;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/i$5;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onLoad(Lcom/my/target/ads/MyTargetView;)V

    .line 387
    :cond_0
    return-void
.end method
