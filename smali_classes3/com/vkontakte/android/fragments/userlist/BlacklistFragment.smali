.class public Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;
.super Lcom/vkontakte/android/fragments/AbsUserListFragment;
.source "BlacklistFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;-><init>()V

    .line 16
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->setActionable(Z)V

    .line 17
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;

    .prologue
    .line 13
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 28
    new-instance v0, Lcom/vkontakte/android/api/account/AccountGetBanned;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/account/AccountGetBanned;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountGetBanned;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 29
    return-void
.end method

.method public onActionClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 33
    new-instance v0, Lcom/vkontakte/android/api/account/AccountBanUser;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/account/AccountBanUser;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment$1;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment$1;-><init>(Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;Landroid/app/Fragment;Lcom/vkontakte/android/UserProfile;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountBanUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onAttach(Landroid/app/Activity;)V

    .line 22
    const v0, 0x7f080112

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->setTitle(I)V

    .line 23
    const v0, 0x7f080113

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;->setEmptyText(I)V

    .line 24
    return-void
.end method
