.class public abstract Lcom/vk/music/fragment/FragmentDelegate;
.super Ljava/lang/Object;
.source "FragmentDelegate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract createView()Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method abstract destroy()V
.end method

.method abstract destroyView()V
.end method

.method pause()V
    .locals 0

    .prologue
    .line 18
    return-void
.end method

.method abstract restoreInstanceState(Landroid/os/Bundle;)V
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method resume()V
    .locals 0

    .prologue
    .line 16
    return-void
.end method

.method abstract saveInstanceState()Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
