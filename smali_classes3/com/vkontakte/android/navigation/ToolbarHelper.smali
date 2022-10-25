.class public Lcom/vkontakte/android/navigation/ToolbarHelper;
.super Ljava/lang/Object;
.source "ToolbarHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static canGoBack(Landroid/app/Fragment;)Z
    .locals 1
    .param p0, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 31
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static hasNavigationDrawer(Landroid/app/Fragment;)Z
    .locals 1
    .param p0, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 27
    const/4 v0, 0x1

    return v0
.end method

.method public static onToolbarNavigationClick(Landroid/app/Fragment;)V
    .locals 3
    .param p0, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/vkontakte/android/navigation/ToolbarHelper;->canGoBack(Landroid/app/Fragment;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 36
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 37
    .local v0, "activity":Landroid/app/Activity;
    instance-of v2, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    if-eqz v2, :cond_0

    .line 38
    check-cast v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    .end local v0    # "activity":Landroid/app/Activity;
    invoke-interface {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v1

    .line 39
    .local v1, "delegate":Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    invoke-virtual {v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onNavigateUp()Z

    .line 44
    .end local v1    # "delegate":Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    :cond_0
    :goto_0
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method public static onViewCreated(Landroid/support/v7/widget/Toolbar;)V
    .locals 1
    .param p0, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 21
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 24
    :cond_0
    return-void
.end method
