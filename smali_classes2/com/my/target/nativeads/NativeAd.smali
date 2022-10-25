.class public Lcom/my/target/nativeads/NativeAd;
.super Lcom/my/target/core/facades/b;
.source "NativeAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/nativeads/NativeAd$NativeAdListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/my/target/core/facades/b",
        "<",
        "Lcom/my/target/nativeads/banners/NativePromoBanner;",
        ">;"
    }
.end annotation


# static fields
.field private static final supportedFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/my/target/nativeads/NativeAd$1;

    invoke-direct {v0}, Lcom/my/target/nativeads/NativeAd$1;-><init>()V

    sput-object v0, Lcom/my/target/nativeads/NativeAd;->supportedFormats:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;)V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/nativeads/NativeAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    .line 38
    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/my/target/nativeads/NativeAd;->supportedFormats:Ljava/util/List;

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/my/target/core/facades/b;-><init>(ILjava/util/List;Landroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    .line 43
    const-string/jumbo v0, "NativeAd created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public static loadImageToView(Lcom/my/target/nativeads/models/ImageData;Landroid/widget/ImageView;)V
    .locals 1

    .prologue
    .line 26
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 28
    :cond_0
    const-string/jumbo v0, "AbstractNativeAd: invalid or null arguments"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 33
    :goto_0
    return-void

    .line 32
    :cond_1
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/my/target/core/net/b;->a(Lcom/my/target/nativeads/models/ImageData;Landroid/widget/ImageView;)V

    goto :goto_0
.end method
