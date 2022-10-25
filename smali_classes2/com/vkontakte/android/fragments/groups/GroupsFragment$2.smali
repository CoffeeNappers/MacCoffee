.class Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;
.super Ljava/lang/Object;
.source "GroupsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groups/GroupsFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 5
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 151
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    move v0, v1

    .line 152
    .local v0, "ns":Z
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v3

    if-eq v0, v3, :cond_1

    .line 153
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3, v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$202(Lcom/vkontakte/android/fragments/groups/GroupsFragment;Z)Z

    .line 154
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 155
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v3, v2, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setPagerCurrentItem(IZ)V

    .line 157
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v3

    if-nez v3, :cond_3

    move v3, v1

    :goto_1
    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabsVisible(Z)V

    .line 158
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v4

    if-nez v4, :cond_4

    :goto_2
    invoke-virtual {v3, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setSwipeEnabled(Z)V

    .line 160
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$300(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->updateFilter(Ljava/lang/String;)V

    .line 161
    return-void

    .end local v0    # "ns":Z
    :cond_2
    move v0, v2

    .line 151
    goto :goto_0

    .restart local v0    # "ns":Z
    :cond_3
    move v3, v2

    .line 157
    goto :goto_1

    :cond_4
    move v1, v2

    .line 158
    goto :goto_2
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 142
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 147
    return-void
.end method
