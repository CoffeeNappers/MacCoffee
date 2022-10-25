.class public Lme/grishka/appkit/preloading/ListPreloader;
.super Ljava/lang/Object;
.source "ListPreloader.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private isIncreasing:Z

.field private lastEnd:I

.field private lastFirstVisible:I

.field private lastStart:I

.field private final maxPreload:I

.field private preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

.field private final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "maxPreload"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->isIncreasing:Z

    .line 36
    iput p1, p0, Lme/grishka/appkit/preloading/ListPreloader;->maxPreload:I

    .line 37
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    .line 38
    return-void
.end method

.method private addToQueue(Lcom/facebook/datasource/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/lang/Void;>;"
    iget-object v1, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    iget v2, p0, Lme/grishka/appkit/preloading/ListPreloader;->maxPreload:I

    if-le v1, v2, :cond_0

    .line 142
    iget-object v1, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/datasource/DataSource;

    .line 143
    .local v0, "ds":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/lang/Void;>;"
    if-eqz v0, :cond_0

    .line 144
    invoke-interface {v0}, Lcom/facebook/datasource/DataSource;->close()Z

    .line 147
    .end local v0    # "ds":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/lang/Void;>;"
    :cond_0
    iget-object v1, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 148
    return-void
.end method

.method private cancelAll()V
    .locals 2

    .prologue
    .line 132
    :cond_0
    :goto_0
    iget-object v1, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 133
    iget-object v1, p0, Lme/grishka/appkit/preloading/ListPreloader;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/datasource/DataSource;

    .line 134
    .local v0, "ds":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/lang/Void;>;"
    if-eqz v0, :cond_0

    .line 135
    invoke-interface {v0}, Lcom/facebook/datasource/DataSource;->close()Z

    goto :goto_0

    .line 138
    .end local v0    # "ds":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/lang/Void;>;"
    :cond_1
    return-void
.end method

.method private preload(II)V
    .locals 6
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v5, 0x0

    .line 81
    if-ge p1, p2, :cond_0

    .line 82
    iget v4, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastEnd:I

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 83
    .local v2, "start":I
    move v0, p2

    .line 88
    .local v0, "end":I
    :goto_0
    iget-object v4, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    invoke-interface {v4}, Lme/grishka/appkit/preloading/PrefetchInfoProvider;->getItemCount()I

    move-result v3

    .line 89
    .local v3, "total":I
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 90
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 92
    if-ge p1, p2, :cond_1

    .line 94
    move v1, v2

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 95
    const/4 v4, 0x1

    invoke-direct {p0, v1, v4}, Lme/grishka/appkit/preloading/ListPreloader;->preloadAdapterPosition(IZ)V

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 85
    .end local v0    # "end":I
    .end local v1    # "i":I
    .end local v2    # "start":I
    .end local v3    # "total":I
    :cond_0
    move v2, p2

    .line 86
    .restart local v2    # "start":I
    iget v4, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastStart:I

    invoke-static {v4, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "end":I
    goto :goto_0

    .line 99
    .restart local v3    # "total":I
    :cond_1
    add-int/lit8 v1, v0, -0x1

    .restart local v1    # "i":I
    :goto_2
    if-lt v1, v2, :cond_2

    .line 100
    invoke-direct {p0, v1, v5}, Lme/grishka/appkit/preloading/ListPreloader;->preloadAdapterPosition(IZ)V

    .line 99
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 104
    :cond_2
    iput v2, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastStart:I

    .line 105
    iput v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastEnd:I

    .line 106
    return-void
.end method

.method private preload(IZ)V
    .locals 1
    .param p1, "start"    # I
    .param p2, "increasing"    # Z

    .prologue
    .line 71
    iget-boolean v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->isIncreasing:Z

    if-eq v0, p2, :cond_0

    .line 72
    iput-boolean p2, p0, Lme/grishka/appkit/preloading/ListPreloader;->isIncreasing:Z

    .line 73
    invoke-direct {p0}, Lme/grishka/appkit/preloading/ListPreloader;->cancelAll()V

    .line 75
    :cond_0
    if-eqz p2, :cond_1

    iget v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->maxPreload:I

    :goto_0
    add-int/2addr v0, p1

    invoke-direct {p0, p1, v0}, Lme/grishka/appkit/preloading/ListPreloader;->preload(II)V

    .line 76
    return-void

    .line 75
    :cond_1
    iget v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->maxPreload:I

    neg-int v0, v0

    goto :goto_0
.end method

.method private preloadAdapterPosition(IZ)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "isIncreasing"    # Z

    .prologue
    .line 109
    iget-object v2, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    invoke-interface {v2, p1}, Lme/grishka/appkit/preloading/PrefetchInfoProvider;->getImageCountForItem(I)I

    move-result v1

    .line 110
    .local v1, "numItems":I
    if-eqz p2, :cond_0

    .line 111
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 112
    iget-object v2, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    invoke-interface {v2, p1, v0}, Lme/grishka/appkit/preloading/PrefetchInfoProvider;->getImageURL(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lme/grishka/appkit/preloading/ListPreloader;->preloadItem(Ljava/lang/String;)V

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 115
    .end local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_1
    if-ltz v0, :cond_1

    .line 116
    iget-object v2, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    invoke-interface {v2, p1, v0}, Lme/grishka/appkit/preloading/PrefetchInfoProvider;->getImageURL(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lme/grishka/appkit/preloading/ListPreloader;->preloadItem(Ljava/lang/String;)V

    .line 115
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 119
    :cond_1
    return-void
.end method

.method private preloadItem(Ljava/lang/String;)V
    .locals 4
    .param p1, "item"    # Ljava/lang/String;

    .prologue
    .line 123
    if-nez p1, :cond_0

    .line 129
    :goto_0
    return-void

    .line 126
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 127
    .local v0, "builder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    sget-object v1, Lcom/vk/imageloader/view/VKImageView;->ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 128
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v1

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/facebook/imagepipeline/core/ImagePipeline;->prefetchToBitmapCache(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/datasource/DataSource;

    move-result-object v1

    invoke-direct {p0, v1}, Lme/grishka/appkit/preloading/ListPreloader;->addToQueue(Lcom/facebook/datasource/DataSource;)V

    goto :goto_0
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2
    .param p1, "absListView"    # Landroid/widget/AbsListView;
    .param p2, "firstVisible"    # I
    .param p3, "visibleCount"    # I
    .param p4, "totalCount"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    if-eqz v0, :cond_1

    .line 60
    iget v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastFirstVisible:I

    if-le p2, v0, :cond_2

    .line 61
    add-int v0, p2, p3

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lme/grishka/appkit/preloading/ListPreloader;->preload(IZ)V

    .line 65
    :cond_0
    :goto_0
    iput p2, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastFirstVisible:I

    .line 67
    :cond_1
    return-void

    .line 62
    :cond_2
    iget v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->lastFirstVisible:I

    if-ge p2, v0, :cond_0

    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lme/grishka/appkit/preloading/ListPreloader;->preload(IZ)V

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p1, "absListView"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 54
    return-void
.end method

.method public setProvider(Lme/grishka/appkit/preloading/PrefetchInfoProvider;)V
    .locals 0
    .param p1, "provider"    # Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    .prologue
    .line 41
    iput-object p1, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    .line 42
    return-void
.end method

.method public update(II)V
    .locals 2
    .param p1, "firstVisible"    # I
    .param p2, "visibleCount"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lme/grishka/appkit/preloading/ListPreloader;->preloadModelProvider:Lme/grishka/appkit/preloading/PrefetchInfoProvider;

    if-eqz v0, :cond_0

    .line 46
    invoke-direct {p0}, Lme/grishka/appkit/preloading/ListPreloader;->cancelAll()V

    .line 47
    add-int v0, p1, p2

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lme/grishka/appkit/preloading/ListPreloader;->preload(IZ)V

    .line 49
    :cond_0
    return-void
.end method
