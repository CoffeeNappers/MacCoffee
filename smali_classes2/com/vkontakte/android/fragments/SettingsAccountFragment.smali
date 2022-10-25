.class public Lcom/vkontakte/android/fragments/SettingsAccountFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "SettingsAccountFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/SettingsAccountFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->showContent()V

    return-void
.end method


# virtual methods
.method public doLoadData()V
    .locals 2

    .prologue
    .line 61
    new-instance v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings;

    invoke-direct {v0}, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;-><init>(Lcom/vkontakte/android/fragments/SettingsAccountFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 72
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 23
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 24
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->loadData()V

    .line 25
    const v0, 0x7f08060b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->setTitle(I)V

    .line 26
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 31
    .local v0, "content":Landroid/view/View;
    const v1, 0x7f10003c

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 32
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 39
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f1001b0

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 40
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    const v2, 0x7f02014f

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 41
    invoke-static {v0}, Lcom/vkontakte/android/navigation/ToolbarHelper;->onViewCreated(Landroid/support/v7/widget/Toolbar;)V

    .line 42
    return-object v1
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->loadData()V

    .line 57
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    goto :goto_0
.end method
