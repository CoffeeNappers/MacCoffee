.class Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;
.super Ljava/lang/Object;
.source "MyTargetAdmobCustomEventInterstitial.java"

# interfaces
.implements Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;


# direct methods
.method constructor <init>(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;)V
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;->this$0:Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 48
    return-void
.end method

.method public onDismiss(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 54
    return-void
.end method

.method public onDisplay(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 66
    return-void
.end method

.method public onLoad(Lcom/my/target/ads/InterstitialAd;)V
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;->this$0:Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;

    invoke-static {v0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->access$000(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;)Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;->onAdLoaded()V

    .line 36
    return-void
.end method

.method public onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;->this$0:Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;

    invoke-static {v0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->access$000(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;)Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;->onAdFailedToLoad(I)V

    .line 42
    return-void
.end method

.method public onVideoCompleted(Lcom/my/target/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 60
    return-void
.end method
