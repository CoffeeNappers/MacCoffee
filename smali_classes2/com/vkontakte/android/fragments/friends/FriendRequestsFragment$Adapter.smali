.class Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "FriendRequestsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/RequestUserProfile;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/FriendRequestHolder;",
        ">;",
        "Lme/grishka/appkit/views/DividerItemDecoration$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)V
    .locals 0

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$1;

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 234
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/RequestUserProfile;

    iget-object v0, v1, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    .line 235
    .local v0, "mutualFriends":[Lcom/vkontakte/android/UserProfile;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    add-int/lit8 v1, v1, 0x1

    return v1

    :cond_0
    array-length v1, v0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 240
    if-nez p2, :cond_0

    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/RequestUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/RequestUserProfile;->photo:Ljava/lang/String;

    .line 243
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$1300(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/RequestUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    add-int/lit8 p2, p2, -0x1

    aget-object v0, v0, p2

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0
.end method

.method public needDrawDividerAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 249
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 225
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/FriendRequestHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "type"    # I

    .prologue
    .line 229
    new-instance v0, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;-><init>(Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$900(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/functions/VoidF2Int;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/FriendRequestHolder;->attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF2Int;)Lcom/vkontakte/android/ui/holder/FriendRequestHolder;

    move-result-object v0

    return-object v0
.end method
