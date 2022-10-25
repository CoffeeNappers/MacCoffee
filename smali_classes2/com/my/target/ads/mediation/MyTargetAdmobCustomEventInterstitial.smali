.class public Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;
.super Lcom/google/android/gms/ads/AdListener;
.source "MyTargetAdmobCustomEventInterstitial.java"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitial;


# static fields
.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"


# instance fields
.field private interstitial:Lcom/my/target/ads/InterstitialAd;

.field private final interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

.field private interstitialListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    .line 29
    new-instance v0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial$1;-><init>(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;)V

    iput-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;)Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitialListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;

    return-object v0
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitial:Lcom/my/target/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 127
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 133
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 139
    return-void
.end method

.method public requestInterstitialAd(Landroid/content/Context;Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;Ljava/lang/String;Lcom/google/android/gms/ads/mediation/MediationAdRequest;Landroid/os/Bundle;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 78
    iput-object p2, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitialListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;

    .line 83
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 84
    const-string/jumbo v1, "slotId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 94
    invoke-static {}, Lcom/my/target/ads/mediation/AdmobCustomParamsFactory;->getCustomParams()Lcom/my/target/ads/CustomParams;

    move-result-object v1

    .line 96
    if-eqz p4, :cond_0

    .line 98
    invoke-interface {p4}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getGender()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/my/target/ads/CustomParams;->setGender(I)V

    .line 99
    invoke-interface {p4}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v2

    .line 100
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    .line 102
    new-instance v3, Ljava/util/GregorianCalendar;

    invoke-direct {v3}, Ljava/util/GregorianCalendar;-><init>()V

    .line 103
    new-instance v4, Ljava/util/GregorianCalendar;

    invoke-direct {v4}, Ljava/util/GregorianCalendar;-><init>()V

    .line 105
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 106
    invoke-virtual {v4, v8}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    .line 107
    invoke-virtual {v3, v8}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v3

    sub-int/2addr v2, v3

    .line 108
    if-ltz v2, :cond_0

    invoke-virtual {v1, v2}, Lcom/my/target/ads/CustomParams;->setAge(I)V

    .line 112
    :cond_0
    new-instance v2, Lcom/my/target/ads/InterstitialAd;

    invoke-direct {v2, v0, p1, v1}, Lcom/my/target/ads/InterstitialAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    iput-object v2, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitial:Lcom/my/target/ads/InterstitialAd;

    .line 113
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitial:Lcom/my/target/ads/InterstitialAd;

    iget-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitialAdListener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    invoke-virtual {v0, v1}, Lcom/my/target/ads/InterstitialAd;->setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V

    .line 114
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitial:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->load()V

    .line 115
    :goto_0
    return-void

    .line 87
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Unable to get slotId from parameter json. Probably Admob mediation misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitialListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/mediation/customevent/CustomEventInterstitialListener;->onAdFailedToLoad(I)V

    goto :goto_0
.end method

.method public showInterstitial()V
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventInterstitial;->interstitial:Lcom/my/target/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/my/target/ads/InterstitialAd;->show()V

    .line 121
    return-void
.end method
