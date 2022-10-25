.class Lcom/vkontakte/android/fragments/NewsFragment$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;

.field private wasScrollingUp:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 466
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 467
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->wasScrollingUp:Z

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 8
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 471
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$000(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 472
    .local v0, "position":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$200(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$100(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v5

    invoke-virtual {v5, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v2, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 473
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v0, :cond_0

    if-ltz v0, :cond_0

    .line 474
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$302(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 475
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->access$300(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v2, v2, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    invoke-static {v5, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$402(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 476
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->access$300(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v2, v2, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    invoke-static {v5, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$502(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 479
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$600(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$700(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v2

    if-eq v2, v7, :cond_2

    .line 480
    if-gez p3, :cond_3

    move v1, v3

    .line 481
    .local v1, "scrollingUp":Z
    :goto_0
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->wasScrollingUp:Z

    if-eq v1, v2, :cond_1

    if-eqz v1, :cond_1

    .line 482
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$800(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v5

    sub-int v5, v0, v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {v2, v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 484
    :cond_1
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->wasScrollingUp:Z

    .line 485
    if-nez v0, :cond_4

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$900(Lcom/vkontakte/android/fragments/NewsFragment;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 486
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2, v4}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V

    .line 487
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2, v7}, Lcom/vkontakte/android/fragments/NewsFragment;->access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I

    .line 494
    .end local v1    # "scrollingUp":Z
    :cond_2
    :goto_1
    return-void

    :cond_3
    move v1, v4

    .line 480
    goto :goto_0

    .line 488
    .restart local v1    # "scrollingUp":Z
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$700(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v2

    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$800(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v5

    add-int/2addr v2, v5

    if-le v0, v2, :cond_5

    .line 489
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2, v4}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V

    goto :goto_1

    .line 490
    :cond_5
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->access$700(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/NewsFragment;->access$800(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v4

    add-int/2addr v2, v4

    if-gt v0, v2, :cond_2

    .line 491
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V

    goto :goto_1
.end method
