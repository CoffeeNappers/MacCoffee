.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "BoardTopicViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CommentsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field comments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 810
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 812
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 860
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowUpLoader()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 861
    add-int/lit8 p1, p1, -0x1

    .line 863
    :cond_0
    if-ltz p1, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt p1, v2, :cond_3

    .line 864
    :cond_1
    const/4 v1, 0x0

    .line 872
    :cond_2
    return v1

    .line 866
    :cond_3
    const/4 v1, 0x1

    .line 867
    .local v1, "count":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/board/BoardComment;

    iget-object v2, v2, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 868
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_4

    .line 869
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 5
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    const/4 v3, 0x0

    .line 877
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowUpLoader()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 878
    add-int/lit8 p1, p1, -0x1

    .line 880
    :cond_0
    if-ltz p1, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt p1, v2, :cond_2

    :cond_1
    move-object v2, v3

    .line 896
    :goto_0
    return-object v2

    .line 883
    :cond_2
    packed-switch p2, :pswitch_data_0

    .line 887
    const/4 v1, 0x0

    .line 888
    .local v1, "imgindex":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/board/BoardComment;

    iget-object v2, v2, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 889
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v4, :cond_3

    .line 890
    add-int/lit8 v1, v1, 0x1

    .line 891
    if-ne v1, p2, :cond_3

    .line 892
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 885
    .end local v1    # "imgindex":I
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/board/BoardComment;

    iget-object v2, v2, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    goto :goto_0

    .restart local v1    # "imgindex":I
    :cond_4
    move-object v2, v3

    .line 896
    goto :goto_0

    .line 883
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public getItemCount()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 851
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowDownLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowUpLoader()Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public getItemOffset(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 855
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 831
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowUpLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowDownLoader()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isNeedShowDownLoader()Z
    .locals 1

    .prologue
    .line 815
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isNeedShowUpLoader()Z
    .locals 1

    .prologue
    .line 819
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 810
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 841
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->isNeedShowUpLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 842
    add-int/lit8 p2, p2, -0x1

    .line 844
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_1

    if-ltz p2, :cond_1

    .line 845
    check-cast p1, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->bind(Ljava/lang/Object;)V

    .line 847
    :cond_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 810
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 836
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;-><init>(Landroid/view/ViewGroup;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->access$500(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->setCanReply(Z)Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;

    move-result-object v0

    goto :goto_0
.end method

.method setData(Ljava/util/List;Z)V
    .locals 0
    .param p2, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 823
    .local p1, "comments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/board/BoardComment;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    .line 824
    if-eqz p2, :cond_0

    .line 825
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->notifyDataSetChanged()V

    .line 827
    :cond_0
    return-void
.end method
