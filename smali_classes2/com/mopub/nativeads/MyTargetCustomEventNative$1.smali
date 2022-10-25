.class Lcom/mopub/nativeads/MyTargetCustomEventNative$1;
.super Ljava/lang/Object;
.source "MyTargetCustomEventNative.java"

# interfaces
.implements Lcom/my/target/nativeads/NativeAd$NativeAdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/nativeads/MyTargetCustomEventNative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;


# direct methods
.method constructor <init>(Lcom/mopub/nativeads/MyTargetCustomEventNative;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onClick(Lcom/my/target/core/facades/b;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {p0, p1}, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->onClick(Lcom/my/target/nativeads/NativeAd;)V

    return-void
.end method

.method public onClick(Lcom/my/target/nativeads/NativeAd;)V
    .locals 0

    .prologue
    .line 112
    return-void
.end method

.method public bridge synthetic onLoad(Lcom/my/target/core/facades/b;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {p0, p1}, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->onLoad(Lcom/my/target/nativeads/NativeAd;)V

    return-void
.end method

.method public onLoad(Lcom/my/target/nativeads/NativeAd;)V
    .locals 4

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$000(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/my/target/nativeads/NativeAd;

    move-result-object v0

    if-eq v0, p1, :cond_1

    .line 64
    const-string/jumbo v0, "Weird things happening"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 96
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    const-string/jumbo v0, "Received ad from myTarget, converting to MoPub ad"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$000(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/my/target/nativeads/NativeAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/NativeAd;->getBanner()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/nativeads/banners/NativePromoBanner;

    .line 71
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    new-instance v2, Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    iget-object v3, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v3}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$200(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$102(Lcom/mopub/nativeads/MyTargetCustomEventNative;Lcom/mopub/nativeads/MyTargetStaticNativeAd;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    .line 72
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setNativeAd(Lcom/my/target/nativeads/NativeAd;)V

    .line 73
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setTitle(Ljava/lang/String;)V

    .line 74
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCtaText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setCallToAction(Ljava/lang/String;)V

    .line 76
    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 78
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/my/target/nativeads/models/ImageData;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setIconImageUrl(Ljava/lang/String;)V

    .line 81
    :cond_2
    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 83
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/my/target/nativeads/models/ImageData;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setMainImageUrl(Ljava/lang/String;)V

    .line 86
    :cond_3
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getRating()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setStarRating(Ljava/lang/Double;)V

    .line 87
    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->setText(Ljava/lang/String;)V

    .line 90
    invoke-static {}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$300()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 91
    invoke-static {}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$300()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 93
    :cond_4
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$400(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$400(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v1}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$100(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/MyTargetStaticNativeAd;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;->onNativeAdLoaded(Lcom/mopub/nativeads/BaseNativeAd;)V

    goto/16 :goto_0
.end method

.method public bridge synthetic onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/b;)V
    .locals 0

    .prologue
    .line 58
    check-cast p2, Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {p0, p1, p2}, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->onNoAd(Ljava/lang/String;Lcom/my/target/nativeads/NativeAd;)V

    return-void
.end method

.method public onNoAd(Ljava/lang/String;Lcom/my/target/nativeads/NativeAd;)V
    .locals 2

    .prologue
    .line 101
    const-string/jumbo v0, "NativeAd: no ad, failing mediation"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-static {v0}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$400(Lcom/mopub/nativeads/MyTargetCustomEventNative;)Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;

    move-result-object v0

    sget-object v1, Lcom/mopub/nativeads/NativeErrorCode;->EMPTY_AD_RESPONSE:Lcom/mopub/nativeads/NativeErrorCode;

    invoke-interface {v0, v1}, Lcom/mopub/nativeads/CustomEventNative$CustomEventNativeListener;->onNativeAdFailed(Lcom/mopub/nativeads/NativeErrorCode;)V

    .line 104
    invoke-static {}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$300()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    invoke-static {}, Lcom/mopub/nativeads/MyTargetCustomEventNative;->access$300()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/nativeads/MyTargetCustomEventNative$1;->this$0:Lcom/mopub/nativeads/MyTargetCustomEventNative;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 106
    :cond_0
    return-void
.end method
