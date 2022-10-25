.class public Lcom/vkontakte/android/fragments/LikesListFragment;
.super Lcom/vkontakte/android/fragments/VKTabbedFragment;
.source "LikesListFragment.java"


# static fields
.field public static final TAB_ALL:I = 0x0

.field public static final TAB_FRIENDS:I = 0x1

.field public static final TAB_SHARE:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKTabbedFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 13
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    const v12, 0x7f080337

    const/4 v11, 0x1

    .line 19
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->onAttach(Landroid/app/Activity;)V

    .line 21
    invoke-virtual {p0, v12}, Lcom/vkontakte/android/fragments/LikesListFragment;->setTitle(I)V

    .line 22
    const-string/jumbo v7, ""

    .line 23
    .local v7, "title":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    const-string/jumbo v10, "title"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    const-string/jumbo v10, "title"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    .end local v7    # "title":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, v7}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 24
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 25
    .local v2, "likesArgs":Landroid/os/Bundle;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 26
    .local v0, "friendsArgs":Landroid/os/Bundle;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    .line 27
    .local v4, "repostsArgs":Landroid/os/Bundle;
    const-string/jumbo v9, "friends_only"

    invoke-virtual {v0, v9, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 28
    const-string/jumbo v9, "no_autoload"

    invoke-virtual {v0, v9, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 29
    const-string/jumbo v9, "filter"

    const-string/jumbo v10, "copies"

    invoke-virtual {v4, v9, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string/jumbo v9, "no_autoload"

    invoke-virtual {v4, v9, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 31
    new-instance v3, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;-><init>()V

    .line 32
    .local v3, "likesView":Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 33
    new-instance v1, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;-><init>()V

    .line 34
    .local v1, "friendsView":Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 35
    new-instance v5, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;-><init>()V

    .line 36
    .local v5, "repostsView":Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/fragments/userlist/LikesUserListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 38
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v6, "tabs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Fragment;>;"
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 41
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    :cond_1
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v8, "titles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0, v12}, Lcom/vkontakte/android/fragments/LikesListFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 48
    const v9, 0x7f08023b

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/fragments/LikesListFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_2
    const v9, 0x7f0805d0

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/fragments/LikesListFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    invoke-virtual {p0, v6, v8}, Lcom/vkontakte/android/fragments/LikesListFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 52
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 57
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LikesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "tab"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/LikesListFragment;->setPagerCurrentItem(I)V

    .line 58
    return-void
.end method
