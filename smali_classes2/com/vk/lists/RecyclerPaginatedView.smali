.class public Lcom/vk/lists/RecyclerPaginatedView;
.super Lcom/vk/lists/AbstractPaginatedView;
.source "RecyclerPaginatedView.java"


# instance fields
.field private columnWidth:I

.field private final dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

.field private final paginatedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

.field private recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private spanCount:I

.field private final spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

.field private swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field private wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 22
    invoke-direct {p0, p1}, Lcom/vk/lists/AbstractPaginatedView;-><init>(Landroid/content/Context;)V

    .line 18
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    .line 19
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    .line 159
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$1;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->paginatedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    .line 199
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$2;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$2;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 211
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$3;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$3;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, -0x1

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/vk/lists/AbstractPaginatedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    .line 19
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    .line 159
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$1;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->paginatedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    .line 199
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$2;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$2;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 211
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$3;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$3;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v0, -0x1

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/lists/AbstractPaginatedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    .line 19
    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    .line 159
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$1;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->paginatedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    .line 199
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$2;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$2;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 211
    new-instance v0, Lcom/vk/lists/RecyclerPaginatedView$3;

    invoke-direct {v0, p0}, Lcom/vk/lists/RecyclerPaginatedView$3;-><init>(Lcom/vk/lists/RecyclerPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 31
    return-void
.end method

.method static synthetic access$000(Lcom/vk/lists/RecyclerPaginatedView;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/lists/RecyclerPaginatedView;)Landroid/support/v4/widget/SwipeRefreshLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/lists/RecyclerPaginatedView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 12
    iget v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    return v0
.end method

.method private setSpanCountToLayoutManager(I)V
    .locals 2
    .param p1, "spanCount"    # I

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v0, v0, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 134
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayoutManager;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 136
    :cond_0
    return-void
.end method

.method private updateSpanCountFromColumnWidth(I)V
    .locals 2
    .param p1, "w"    # I

    .prologue
    .line 127
    const/4 v0, 0x1

    iget v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    div-int v1, p1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    .line 128
    iget v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    invoke-direct {p0, v0}, Lcom/vk/lists/RecyclerPaginatedView;->setSpanCountToLayoutManager(I)V

    .line 129
    return-void
.end method


# virtual methods
.method public clearSwipeRefreshing()V
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 56
    return-void
.end method

.method protected doShowFooterError()V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayErrorRow(Z)V

    .line 94
    :cond_0
    return-void
.end method

.method protected doShowFooterLoading()V
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->displayLoadingRow(Z)V

    .line 87
    :cond_0
    return-void
.end method

.method protected getDataInfoProvider()Lcom/vk/lists/PaginateHelper$DataInfoProvider;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    return-object v0
.end method

.method public getPaginatedView()Lcom/vk/lists/PaginateHelper$PaginatedView;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->paginatedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    return-object v0
.end method

.method public getRecyclerView()Landroid/support/v7/widget/RecyclerView;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method protected hideFooter()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->hideFooter()V

    .line 101
    :cond_0
    return-void
.end method

.method protected onCreateListView()Landroid/view/View;
    .locals 2

    .prologue
    .line 42
    new-instance v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 43
    new-instance v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 44
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->addView(Landroid/view/View;)V

    .line 45
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 107
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/lists/AbstractPaginatedView;->onSizeChanged(IIII)V

    .line 108
    iget v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    if-lez v0, :cond_0

    .line 109
    invoke-direct {p0, p1}, Lcom/vk/lists/RecyclerPaginatedView;->updateSpanCountFromColumnWidth(I)V

    .line 111
    :cond_0
    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">(",
            "Landroid/support/v7/widget/RecyclerView$Adapter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;, "Landroid/support/v7/widget/RecyclerView$Adapter<TT;>;"
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 148
    :cond_0
    new-instance v0, Lcom/vk/lists/PaginatedRecyclerAdapter;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->footerViewProvider:Lcom/vk/lists/FooterViewProvider;

    iget-object v2, p0, Lcom/vk/lists/RecyclerPaginatedView;->internalLoadNextRetryListener:Lcom/vk/lists/OnRetryClickListener;

    invoke-direct {v0, p1, v1, v2}, Lcom/vk/lists/PaginatedRecyclerAdapter;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;Lcom/vk/lists/FooterViewProvider;Lcom/vk/lists/OnRetryClickListener;)V

    iput-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    .line 149
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 151
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_1

    .line 152
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->wrapperAdapter:Lcom/vk/lists/PaginatedRecyclerAdapter;

    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz v0, :cond_2

    .line 155
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    .line 157
    :cond_2
    return-void
.end method

.method public setColumnWidth(I)V
    .locals 1
    .param p1, "columnWidth"    # I

    .prologue
    .line 120
    iput p1, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    .line 121
    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_0

    if-lez p1, :cond_0

    .line 122
    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getMeasuredWidth()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vk/lists/RecyclerPaginatedView;->updateSpanCountFromColumnWidth(I)V

    .line 124
    :cond_0
    return-void
.end method

.method public setFixedSpanCount(I)V
    .locals 1
    .param p1, "spanCount"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanCount:I

    .line 115
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->columnWidth:I

    .line 116
    invoke-direct {p0, p1}, Lcom/vk/lists/RecyclerPaginatedView;->setSpanCountToLayoutManager(I)V

    .line 117
    return-void
.end method

.method protected setLayoutManagerFromBuilder(Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;)V
    .locals 6
    .param p1, "layoutBuilder"    # Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;

    .prologue
    .line 60
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getLayoutType()Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    move-result-object v1

    sget-object v2, Lcom/vk/lists/AbstractPaginatedView$LayoutType;->STAGGERED_GRID:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    if-ne v1, v2, :cond_0

    .line 61
    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getSpanCount()I

    move-result v3

    .line 62
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getOrientation()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 61
    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 75
    :goto_0
    return-void

    .line 64
    :cond_0
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getLayoutType()Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    move-result-object v1

    sget-object v2, Lcom/vk/lists/AbstractPaginatedView$LayoutType;->GRID:Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    if-ne v1, v2, :cond_1

    .line 65
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getSpanCount()I

    move-result v2

    .line 66
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getOrientation()I

    move-result v3

    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->isReverseLayout()Z

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 67
    .local v0, "lm":Landroid/support/v7/widget/GridLayoutManager;
    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->spanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 68
    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 69
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getSpanCount()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vk/lists/RecyclerPaginatedView;->setFixedSpanCount(I)V

    goto :goto_0

    .line 72
    .end local v0    # "lm":Landroid/support/v7/widget/GridLayoutManager;
    :cond_1
    iget-object v1, p0, Lcom/vk/lists/RecyclerPaginatedView;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vk/lists/RecyclerPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->getOrientation()I

    move-result v4

    .line 73
    invoke-virtual {p1}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;->isReverseLayout()Z

    move-result v5

    invoke-direct {v2, v3, v4, v5}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 72
    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    goto :goto_0
.end method

.method protected setSwipeRefreshEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 80
    return-void
.end method
