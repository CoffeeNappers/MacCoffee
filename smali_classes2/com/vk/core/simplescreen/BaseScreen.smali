.class public abstract Lcom/vk/core/simplescreen/BaseScreen;
.super Ljava/lang/Object;
.source "BaseScreen.java"


# instance fields
.field private final handler:Landroid/os/Handler;

.field private isDestroyed:Z

.field private isResumed:Z

.field private parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

.field private screenView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->handler:Landroid/os/Handler;

    .line 16
    iput-boolean v2, p0, Lcom/vk/core/simplescreen/BaseScreen;->isDestroyed:Z

    .line 17
    iput-boolean v2, p0, Lcom/vk/core/simplescreen/BaseScreen;->isResumed:Z

    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 134
    return-void
.end method

.method public abstract createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isDestroyed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    if-nez v0, :cond_1

    .line 55
    :cond_0
    :goto_0
    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/ScreenContainer;->closeLastScreen()V

    goto :goto_0
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    iget-object v0, v0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    .line 93
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getContainer()Lcom/vk/core/simplescreen/ScreenContainer;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/BaseScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getScreenView()Landroid/view/View;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    return-object v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 102
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/BaseScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 104
    :goto_0
    return-object v1

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, ""

    goto :goto_0
.end method

.method public getView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 24
    invoke-virtual {p0, p1}, Lcom/vk/core/simplescreen/BaseScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    .line 25
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    return-object v0
.end method

.method public isAdded()Z
    .locals 1

    .prologue
    .line 86
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/BaseScreen;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isDestroyed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDestroyed()Z
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isDestroyed:Z

    return v0
.end method

.method public isResumed()Z
    .locals 1

    .prologue
    .line 121
    iget-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isResumed:Z

    return v0
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public onDestroy()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isDestroyed:Z

    .line 61
    return-void
.end method

.method public onPause()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isResumed:Z

    .line 73
    return-void
.end method

.method public onResume()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->isResumed:Z

    .line 67
    return-void
.end method

.method public onTopPaddingChanged(I)V
    .locals 0
    .param p1, "topPadding"    # I

    .prologue
    .line 47
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 126
    return-void
.end method

.method public postDelayed(Ljava/lang/Runnable;J)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 130
    return-void
.end method

.method protected setParentLayout(Lcom/vk/core/simplescreen/ScreenContainer;)V
    .locals 2
    .param p1, "layout"    # Lcom/vk/core/simplescreen/ScreenContainer;

    .prologue
    .line 33
    iget-object v1, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    if-eq v1, p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    .line 35
    iget-object v1, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    if-eqz v1, :cond_1

    .line 36
    iget-object v1, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 37
    .local v0, "parent":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 38
    iget-object v1, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 40
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/core/simplescreen/BaseScreen;->screenView:Landroid/view/View;

    .line 43
    .end local v0    # "parent":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method

.method public showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V
    .locals 1
    .param p1, "fragment"    # Lcom/vk/core/simplescreen/BaseScreen;

    .prologue
    .line 80
    if-eqz p1, :cond_0

    .line 81
    iget-object v0, p0, Lcom/vk/core/simplescreen/BaseScreen;->parentLayout:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0, p1}, Lcom/vk/core/simplescreen/ScreenContainer;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 83
    :cond_0
    return-void
.end method
