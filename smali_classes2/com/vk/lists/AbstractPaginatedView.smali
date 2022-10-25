.class public abstract Lcom/vk/lists/AbstractPaginatedView;
.super Landroid/widget/FrameLayout;
.source "AbstractPaginatedView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;,
        Lcom/vk/lists/AbstractPaginatedView$LayoutType;
    }
.end annotation


# instance fields
.field protected dataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field protected emptyView:Landroid/view/View;

.field protected errorView:Lcom/vk/lists/AbstractErrorView;

.field protected footerViewProvider:Lcom/vk/lists/FooterViewProvider;

.field protected final internalLoadNextRetryListener:Lcom/vk/lists/OnRetryClickListener;

.field protected final internalReloadRetryListener:Lcom/vk/lists/OnRetryClickListener;

.field protected listContainer:Lcom/vk/lists/FullScreenLayout;

.field private loadNextRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

.field protected loadingView:Landroid/view/View;

.field private reloadRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

.field private final uiControl:Lcom/vk/lists/PaginateHelper$UIControl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/lists/AbstractPaginatedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/lists/AbstractPaginatedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    sget-object v0, Lcom/vk/lists/FooterViewProvider;->DEFAULT:Lcom/vk/lists/FooterViewProvider;

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->footerViewProvider:Lcom/vk/lists/FooterViewProvider;

    .line 172
    new-instance v0, Lcom/vk/lists/AbstractPaginatedView$1;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractPaginatedView$1;-><init>(Lcom/vk/lists/AbstractPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    .line 209
    new-instance v0, Lcom/vk/lists/AbstractPaginatedView$2;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractPaginatedView$2;-><init>(Lcom/vk/lists/AbstractPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->internalReloadRetryListener:Lcom/vk/lists/OnRetryClickListener;

    .line 218
    new-instance v0, Lcom/vk/lists/AbstractPaginatedView$3;

    invoke-direct {v0, p0}, Lcom/vk/lists/AbstractPaginatedView$3;-><init>(Lcom/vk/lists/AbstractPaginatedView;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->internalLoadNextRetryListener:Lcom/vk/lists/OnRetryClickListener;

    .line 34
    invoke-direct {p0}, Lcom/vk/lists/AbstractPaginatedView;->init()V

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/OnRetryClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->reloadRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/lists/AbstractPaginatedView;)Lcom/vk/lists/OnRetryClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->loadNextRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    return-object v0
.end method

.method private init()V
    .locals 6

    .prologue
    const/4 v5, -0x1

    const/16 v4, 0x8

    const/16 v3, 0x11

    const/4 v2, -0x2

    .line 41
    new-instance v0, Lcom/vk/lists/FullScreenLayout;

    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/lists/FullScreenLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    .line 42
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->onCreateListView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/lists/FullScreenLayout;->addView(Landroid/view/View;)V

    .line 43
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    invoke-virtual {v0, v4}, Lcom/vk/lists/FullScreenLayout;->setVisibility(I)V

    .line 44
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v5, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/vk/lists/AbstractPaginatedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->createEmptyView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    .line 49
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 50
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/vk/lists/AbstractPaginatedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->createLoadingView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    .line 55
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/vk/lists/AbstractPaginatedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->createErrorView()Lcom/vk/lists/AbstractErrorView;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    .line 60
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    invoke-virtual {v0, v4}, Lcom/vk/lists/AbstractErrorView;->setVisibility(I)V

    .line 61
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->internalReloadRetryListener:Lcom/vk/lists/OnRetryClickListener;

    invoke-virtual {v0, v1}, Lcom/vk/lists/AbstractErrorView;->setRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 62
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/vk/lists/AbstractPaginatedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    return-void
.end method

.method private static varargs makeFirstNViewVisible(I[Landroid/view/View;)V
    .locals 3
    .param p0, "toVisibleCount"    # I
    .param p1, "views"    # [Landroid/view/View;

    .prologue
    .line 164
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p0, :cond_0

    .line 165
    aget-object v1, p1, v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 167
    :cond_0
    move v0, p0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 168
    aget-object v1, p1, v0

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 170
    :cond_1
    return-void
.end method


# virtual methods
.method protected abstract clearSwipeRefreshing()V
.end method

.method protected createEmptyView()Landroid/view/View;
    .locals 3

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/vk/lists/R$layout;->view_default_empty_view:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createErrorView()Lcom/vk/lists/AbstractErrorView;
    .locals 2

    .prologue
    .line 71
    new-instance v0, Lcom/vk/lists/DefaultErrorView;

    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/lists/DefaultErrorView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected createLoadingView()Landroid/view/View;
    .locals 3

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/vk/lists/R$layout;->view_default_loading:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected abstract doShowFooterError()V
.end method

.method protected abstract doShowFooterLoading()V
.end method

.method protected abstract getDataInfoProvider()Lcom/vk/lists/PaginateHelper$DataInfoProvider;
.end method

.method public getLoadNextRetryClickListener()Lcom/vk/lists/OnRetryClickListener;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->loadNextRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    return-object v0
.end method

.method public abstract getPaginatedView()Lcom/vk/lists/PaginateHelper$PaginatedView;
.end method

.method public getReloadRetryClickListener()Lcom/vk/lists/OnRetryClickListener;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->reloadRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    return-object v0
.end method

.method public getUIControl()Lcom/vk/lists/PaginateHelper$UIControl;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    return-object v0
.end method

.method protected abstract hideFooter()V
.end method

.method public initLayoutManager(Lcom/vk/lists/AbstractPaginatedView$LayoutType;)Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;
    .locals 1
    .param p1, "layoutType"    # Lcom/vk/lists/AbstractPaginatedView$LayoutType;

    .prologue
    .line 79
    new-instance v0, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;

    invoke-direct {v0, p1, p0}, Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;-><init>(Lcom/vk/lists/AbstractPaginatedView$LayoutType;Lcom/vk/lists/AbstractPaginatedView;)V

    return-object v0
.end method

.method protected abstract onCreateListView()Landroid/view/View;
.end method

.method public setFooterViewProvider(Lcom/vk/lists/FooterViewProvider;)V
    .locals 0
    .param p1, "footerViewProvider"    # Lcom/vk/lists/FooterViewProvider;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView;->footerViewProvider:Lcom/vk/lists/FooterViewProvider;

    .line 84
    return-void
.end method

.method protected abstract setLayoutManagerFromBuilder(Lcom/vk/lists/AbstractPaginatedView$LayoutBuilder;)V
.end method

.method public setLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 0
    .param p1, "loadNextRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView;->loadNextRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    .line 159
    return-void
.end method

.method public setReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V
    .locals 0
    .param p1, "reloadRetryClickListener"    # Lcom/vk/lists/OnRetryClickListener;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView;->reloadRetryClickListener:Lcom/vk/lists/OnRetryClickListener;

    .line 151
    return-void
.end method

.method protected abstract setSwipeRefreshEnabled(Z)V
.end method

.method public showBigLoading()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 109
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->hideFooter()V

    .line 110
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 111
    return-void
.end method

.method public showEmpty()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 124
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->hideFooter()V

    .line 125
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v1, v0, v3

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 126
    return-void
.end method

.method public showError()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 114
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->hideFooter()V

    .line 115
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 116
    return-void
.end method

.method public showFooterError()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 134
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 135
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->doShowFooterError()V

    .line 136
    return-void
.end method

.method public showFooterLoading()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 129
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 130
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->doShowFooterLoading()V

    .line 131
    return-void
.end method

.method public showList()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 119
    invoke-virtual {p0}, Lcom/vk/lists/AbstractPaginatedView;->hideFooter()V

    .line 120
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->listContainer:Lcom/vk/lists/FullScreenLayout;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vk/lists/AbstractPaginatedView;->errorView:Lcom/vk/lists/AbstractErrorView;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->loadingView:Landroid/view/View;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vk/lists/AbstractPaginatedView;->emptyView:Landroid/view/View;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/vk/lists/AbstractPaginatedView;->makeFirstNViewVisible(I[Landroid/view/View;)V

    .line 121
    return-void
.end method
