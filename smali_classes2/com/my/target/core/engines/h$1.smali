.class final Lcom/my/target/core/engines/h$1;
.super Ljava/lang/Object;
.source "Native320x50Engine.java"

# interfaces
.implements Lcom/my/target/core/net/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/h;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/my/target/core/engines/h$1;->a:Lcom/my/target/core/engines/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoad()V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/my/target/core/engines/h$1;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/engines/h;)Lcom/my/target/core/engines/h$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->e()V

    .line 65
    iget-object v0, p0, Lcom/my/target/core/engines/h$1;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->b(Lcom/my/target/core/engines/h;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/my/target/core/engines/h$1;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->b(Lcom/my/target/core/engines/h;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h$1;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->b(Lcom/my/target/core/engines/h;)Lcom/my/target/ads/MyTargetView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onLoad(Lcom/my/target/ads/MyTargetView;)V

    .line 69
    :cond_0
    return-void
.end method
