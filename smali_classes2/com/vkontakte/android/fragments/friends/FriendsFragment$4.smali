.class Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;
.super Ljava/lang/Object;
.source "FriendsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestUsers(Ljava/util/List;Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

.field final synthetic val$friends:Ljava/util/List;

.field final synthetic val$suggests:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;ZLjava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 625
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$suggests:Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$friends:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 653
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2602(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 654
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    .prologue
    const/4 v2, 0x0

    .line 628
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$suggests:Z

    if-eqz v0, :cond_2

    .line 629
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 630
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 631
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 632
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$900(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendRequests()I

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .line 633
    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z

    .line 635
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$friends:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Ljava/util/List;Z)V

    .line 649
    :goto_0
    return-void

    .line 637
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v0

    const/4 v1, 0x2

    if-gt v0, v1, :cond_1

    .line 638
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$friends:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto :goto_0

    .line 640
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V

    goto :goto_0

    .line 644
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 645
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->list:Lcom/vkontakte/android/data/VKList;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 646
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget v1, p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;->total:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$902(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 647
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->val$friends:Ljava/util/List;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Ljava/util/List;Z)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 625
    check-cast p1, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;->success(Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;)V

    return-void
.end method
