.class public Lcom/mopub/nativeads/MyTargetStaticNativeAd;
.super Lcom/mopub/nativeads/StaticNativeAd;
.source "MyTargetStaticNativeAd.java"


# instance fields
.field private final impressionTracker:Lcom/mopub/nativeads/ImpressionTracker;

.field private nativeAd:Lcom/my/target/nativeads/NativeAd;

.field private final nativeClickHandler:Lcom/mopub/nativeads/NativeClickHandler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mopub/nativeads/StaticNativeAd;-><init>()V

    .line 17
    new-instance v0, Lcom/mopub/nativeads/NativeClickHandler;

    invoke-direct {v0, p1}, Lcom/mopub/nativeads/NativeClickHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeClickHandler:Lcom/mopub/nativeads/NativeClickHandler;

    .line 18
    new-instance v0, Lcom/mopub/nativeads/ImpressionTracker;

    invoke-direct {v0, p1}, Lcom/mopub/nativeads/ImpressionTracker;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->impressionTracker:Lcom/mopub/nativeads/ImpressionTracker;

    .line 19
    return-void
.end method


# virtual methods
.method public clear(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 47
    if-nez p1, :cond_0

    .line 51
    :goto_0
    return-void

    .line 48
    :cond_0
    invoke-super {p0, p1}, Lcom/mopub/nativeads/StaticNativeAd;->clear(Landroid/view/View;)V

    .line 49
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeClickHandler:Lcom/mopub/nativeads/NativeClickHandler;

    invoke-virtual {v0, p1}, Lcom/mopub/nativeads/NativeClickHandler;->clearOnClickListener(Landroid/view/View;)V

    .line 50
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->impressionTracker:Lcom/mopub/nativeads/ImpressionTracker;

    invoke-virtual {v0}, Lcom/mopub/nativeads/ImpressionTracker;->clear()V

    goto :goto_0
.end method

.method public handleClick(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {v0}, Lcom/my/target/nativeads/NativeAd;->handleClick()V

    .line 42
    :cond_0
    return-void
.end method

.method public prepare(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 24
    if-nez p1, :cond_0

    .line 28
    :goto_0
    return-void

    .line 25
    :cond_0
    invoke-super {p0, p1}, Lcom/mopub/nativeads/StaticNativeAd;->prepare(Landroid/view/View;)V

    .line 26
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeClickHandler:Lcom/mopub/nativeads/NativeClickHandler;

    invoke-virtual {v0, p1, p0}, Lcom/mopub/nativeads/NativeClickHandler;->setOnClickListener(Landroid/view/View;Lcom/mopub/nativeads/ClickInterface;)V

    .line 27
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->impressionTracker:Lcom/mopub/nativeads/ImpressionTracker;

    invoke-virtual {v0, p1, p0}, Lcom/mopub/nativeads/ImpressionTracker;->addView(Landroid/view/View;Lcom/mopub/nativeads/ImpressionInterface;)V

    goto :goto_0
.end method

.method public recordImpression(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    invoke-virtual {v0}, Lcom/my/target/nativeads/NativeAd;->handleShow()V

    .line 35
    :cond_0
    return-void
.end method

.method public setNativeAd(Lcom/my/target/nativeads/NativeAd;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/mopub/nativeads/MyTargetStaticNativeAd;->nativeAd:Lcom/my/target/nativeads/NativeAd;

    .line 56
    return-void
.end method
