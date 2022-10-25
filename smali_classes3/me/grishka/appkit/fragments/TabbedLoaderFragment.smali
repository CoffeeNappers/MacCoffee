.class public abstract Lme/grishka/appkit/fragments/TabbedLoaderFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "TabbedLoaderFragment.java"

# interfaces
.implements Lme/grishka/appkit/fragments/TabbedScreen;


# instance fields
.field private delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 24
    new-instance v0, Lme/grishka/appkit/fragments/TabbedLoaderFragment$1;

    invoke-direct {v0, p0, p0}, Lme/grishka/appkit/fragments/TabbedLoaderFragment$1;-><init>(Lme/grishka/appkit/fragments/TabbedLoaderFragment;Lme/grishka/appkit/fragments/ContainerFragment;)V

    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    return-void
.end method


# virtual methods
.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 114
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 115
    return-void
.end method

.method public addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "tab"    # Landroid/app/Fragment;
    .param p3, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 99
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V

    .line 100
    return-void
.end method

.method public createAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->createAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    return-object v0
.end method

.method public createPagerAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPagerCurrentItem()I
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getPagerCurrentItem()I

    move-result v0

    return v0
.end method

.method public getTabAt(I)Landroid/app/Fragment;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getTabAt(I)Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public getTabView()Landroid/view/View;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getTabView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getTabsCount()I
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getTabsCount()I

    move-result v0

    return v0
.end method

.method public invalidateTabTitles()V
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->invalidateTabTitles()V

    .line 95
    return-void
.end method

.method public isSwipeEnabled()Z
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->isSwipeEnabled()Z

    move-result v0

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 53
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->setHasOptionsMenu(Z)V

    .line 54
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 58
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->createView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 157
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 158
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 159
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 63
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 64
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->destroyView()V

    .line 65
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 163
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPageSelected(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 44
    return-void
.end method

.method public removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 119
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 120
    return-void
.end method

.method public removeTab(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->removeTab(I)V

    .line 105
    return-void
.end method

.method public removeTab(Landroid/app/Fragment;)V
    .locals 1
    .param p1, "tab"    # Landroid/app/Fragment;

    .prologue
    .line 109
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->removeTab(Landroid/app/Fragment;)V

    .line 110
    return-void
.end method

.method public setPagerCurrentItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 129
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setPagerCurrentItem(I)V

    .line 130
    return-void
.end method

.method public setPagerCurrentItem(IZ)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "scroll"    # Z

    .prologue
    .line 134
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setPagerCurrentItem(IZ)V

    .line 135
    return-void
.end method

.method public setSwipeEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 74
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setSwipeEnabled(Z)V

    .line 75
    return-void
.end method

.method public setTabTitle(ILjava/lang/CharSequence;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 89
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 90
    return-void
.end method

.method public setTabs(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "fragments":Ljava/util/List;, "Ljava/util/List<+Landroid/app/Fragment;>;"
    .local p2, "titles":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/CharSequence;>;"
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 80
    return-void
.end method

.method public setTabsAutoLoad(Z)V
    .locals 1
    .param p1, "autoLoad"    # Z

    .prologue
    .line 178
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabsAutoLoad(Z)V

    .line 179
    return-void
.end method

.method public setTabsLayout(I)V
    .locals 1
    .param p1, "tabsLayout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 173
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabsLayout(I)V

    .line 174
    return-void
.end method

.method public setTabsVisible(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->delegate:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabsVisible(Z)V

    .line 125
    return-void
.end method

.method protected showContent()V
    .locals 2

    .prologue
    .line 149
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->showContent()V

    .line 150
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 151
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/TabbedLoaderFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setElevation(F)V

    .line 153
    :cond_0
    return-void
.end method
