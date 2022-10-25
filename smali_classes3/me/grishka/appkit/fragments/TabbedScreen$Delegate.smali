.class public Lme/grishka/appkit/fragments/TabbedScreen$Delegate;
.super Ljava/lang/Object;
.source "TabbedScreen.java"

# interfaces
.implements Lme/grishka/appkit/fragments/TabbedScreen;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/fragments/TabbedScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Delegate"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/fragments/TabbedScreen$Delegate$TabAdapter;
    }
.end annotation


# instance fields
.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private final host:Lme/grishka/appkit/fragments/ContainerFragment;

.field private loaded:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mAutoLoad:Z

.field private pager:Lme/grishka/appkit/views/DisableableViewPager;

.field private tabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

.field private tabbar:Landroid/support/design/widget/TabLayout;

.field private tabsLayout:I

.field private tabsVisible:Z

.field private titles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lme/grishka/appkit/fragments/ContainerFragment;)V
    .locals 2
    .param p1, "mHost"    # Lme/grishka/appkit/fragments/ContainerFragment;

    .prologue
    const/4 v1, 0x1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    .line 78
    iput-boolean v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->mAutoLoad:Z

    .line 80
    const v0, 0x7f03002d

    iput v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsLayout:I

    .line 82
    new-instance v0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;

    invoke-direct {v0, p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;-><init>(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)V

    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    .line 108
    iput-boolean v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsVisible:Z

    .line 111
    iput-object p1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->host:Lme/grishka/appkit/fragments/ContainerFragment;

    .line 112
    return-void
.end method

.method static synthetic access$000(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Lme/grishka/appkit/views/DisableableViewPager;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    return-object v0
.end method

.method static synthetic access$100(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Z
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->mAutoLoad:Z

    return v0
.end method

.method static synthetic access$300(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Lme/grishka/appkit/fragments/ContainerFragment;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->host:Lme/grishka/appkit/fragments/ContainerFragment;

    return-object v0
.end method

.method static synthetic access$500(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 69
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    return-object v0
.end method

.method private invalidate()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 176
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v1}, Lme/grishka/appkit/views/DisableableViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->notifyDataSetChanged()V

    .line 178
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->setupWithViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 179
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->setOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V

    .line 180
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_1

    :goto_0
    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->setTabsVisible(Z)V

    .line 182
    :cond_0
    return-void

    .line 180
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isActive(Landroid/app/Fragment;)Z
    .locals 1
    .param p0, "f"    # Landroid/app/Fragment;

    .prologue
    .line 172
    invoke-virtual {p0}, Landroid/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroid/app/Fragment;->isDetached()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Fragment;->isRemoving()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 243
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/DisableableViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 244
    return-void
.end method

.method public addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V
    .locals 4
    .param p1, "position"    # I
    .param p2, "f"    # Landroid/app/Fragment;
    .param p3, "title"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v3, 0x1

    .line 212
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v1, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 213
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    invoke-interface {v1, p1, p3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 214
    instance-of v1, p2, Lme/grishka/appkit/fragments/LoaderFragment;

    if-eqz v1, :cond_1

    .line 215
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    move-object v1, p2

    check-cast v1, Lme/grishka/appkit/fragments/LoaderFragment;

    iget-boolean v1, v1, Lme/grishka/appkit/fragments/LoaderFragment;->loaded:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    :goto_0
    invoke-virtual {p2}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 220
    .local v0, "args":Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 221
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "args":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 223
    .restart local v0    # "args":Landroid/os/Bundle;
    :cond_0
    const-string/jumbo v1, "__is_tab"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 224
    invoke-virtual {p2, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 225
    invoke-direct {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->invalidate()V

    .line 226
    return-void

    .line 217
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_1
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public createAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .prologue
    .line 299
    new-instance v0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$TabAdapter;

    invoke-direct {v0, p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$TabAdapter;-><init>(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)V

    return-object v0
.end method

.method public createView()Landroid/view/View;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 115
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->host:Lme/grishka/appkit/fragments/ContainerFragment;

    invoke-virtual {v1}, Lme/grishka/appkit/fragments/ContainerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    iget v3, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsLayout:I

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->view:Landroid/view/View;

    .line 117
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->view:Landroid/view/View;

    const v3, 0x7f1001ae

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lme/grishka/appkit/views/DisableableViewPager;

    iput-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    .line 118
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->view:Landroid/view/View;

    const v3, 0x7f1001ad

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/TabLayout;

    iput-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    .line 119
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->setTabMode(I)V

    .line 121
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->createAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v1, v3}, Lme/grishka/appkit/views/DisableableViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 122
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-object v3, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v1, v3}, Landroid/support/design/widget/TabLayout;->setupWithViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 123
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-object v3, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    invoke-virtual {v1, v3}, Landroid/support/design/widget/TabLayout;->setOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V

    .line 124
    iget-object v3, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-boolean v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsVisible:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v3, v1}, Landroid/support/design/widget/TabLayout;->setVisibility(I)V

    .line 126
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 127
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->host:Lme/grishka/appkit/fragments/ContainerFragment;

    invoke-virtual {v1}, Lme/grishka/appkit/fragments/ContainerFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 128
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 129
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setElevation(F)V

    .line 133
    .end local v0    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_0
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->view:Landroid/view/View;

    return-object v1

    .line 124
    :cond_1
    const/16 v1, 0x8

    goto :goto_0
.end method

.method public destroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 137
    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    .line 138
    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->view:Landroid/view/View;

    .line 139
    iput-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    .line 140
    return-void
.end method

.method public getPagerCurrentItem()I
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0}, Lme/grishka/appkit/views/DisableableViewPager;->getCurrentItem()I

    move-result v0

    return v0
.end method

.method public getTabAt(I)Landroid/app/Fragment;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 196
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    return-object v0
.end method

.method public getTabView()Landroid/view/View;
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    return-object v0
.end method

.method public getTabsCount()I
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public invalidateOptionsMenu()V
    .locals 0

    .prologue
    .line 308
    return-void
.end method

.method public invalidateTabTitles()V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout;->setupWithViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 208
    return-void
.end method

.method public isSwipeEnabled()Z
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0}, Lme/grishka/appkit/views/DisableableViewPager;->isSwipeEnabled()Z

    move-result v0

    return v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 311
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 312
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getPagerCurrentItem()I

    move-result v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 313
    .local v0, "activeFragment":Landroid/app/Fragment;
    invoke-virtual {v0, p1, p2}, Landroid/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 315
    .end local v0    # "activeFragment":Landroid/app/Fragment;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 318
    iget-object v1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->getPagerCurrentItem()I

    move-result v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 319
    .local v0, "activeFragment":Landroid/app/Fragment;
    invoke-virtual {v0, p1}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method public onPageSelected(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 304
    return-void
.end method

.method public removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 248
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/DisableableViewPager;->removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 249
    return-void
.end method

.method public removeTab(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 231
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 232
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 233
    invoke-direct {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->invalidate()V

    .line 234
    return-void
.end method

.method public removeTab(Landroid/app/Fragment;)V
    .locals 1
    .param p1, "tab"    # Landroid/app/Fragment;

    .prologue
    .line 238
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->removeTab(I)V

    .line 239
    return-void
.end method

.method public setPagerCurrentItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 258
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/DisableableViewPager;->setCurrentItem(I)V

    .line 259
    return-void
.end method

.method public setPagerCurrentItem(IZ)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "scroll"    # Z

    .prologue
    .line 263
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, p1, p2}, Lme/grishka/appkit/views/DisableableViewPager;->setCurrentItem(IZ)V

    .line 264
    return-void
.end method

.method public setSwipeEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 191
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->pager:Lme/grishka/appkit/views/DisableableViewPager;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/DisableableViewPager;->setSwipeEnabled(Z)V

    .line 192
    return-void
.end method

.method public setTabTitle(ILjava/lang/CharSequence;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 201
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 202
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/support/design/widget/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    .line 203
    return-void
.end method

.method public setTabs(Ljava/util/List;Ljava/util/List;)V
    .locals 6
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
    .local p1, "fragments":Ljava/util/List;, "Ljava/util/List<+Landroid/app/Fragment;>;"
    .local p2, "titles":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/CharSequence;>;"
    const/4 v5, 0x1

    .line 144
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 145
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Fragments and titles arrays must be the same size"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 147
    :cond_0
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 148
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 149
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 150
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->titles:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 152
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Fragment;

    .line 153
    .local v1, "f":Landroid/app/Fragment;
    instance-of v2, v1, Lme/grishka/appkit/fragments/LoaderFragment;

    if-eqz v2, :cond_3

    .line 154
    iget-object v4, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    move-object v2, v1

    check-cast v2, Lme/grishka/appkit/fragments/LoaderFragment;

    iget-boolean v2, v2, Lme/grishka/appkit/fragments/LoaderFragment;->loaded:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    :goto_1
    invoke-static {v1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->isActive(Landroid/app/Fragment;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 161
    invoke-virtual {v1}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 162
    .local v0, "args":Landroid/os/Bundle;
    if-nez v0, :cond_2

    .line 163
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "args":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 165
    .restart local v0    # "args":Landroid/os/Bundle;
    :cond_2
    const-string/jumbo v2, "__is_tab"

    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 166
    invoke-virtual {v1, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    goto :goto_0

    .line 156
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_3
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->loaded:Ljava/util/List;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 168
    .end local v1    # "f":Landroid/app/Fragment;
    :cond_4
    invoke-direct {p0}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->invalidate()V

    .line 169
    return-void
.end method

.method public setTabsAutoLoad(Z)V
    .locals 0
    .param p1, "autoLoad"    # Z

    .prologue
    .line 289
    iput-boolean p1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->mAutoLoad:Z

    .line 290
    return-void
.end method

.method public setTabsLayout(I)V
    .locals 0
    .param p1, "tabsLayout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 284
    iput p1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsLayout:I

    .line 285
    return-void
.end method

.method public setTabsVisible(Z)V
    .locals 3
    .param p1, "visible"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 268
    if-eqz p1, :cond_1

    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v0, :cond_1

    move p1, v0

    .line 269
    :goto_0
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsVisible:Z

    if-eq v0, p1, :cond_0

    .line 270
    iput-boolean p1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsVisible:Z

    .line 271
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabbar:Landroid/support/design/widget/TabLayout;

    iget-boolean v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->tabsVisible:Z

    if-eqz v2, :cond_2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout;->setVisibility(I)V

    .line 275
    :cond_0
    return-void

    :cond_1
    move p1, v1

    .line 268
    goto :goto_0

    .line 272
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method
