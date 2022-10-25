.class Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FriendsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->accept(Lcom/vkontakte/android/RequestUserProfile;ZI)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

.field final synthetic val$agree:Z

.field final synthetic val$curNumFriendRequests:I

.field final synthetic val$curNumFriendSuggestions:I

.field final synthetic val$request:Lcom/vkontakte/android/RequestUserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/app/Fragment;Lcom/vkontakte/android/RequestUserProfile;ZII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 577
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$agree:Z

    iput p5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$curNumFriendRequests:I

    iput p6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$curNumFriendSuggestions:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 7
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;"
    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 580
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_0

    .line 581
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$request:Lcom/vkontakte/android/RequestUserProfile;

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$agree:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v3, Lcom/vkontakte/android/RequestUserProfile;->sent:Ljava/lang/Boolean;

    .line 583
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 584
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 585
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->decreaseRequests()V

    .line 586
    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$curNumFriendRequests:I

    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$curNumFriendSuggestions:I

    sub-int/2addr v3, v4

    add-int/lit8 v0, v3, -0x1

    .line 587
    .local v0, "newVal":I
    sget-object v3, Lcom/vkontakte/android/data/Friends$Request;->IN:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v3}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    .line 588
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 589
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setTotalRequests(I)V

    .line 590
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3, v0, v6}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;II)V

    .line 599
    .end local v0    # "newVal":I
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 600
    .local v1, "reqSize":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 601
    .local v2, "sugSize":I
    add-int v3, v1, v2

    const/4 v4, 0x5

    if-gt v3, v4, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v3

    add-int v4, v1, v2

    if-le v3, v4, :cond_2

    .line 602
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3, v5}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V

    .line 605
    .end local v1    # "reqSize":I
    .end local v2    # "sugSize":I
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    .line 606
    return-void

    .line 591
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 592
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 593
    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->val$curNumFriendSuggestions:I

    add-int/lit8 v0, v3, -0x1

    .line 594
    .restart local v0    # "newVal":I
    sget-object v3, Lcom/vkontakte/android/data/Friends$Request;->SUGGEST:Lcom/vkontakte/android/data/Friends$Request;

    invoke-static {v0, v3}, Lcom/vkontakte/android/data/Friends;->notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V

    .line 595
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 596
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setTotalRequests(I)V

    .line 597
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v3, v6, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$1300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;II)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 577
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;"
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
