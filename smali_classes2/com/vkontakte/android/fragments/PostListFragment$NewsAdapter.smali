.class public Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PostListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;
.implements Lcom/vkontakte/android/media/AutoPlayProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "NewsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;",
        "Lcom/vkontakte/android/media/AutoPlayProvider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 1014
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 1015
    invoke-static {p1}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1800(Lcom/vkontakte/android/fragments/PostListFragment;)Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->setProvider(Lcom/vkontakte/android/media/AutoPlayProvider;)V

    .line 1016
    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x0

    .line 1103
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    if-gez p1, :cond_1

    :cond_0
    move v0, v1

    .line 1116
    :goto_0
    return v0

    .line 1106
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v0, v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bgType:I

    packed-switch v0, :pswitch_data_0

    move v0, v1

    .line 1116
    goto :goto_0

    .line 1108
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1110
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 1112
    :pswitch_2
    const/4 v0, 0x4

    goto :goto_0

    .line 1114
    :pswitch_3
    const/4 v0, 0x6

    goto :goto_0

    .line 1106
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 1093
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getImageCount()I

    move-result v0

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 1098
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Lcom/vkontakte/android/media/AutoPlay;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1121
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostListFragment;->getPostsOffset()I

    move-result v1

    sub-int v0, p1, v1

    .line 1122
    .local v0, "pos":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1900(Lcom/vkontakte/android/fragments/PostListFragment;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/AutoPlay;

    return-object v1
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 1020
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1025
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 1088
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getType()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 1011
    check-cast p1, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 1082
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget-object v1, p1, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bindView(Landroid/view/View;)V

    .line 1083
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->bind(Lcom/vkontakte/android/ui/posts/PostDisplayItem;)V

    .line 1084
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 1011
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1030
    packed-switch p2, :pswitch_data_0

    .line 1074
    :pswitch_0
    invoke-static {p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->isNotificationViewType(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1075
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v2, p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->createView(Landroid/app/Fragment;I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    .line 1077
    :goto_0
    return-object v0

    .line 1032
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1034
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createViewAd(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1036
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createViewRecommended(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1038
    :pswitch_4
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1040
    :pswitch_5
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->createView(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1042
    :pswitch_6
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1044
    :pswitch_7
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto :goto_0

    .line 1046
    :pswitch_8
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1048
    :pswitch_9
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/AudioPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1050
    :pswitch_a
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1052
    :pswitch_b
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1054
    :pswitch_c
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1056
    :pswitch_d
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1058
    :pswitch_e
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1060
    :pswitch_f
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1062
    :pswitch_10
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1064
    :pswitch_11
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1066
    :pswitch_12
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1068
    :pswitch_13
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1070
    :pswitch_14
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/MarkedAsAdsPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1072
    :pswitch_15
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1077
    :cond_0
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 1030
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_0
        :pswitch_2
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_0
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_3
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method
