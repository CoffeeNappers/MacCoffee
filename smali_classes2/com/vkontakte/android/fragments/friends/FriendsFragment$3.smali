.class Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;
.super Ljava/lang/Object;
.source "FriendsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;->doLoadData()V
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
        "Lcom/vkontakte/android/api/friends/FriendsGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 585
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 599
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 600
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 601
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2300(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 602
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2402(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 603
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/friends/FriendsGet$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/friends/FriendsGet$Result;

    .prologue
    const/4 v2, 0x0

    .line 588
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;->friends:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setData(Ljava/util/List;)V

    .line 589
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 590
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->intersect(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 591
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 592
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;ZZ)V

    .line 594
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V

    .line 595
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 585
    check-cast p1, Lcom/vkontakte/android/api/friends/FriendsGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;->success(Lcom/vkontakte/android/api/friends/FriendsGet$Result;)V

    return-void
.end method
