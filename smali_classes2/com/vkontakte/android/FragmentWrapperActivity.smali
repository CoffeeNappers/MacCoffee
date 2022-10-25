.class public Lcom/vkontakte/android/FragmentWrapperActivity;
.super Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;
.source "FragmentWrapperActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ResulterProvider;


# static fields
.field public static final DISABLE_DRAWER_LAYOUT_KEY:Ljava/lang/String; = "disable_drawer_layout"

.field public static final FULLSCREEN_KEY:Ljava/lang/String; = "fullscreen"

.field public static final ORIENTATION_KEY:Ljava/lang/String; = "orientation"


# instance fields
.field private mResulters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/ActivityResulter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;-><init>()V

    return-void
.end method

.method private setupMenu(Landroid/view/View;Z)V
    .locals 3
    .param p1, "content"    # Landroid/view/View;
    .param p2, "disableDrawerLayout"    # Z

    .prologue
    .line 93
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getIntro()I

    move-result v0

    .line 94
    .local v0, "intro":I
    and-int/lit8 v1, v0, 0x3

    if-lez v1, :cond_0

    .line 95
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/FragmentWrapperActivity;->setContentView(Landroid/view/View;)V

    .line 108
    :goto_0
    return-void

    .line 99
    :cond_0
    if-eqz p2, :cond_2

    .line 100
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, -0xc4a079

    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 103
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/FragmentWrapperActivity;->setContentView(Landroid/view/View;)V

    goto :goto_0

    .line 107
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->setContentView(Landroid/view/View;)V

    goto :goto_0
.end method


# virtual methods
.method protected initFragment()Landroid/app/Fragment;
    .locals 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ui/FragmentHelper;->extractFragment(Landroid/content/Intent;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/FragmentHelper;->extractArgs(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method protected isTopLevel()Z
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x0

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 143
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 145
    iget-object v1, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ActivityResulter;

    .line 146
    .local v0, "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/ActivityResulter;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 149
    .end local v0    # "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x400

    const/4 v6, 0x1

    .line 43
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "args"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 45
    .local v0, "bundle":Landroid/os/Bundle;
    const/4 v2, 0x0

    .line 47
    .local v2, "disableDrawerLayout":Z
    if-eqz v0, :cond_0

    const-string/jumbo v4, "disable_drawer_layout"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "disable_drawer_layout"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-ne v4, v6, :cond_0

    .line 48
    const/4 v2, 0x1

    .line 51
    :cond_0
    if-eqz v0, :cond_1

    const-string/jumbo v4, "fullscreen"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v4, "fullscreen"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 52
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/FragmentWrapperActivity;->requestWindowFeature(I)Z

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v7, v7}, Landroid/view/Window;->setFlags(II)V

    .line 57
    :cond_1
    if-eqz v0, :cond_2

    const-string/jumbo v4, "orientation"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 58
    const-string/jumbo v4, "orientation"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 59
    .local v3, "orientation":I
    packed-switch v3, :pswitch_data_0

    .line 69
    .end local v3    # "orientation":I
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    if-eqz v0, :cond_3

    const-string/jumbo v4, "theme"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 72
    const-string/jumbo v4, "theme"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/FragmentWrapperActivity;->setTheme(I)V

    .line 75
    :cond_3
    new-instance v1, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;-><init>(Landroid/content/Context;)V

    .line 76
    .local v1, "contentView":Landroid/widget/FrameLayout;
    const v4, 0x7f10002b

    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setId(I)V

    .line 77
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_4

    .line 78
    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setFitsSystemWindows(Z)V

    .line 80
    :cond_4
    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/FragmentWrapperActivity;->setupMenu(Landroid/view/View;Z)V

    .line 82
    if-nez p1, :cond_5

    .line 83
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->initFragment()Landroid/app/Fragment;

    .line 85
    :cond_5
    return-void

    .line 61
    .end local v1    # "contentView":Landroid/widget/FrameLayout;
    .restart local v3    # "orientation":I
    :pswitch_0
    const/16 v4, 0xb

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/FragmentWrapperActivity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 64
    :pswitch_1
    const/16 v4, 0xc

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/FragmentWrapperActivity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 128
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x102002c

    if-ne v2, v3, :cond_1

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f10002b

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    .line 130
    .local v0, "f":Landroid/app/Fragment;
    instance-of v2, v0, Lcom/vkontakte/android/fragments/HomeListener;

    if-eqz v2, :cond_0

    .line 131
    check-cast v0, Lcom/vkontakte/android/fragments/HomeListener;

    .end local v0    # "f":Landroid/app/Fragment;
    invoke-interface {v0}, Lcom/vkontakte/android/fragments/HomeListener;->onHomePressed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    :goto_0
    return v1

    .line 135
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/FragmentWrapperActivity;->onBackPressed()V

    goto :goto_0

    .line 138
    :cond_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 116
    invoke-super {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onPause()V

    .line 117
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 118
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 122
    invoke-super {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onResume()V

    .line 123
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 124
    return-void
.end method

.method public registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    return-void
.end method

.method public setTitle(I)V
    .locals 1
    .param p1, "res"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/FragmentWrapperActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/FragmentWrapperActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 112
    return-void
.end method

.method public unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/FragmentWrapperActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 164
    :cond_0
    return-void
.end method
