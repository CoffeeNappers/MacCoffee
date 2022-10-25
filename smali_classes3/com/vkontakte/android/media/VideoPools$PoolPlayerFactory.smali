.class abstract Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;
.super Ljava/lang/Object;
.source "VideoPools.java"

# interfaces
.implements Lcom/vkontakte/android/media/VideoPools$PlayerFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VideoPools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "PoolPlayerFactory"
.end annotation


# instance fields
.field final context:Landroid/content/Context;

.field final pool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/media/VideoPools$PlayerHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    .line 334
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->context:Landroid/content/Context;

    .line 335
    return-void
.end method


# virtual methods
.method public declared-synchronized attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z
    .locals 2
    .param p2, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/media/VideoPools$PlayerContext;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 367
    .local p1, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 368
    .local v0, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    if-eqz v0, :cond_0

    .line 369
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->attachCallbacks(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    const/4 v1, 0x1

    .line 372
    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 367
    .end local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected abstract createPlayer(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public declared-synchronized detachContext(Landroid/support/v4/util/Pair;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 378
    .local v0, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    if-eqz v0, :cond_0

    .line 379
    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->detachCallbacks()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    const/4 v1, 0x1

    .line 382
    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 377
    .end local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;
    .locals 5
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "quality"    # I
    .param p4, "useVigo"    # Z
    .param p5, "autoplay"    # Z
    .param p6, "referrer"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "IZZ",
            "Ljava/lang/String;",
            ")",
            "Lcom/vkontakte/android/media/AbsVideoPlayer;"
        }
    .end annotation

    .prologue
    .line 341
    .local p1, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    monitor-enter p0

    const/4 v1, 0x2

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "AUTOPLAY"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "getPlayer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 342
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 343
    .local v0, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    if-nez v0, :cond_0

    .line 344
    new-instance v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .end local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    iget-object v2, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->context:Landroid/content/Context;

    iget-object v1, p1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, v2, v1, p6}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->createPlayer(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;-><init>(Lcom/vkontakte/android/media/AbsVideoPlayer;Lcom/vkontakte/android/media/VideoPools$1;)V

    .line 345
    .restart local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->lastURL:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->lastURL:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 348
    :cond_1
    iput-object p2, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->lastURL:Ljava/lang/String;

    .line 349
    iget-object v1, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1, p2, p3, p4, p5}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setDataSourceAndPrepare(Ljava/lang/String;IZZ)V

    .line 351
    :cond_2
    iget-object v1, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->refCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 356
    iget-object v1, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 341
    .end local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized releasePlayer(Landroid/support/v4/util/Pair;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 387
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 388
    .local v0, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    if-eqz v0, :cond_1

    .line 393
    iget-object v2, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->refCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v2

    if-nez v2, :cond_0

    .line 394
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "AUTOPLAY"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "releasePlayer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 395
    iget-object v2, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/AbsVideoPlayer;->stopAndRelease()V

    .line 396
    iget-object v2, v0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v2}, Lcom/vkontakte/android/media/AbsVideoPlayer;->sendViewedRanges()V

    .line 397
    iget-object v2, p0, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    :cond_0
    :goto_0
    monitor-exit p0

    return v1

    :cond_1
    move v1, v2

    goto :goto_0

    .line 387
    .end local v0    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
