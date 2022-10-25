.class public Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "FriendRequestsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/RequestUserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field private counter:I

.field private isOutgoing:Z

.field private isSuggest:Z

.field private mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF2Int",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mProfileListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private showClearAll:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 76
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 44
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mProfileListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 45
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF2Int;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    .line 51
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$1;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF2Int;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isSuggest:Z

    return v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isOutgoing:Z

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->counter:I

    return v0
.end method

.method static synthetic access$710(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->counter:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->counter:I

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mProfileListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/RequestUserProfile;ZI)V
    .locals 7
    .param p1, "request"    # Lcom/vkontakte/android/RequestUserProfile;
    .param p2, "agree"    # Z
    .param p3, "position"    # I

    .prologue
    .line 196
    if-eqz p2, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isOutgoing:Z

    if-nez v0, :cond_0

    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsAdd;

    iget v1, p1, Lcom/vkontakte/android/RequestUserProfile;->uid:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/friends/FriendsAdd;-><init>(ILjava/lang/String;)V

    .line 197
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v6

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;

    move-object v1, p0

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Fragment;Lcom/vkontakte/android/RequestUserProfile;ZI)V

    .line 198
    invoke-virtual {v6, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 218
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 219
    return-void

    .line 196
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsDelete;

    iget v1, p1, Lcom/vkontakte/android/RequestUserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDelete;-><init>(I)V

    goto :goto_0
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/ui/holder/FriendRequestHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 81
    new-instance v1, Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isSuggest:Z

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isOutgoing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isSuggest:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, p1, p2, v2, v0}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;-><init>(IIZZ)V

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)V

    .line 82
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 103
    return-void

    .line 81
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getColumnsCount()I
    .locals 2

    .prologue
    .line 188
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isTablet:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->scrW:I

    const/16 v1, 0x320

    if-lt v0, v1, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method synthetic lambda$onOptionsItemSelected$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p3, "i"    # I

    .prologue
    .line 152
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsDeleteAllRequests;

    invoke-direct {v0}, Lcom/vkontakte/android/api/friends/FriendsDeleteAllRequests;-><init>()V

    .line 153
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDeleteAllRequests;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)V

    .line 154
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 166
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 176
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->showProgress()V

    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->refresh()V

    .line 179
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 107
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 108
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 109
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 110
    const-string/jumbo v1, "out"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isOutgoing:Z

    .line 111
    const-string/jumbo v1, "suggests"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isSuggest:Z

    .line 112
    const-string/jumbo v1, "menu_clear_all"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->showClearAll:Z

    .line 114
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->showClearAll:Z

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setHasOptionsMenu(Z)V

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string/jumbo v4, "com.vkontakte.android.ACTION_FRIEND_STATUS_CHANGED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 116
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x0

    .line 135
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 136
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->showClearAll:Z

    if-eqz v1, :cond_0

    .line 137
    const v1, 0x7f100295

    const v2, 0x7f080145

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 138
    .local v0, "clearAll":Landroid/view/MenuItem;
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 139
    const v1, 0x7f020151

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 141
    .end local v0    # "clearAll":Landroid/view/MenuItem;
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 120
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroy()V

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 122
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 145
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f100295

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 147
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f080627

    .line 148
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08023e

    .line 149
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080433

    const/4 v3, 0x0

    .line 150
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080798

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 151
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 167
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 168
    const/4 v1, 0x1

    .line 170
    .end local v0    # "activity":Landroid/app/Activity;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 126
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 127
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isSuggest:Z

    if-eqz v0, :cond_0

    const v0, 0x7f08023a

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setTitle(I)V

    .line 128
    iget-object v7, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, 0x26000000

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isTablet:Z

    if-eqz v3, :cond_1

    move-object v3, v5

    :goto_1
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isTablet:Z

    if-eqz v4, :cond_2

    move v4, v6

    .line 129
    :goto_2
    invoke-direct/range {v0 .. v6}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v1

    check-cast v1, Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    move-result-object v0

    .line 128
    invoke-virtual {v7, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 131
    return-void

    .line 127
    :cond_0
    const v0, 0x7f080627

    goto :goto_0

    .line 128
    :cond_1
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, -0x1

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_1

    :cond_2
    const/high16 v4, 0x41100000    # 9.0f

    .line 129
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    goto :goto_2
.end method

.method public openUserDetails(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 222
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 223
    return-void
.end method

.method public setCounter(I)V
    .locals 0
    .param p1, "counter"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->counter:I

    .line 193
    return-void
.end method
