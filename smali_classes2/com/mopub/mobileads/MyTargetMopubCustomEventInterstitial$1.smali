.class Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;
.super Ljava/lang/Object;
.source "MyTargetMopubCustomEventInterstitial.java"

# interfaces
.implements Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)V
    .locals 0

    .prologue
    .line 25
    iput-object p1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 46
    return-void
.end method

.method public onDismiss(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 52
    return-void
.end method

.method public onDisplay(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 64
    return-void
.end method

.method public onLoad(Lcom/my/target/ads/InterstitialAd;)V
    .locals 1

    .prologue
    .line 29
    const-string/jumbo v0, "Mediation interstitial ad loaded"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;

    invoke-static {v0}, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->access$000(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;

    invoke-static {v0}, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->access$000(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;->onInterstitialLoaded()V

    .line 32
    :cond_0
    return-void
.end method

.method public onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Mediation interstitial failed to load: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;

    invoke-static {v0}, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->access$000(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;

    invoke-static {v0}, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->access$000(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    move-result-object v0

    sget-object v1, Lcom/mopub/mobileads/MoPubErrorCode;->MRAID_LOAD_ERROR:Lcom/mopub/mobileads/MoPubErrorCode;

    invoke-interface {v0, v1}, Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;->onInterstitialFailed(Lcom/mopub/mobileads/MoPubErrorCode;)V

    .line 40
    :cond_0
    return-void
.end method

.method public onVideoCompleted(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 58
    return-void
.end method
