.class Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InfiniteOnScrollListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method private constructor <init>(Lcom/vk/lists/PaginateHelper;)V
    .locals 0

    .prologue
    .line 320
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/lists/PaginateHelper;Lcom/vk/lists/PaginateHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/lists/PaginateHelper;
    .param p2, "x1"    # Lcom/vk/lists/PaginateHelper$1;

    .prologue
    .line 320
    invoke-direct {p0, p1}, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;-><init>(Lcom/vk/lists/PaginateHelper;)V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 323
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 325
    .local v1, "totalItemCount":I
    invoke-static {p1}, Lcom/vk/lists/PaginationUtil;->getLastVisiblePosition(Landroid/support/v7/widget/RecyclerView;)I

    move-result v2

    sub-int v2, v1, v2

    iget-object v3, p0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v3}, Lcom/vk/lists/PaginateHelper;->access$1000(Lcom/vk/lists/PaginateHelper;)I

    move-result v3

    if-ge v2, v3, :cond_1

    const/4 v0, 0x1

    .line 327
    .local v0, "loadMore":Z
    :goto_0
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v2}, Lcom/vk/lists/PaginateHelper;->access$1100(Lcom/vk/lists/PaginateHelper;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v2}, Lcom/vk/lists/PaginateHelper;->access$200(Lcom/vk/lists/PaginateHelper;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 328
    iget-object v2, p0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v2}, Lcom/vk/lists/PaginateHelper;->loadNext()V

    .line 330
    :cond_0
    return-void

    .line 325
    .end local v0    # "loadMore":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
