.class public Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;
.super Lcom/vkontakte/android/fragments/AbsUserListFragment;
.source "FaveUserListFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;-><init>()V

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->setActionable(Z)V

    .line 18
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method private deleteBookmark(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 38
    new-instance v0, Lcom/vkontakte/android/api/fave/FaveRemoveUser;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/fave/FaveRemoveUser;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment$1;-><init>(Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;Lcom/vkontakte/android/UserProfile;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/fave/FaveRemoveUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 49
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 32
    new-instance v0, Lcom/vkontakte/android/api/fave/FaveGetUsers;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/fave/FaveGetUsers;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 33
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/fave/FaveGetUsers;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 34
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 35
    return-void
.end method

.method synthetic lambda$onActionClick$0(Lcom/vkontakte/android/UserProfile;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->deleteBookmark(Lcom/vkontakte/android/UserProfile;)V

    .line 27
    return-void
.end method

.method public onActionClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 22
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 23
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080209

    .line 24
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/fave/FaveUserListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/fave/FaveUserListFragment;Lcom/vkontakte/android/UserProfile;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 28
    return-void
.end method
