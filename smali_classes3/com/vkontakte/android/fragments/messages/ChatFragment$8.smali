.class Lcom/vkontakte/android/fragments/messages/ChatFragment$8;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1223
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 1226
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    invoke-static {v0, p2}, Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;->onScrollStateChanged(Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;I)V

    .line 1227
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 11
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x4

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1231
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v0

    .line 1232
    .local v0, "firstVisibleItem":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    .line 1233
    .local v2, "visibleItemCount":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getCount()I

    move-result v1

    .line 1235
    .local v1, "totalItemCount":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;->checkTimeAnchor(Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;Lcom/vkontakte/android/ui/adapters/MessagesAdapter;I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I

    .line 1237
    if-nez v0, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1238
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1239
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1240
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4102(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1241
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1250
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 1251
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 1254
    :cond_1
    add-int v3, v0, v2

    add-int/lit8 v4, v1, -0x1

    if-lt v3, v4, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 1255
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 1256
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1257
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1258
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1276
    :cond_4
    :goto_1
    return-void

    .line 1242
    :cond_5
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 1243
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    .line 1244
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1245
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4102(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1246
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    goto/16 :goto_0

    .line 1248
    :cond_6
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    goto/16 :goto_0

    .line 1259
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_8

    .line 1260
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5000(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    .line 1261
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1262
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1263
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 1264
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 1265
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    goto :goto_1

    .line 1266
    :cond_8
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 1267
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 1268
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 1269
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    goto/16 :goto_1

    .line 1271
    :cond_9
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v10}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 1272
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v3

    invoke-virtual {v3, v10}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    goto/16 :goto_1
.end method
