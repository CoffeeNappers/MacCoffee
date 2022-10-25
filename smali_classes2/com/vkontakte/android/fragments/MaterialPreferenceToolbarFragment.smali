.class public Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;
.super Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
.source "MaterialPreferenceToolbarFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->getTitleRes()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitleRes()I
    .locals 1

    .prologue
    .line 38
    const v0, 0x7f0800d0

    return v0
.end method

.method synthetic lambda$onCreateView$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->onToolbarNavigationClick()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 16
    .local v1, "view":Landroid/view/View;
    const v4, 0x7f03002f

    const/4 v5, 0x0

    invoke-virtual {p1, v4, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 17
    .local v3, "wrapView":Landroid/view/View;
    const v4, 0x7f1001b1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 18
    .local v2, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    const v4, 0x7f1001b0

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 21
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 22
    const v4, 0x7f02014f

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 23
    invoke-static {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    invoke-static {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/MaterialPreferenceToolbarFragment;)Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/Toolbar;->setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V

    .line 25
    invoke-static {v0}, Lcom/vkontakte/android/navigation/ToolbarHelper;->onViewCreated(Landroid/support/v7/widget/Toolbar;)V

    .line 26
    return-object v3
.end method

.method public onToolbarNavigationClick()V
    .locals 0

    .prologue
    .line 30
    invoke-static {p0}, Lcom/vkontakte/android/navigation/ToolbarHelper;->onToolbarNavigationClick(Landroid/app/Fragment;)V

    .line 31
    return-void
.end method
