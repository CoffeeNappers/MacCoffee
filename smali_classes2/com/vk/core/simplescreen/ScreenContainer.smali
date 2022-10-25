.class public Lcom/vk/core/simplescreen/ScreenContainer;
.super Landroid/widget/FrameLayout;
.source "ScreenContainer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;
    }
.end annotation


# instance fields
.field private onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

.field protected parentActivity:Landroid/app/Activity;

.field private final screensStack:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/core/simplescreen/BaseScreen;",
            ">;"
        }
    .end annotation
.end field

.field private topPadding:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    .line 24
    invoke-direct {p0, p1}, Lcom/vk/core/simplescreen/ScreenContainer;->init(Landroid/content/Context;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    .line 29
    invoke-direct {p0, p1}, Lcom/vk/core/simplescreen/ScreenContainer;->init(Landroid/content/Context;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    .line 34
    invoke-direct {p0, p1}, Lcom/vk/core/simplescreen/ScreenContainer;->init(Landroid/content/Context;)V

    .line 35
    return-void
.end method

.method private hideAll()V
    .locals 3

    .prologue
    .line 157
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 158
    invoke-virtual {p0, v0}, Lcom/vk/core/simplescreen/ScreenContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 157
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 160
    :cond_0
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    .line 39
    return-void
.end method

.method private pauseScreen(Lcom/vk/core/simplescreen/BaseScreen;)V
    .locals 2
    .param p1, "screen"    # Lcom/vk/core/simplescreen/BaseScreen;

    .prologue
    .line 163
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 164
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 168
    :cond_0
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->onPause()V

    .line 169
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 170
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 173
    :cond_1
    return-void
.end method

.method private removeScreenFromStack(Lcom/vk/core/simplescreen/BaseScreen;)V
    .locals 2
    .param p1, "screen"    # Lcom/vk/core/simplescreen/BaseScreen;

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lcom/vk/core/simplescreen/ScreenContainer;->pauseScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 140
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 143
    :cond_0
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->onDestroy()V

    .line 144
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/core/simplescreen/BaseScreen;->setParentLayout(Lcom/vk/core/simplescreen/ScreenContainer;)V

    .line 145
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 146
    return-void
.end method


# virtual methods
.method public closeLastScreen()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 113
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 114
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/core/simplescreen/BaseScreen;

    invoke-direct {p0, v1}, Lcom/vk/core/simplescreen/ScreenContainer;->removeScreenFromStack(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 115
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/simplescreen/BaseScreen;

    .line 118
    .local v0, "screen":Lcom/vk/core/simplescreen/BaseScreen;
    invoke-direct {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->hideAll()V

    .line 119
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p0, :cond_2

    .line 120
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 128
    :goto_0
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->onResume()V

    .line 131
    .end local v0    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :cond_0
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 132
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    if-eqz v1, :cond_1

    .line 133
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    invoke-interface {v1}, Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;->onDismiss()V

    .line 136
    :cond_1
    return-void

    .line 122
    .restart local v0    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :cond_2
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 123
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 125
    :cond_3
    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/simplescreen/BaseScreen;->getView(Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/simplescreen/ScreenContainer;->addView(Landroid/view/View;)V

    .line 126
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->getScreenView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;
    .locals 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/simplescreen/BaseScreen;

    .line 152
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 76
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/simplescreen/BaseScreen;->onBackPressed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 77
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->closeLastScreen()V

    .line 85
    :cond_0
    :goto_0
    return v0

    .line 79
    :cond_1
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v1

    if-nez v1, :cond_0

    .line 82
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    if-eqz v0, :cond_2

    .line 83
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    invoke-interface {v0}, Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;->onDismiss()V

    .line 85
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 69
    :goto_0
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/simplescreen/BaseScreen;

    invoke-direct {p0, v0}, Lcom/vk/core/simplescreen/ScreenContainer;->removeScreenFromStack(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_0

    .line 72
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    .line 73
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v0

    .line 60
    .local v0, "currentScreen":Lcom/vk/core/simplescreen/BaseScreen;
    if-eqz v0, :cond_0

    .line 61
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->onPause()V

    .line 63
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v0

    .line 50
    .local v0, "currentScreen":Lcom/vk/core/simplescreen/BaseScreen;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->isResumed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 51
    invoke-virtual {v0}, Lcom/vk/core/simplescreen/BaseScreen;->onResume()V

    .line 53
    :cond_0
    return-void
.end method

.method public onTopPaddingChanged(I)V
    .locals 1
    .param p1, "topPadding"    # I

    .prologue
    .line 90
    iput p1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->topPadding:I

    .line 91
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/core/simplescreen/BaseScreen;->onTopPaddingChanged(I)V

    .line 94
    :cond_0
    return-void
.end method

.method public setOnDismissListener(Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;)V
    .locals 0
    .param p1, "onDismissListener"    # Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vk/core/simplescreen/ScreenContainer;->onDismissListener:Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;

    .line 43
    return-void
.end method

.method public showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V
    .locals 1
    .param p1, "screen"    # Lcom/vk/core/simplescreen/BaseScreen;

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/vk/core/simplescreen/ScreenContainer;->getCurrentScreen()Lcom/vk/core/simplescreen/BaseScreen;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/core/simplescreen/ScreenContainer;->pauseScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 104
    invoke-virtual {p1, p0}, Lcom/vk/core/simplescreen/BaseScreen;->setParentLayout(Lcom/vk/core/simplescreen/ScreenContainer;)V

    .line 105
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->parentActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/core/simplescreen/BaseScreen;->getView(Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/simplescreen/ScreenContainer;->addView(Landroid/view/View;)V

    .line 106
    invoke-virtual {p1}, Lcom/vk/core/simplescreen/BaseScreen;->onResume()V

    .line 107
    iget v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->topPadding:I

    invoke-virtual {p1, v0}, Lcom/vk/core/simplescreen/BaseScreen;->onTopPaddingChanged(I)V

    .line 109
    iget-object v0, p0, Lcom/vk/core/simplescreen/ScreenContainer;->screensStack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    return-void
.end method
