.class Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FriendRequestsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->accept(Lcom/vkontakte/android/RequestUserProfile;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field final synthetic val$agree:Z

.field final synthetic val$position:I

.field final synthetic val$request:Lcom/vkontakte/android/RequestUserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Fragment;Lcom/vkontakte/android/RequestUserProfile;ZI)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$agree:Z

    iput p5, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$position:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 201
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->decreaseRequests()V

    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I

    move-result v0

    if-lez v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$710(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/RequestUserProfile;->isSuggesting:Z

    if-eqz v0, :cond_2

    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I

    move-result v0

    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->SUGGEST:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    .line 212
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_1

    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$agree:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    .line 215
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$800(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$position:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemChanged(I)V

    .line 216
    return-void

    .line 207
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    if-eqz v0, :cond_3

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I

    move-result v0

    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->OUT:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    goto :goto_0

    .line 210
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;)I

    move-result v0

    sget-object v1, Lcom/vkontakte/android/data/Friends$Request;->IN:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 198
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
