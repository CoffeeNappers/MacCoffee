.class Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;
.super Ljava/lang/Object;
.source "MyTargetMopubCustomEventRewardedVideo.java"

# interfaces
.implements Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RewardedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;


# direct methods
.method private constructor <init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$1;)V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;-><init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;)V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 50
    const-class v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v1, "myTarget"

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoClicked(Ljava/lang/Class;Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public onDismiss(Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 57
    const-class v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v1, "myTarget"

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoClosed(Ljava/lang/Class;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public onDisplay(Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 75
    const-class v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v1, "myTarget"

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoStarted(Ljava/lang/Class;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public onLoad(Lcom/my/target/ads/InterstitialAd;)V
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;->this$0:Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->access$102(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;Z)Z

    .line 34
    const-class v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v1, "myTarget"

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoLoadSuccess(Ljava/lang/Class;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V
    .locals 3

    .prologue
    .line 42
    const-class v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v1, "myTarget"

    sget-object v2, Lcom/mopub/mobileads/MoPubErrorCode;->NO_FILL:Lcom/mopub/mobileads/MoPubErrorCode;

    invoke-static {v0, v1, v2}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoLoadFailure(Ljava/lang/Class;Ljava/lang/String;Lcom/mopub/mobileads/MoPubErrorCode;)V

    .line 45
    return-void
.end method

.method public onVideoCompleted(Lcom/my/target/ads/InterstitialAd;)V
    .locals 3

    .prologue
    .line 64
    const-string/jumbo v0, ""

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mopub/common/MoPubReward;->success(Ljava/lang/String;I)Lcom/mopub/common/MoPubReward;

    move-result-object v0

    .line 66
    const-class v1, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;

    const-string/jumbo v2, "myTarget"

    .line 67
    invoke-static {v1, v2, v0}, Lcom/mopub/mobileads/MoPubRewardedVideoManager;->onRewardedVideoCompleted(Ljava/lang/Class;Ljava/lang/String;Lcom/mopub/common/MoPubReward;)V

    .line 70
    return-void
.end method
