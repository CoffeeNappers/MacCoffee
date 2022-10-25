.class public Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;
.super Lcom/google/android/gms/ads/AdListener;
.source "MyTargetAdmobCustomEventRewarded.java"

# interfaces
.implements Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdAdapter;


# static fields
.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"


# instance fields
.field private interstitial:Lcom/my/target/ads/InterstitialAd;

.field private final interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

.field private mediationRewardedVideoAdListener:Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;

.field private final rewardItem:Lcom/google/android/gms/ads/reward/RewardItem;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    .line 26
    new-instance v0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded$1;-><init>(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;)V

    iput-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->rewardItem:Lcom/google/android/gms/ads/reward/RewardItem;

    .line 41
    new-instance v0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded$2;

    invoke-direct {v0, p0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded$2;-><init>(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;)V

    iput-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;)Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->mediationRewardedVideoAdListener:Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;)Lcom/google/android/gms/ads/reward/RewardItem;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->rewardItem:Lcom/google/android/gms/ads/reward/RewardItem;

    return-object v0
.end method


# virtual methods
.method public initialize(Landroid/content/Context;Lcom/google/android/gms/ads/mediation/MediationAdRequest;Ljava/lang/String;Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 116
    iput-object p4, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->mediationRewardedVideoAdListener:Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;

    .line 121
    :try_start_0
    const-string/jumbo v0, "parameter"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 124
    const-string/jumbo v0, "slotId"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 136
    invoke-static {}, Lcom/my/target/ads/mediation/AdmobCustomParamsFactory;->getCustomParams()Lcom/my/target/ads/CustomParams;

    move-result-object v1

    .line 138
    if-eqz p2, :cond_0

    .line 140
    invoke-interface {p2}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getGender()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/my/target/ads/CustomParams;->setGender(I)V

    .line 141
    invoke-interface {p2}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v2

    .line 142
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    .line 144
    new-instance v3, Ljava/util/GregorianCalendar;

    invoke-direct {v3}, Ljava/util/GregorianCalendar;-><init>()V

    .line 145
    new-instance v4, Ljava/util/GregorianCalendar;

    invoke-direct {v4}, Ljava/util/GregorianCalendar;-><init>()V

    .line 147
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 148
    invoke-virtual {v4, v8}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    .line 149
    invoke-virtual {v3, v8}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v3

    sub-int/2addr v2, v3

    .line 150
    if-ltz v2, :cond_0

    invoke-virtual {v1, v2}, Lcom/my/target/ads/CustomParams;->setAge(I)V

    .line 154
    :cond_0
    new-instance v2, Lcom/my/target/ads/InterstitialAd;

    invoke-direct {v2, v0, p1, v1}, Lcom/my/target/ads/InterstitialAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    iput-object v2, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    .line 155
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    iget-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 157
    invoke-interface {p4, p0}, Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;->onInitializationSucceeded(Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdAdapter;)V

    .line 158
    :goto_0
    return-void

    .line 127
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Unable to get slotId from parameter json. Probably Admob mediation misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 130
    const/4 v0, 0x0

    invoke-interface {p4, p0, v0}, Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdListener;->onAdFailedToLoad(Lcom/google/android/gms/ads/reward/mediation/MediationRewardedVideoAdAdapter;I)V

    goto :goto_0
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadAd(Lcom/google/android/gms/ads/mediation/MediationAdRequest;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->load()V

    .line 164
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 95
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 100
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 106
    return-void
.end method

.method public showVideo()V
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventRewarded;->interstitial:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->show()V

    .line 170
    return-void
.end method
