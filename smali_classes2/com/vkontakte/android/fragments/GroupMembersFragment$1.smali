.class Lcom/vkontakte/android/fragments/GroupMembersFragment$1;
.super Ljava/lang/Object;
.source "GroupMembersFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GroupMembersFragment;->onAttach(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GroupMembersFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GroupMembersFragment;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

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

    .line 73
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    move v1, v2

    .line 74
    .local v1, "ns":Z
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->access$000(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Z

    move-result v4

    if-eq v1, v4, :cond_0

    .line 75
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v4, v1}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->access$002(Lcom/vkontakte/android/fragments/GroupMembersFragment;Z)Z

    .line 76
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->access$000(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Z

    move-result v4

    if-nez v4, :cond_3

    move v4, v2

    :goto_1
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->setSwipeEnabled(Z)V

    .line 77
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->access$000(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Z

    move-result v5

    if-nez v5, :cond_4

    :goto_2
    invoke-virtual {v4, v2}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->setTabsVisible(Z)V

    .line 79
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GroupMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/GroupMembersFragment;->access$100(Lcom/vkontakte/android/fragments/GroupMembersFragment;)Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    move-result-object v0

    .line 80
    .local v0, "fragment":Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    if-eqz v0, :cond_1

    .line 81
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateFilter(Ljava/lang/String;)V

    .line 83
    :cond_1
    return-void

    .end local v0    # "fragment":Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
    .end local v1    # "ns":Z
    :cond_2
    move v1, v3

    .line 73
    goto :goto_0

    .restart local v1    # "ns":Z
    :cond_3
    move v4, v3

    .line 76
    goto :goto_1

    :cond_4
    move v2, v3

    .line 77
    goto :goto_2
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 66
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 69
    return-void
.end method
