.class Lcom/vk/lists/PaginationUtil;
.super Ljava/lang/Object;
.source "PaginationUtil.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFirstVisiblePosition(Landroid/support/v7/widget/RecyclerView;)I
    .locals 3
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 17
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    .line 18
    .local v0, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/support/v7/widget/LinearLayoutManager;

    if-eq v1, v2, :cond_0

    instance-of v1, v0, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v1, :cond_1

    .line 19
    :cond_0
    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v0    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    .line 21
    :goto_0
    return v1

    .restart local v0    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public static getLastVisiblePosition(Landroid/support/v7/widget/RecyclerView;)I
    .locals 3
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 8
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    .line 9
    .local v0, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/support/v7/widget/LinearLayoutManager;

    if-eq v1, v2, :cond_0

    instance-of v1, v0, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v1, :cond_1

    .line 10
    :cond_0
    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v0    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    .line 12
    :goto_0
    return v1

    .restart local v0    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method
