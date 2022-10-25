.class Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;
.super Ljava/lang/Object;
.source "FriendRequestsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 100
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    .prologue
    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 86
    const/4 v1, 0x0

    iget v2, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 87
    .local v0, "count":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->SUGGEST:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    .line 94
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 95
    return-void

    .line 89
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 90
    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->OUT:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    goto :goto_0

    .line 92
    :cond_1
    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->IN:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 82
    check-cast p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$2;->success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V

    return-void
.end method
