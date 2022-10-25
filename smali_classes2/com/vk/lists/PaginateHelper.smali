.class public Lcom/vk/lists/PaginateHelper;
.super Ljava/lang/Object;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/lists/PaginateHelper$PaginatedView;,
        Lcom/vk/lists/PaginateHelper$DataInfoProvider;,
        Lcom/vk/lists/PaginateHelper$UIControl;,
        Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;,
        Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;,
        Lcom/vk/lists/PaginateHelper$PagedDataProvider;,
        Lcom/vk/lists/PaginateHelper$Builder;,
        Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;
    }
.end annotation


# static fields
.field public static final DEFAULT_PAGE_SIZE:I = 0x1e

.field private static final MSG_HIDE_SWIPE_REFRESH:I


# instance fields
.field private bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

.field private final dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

.field private isInErrorState:Z

.field private loadingEnabled:Z

.field private loadingInProgress:Z

.field private final loadingStartOffset:I

.field private final nextFromHolder:Lcom/vk/lists/NextFromHolder;

.field private final pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

.field private final pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

.field private final preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

.field private final requestObservableTransform:Lio/reactivex/ObservableTransformer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableTransformer",
            "<",
            "Lio/reactivex/Observable",
            "<*>;",
            "Lio/reactivex/Observable",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final scrollListener:Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;

.field private final uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

.field private final uiHandler:Landroid/os/Handler;


# direct methods
.method private constructor <init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;Lcom/vk/lists/PaginateHelper$DataInfoProvider;Lcom/vk/lists/PaginateHelper$UIControl;Lcom/vk/lists/PreloadScrollListener;IZILjava/lang/String;)V
    .locals 2
    .param p1, "pagedDataProviderWithOffset"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "pagedDataProviderWithStartFrom"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "dataInfoProvider"    # Lcom/vk/lists/PaginateHelper$DataInfoProvider;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "uiControl"    # Lcom/vk/lists/PaginateHelper$UIControl;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "preloadScrollListener"    # Lcom/vk/lists/PreloadScrollListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "loadingStartOffset"    # I
    .param p7, "loadingEnabledByDefault"    # Z
    .param p8, "pageSize"    # I
    .param p9, "defaultNextFrom"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lcom/vk/lists/PaginateHelper$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/lists/PaginateHelper$1;-><init>(Lcom/vk/lists/PaginateHelper;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiHandler:Landroid/os/Handler;

    .line 51
    new-instance v0, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;-><init>(Lcom/vk/lists/PaginateHelper;Lcom/vk/lists/PaginateHelper$1;)V

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper;->scrollListener:Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;

    .line 52
    new-instance v0, Lcom/vk/lists/NextFromHolder;

    invoke-direct {v0}, Lcom/vk/lists/NextFromHolder;-><init>()V

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    .line 283
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingInProgress:Z

    .line 284
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingEnabled:Z

    .line 333
    new-instance v0, Lcom/vk/lists/PaginateHelper$7;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginateHelper$7;-><init>(Lcom/vk/lists/PaginateHelper;)V

    iput-object v0, p0, Lcom/vk/lists/PaginateHelper;->requestObservableTransform:Lio/reactivex/ObservableTransformer;

    .line 73
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You should provide PagedDataProvider"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_0
    iput p6, p0, Lcom/vk/lists/PaginateHelper;->loadingStartOffset:I

    .line 77
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    .line 78
    iput-object p2, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    .line 79
    iput-object p3, p0, Lcom/vk/lists/PaginateHelper;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 80
    iput-object p4, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    .line 81
    iput-object p5, p0, Lcom/vk/lists/PaginateHelper;->preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

    .line 82
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0, p8}, Lcom/vk/lists/NextFromHolder;->setPageSize(I)V

    .line 83
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0, p9}, Lcom/vk/lists/NextFromHolder;->setNextFrom(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p0, p7}, Lcom/vk/lists/PaginateHelper;->setLoadingEnabled(Z)V

    .line 85
    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;Lcom/vk/lists/PaginateHelper$DataInfoProvider;Lcom/vk/lists/PaginateHelper$UIControl;Lcom/vk/lists/PreloadScrollListener;IZILjava/lang/String;Lcom/vk/lists/PaginateHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;
    .param p2, "x1"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;
    .param p3, "x2"    # Lcom/vk/lists/PaginateHelper$DataInfoProvider;
    .param p4, "x3"    # Lcom/vk/lists/PaginateHelper$UIControl;
    .param p5, "x4"    # Lcom/vk/lists/PreloadScrollListener;
    .param p6, "x5"    # I
    .param p7, "x6"    # Z
    .param p8, "x7"    # I
    .param p9, "x8"    # Ljava/lang/String;
    .param p10, "x9"    # Lcom/vk/lists/PaginateHelper$1;

    .prologue
    .line 37
    invoke-direct/range {p0 .. p9}, Lcom/vk/lists/PaginateHelper;-><init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;Lcom/vk/lists/PaginateHelper$DataInfoProvider;Lcom/vk/lists/PaginateHelper$UIControl;Lcom/vk/lists/PreloadScrollListener;IZILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/lists/PaginateHelper;)Lcom/vk/lists/PaginateHelper$UIControl;
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/lists/PaginateHelper;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    iget v0, p0, Lcom/vk/lists/PaginateHelper;->loadingStartOffset:I

    return v0
.end method

.method static synthetic access$1100(Lcom/vk/lists/PaginateHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingEnabled:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->stopLoading()V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/lists/PaginateHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->isInErrorState:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vk/lists/PaginateHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/vk/lists/PaginateHelper;->isInErrorState:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->checkState()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/lists/PaginateHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isListEmpty()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showBigError()V

    return-void
.end method

.method static synthetic access$600(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showSmallError()V

    return-void
.end method

.method static synthetic access$700(Lcom/vk/lists/PaginateHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isLoadingInProgress()Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showNoItems()V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showList()V

    return-void
.end method

.method private checkState()V
    .locals 3

    .prologue
    .line 233
    new-instance v0, Lcom/vk/lists/PaginateHelper$6;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginateHelper$6;-><init>(Lcom/vk/lists/PaginateHelper;)V

    .line 251
    .local v0, "checkStateRunnable":Ljava/lang/Runnable;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 252
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 256
    :goto_0
    return-void

    .line 254
    :cond_0
    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static createWithOffset(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 1
    .param p0, "pagedDataProviderWithOffset"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    .prologue
    .line 366
    new-instance v0, Lcom/vk/lists/PaginateHelper$Builder;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginateHelper$Builder;-><init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;)V

    return-object v0
.end method

.method public static createWithStartFrom(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;)Lcom/vk/lists/PaginateHelper$Builder;
    .locals 1
    .param p0, "pagedDataProviderWithStartFrom"    # Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    .prologue
    .line 370
    new-instance v0, Lcom/vk/lists/PaginateHelper$Builder;

    invoke-direct {v0, p0}, Lcom/vk/lists/PaginateHelper$Builder;-><init>(Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;)V

    return-object v0
.end method

.method private hideRefreshIndicator()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 228
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 229
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->uiHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 230
    return-void
.end method

.method private isListEmpty()Z
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->dataInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$DataInfoProvider;->isListEmpty()Z

    move-result v0

    return v0
.end method

.method private isLoadingInProgress()Z
    .locals 1

    .prologue
    .line 287
    iget-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingInProgress:Z

    return v0
.end method

.method private showBigError()V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showBigError()V

    .line 225
    return-void
.end method

.method private showBigLoading()V
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showBigLoading()V

    .line 217
    return-void
.end method

.method private showList()V
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showRecycler()V

    .line 205
    return-void
.end method

.method private showNoItems()V
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showNoItems()V

    .line 209
    return-void
.end method

.method private showSmallError()V
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showSmallError()V

    .line 221
    return-void
.end method

.method private showSmallLoading()V
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->uiControl:Lcom/vk/lists/PaginateHelper$UIControl;

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->showSmallLoading()V

    .line 213
    return-void
.end method

.method private startLoading(Z)V
    .locals 1
    .param p1, "isPullToRefreshReload"    # Z

    .prologue
    .line 291
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingInProgress:Z

    .line 292
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isListEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 293
    if-nez p1, :cond_0

    .line 294
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showBigLoading()V

    .line 299
    :cond_0
    :goto_0
    return-void

    .line 297
    :cond_1
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->showSmallLoading()V

    goto :goto_0
.end method

.method private stopLoading()V
    .locals 1

    .prologue
    .line 302
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingInProgress:Z

    .line 303
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->hideRefreshIndicator()V

    .line 304
    return-void
.end method


# virtual methods
.method public bind(Lcom/vk/lists/PaginateHelper$PaginatedView;Z)V
    .locals 2
    .param p1, "view"    # Lcom/vk/lists/PaginateHelper$PaginatedView;
    .param p2, "reloadOnBind"    # Z

    .prologue
    .line 90
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    .line 91
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->scrollListener:Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 95
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    new-instance v1, Lcom/vk/lists/PaginateHelper$2;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$2;-><init>(Lcom/vk/lists/PaginateHelper;)V

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 101
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    new-instance v1, Lcom/vk/lists/PaginateHelper$3;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$3;-><init>(Lcom/vk/lists/PaginateHelper;)V

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 107
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    new-instance v1, Lcom/vk/lists/PaginateHelper$4;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$4;-><init>(Lcom/vk/lists/PaginateHelper;)V

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 114
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    new-instance v1, Lcom/vk/lists/PaginateHelper$5;

    invoke-direct {v1, p0}, Lcom/vk/lists/PaginateHelper$5;-><init>(Lcom/vk/lists/PaginateHelper;)V

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 131
    iget-boolean v0, p0, Lcom/vk/lists/PaginateHelper;->loadingEnabled:Z

    if-eqz v0, :cond_2

    if-nez p2, :cond_1

    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isListEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 132
    :cond_1
    invoke-virtual {p0}, Lcom/vk/lists/PaginateHelper;->reload()V

    .line 134
    :cond_2
    return-void
.end method

.method public getIntNextFrom()I
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0}, Lcom/vk/lists/NextFromHolder;->getIntNextFrom()I

    move-result v0

    return v0
.end method

.method public getNextFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0}, Lcom/vk/lists/NextFromHolder;->getNextFrom()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPageSize()I
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0}, Lcom/vk/lists/NextFromHolder;->getPageSize()I

    move-result v0

    return v0
.end method

.method public incrementPage(I)V
    .locals 2
    .param p1, "totalCount"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "You shouldn\'t call incrementPage with pagedDataProviderWithStartFrom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0, p1}, Lcom/vk/lists/NextFromHolder;->incrementNextFrom(I)V

    .line 174
    return-void
.end method

.method public loadNext()V
    .locals 4

    .prologue
    .line 307
    invoke-virtual {p0}, Lcom/vk/lists/PaginateHelper;->getNextFrom()Ljava/lang/String;

    move-result-object v0

    .line 308
    .local v0, "nf":Ljava/lang/String;
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isLoadingInProgress()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 309
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/lists/PaginateHelper;->startLoading(Z)V

    .line 310
    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    if-eqz v1, :cond_1

    .line 311
    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    invoke-interface {v2, v0, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;->loadNext(Ljava/lang/String;Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/lists/PaginateHelper;->requestObservableTransform:Lio/reactivex/ObservableTransformer;

    .line 312
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v2

    .line 311
    invoke-interface {v1, v2, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;->onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V

    .line 318
    :cond_0
    :goto_0
    return-void

    .line 314
    :cond_1
    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    invoke-virtual {p0}, Lcom/vk/lists/PaginateHelper;->getIntNextFrom()I

    move-result v3

    invoke-interface {v2, v3, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;->loadNext(ILcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/lists/PaginateHelper;->requestObservableTransform:Lio/reactivex/ObservableTransformer;

    .line 315
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v2

    .line 314
    invoke-interface {v1, v2, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;->onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V

    goto :goto_0
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper;->reload(Z)V

    .line 262
    return-void
.end method

.method public reload(Z)V
    .locals 3
    .param p1, "isPullToRefreshReload"    # Z

    .prologue
    .line 265
    invoke-direct {p0}, Lcom/vk/lists/PaginateHelper;->isLoadingInProgress()Z

    move-result v0

    if-nez v0, :cond_0

    .line 266
    invoke-direct {p0, p1}, Lcom/vk/lists/PaginateHelper;->startLoading(Z)V

    .line 267
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    if-eqz v0, :cond_1

    .line 268
    const-string/jumbo v0, "0"

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper;->setNextFrom(Ljava/lang/String;)V

    .line 269
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    invoke-interface {v1, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;->reload(Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper;->requestObservableTransform:Lio/reactivex/ObservableTransformer;

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;->onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 271
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/lists/PaginateHelper;->setIntNextFrom(I)V

    .line 272
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithOffset:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;

    invoke-interface {v1, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;->reload(Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/lists/PaginateHelper;->requestObservableTransform:Lio/reactivex/ObservableTransformer;

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;->onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V

    goto :goto_0
.end method

.method public setIntNextFrom(I)V
    .locals 1
    .param p1, "nextFrom"    # I

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0, p1}, Lcom/vk/lists/NextFromHolder;->setIntNextFrom(I)V

    .line 157
    return-void
.end method

.method public setLoadingEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 278
    iput-boolean p1, p0, Lcom/vk/lists/PaginateHelper;->loadingEnabled:Z

    .line 279
    return-void
.end method

.method public setNextFrom(Ljava/lang/String;)V
    .locals 2
    .param p1, "nextFrom"    # Ljava/lang/String;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->pagedDataProviderWithStartFrom:Lcom/vk/lists/PaginateHelper$PagedDataProviderWithStartFrom;

    if-nez v0, :cond_0

    .line 188
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "You shouldn\'t call setNextFrom with pagedDataProviderWithOffset"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->nextFromHolder:Lcom/vk/lists/NextFromHolder;

    invoke-virtual {v0, p1}, Lcom/vk/lists/NextFromHolder;->setNextFrom(Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public unbind()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 137
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->preloadScrollListener:Lcom/vk/lists/PreloadScrollListener;

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    iget-object v1, p0, Lcom/vk/lists/PaginateHelper;->scrollListener:Lcom/vk/lists/PaginateHelper$InfiniteOnScrollListener;

    invoke-interface {v0, v1}, Lcom/vk/lists/PaginateHelper$PaginatedView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 142
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    invoke-interface {v0, v2}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 143
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    invoke-interface {v0, v2}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 144
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    invoke-interface {v0, v2}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnReloadRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 145
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    invoke-interface {v0, v2}, Lcom/vk/lists/PaginateHelper$PaginatedView;->setOnLoadNextRetryClickListener(Lcom/vk/lists/OnRetryClickListener;)V

    .line 146
    iput-object v2, p0, Lcom/vk/lists/PaginateHelper;->bindedView:Lcom/vk/lists/PaginateHelper$PaginatedView;

    .line 148
    :cond_1
    return-void
.end method
