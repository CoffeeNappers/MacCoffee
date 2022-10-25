.class final Lcom/my/target/core/engines/i$10;
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
    .line 457
    iput-object p1, p0, Lcom/my/target/core/engines/i$10;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 2

    .prologue
    .line 462
    check-cast p1, Lcom/my/target/core/communication/js/events/c;

    .line 463
    iget-object v0, p0, Lcom/my/target/core/engines/i$10;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {p1}, Lcom/my/target/core/communication/js/events/c;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Ljava/lang/String;)V

    .line 464
    iget-object v0, p0, Lcom/my/target/core/engines/i$10;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i$10;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/i$10;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onClick(Lcom/my/target/ads/MyTargetView;)V

    .line 465
    :cond_0
    return-void
.end method
