.class Lcom/vk/lists/PreloadScrollListener;
.super Lcom/vk/lists/RecyclerViewScrollDetector;
.source "PreloadScrollListener.java"


# instance fields
.field private firstVisible:I

.field private itemsCount:I

.field private lastVisible:I

.field private final preloadCallback:Lcom/vk/lists/PreloadCallback;

.field private final preloadCount:I

.field private final preloadInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;


# direct methods
.method public constructor <init>(ILcom/vk/lists/PreloadCallback;Lcom/vk/lists/PaginateHelper$DataInfoProvider;)V
    .locals 1
    .param p1, "preloadCount"    # I
    .param p2, "preloadCallback"    # Lcom/vk/lists/PreloadCallback;
    .param p3, "preloadInfoProvider"    # Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .prologue
    const/4 v0, -0x1

    .line 15
    invoke-direct {p0}, Lcom/vk/lists/RecyclerViewScrollDetector;-><init>()V

    .line 11
    iput v0, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    .line 12
    iput v0, p0, Lcom/vk/lists/PreloadScrollListener;->firstVisible:I

    .line 13
    iput v0, p0, Lcom/vk/lists/PreloadScrollListener;->lastVisible:I

    .line 16
    iput p1, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCount:I

    .line 17
    iput-object p2, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    .line 18
    iput-object p3, p0, Lcom/vk/lists/PreloadScrollListener;->preloadInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    .line 19
    return-void
.end method


# virtual methods
.method public onScrollDown()V
    .locals 3

    .prologue
    .line 76
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    if-nez v2, :cond_1

    .line 91
    :cond_0
    return-void

    .line 79
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCount:I

    if-ge v0, v2, :cond_0

    .line 80
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->firstVisible:I

    sub-int v1, v2, v0

    .line 81
    .local v1, "preloadPosition":I
    if-ltz v1, :cond_0

    .line 83
    :try_start_0
    iget-object v2, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    invoke-interface {v2, v1}, Lcom/vk/lists/PreloadCallback;->preload(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public onScrollUp()V
    .locals 3

    .prologue
    .line 57
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    if-nez v2, :cond_1

    .line 72
    :cond_0
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCount:I

    if-ge v0, v2, :cond_0

    .line 61
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->lastVisible:I

    add-int v1, v2, v0

    .line 62
    .local v1, "preloadPosition":I
    iget v2, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    if-ge v1, v2, :cond_0

    .line 64
    :try_start_0
    iget-object v2, p0, Lcom/vk/lists/PreloadScrollListener;->preloadCallback:Lcom/vk/lists/PreloadCallback;

    invoke-interface {v2, v1}, Lcom/vk/lists/PreloadCallback;->preload(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 23
    invoke-static {p1}, Lcom/vk/lists/PaginationUtil;->getFirstVisiblePosition(Landroid/support/v7/widget/RecyclerView;)I

    move-result v2

    .line 24
    .local v2, "firstVisibleItem":I
    invoke-static {p1}, Lcom/vk/lists/PaginationUtil;->getLastVisiblePosition(Landroid/support/v7/widget/RecyclerView;)I

    move-result v3

    .line 25
    .local v3, "lastVisiblePosition":I
    iget-object v5, p0, Lcom/vk/lists/PreloadScrollListener;->preloadInfoProvider:Lcom/vk/lists/PaginateHelper$DataInfoProvider;

    invoke-interface {v5}, Lcom/vk/lists/PaginateHelper$DataInfoProvider;->getItemsCount()I

    move-result v4

    .line 29
    .local v4, "realItemCount":I
    if-gez v2, :cond_0

    .line 30
    const/4 v0, 0x0

    .line 36
    .local v0, "_firstVisible":I
    :goto_0
    if-gez v3, :cond_1

    .line 37
    const/4 v1, 0x0

    .line 44
    .local v1, "_lastVisible":I
    :goto_1
    iget v5, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    if-ne v5, v4, :cond_3

    iget v5, p0, Lcom/vk/lists/PreloadScrollListener;->firstVisible:I

    if-ne v5, v0, :cond_3

    iget v5, p0, Lcom/vk/lists/PreloadScrollListener;->lastVisible:I

    if-ne v5, v1, :cond_3

    .line 53
    :goto_2
    return-void

    .line 32
    .end local v0    # "_firstVisible":I
    .end local v1    # "_lastVisible":I
    :cond_0
    move v0, v2

    .restart local v0    # "_firstVisible":I
    goto :goto_0

    .line 38
    :cond_1
    if-ge v3, v4, :cond_2

    .line 39
    move v1, v3

    .restart local v1    # "_lastVisible":I
    goto :goto_1

    .line 41
    .end local v1    # "_lastVisible":I
    :cond_2
    add-int/lit8 v1, v4, -0x1

    .restart local v1    # "_lastVisible":I
    goto :goto_1

    .line 47
    :cond_3
    iput v4, p0, Lcom/vk/lists/PreloadScrollListener;->itemsCount:I

    .line 48
    iput v0, p0, Lcom/vk/lists/PreloadScrollListener;->firstVisible:I

    .line 49
    iput v1, p0, Lcom/vk/lists/PreloadScrollListener;->lastVisible:I

    .line 51
    invoke-super {p0, p1, p2, p3}, Lcom/vk/lists/RecyclerViewScrollDetector;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    goto :goto_2
.end method
