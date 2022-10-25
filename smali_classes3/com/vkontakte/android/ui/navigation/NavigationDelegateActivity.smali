.class public abstract Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "NavigationDelegateActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;


# instance fields
.field private navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method

.method private createNavigationDelegate(Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    .locals 2
    .param p1, "act"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;

    .prologue
    .line 20
    invoke-static {p1}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21
    new-instance v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->isTopLevel()Z

    move-result v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;-><init>(Landroid/app/Activity;Z)V

    .line 23
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->isTopLevel()Z

    move-result v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;-><init>(Landroid/app/Activity;Z)V

    goto :goto_0
.end method


# virtual methods
.method public getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 3

    .prologue
    .line 58
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 59
    .local v1, "resOrigin":Landroid/content/res/Resources;
    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    if-nez v2, :cond_0

    const/4 v0, 0x0

    .line 60
    .local v0, "res":Landroid/content/res/Resources;
    :goto_0
    if-nez v0, :cond_1

    .end local v1    # "resOrigin":Landroid/content/res/Resources;
    :goto_1
    return-object v1

    .line 59
    .end local v0    # "res":Landroid/content/res/Resources;
    .restart local v1    # "resOrigin":Landroid/content/res/Resources;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->getResources(Landroid/content/res/Resources;)Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_0

    .restart local v0    # "res":Landroid/content/res/Resources;
    :cond_1
    move-object v1, v0

    .line 60
    goto :goto_1
.end method

.method protected abstract isTopLevel()Z
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 65
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onBackPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const v2, 0x7f10002b

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    .line 69
    .local v0, "f":Landroid/app/Fragment;
    if-eqz v0, :cond_2

    instance-of v1, v0, Lcom/vkontakte/android/fragments/BackListener;

    if-eqz v1, :cond_2

    .line 70
    check-cast v0, Lcom/vkontakte/android/fragments/BackListener;

    .end local v0    # "f":Landroid/app/Fragment;
    invoke-interface {v0}, Lcom/vkontakte/android/fragments/BackListener;->onBackPressed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 74
    :cond_2
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 43
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 29
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    invoke-direct {p0, p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->createNavigationDelegate(Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    .line 31
    return-void
.end method

.method public onNavigateUp()Z
    .locals 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onNavigateUp()Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "m"    # Landroid/view/Menu;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 48
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onResume()V

    .line 37
    return-void
.end method

.method public updateUserInfo()V
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    instance-of v0, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->navigationDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    check-cast v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->updateUserInfo()V

    .line 81
    :cond_0
    return-void
.end method
