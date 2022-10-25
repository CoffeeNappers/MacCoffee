.class public Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;
.super Lcom/mopub/mobileads/CustomEventInterstitial;
.source "MyTargetMopubCustomEventInterstitial.java"


# static fields
.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"


# instance fields
.field private ad:Lcom/my/target/ads/InterstitialAd;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mopubInterstitialListener:Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mopub/mobileads/CustomEventInterstitial;-><init>()V

    .line 24
    new-instance v0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;

    invoke-direct {v0, p0}, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial$1;-><init>(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)V

    iput-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;)Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->mopubInterstitialListener:Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    return-object v0
.end method


# virtual methods
.method protected loadInterstitial(Landroid/content/Context;Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;",
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

    .prologue
    .line 70
    iput-object p2, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->mopubInterstitialListener:Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;

    .line 71
    const-string/jumbo v0, "Loading mopub mediation interstitial"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 73
    invoke-static {p3}, Lcom/mopub/MopubCustomParamsFactory;->getCustomParams(Ljava/util/Map;)Lcom/my/target/ads/CustomParams;

    move-result-object v1

    .line 76
    invoke-interface {p4}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "slotId"

    invoke-interface {p4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 78
    :cond_0
    const-string/jumbo v0, "Unable to get slotId from parameter json. Probably Admob mediation misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 79
    sget-object v0, Lcom/mopub/mobileads/MoPubErrorCode;->UNSPECIFIED:Lcom/mopub/mobileads/MoPubErrorCode;

    invoke-interface {p2, v0}, Lcom/mopub/mobileads/CustomEventInterstitial$CustomEventInterstitialListener;->onInterstitialFailed(Lcom/mopub/mobileads/MoPubErrorCode;)V

    .line 88
    :goto_0
    return-void

    .line 83
    :cond_1
    const-string/jumbo v0, "slotId"

    invoke-interface {p4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 85
    new-instance v2, Lcom/my/target/ads/InterstitialAd;

    invoke-direct {v2, v0, p1, v1}, Lcom/my/target/ads/InterstitialAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    iput-object v2, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    .line 86
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    iget-object v1, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->mytargetInterstitialListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 87
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->load()V

    goto :goto_0
.end method

.method protected onInvalidate()V
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 108
    :cond_0
    return-void
.end method

.method protected showInterstitial()V
    .locals 1

    .prologue
    .line 94
    const-string/jumbo v0, "Showing mopub mediation interstitial"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/mopub/mobileads/MyTargetMopubCustomEventInterstitial;->ad:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->show()V

    .line 99
    :cond_0
    return-void
.end method
