.class public Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;
.super Lcom/mopub/mobileads/CustomEventRewardedVideo;
.source "MyTargetMopubCustomEventRewardedVideo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;
    }
.end annotation


# static fields
.field public static final NETWORK_ID:Ljava/lang/String; = "myTarget"

.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"


# instance fields
.field private ad:Lcom/my/target/ads/InterstitialAd;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private loaded:Z

.field private mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mopub/mobileads/CustomEventRewardedVideo;-><init>()V

    .line 24
    new-instance v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$RewardedListener;-><init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo$1;)V

    iput-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    return-void
.end method

.method static synthetic access$102(Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;Z)Z
    .locals 0

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->loaded:Z

    return p1
.end method


# virtual methods
.method protected checkAndInitializeSdk(Landroid/app/Activity;Ljava/util/Map;Ljava/util/Map;)Z
    .locals 3
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 116
    invoke-static {p2}, Lcom/mopub/MopubCustomParamsFactory;->getCustomParams(Ljava/util/Map;)Lcom/my/target/ads/CustomParams;

    move-result-object v2

    .line 119
    invoke-interface {p3}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "slotId"

    invoke-interface {p3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 121
    :cond_0
    const-string/jumbo v0, "Unable to get slotId from parameter json. Probably Admob mediation misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    move v0, v1

    .line 138
    :goto_0
    return v0

    .line 129
    :cond_1
    :try_start_0
    const-string/jumbo v0, "slotId"

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 136
    new-instance v1, Lcom/my/target/ads/InterstitialAd;

    invoke-direct {v1, v0, p1, v2}, Lcom/my/target/ads/InterstitialAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    iput-object v1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    .line 137
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    iget-object v1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 138
    const/4 v0, 0x1

    goto :goto_0

    .line 132
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Wrong slotId"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    move v0, v1

    .line 133
    goto :goto_0
.end method

.method protected getAdNetworkId()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 98
    const-string/jumbo v0, "myTarget"

    return-object v0
.end method

.method protected getLifecycleListener()Lcom/mopub/common/LifecycleListener;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 91
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getVideoListenerForSdk()Lcom/mopub/mobileads/CustomEventRewardedVideo$CustomEventRewardedVideoListener;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 84
    const/4 v0, 0x0

    return-object v0
.end method

.method protected hasVideoAvailable()Z
    .locals 1

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->loaded:Z

    return v0
.end method

.method protected loadWithSdkInitialized(Landroid/app/Activity;Ljava/util/Map;Ljava/util/Map;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 147
    const-string/jumbo v0, "Loading mopub mediation rewarded"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->load()V

    .line 152
    :cond_0
    return-void
.end method

.method protected onInvalidate()V
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 108
    :cond_0
    return-void
.end method

.method protected showVideo()V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventRewardedVideo;->ad:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->show()V

    .line 167
    :cond_0
    return-void
.end method
