.class public Lcom/mopub/nativeads/MyTargetCustomEventNative;
.super Lcom/mopub/nativeads/CustomEventNative;
.source "MyTargetCustomEventNative.java"


# static fields
.field private static final SLOT_ID_KEY:Ljava/lang/String; = "slotId"

.field private static activeEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mopub/nativeads/MyTargetCustomEventNative;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private context:Landroid/content/Context;

.field private listener:Lcom/my/target/nativeads/NativeAd$NativeAdListener;

.field private loadedAdListener:Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

.field private mopubNativeAd:Lcom/mopub/nativeads/MyTargetStaticNativeAd;

.field private nativeAd:Lcom/my/target/nativeads/NativeAd;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->activeEvents:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mopub/nativeads/CustomEventNative;-><init>()V

    .line 57
    new-instance v0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;

    invoke-direct {v0, p0}, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;-><init>(Lcom/mopub/nativeads/MyTargetCustomEventNative;)V

    iput-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->listener:Lcom/my/target/nativeads/NativeAd$NativeAdListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/my/target/nativeads/NativeAd;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->mopubNativeAd:Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mopub/nativeads/MyTargetCustomEventNative;Lcom/mopub/nativeads/MyTargetStaticNativeAd;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->mopubNativeAd:Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/List;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->activeEvents:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->loadedAdListener:Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    return-object v0
.end method


# virtual methods
.method protected loadNativeAd(Landroid/content/Context;Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;",
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
    .line 31
    iput-object p2, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->loadedAdListener:Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    .line 32
    iput-object p1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->context:Landroid/content/Context;

    .line 36
    if-eqz p4, :cond_0

    const-string/jumbo v0, "slotId"

    invoke-interface {p4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const-string/jumbo v0, "slotId"

    invoke-interface {p4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 47
    invoke-static {p3}, Lcom/mopub/MopubCustomParamsFactory;->getCustomParams(Ljava/util/Map;)Lcom/my/target/ads/CustomParams;

    move-result-object v1

    .line 49
    sget-object v2, Lcom/mopub/nativeads/MyTargetCustomEventNative;->activeEvents:Ljava/util/List;

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v2, Lcom/my/target/nativeads/NativeAd;

    invoke-direct {v2, v0, p1, v1}, Lcom/my/target/nativeads/NativeAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    iput-object v2, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    .line 52
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/NativeAd;->setAutoLoadImages(Z)V

    .line 53
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->listener:Lcom/my/target/nativeads/NativeAd$NativeAdListener;

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/NativeAd;->setListener(Lcom/my/target/core/facades/b$a;)V

    .line 54
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {v0}, Lcom/my/target/nativeads/NativeAd;->load()V

    .line 55
    :goto_0
    return-void

    .line 42
    :cond_0
    const-string/jumbo v0, "Unable to get slotId. Probably MoPub custom network misconfiguration."

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative;->loadedAdListener:Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    sget-object v1, Lcom/mopub/nativeads/NativeErrorCode;->INVALID_RESPONSE:Lcom/mopub/nativeads/NativeErrorCode;

    invoke-interface {v0, v1}, Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;->onNativeAdFailed(Lcom/mopub/nativeads/NativeErrorCode;)V

    goto :goto_0
.end method
