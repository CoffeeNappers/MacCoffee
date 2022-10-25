.class Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;
.super Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
.source "NavigationDelegateSlider.java"

# interfaces
.implements Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu",
        "<",
        "Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;",
        ">;",
        "Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isTopLevel"    # Z

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;-><init>(Landroid/app/Activity;Z)V

    .line 20
    return-void
.end method


# virtual methods
.method public closeMenu()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v0, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->closePane()Z

    .line 71
    :cond_0
    return-void
.end method

.method initializeLeftMenu(Landroid/view/View;)V
    .locals 7
    .param p1, "contentView"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 24
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->activity:Landroid/app/Activity;

    const v2, 0x7f030094

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    iput-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    .line 25
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->addView(Landroid/view/View;)V

    .line 27
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setFitsSystemWindows(Z)V

    .line 28
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    const/high16 v1, 0x43900000    # 288.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-direct {v0, v1, v4}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(II)V

    .line 29
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v1, v2, v5, v0}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 30
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .end local v0    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-direct {v0, v4, v4}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(II)V

    .line 31
    .restart local v0    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    const/high16 v1, 0x42a80000    # 84.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setPanelSlideListener(Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;)V

    .line 34
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setSliderFadeColor(I)V

    .line 35
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 36
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/high16 v2, 0x44000000    # 512.0f

    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 37
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/ui/widget/MenuListView;->setFitsSystemWindows(Z)V

    .line 38
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setClipToPadding(Z)V

    .line 39
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v1, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    const/16 v2, 0x500

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setSystemUiVisibility(I)V

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setExpansion(F)V

    .line 42
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;-><init>(Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 50
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$2;-><init>(Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 57
    return-void
.end method

.method public onPanelClosed(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->onMenuClosed()V

    .line 95
    return-void
.end method

.method public onPanelOpened(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->onMenuOpened()V

    .line 90
    return-void
.end method

.method public onPanelSlide(Landroid/view/View;F)V
    .locals 1
    .param p1, "panel"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setExpansion(F)V

    .line 85
    return-void
.end method

.method public openMenu()V
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v0, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->openPane()Z

    .line 64
    :cond_0
    return-void
.end method

.method public setStatusBarColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menu:Landroid/view/ViewGroup;

    check-cast v0, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/EdgeSlidingPaneLayout;->setStatusBarColor(I)V

    .line 78
    :cond_0
    return-void
.end method
