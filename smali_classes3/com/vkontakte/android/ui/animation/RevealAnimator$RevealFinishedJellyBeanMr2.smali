.class public Lcom/vkontakte/android/ui/animation/RevealAnimator$RevealFinishedJellyBeanMr2;
.super Lcom/vkontakte/android/ui/animation/RevealAnimator$RevealFinishedIceCreamSandwich;
.source "RevealAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/animation/RevealAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RevealFinishedJellyBeanMr2"
.end annotation


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/animation/RevealAnimator;)V
    .locals 1
    .param p1, "target"    # Lcom/vkontakte/android/ui/animation/RevealAnimator;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/animation/RevealAnimator$RevealFinishedIceCreamSandwich;-><init>(Lcom/vkontakte/android/ui/animation/RevealAnimator;)V

    .line 140
    const/4 v0, 0x2

    iput v0, p0, Lcom/vkontakte/android/ui/animation/RevealAnimator$RevealFinishedJellyBeanMr2;->mFeaturedLayerType:I

    .line 141
    return-void
.end method
