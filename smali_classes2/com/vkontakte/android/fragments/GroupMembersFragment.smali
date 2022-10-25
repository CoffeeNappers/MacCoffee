.class public Lcom/vkontakte/android/fragments/GroupMembersFragment;
.super Lme/grishka/appkit/fragments/TabbedFragment;
.source "GroupMembersFragment.java"


# instance fields
.field private friendsFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

.field private membersFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private searching:Z

.field private unsureFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lme/grishka/appkit/fragments/TabbedFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GroupMembersFragment;

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->searching:Z

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/GroupMembersFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GroupMembersFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->searching:Z

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GroupMembersFragment;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getCurrentFragment()Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    move-result-object v0

    return-object v0
.end method

.method private getCurrentFragment()Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    .locals 2

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getPagerCurrentItem()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getTabAt(I)Landroid/app/Fragment;

    move-result-object v0

    .line 111
    .local v0, "fragment":Landroid/app/Fragment;
    instance-of v1, v0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    if-eqz v1, :cond_0

    .line 112
    check-cast v0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .line 114
    .end local v0    # "fragment":Landroid/app/Fragment;
    :goto_0
    return-object v0

    .restart local v0    # "fragment":Landroid/app/Fragment;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 8
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    const/4 v7, 0x1

    .line 30
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/TabbedFragment;->onAttach(Landroid/app/Activity;)V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v0, "fragments":Ljava/util/List;, "Ljava/util/List<Landroid/app/Fragment;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v4, "titles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_0
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 37
    .local v2, "membersArgs":Landroid/os/Bundle;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 38
    .local v1, "friendsArgs":Landroid/os/Bundle;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Bundle;

    .line 39
    .local v3, "repostsArgs":Landroid/os/Bundle;
    const-string/jumbo v5, "filter"

    const-string/jumbo v6, "friends"

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string/jumbo v5, "title"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 41
    const-string/jumbo v5, "no_autoload"

    invoke-virtual {v1, v5, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 42
    const-string/jumbo v5, "from_list"

    const-string/jumbo v6, "friends"

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-string/jumbo v5, "filter"

    const-string/jumbo v6, "unsure"

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string/jumbo v5, "title"

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 45
    const-string/jumbo v5, "no_autoload"

    invoke-virtual {v3, v5, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 46
    const-string/jumbo v5, "from_list"

    const-string/jumbo v6, "subscriptions"

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v5, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->membersFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .line 48
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->membersFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-virtual {v5, v2}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 49
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->membersFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->loadData()V

    .line 50
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->membersFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "type"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_2

    const v5, 0x7f08021e

    :goto_1
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v5, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->friendsFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .line 53
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->friendsFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 54
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->friendsFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    const v5, 0x7f08023b

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "type"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v7, :cond_0

    .line 57
    new-instance v5, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->unsureFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .line 58
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->unsureFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-virtual {v5, v3}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 59
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->unsureFragment:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    const v5, 0x7f080724

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    :cond_0
    invoke-virtual {p0, v0, v4}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 64
    new-instance v5, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;-><init>(Lcom/vkontakte/android/fragments/GroupMembersFragment;)V

    invoke-direct {v5, v6, v7}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 85
    return-void

    .line 35
    .end local v1    # "friendsArgs":Landroid/os/Bundle;
    .end local v2    # "membersArgs":Landroid/os/Bundle;
    .end local v3    # "repostsArgs":Landroid/os/Bundle;
    :cond_1
    const-string/jumbo v5, ""

    goto/16 :goto_0

    .line 51
    .restart local v1    # "friendsArgs":Landroid/os/Bundle;
    .restart local v2    # "membersArgs":Landroid/os/Bundle;
    .restart local v3    # "repostsArgs":Landroid/os/Bundle;
    :cond_2
    const v5, 0x7f080354

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getCurrentFragment()Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    move-result-object v0

    .line 90
    .local v0, "fragment":Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 93
    :cond_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 107
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 98
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    .line 102
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    goto :goto_0
.end method
