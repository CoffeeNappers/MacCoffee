.class public Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "PostListFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$DisableableClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PostDisplayItemViewHolder"
.end annotation


# instance fields
.field protected item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V
    .locals 3
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 1130
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    .line 1131
    invoke-direct {p0, p2}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1132
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1133
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/ui/posts/PostDisplayItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .prologue
    .line 1136
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 1137
    return-void
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 1180
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->clickable:Z

    return v0
.end method

.method public onClick()V
    .locals 10

    .prologue
    .line 1142
    const/4 v1, 0x0

    .line 1143
    .local v1, "e":Lcom/vkontakte/android/NewsEntry;
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/PostListFragment;->access$2000(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    .line 1144
    .local v2, "post":Lcom/vkontakte/android/NewsEntry;
    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-ne v5, v6, :cond_0

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v5, v6, :cond_0

    .line 1145
    move-object v1, v2

    .line 1149
    .end local v2    # "post":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    if-nez v1, :cond_3

    .line 1176
    :cond_2
    :goto_0
    return-void

    .line 1152
    :cond_3
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_2

    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x7

    if-eq v4, v5, :cond_2

    .line 1156
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_4

    .line 1157
    new-instance v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    iget v5, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v6, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v6, v6

    iget-object v7, v1, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v7}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    iget v5, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget v6, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    rem-int/lit8 v6, v6, 0x14

    sub-int/2addr v5, v6

    .line 1158
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setOffset(I)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v4

    iget v5, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    .line 1159
    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setIsAdmin(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1173
    :catch_0
    move-exception v3

    .line 1174
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1160
    .end local v3    # "x":Ljava/lang/Exception;
    :cond_4
    :try_start_1
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x5

    if-ne v4, v5, :cond_5

    .line 1161
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "vkontakte://vk.com/wall"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v9, "parent_post"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "?reply="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/PostListFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1162
    :cond_5
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x12

    if-ne v4, v5, :cond_7

    .line 1163
    iget-object v4, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1164
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v5, :cond_6

    .line 1165
    new-instance v4, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v5, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->feed:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    check-cast v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v6, v0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;Lcom/vkontakte/android/data/Good;)V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 1169
    :cond_7
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xb

    if-eq v4, v5, :cond_2

    .line 1170
    new-instance v4, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1171
    new-instance v4, Lcom/vkontakte/android/data/PostInteract;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    sget-object v5, Lcom/vkontakte/android/data/PostInteract$Type;->open:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
