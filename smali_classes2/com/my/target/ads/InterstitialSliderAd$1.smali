.class Lcom/my/target/ads/InterstitialSliderAd$1;
.super Ljava/lang/Object;
.source "InterstitialSliderAd.java"

# interfaces
.implements Lcom/my/target/core/facades/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/ads/InterstitialSliderAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/my/target/ads/InterstitialSliderAd;


# direct methods
.method constructor <init>(Lcom/my/target/ads/InterstitialSliderAd;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onClick(Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 48
    :cond_0
    return-void
.end method

.method public onDismiss(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onDismiss(Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 55
    :cond_0
    return-void
.end method

.method public onDisplay(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onDisplay(Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 68
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/String;Lcom/my/target/core/facades/c;)V
    .locals 3

    .prologue
    .line 38
    const-string/jumbo v0, "InterstitialSliderAd has no banners"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 41
    :cond_0
    return-void
.end method

.method public onLoad(Lcom/my/target/core/facades/c;)V
    .locals 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-static {v0}, Lcom/my/target/ads/InterstitialSliderAd;->access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd$1;->this$0:Lcom/my/target/ads/InterstitialSliderAd;

    invoke-interface {v0, v1}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onLoad(Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 33
    :cond_0
    return-void
.end method

.method public onVideoCompleted(Lcom/my/target/core/facades/c;)V
    .locals 0

    .prologue
    .line 61
    return-void
.end method
