.class Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CommentsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder",
        "<",
        "Lcom/vkontakte/android/NewsComment;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final VIEW_TYPE_DELETED:I = 0x65

.field private static final VIEW_TYPE_REGULAR:I = 0x64


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0

    .prologue
    .line 2183
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/fragments/PostViewFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/PostViewFragment$1;

    .prologue
    .line 2183
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 2218
    const/4 v1, 0x1

    .line 2219
    .local v1, "count":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    iget-object v2, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 2220
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_0

    .line 2221
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2224
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    return v1
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 4
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 2229
    packed-switch p2, :pswitch_data_0

    .line 2233
    const/4 v1, 0x0

    .line 2234
    .local v1, "imgindex":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    iget-object v2, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 2235
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_0

    .line 2236
    add-int/lit8 v1, v1, 0x1

    .line 2237
    if-ne v1, p2, :cond_0

    .line 2238
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v2

    .line 2242
    .end local v1    # "imgindex":I
    :goto_0
    return-object v2

    .line 2231
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    iget-object v2, v2, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    goto :goto_0

    .line 2242
    .restart local v1    # "imgindex":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 2229
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 2208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 2213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsComment;

    iget-boolean v0, v0, Lcom/vkontakte/android/NewsComment;->isDeleted:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x65

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 2183
    check-cast p1, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;I)V
    .locals 3
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 2198
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder<Lcom/vkontakte/android/NewsComment;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsComment;

    .line 2199
    .local v0, "comment":Lcom/vkontakte/android/NewsComment;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;->bind(Ljava/lang/Object;)V

    .line 2200
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5000(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v1

    invoke-virtual {v0}, Lcom/vkontakte/android/NewsComment;->getId()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 2201
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$5002(Lcom/vkontakte/android/fragments/PostViewFragment;I)I

    .line 2202
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;->highlight()V

    .line 2204
    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 2183
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2190
    const/16 v0, 0x65

    if-ne p2, v0, :cond_0

    .line 2191
    new-instance v0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;)V

    .line 2193
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;)V

    goto :goto_0
.end method
