.class Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;
.super Ljava/lang/Object;
.source "FriendsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 311
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 6
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 320
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    move v1, v2

    .line 321
    .local v1, "ns":Z
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-eq v1, v4, :cond_0

    .line 322
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1802(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z

    .line 323
    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_3

    move v4, v2

    :goto_1
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setSwipeEnabled(Z)V

    .line 324
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v5

    if-nez v5, :cond_4

    :goto_2
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabsVisible(Z)V

    .line 326
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1900(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v0

    .line 327
    .local v0, "fragment":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    if-eqz v0, :cond_1

    .line 328
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateFilter(Ljava/lang/String;)V

    .line 330
    :cond_1
    return-void

    .end local v0    # "fragment":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .end local v1    # "ns":Z
    :cond_2
    move v1, v3

    .line 320
    goto :goto_0

    .restart local v1    # "ns":Z
    :cond_3
    move v4, v3

    .line 323
    goto :goto_1

    :cond_4
    move v2, v3

    .line 324
    goto :goto_2
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 313
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 316
    return-void
.end method
