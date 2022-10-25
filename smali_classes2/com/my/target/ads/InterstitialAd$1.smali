.class Lcom/my/target/ads/InterstitialAd$1;
.super Ljava/lang/Object;
.source "InterstitialAd.java"

# interfaces
.implements Lcom/my/target/core/facades/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/ads/InterstitialAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/my/target/ads/InterstitialAd;


# direct methods
.method constructor <init>(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 180
    iput-object p1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onClick(Lcom/my/target/ads/InterstitialAd;)V

    .line 202
    :cond_0
    return-void
.end method

.method public onDismiss(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onDismiss(Lcom/my/target/ads/InterstitialAd;)V

    .line 209
    :cond_0
    return-void
.end method

.method public onDisplay(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onDisplay(Lcom/my/target/ads/InterstitialAd;)V

    .line 223
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/String;Lcom/my/target/core/facades/c;)V
    .locals 3

    .prologue
    .line 192
    const-string/jumbo v0, "InterstitialAd has no banners"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V

    .line 195
    :cond_0
    return-void
.end method

.method public onLoad(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onLoad(Lcom/my/target/ads/InterstitialAd;)V

    .line 187
    :cond_0
    return-void
.end method

.method public onVideoCompleted(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialAd;->access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd$1;->this$0:Lcom/my/target/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onVideoCompleted(Lcom/my/target/ads/InterstitialAd;)V

    .line 216
    :cond_0
    return-void
.end method
