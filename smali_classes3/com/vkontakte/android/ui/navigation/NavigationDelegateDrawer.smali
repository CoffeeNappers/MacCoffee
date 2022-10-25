.class Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;
.super Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
.source "NavigationDelegateDrawer.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu",
        "<",
        "Landroid/support/v4/widget/DrawerLayout;",
        ">;",
        "Landroid/support/v4/widget/DrawerLayout$DrawerListener;"
    }
.end annotation


# instance fields
.field private mStartDragging:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isTopLevel"    # Z

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;-><init>(Landroid/app/Activity;Z)V

    .line 27
    return-void
.end method

.method private hideKeyboard()V
    .locals 4

    .prologue
    .line 110
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 111
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 112
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 113
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    .line 115
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.andoroid.HIDE_EMOJI_POPUP"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 116
    return-void
.end method


# virtual methods
.method public closeMenu()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    .line 57
    :cond_0
    return-void
.end method

.method initializeLeftMenu(Landroid/view/View;)V
    .locals 6
    .param p1, "contentView"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x3

    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    const v1, 0x7f030093

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;)V

    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    const v1, 0x7f02031b

    invoke-virtual {v0, v1, v5}, Landroid/support/v4/widget/DrawerLayout;->setDrawerShadow(II)V

    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x44000000    # 512.0f

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    const v2, 0x7f0100cb

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->fetchSystemColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setStatusBarBackgroundColor(I)V

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->setFitsSystemWindows(Z)V

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    new-instance v2, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-object v3, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->getRecommendedWidth(Landroid/content/Context;)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4, v5}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 43
    return-void
.end method

.method public onDrawerClosed(Landroid/view/View;)V
    .locals 0
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->onMenuClosed()V

    .line 89
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 0
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->onMenuOpened()V

    .line 84
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .locals 1
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "offset"    # F

    .prologue
    .line 70
    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p2, v0

    if-nez v0, :cond_2

    .line 71
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->mStartDragging:Z

    .line 79
    :cond_1
    :goto_0
    return-void

    .line 74
    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->mStartDragging:Z

    if-nez v0, :cond_1

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->mStartDragging:Z

    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->hideKeyboard()V

    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->prepare()V

    goto :goto_0
.end method

.method public onDrawerStateChanged(I)V
    .locals 0
    .param p1, "newState"    # I

    .prologue
    .line 93
    return-void
.end method

.method onMenuClosed()V
    .locals 1

    .prologue
    .line 103
    invoke-super {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->onMenuClosed()V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;)V

    .line 105
    return-void
.end method

.method onMenuOpened()V
    .locals 1

    .prologue
    .line 97
    invoke-super {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->onMenuOpened()V

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;)V

    .line 99
    return-void
.end method

.method public openMenu()V
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    .line 50
    :cond_0
    return-void
.end method

.method public setStatusBarColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateDrawer;->menu:Landroid/view/ViewGroup;

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/DrawerLayout;->setStatusBarBackgroundColor(I)V

    .line 64
    :cond_0
    return-void
.end method
