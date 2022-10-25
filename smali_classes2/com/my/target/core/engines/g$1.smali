.class final Lcom/my/target/core/engines/g$1;
.super Ljava/lang/Object;
.source "Native300x250Engine.java"

# interfaces
.implements Lcom/my/target/core/net/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/g;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/g;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoad()V
    .locals 3

    .prologue
    .line 32
    const-string/jumbo v0, "banner"

    iget-object v1, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v1}, Lcom/my/target/core/engines/g;->a(Lcom/my/target/core/engines/g;)Lcom/my/target/core/models/banners/j;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 34
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->a(Lcom/my/target/core/engines/g;)Lcom/my/target/core/models/banners/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    .line 35
    invoke-static {v0}, Lcom/my/target/core/engines/g;->a(Lcom/my/target/core/engines/g;)Lcom/my/target/core/models/banners/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_2

    .line 37
    :cond_0
    const-string/jumbo v0, "StandardAdEngine: unable to load picture in banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 39
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "Unable to load banner picture"

    iget-object v2, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    .line 40
    invoke-static {v2}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    .line 47
    :cond_1
    :goto_0
    return-void

    .line 44
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v1}, Lcom/my/target/core/engines/g;->b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onLoad(Lcom/my/target/ads/MyTargetView;)V

    .line 46
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/engines/g$1;->a:Lcom/my/target/core/engines/g;

    invoke-static {v0}, Lcom/my/target/core/engines/g;->c(Lcom/my/target/core/engines/g;)V

    goto :goto_0
.end method
