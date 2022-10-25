.class Lcom/vk/lists/RecyclerPaginatedView$1;
.super Ljava/lang/Object;
.source "RecyclerPaginatedView.java"

# interfaces
.implements Lcom/vk/lists/PaginateHelper$PaginatedView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/RecyclerPaginatedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/RecyclerPaginatedView;


# direct methods
.method constructor <init>(Lcom/vk/lists/RecyclerPaginatedView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$000(Lcom/vk/lists/RecyclerPaginatedView;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 173
    return-void
.end method

.method public removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$000(Lcom/vk/lists/RecyclerPaginatedView;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 178
    return-void
.end method

.method public setDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 2
    .param p1, "dataObserver"    # Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    iget-object v0, v0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    iget-object v1, v1, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 189
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    iput-object p1, v0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .line 193
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    iget-object v0, v0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_1

    .line 194
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    iget-object v1, v1, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 196
    :cond_1
    return-void
.end method

.method public setOnLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 1
    .param p1, "onRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-virtual {v0, p1}, Lcom/vk/lists/RecyclerPaginatedView;->setLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 168
    return-void
.end method

.method public setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$100(Lcom/vk/lists/RecyclerPaginatedView;)Landroid/support/v4/widget/SwipeRefreshLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 183
    return-void
.end method

.method public setOnReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 1
    .param p1, "onRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$1;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-virtual {v0, p1}, Lcom/vk/lists/RecyclerPaginatedView;->setReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 163
    return-void
.end method
