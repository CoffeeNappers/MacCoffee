.class public Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;
.super Ljava/lang/Object;
.source "MyTargetAdmobCustomEventBanner.java"

# interfaces
.implements Lcom/google/android/gms/ads/mediation/customevent/CustomEventBanner;


# static fields
.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"

.field private static final customParams:Lcom/my/target/ads/CustomParams;


# instance fields
.field private bannerListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;

.field private myTargetView:Lcom/my/target/ads/MyTargetView;

.field private final myTargetViewListener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    invoke-static {}, Lcom/my/target/ads/mediation/AdmobCustomParamsFactory;->getCustomParams()Lcom/my/target/ads/CustomParams;

    move-result-object v0

    sput-object v0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->customParams:Lcom/my/target/ads/CustomParams;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner$1;-><init>(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;)V

    iput-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetViewListener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;)Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->bannerListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;

    return-object v0
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 122
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->destroy()V

    .line 125
    iput-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    .line 127
    :cond_0
    iput-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->bannerListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;

    .line 128
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 162
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 168
    return-void
.end method

.method public requestBannerAd(Landroid/content/Context;Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;Ljava/lang/String;Lcom/google/android/gms/ads/AdSize;Lcom/google/android/gms/ads/mediation/MediationAdRequest;Landroid/os/Bundle;)V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 71
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 72
    const-string/jumbo v1, "slotId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 81
    sget-object v1, Lcom/google/android/gms/ads/AdSize;->BANNER:Lcom/google/android/gms/ads/AdSize;

    invoke-virtual {v1, p4}, Lcom/google/android/gms/ads/AdSize;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 83
    iput-object p2, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->bannerListener:Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;

    .line 84
    iget-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    if-nez v1, :cond_1

    .line 86
    new-instance v1, Lcom/my/target/ads/MyTargetView;

    invoke-direct {v1, p1}, Lcom/my/target/ads/MyTargetView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    .line 88
    if-eqz p5, :cond_0

    .line 90
    sget-object v1, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->customParams:Lcom/my/target/ads/CustomParams;

    invoke-interface {p5}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getGender()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/my/target/ads/CustomParams;->setGender(I)V

    .line 92
    invoke-interface {p5}, Lcom/google/android/gms/ads/mediation/MediationAdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v1

    .line 93
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 95
    new-instance v2, Ljava/util/GregorianCalendar;

    invoke-direct {v2}, Ljava/util/GregorianCalendar;-><init>()V

    .line 96
    new-instance v3, Ljava/util/GregorianCalendar;

    invoke-direct {v3}, Ljava/util/GregorianCalendar;-><init>()V

    .line 98
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 99
    invoke-virtual {v3, v7}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v1

    .line 100
    invoke-virtual {v2, v7}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    sub-int/2addr v1, v2

    .line 101
    if-ltz v1, :cond_0

    sget-object v2, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->customParams:Lcom/my/target/ads/CustomParams;

    invoke-virtual {v2, v1}, Lcom/my/target/ads/CustomParams;->setAge(I)V

    .line 105
    :cond_0
    iget-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    sget-object v2, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->customParams:Lcom/my/target/ads/CustomParams;

    invoke-virtual {v1, v0, v6, v2, v6}, Lcom/my/target/ads/MyTargetView;->init(IILcom/my/target/ads/CustomParams;Z)V

    .line 109
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    iget-object v1, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetViewListener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    invoke-virtual {v0, v1}, Lcom/my/target/ads/MyTargetView;->setListener(Lcom/my/target/ads/MyTargetView$MyTargetViewListener;)V

    .line 111
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/mediation/MyTargetAdmobCustomEventBanner;->myTargetView:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->load()V

    .line 117
    :cond_2
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Unable to get slotId from parameter json. Probably Admob mediation misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 76
    if-eqz p2, :cond_2

    .line 77
    invoke-interface {p2, v6}, Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;->onAdFailedToLoad(I)V

    goto :goto_0

    .line 113
    :cond_3
    if-eqz p2, :cond_2

    .line 115
    invoke-interface {p2, v6}, Lcom/google/android/gms/ads/mediation/customevent/CustomEventBannerListener;->onAdFailedToLoad(I)V

    goto :goto_0
.end method
