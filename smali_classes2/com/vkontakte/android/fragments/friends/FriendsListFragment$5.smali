.class Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;
.super Ljava/lang/Object;
.source "FriendsListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->loadRequestUsers(Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

.field final synthetic val$suggests:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 613
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->val$suggests:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 632
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1802(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 633
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    .prologue
    .line 616
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;"
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->val$suggests:Z

    if-eqz v0, :cond_0

    .line 617
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 618
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1602(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;I)I

    .line 620
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    .line 621
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;II)V

    .line 628
    :goto_0
    return-void

    .line 623
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 624
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 625
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1702(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;I)I

    .line 626
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 613
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;"
    check-cast p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;->success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V

    return-void
.end method
