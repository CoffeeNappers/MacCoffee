.class public Lcom/vkontakte/android/media/VideoRecyclerViewHelper;
.super Ljava/lang/Object;
.source "VideoRecyclerViewHelper.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Lcom/vkontakte/android/media/AutoPlay$Listener;


# static fields
.field private static final BEYOND_ITEMS_TO_PRELOAD:I = 0x1e

.field public static final CAN_PLAY_IDLE_STATE:F = 0.5f

.field public static final CAN_PLAY_SLOW_STATE:F = 0.2f

.field private static final TAG:Ljava/lang/String; = "VideoRecyclerViewHelper"


# instance fields
.field private final candidates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private gifAutoPlay:Z

.field private lastFirstVisible:I

.field private lastVisibleCount:I

.field private playingNow:Lcom/vkontakte/android/media/AutoPlay;

.field private final preloadByDirection:I

.field private provider:Lcom/vkontakte/android/media/AutoPlayProvider;

.field private final queue:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation
.end field

.field private scrollState:I

.field private final toRemove:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation
.end field

.field private videoAutoPlay:Z

.field private final videosPos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/vkontakte/android/media/AutoPlay;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final videosShift:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, -0x1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    .line 32
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    .line 33
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    .line 34
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosShift:Ljava/util/TreeMap;

    .line 35
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosPos:Ljava/util/Map;

    .line 43
    iput v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->context:Landroid/content/Context;

    .line 50
    const/4 v3, -0x1

    .line 52
    .local v3, "size":I
    invoke-static {}, Lcom/vkontakte/android/auth/configs/VideoConfig;->getInstance()Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v1

    .line 53
    .local v1, "config":Lcom/vkontakte/android/auth/configs/VideoConfig;
    if-eqz v1, :cond_0

    .line 54
    invoke-virtual {v1}, Lcom/vkontakte/android/auth/configs/VideoConfig;->getPoolSize()I

    move-result v3

    .line 57
    :cond_0
    if-ne v3, v5, :cond_1

    .line 58
    const-string/jumbo v4, "activity"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 59
    .local v0, "activityManager":Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v2

    .line 60
    .local v2, "memClass":I
    const/16 v4, 0xc0

    if-lt v2, v4, :cond_2

    const/4 v3, 0x2

    .line 63
    .end local v0    # "activityManager":Landroid/app/ActivityManager;
    .end local v2    # "memClass":I
    :cond_1
    :goto_0
    iput v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadByDirection:I

    .line 64
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->checkAutoPlayPreferences()V

    .line 65
    return-void

    .line 60
    .restart local v0    # "activityManager":Landroid/app/ActivityManager;
    .restart local v2    # "memClass":I
    :cond_2
    const/16 v4, 0x40

    if-le v2, v4, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private add(Lcom/vkontakte/android/media/AutoPlay;I)V
    .locals 4
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;
    .param p2, "key"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 369
    if-eqz p1, :cond_1

    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    .line 371
    invoke-interface {p1, p0}, Lcom/vkontakte/android/media/AutoPlay;->setListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V

    .line 372
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->getType()Lcom/vkontakte/android/media/AutoPlay$Type;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->canPlayByType(Lcom/vkontakte/android/media/AutoPlay$Type;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 373
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->prepare()V

    .line 375
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 376
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "VideoRecyclerViewHelper"

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Video add at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 381
    :cond_1
    :goto_0
    return-void

    .line 378
    :cond_2
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "VideoRecyclerViewHelper"

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Video at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is already added"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private canPlayByType(Lcom/vkontakte/android/media/AutoPlay$Type;)Z
    .locals 1
    .param p1, "type"    # Lcom/vkontakte/android/media/AutoPlay$Type;

    .prologue
    .line 272
    sget-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->VIDEO:Lcom/vkontakte/android/media/AutoPlay$Type;

    if-ne p1, v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videoAutoPlay:Z

    if-nez v0, :cond_1

    :cond_0
    sget-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->GIF:Lcom/vkontakte/android/media/AutoPlay$Type;

    if-ne p1, v0, :cond_2

    iget-boolean v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->gifAutoPlay:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private cancel(I)V
    .locals 5
    .param p1, "key"    # I

    .prologue
    .line 395
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 396
    .local v0, "autoPlay":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v0, :cond_0

    .line 397
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->stop()V

    .line 398
    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/AutoPlay;->removeListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V

    .line 399
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 400
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VideoRecyclerViewHelper"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Video cancel at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 402
    :cond_0
    return-void
.end method

.method private cancel(Lcom/vkontakte/android/media/AutoPlay;)V
    .locals 2
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;

    .prologue
    .line 405
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 406
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_1

    .line 407
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancel(I)V

    .line 411
    :cond_0
    return-void

    .line 405
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private cancelAll()V
    .locals 5

    .prologue
    .line 384
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 385
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 384
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 387
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 388
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancel(I)V

    .line 387
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 390
    :cond_1
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VideoRecyclerViewHelper"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Canceled "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " videos"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 391
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 392
    return-void
.end method

.method private cancelFurther()V
    .locals 8

    .prologue
    .line 330
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 331
    .local v5, "size":I
    if-lez v5, :cond_5

    .line 332
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    .line 333
    .local v0, "firstKey":I
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    add-int/lit8 v7, v5, -0x1

    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    .line 335
    .local v4, "lastKey":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v5, :cond_3

    iget v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadByDirection:I

    mul-int/lit8 v6, v6, 0x2

    add-int/lit8 v6, v6, 0x1

    iget-object v7, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    sub-int/2addr v6, v7

    if-le v5, v6, :cond_3

    .line 336
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 337
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v6, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 338
    .local v3, "key":I
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v6, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_2

    .line 339
    if-lt v3, v0, :cond_0

    if-le v3, v4, :cond_2

    .line 340
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    iget-object v7, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v7, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v3, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 335
    .end local v3    # "key":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 336
    .restart local v3    # "key":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 347
    .end local v2    # "j":I
    .end local v3    # "key":I
    :cond_3
    const/4 v1, 0x0

    :goto_2
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    if-ge v1, v6, :cond_4

    .line 348
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancel(I)V

    .line 347
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 350
    :cond_4
    iget-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->toRemove:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->clear()V

    .line 352
    .end local v0    # "firstKey":I
    .end local v1    # "i":I
    .end local v4    # "lastKey":I
    :cond_5
    return-void
.end method

.method private checkAutoPlayPreferences()V
    .locals 1

    .prologue
    .line 68
    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->allowAutoPlayVideo()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videoAutoPlay:Z

    .line 69
    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->allowAutoPlay()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->gifAutoPlay:Z

    .line 70
    return-void
.end method

.method private clear()V
    .locals 1

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancelAll()V

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 98
    return-void
.end method

.method private findCandidates(IIZ)V
    .locals 9
    .param p1, "start"    # I
    .param p2, "lookUpCount"    # I
    .param p3, "increasing"    # Z

    .prologue
    const/4 v6, 0x1

    .line 289
    const/4 v2, 0x0

    .line 290
    .local v2, "found":I
    const/4 v0, 0x0

    .line 291
    .local v0, "counter":I
    move v3, p1

    .local v3, "index":I
    move v1, v0

    .line 292
    .end local v0    # "counter":I
    .local v1, "counter":I
    :goto_0
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "counter":I
    .restart local v0    # "counter":I
    if-ge v1, p2, :cond_2

    iget v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadByDirection:I

    if-gt v2, v5, :cond_2

    if-ltz v3, :cond_2

    .line 293
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    invoke-interface {v5, v3}, Lcom/vkontakte/android/media/AutoPlayProvider;->getItem(I)Lcom/vkontakte/android/media/AutoPlay;

    move-result-object v4

    .line 294
    .local v4, "item":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v4, :cond_0

    .line 295
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 296
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "VideoRecyclerViewHelper"

    aput-object v8, v5, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Candidate at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 297
    add-int/lit8 v2, v2, 0x1

    .line 299
    :cond_0
    if-eqz p3, :cond_1

    move v5, v6

    :goto_1
    add-int/2addr v3, v5

    move v1, v0

    .line 300
    .end local v0    # "counter":I
    .restart local v1    # "counter":I
    goto :goto_0

    .line 299
    .end local v1    # "counter":I
    .restart local v0    # "counter":I
    :cond_1
    const/4 v5, -0x1

    goto :goto_1

    .line 301
    .end local v4    # "item":Lcom/vkontakte/android/media/AutoPlay;
    :cond_2
    return-void
.end method

.method private getVideoToPlay(II)Landroid/support/v4/util/Pair;
    .locals 8
    .param p1, "firstVisible"    # I
    .param p2, "visibleCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Landroid/support/v4/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation

    .prologue
    .line 249
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosPos:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    .line 250
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosShift:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->clear()V

    .line 251
    move v1, p1

    .local v1, "i":I
    :goto_0
    add-int v5, p1, p2

    if-gt v1, v5, :cond_2

    .line 252
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    invoke-interface {v5, v1}, Lcom/vkontakte/android/media/AutoPlayProvider;->getItem(I)Lcom/vkontakte/android/media/AutoPlay;

    move-result-object v2

    .line 253
    .local v2, "item":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v2, :cond_1

    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->getType()Lcom/vkontakte/android/media/AutoPlay$Type;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->canPlayByType(Lcom/vkontakte/android/media/AutoPlay$Type;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 254
    :cond_0
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->getScreenCenterDistance()I

    move-result v4

    .line 255
    .local v4, "shift":I
    if-ltz v4, :cond_1

    .line 256
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosPos:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosShift:Ljava/util/TreeMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .end local v4    # "shift":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 262
    .end local v2    # "item":Lcom/vkontakte/android/media/AutoPlay;
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosShift:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 263
    new-instance v5, Landroid/support/v4/util/Pair;

    const/4 v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 267
    :goto_1
    return-object v5

    .line 265
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosShift:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 266
    .local v0, "autoPlay":Lcom/vkontakte/android/media/AutoPlay;
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->videosPos:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 267
    .local v3, "position":I
    new-instance v5, Landroid/support/v4/util/Pair;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private preload(IIIZ)V
    .locals 4
    .param p1, "start"    # I
    .param p2, "visibleCount"    # I
    .param p3, "totalCount"    # I
    .param p4, "increasing"    # Z

    .prologue
    const/16 v2, 0x1e

    .line 276
    div-int/lit8 v3, p2, 0x2

    add-int v0, p1, v3

    .line 277
    .local v0, "center":I
    sub-int v3, p3, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 278
    .local v1, "lookUpCountDown":I
    if-lt p1, v2, :cond_0

    .line 280
    .local v2, "lookUpCountUp":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 281
    const/4 v3, 0x1

    invoke-direct {p0, v0, v1, v3}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->findCandidates(IIZ)V

    .line 282
    const/4 v3, 0x0

    invoke-direct {p0, v0, v2, v3}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->findCandidates(IIZ)V

    .line 283
    invoke-direct {p0, p4}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->trimCandidates(Z)V

    .line 284
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancelFurther()V

    .line 285
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadCandidates()V

    .line 286
    return-void

    .line 278
    .end local v2    # "lookUpCountUp":I
    :cond_0
    sub-int v3, v0, p1

    add-int/lit8 v2, v3, 0x1

    goto :goto_0
.end method

.method private preloadCandidates()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 355
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 356
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 357
    .local v1, "key":I
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/media/AutoPlay;

    .line 358
    .local v2, "val":Lcom/vkontakte/android/media/AutoPlay;
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->isPrepared()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 359
    new-array v3, v8, [Ljava/lang/Object;

    const-string/jumbo v4, "VideoRecyclerViewHelper"

    aput-object v4, v3, v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Preload candidate is prepared (inc) at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 355
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 360
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_1

    .line 361
    invoke-direct {p0, v2, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->add(Lcom/vkontakte/android/media/AutoPlay;I)V

    goto :goto_1

    .line 363
    :cond_1
    new-array v3, v8, [Ljava/lang/Object;

    const-string/jumbo v4, "VideoRecyclerViewHelper"

    aput-object v4, v3, v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Preload candidate is in queue (inc) at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 366
    .end local v1    # "key":I
    .end local v2    # "val":Lcom/vkontakte/android/media/AutoPlay;
    :cond_2
    return-void
.end method

.method private trimCandidates(Z)V
    .locals 10
    .param p1, "increasing"    # Z

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 304
    iget v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadByDirection:I

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ne v4, v9, :cond_2

    .line 305
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 306
    .local v0, "first":Lcom/vkontakte/android/media/AutoPlay;
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/media/AutoPlay;

    .line 307
    .local v3, "second":Lcom/vkontakte/android/media/AutoPlay;
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->getScreenCenterDistance()I

    move-result v4

    invoke-interface {v3}, Lcom/vkontakte/android/media/AutoPlay;->getScreenCenterDistance()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 308
    new-array v4, v9, [Ljava/lang/Object;

    const-string/jumbo v5, "VideoRecyclerViewHelper"

    aput-object v5, v4, v7

    const-string/jumbo v5, "Trimmed last at 1"

    aput-object v5, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 309
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v8}, Landroid/util/SparseArray;->removeAt(I)V

    .line 327
    .end local v0    # "first":Lcom/vkontakte/android/media/AutoPlay;
    .end local v3    # "second":Lcom/vkontakte/android/media/AutoPlay;
    :cond_0
    :goto_0
    return-void

    .line 311
    .restart local v0    # "first":Lcom/vkontakte/android/media/AutoPlay;
    .restart local v3    # "second":Lcom/vkontakte/android/media/AutoPlay;
    :cond_1
    new-array v4, v9, [Ljava/lang/Object;

    const-string/jumbo v5, "VideoRecyclerViewHelper"

    aput-object v5, v4, v7

    const-string/jumbo v5, "Trimmed first at 0"

    aput-object v5, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 312
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v7}, Landroid/util/SparseArray;->removeAt(I)V

    goto :goto_0

    .line 315
    .end local v0    # "first":Lcom/vkontakte/android/media/AutoPlay;
    .end local v3    # "second":Lcom/vkontakte/android/media/AutoPlay;
    :cond_2
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preloadByDirection:I

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, 0x1

    if-le v4, v5, :cond_0

    .line 316
    if-eqz p1, :cond_3

    .line 317
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 318
    .local v1, "firstKey":I
    new-array v4, v9, [Ljava/lang/Object;

    const-string/jumbo v5, "VideoRecyclerViewHelper"

    aput-object v5, v4, v7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Trimmed first at "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 319
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 321
    .end local v1    # "firstKey":I
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    .line 322
    .local v2, "lastKey":I
    new-array v4, v9, [Ljava/lang/Object;

    const-string/jumbo v5, "VideoRecyclerViewHelper"

    aput-object v5, v4, v7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Trimmed last at "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 323
    iget-object v4, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->candidates:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1
.end method

.method private tryToPlayVideo(II)V
    .locals 11
    .param p1, "firstVisible"    # I
    .param p2, "visibleCount"    # I

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 225
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->getVideoToPlay(II)Landroid/support/v4/util/Pair;

    move-result-object v4

    .line 226
    .local v4, "video":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Lcom/vkontakte/android/media/AutoPlay;>;"
    iget-object v5, v4, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 227
    .local v3, "position":I
    iget-object v0, v4, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 228
    .local v0, "autoPlay":Lcom/vkontakte/android/media/AutoPlay;
    iget-object v2, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 229
    .local v2, "playingNow":Lcom/vkontakte/android/media/AutoPlay;
    if-nez v2, :cond_3

    const/4 v1, 0x0

    .line 230
    .local v1, "percentOnScreen":F
    :goto_0
    if-eqz v2, :cond_1

    const v5, 0x3e4ccccd    # 0.2f

    cmpg-float v5, v1, v5

    if-lez v5, :cond_0

    if-eq v0, v2, :cond_1

    .line 231
    :cond_0
    new-array v5, v10, [Ljava/lang/Object;

    const-string/jumbo v6, "VideoRecyclerViewHelper"

    aput-object v6, v5, v8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "On scroll pause 0.2f "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 232
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 233
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 235
    :cond_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v5

    if-nez v5, :cond_2

    .line 236
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->isPrepared()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->getType()Lcom/vkontakte/android/media/AutoPlay$Type;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->canPlayByType(Lcom/vkontakte/android/media/AutoPlay$Type;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 237
    new-array v5, v10, [Ljava/lang/Object;

    const-string/jumbo v6, "VideoRecyclerViewHelper"

    aput-object v6, v5, v8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "On scroll is prepared "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 238
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onReady(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 246
    :cond_2
    :goto_1
    return-void

    .line 229
    .end local v1    # "percentOnScreen":F
    :cond_3
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->getPercentageOnScreen()F

    move-result v1

    goto :goto_0

    .line 239
    .restart local v1    # "percentOnScreen":F
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 240
    new-array v5, v10, [Ljava/lang/Object;

    const-string/jumbo v6, "VideoRecyclerViewHelper"

    aput-object v6, v5, v8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "On scroll is in queue "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 242
    :cond_5
    new-array v5, v10, [Ljava/lang/Object;

    const-string/jumbo v6, "VideoRecyclerViewHelper"

    aput-object v6, v5, v8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "On scroll is new to prepare "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 243
    invoke-direct {p0, v0, v3}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->add(Lcom/vkontakte/android/media/AutoPlay;I)V

    goto :goto_1
.end method


# virtual methods
.method public getPlayingNow()Lcom/vkontakte/android/media/AutoPlay;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    return-object v0
.end method

.method public onComplete(Lcom/vkontakte/android/media/AutoPlay;)V
    .locals 0
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;

    .prologue
    .line 195
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 196
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->clear()V

    .line 78
    iput-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->context:Landroid/content/Context;

    .line 79
    iput-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    .line 80
    return-void
.end method

.method public onError(Lcom/vkontakte/android/media/AutoPlay;)V
    .locals 4
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;

    .prologue
    .line 132
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "VideoRecyclerViewHelper"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 133
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancel(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 134
    return-void
.end method

.method public onListUpdate()V
    .locals 4

    .prologue
    .line 101
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VideoRecyclerViewHelper"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "onListUpdate"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 102
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->queue:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/media/AutoPlay;

    invoke-interface {v1}, Lcom/vkontakte/android/media/AutoPlay;->detachSurface()V

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    :cond_0
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 110
    .local v0, "now":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->context:Landroid/content/Context;

    if-ne p1, v1, :cond_0

    .line 111
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 113
    :cond_0
    return-void
.end method

.method public onReady(Lcom/vkontakte/android/media/AutoPlay;)V
    .locals 11
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;

    .prologue
    const v10, 0x3e4ccccd    # 0.2f

    const/4 v9, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 156
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "onReady "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 157
    iget-object v2, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 158
    .local v2, "now":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v2, :cond_0

    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v6

    if-nez v6, :cond_6

    .line 159
    :cond_0
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->getPercentageOnScreen()F

    move-result v3

    .line 160
    .local v3, "percentage":F
    iget v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->scrollState:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_2

    cmpl-float v6, v3, v10

    if-ltz v6, :cond_1

    move v1, v4

    .line 163
    .local v1, "goodVisible":Z
    :goto_0
    if-eqz v1, :cond_4

    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->isComplete()Z

    move-result v6

    if-nez v6, :cond_4

    .line 164
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 165
    invoke-interface {p1, v5}, Lcom/vkontakte/android/media/AutoPlay;->play(Z)V

    .line 166
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onReady 0.2f/0.5f "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 191
    .end local v1    # "goodVisible":Z
    .end local v3    # "percentage":F
    :goto_1
    return-void

    .restart local v3    # "percentage":F
    :cond_1
    move v1, v5

    .line 160
    goto :goto_0

    :cond_2
    const/high16 v6, 0x3f000000    # 0.5f

    cmpl-float v6, v3, v6

    if-ltz v6, :cond_3

    move v1, v4

    goto :goto_0

    :cond_3
    move v1, v5

    goto :goto_0

    .line 168
    .restart local v1    # "goodVisible":Z
    :cond_4
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v6

    if-nez v6, :cond_5

    .line 169
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->waiting()V

    .line 171
    :cond_5
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onReady nothing play now "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 174
    .end local v1    # "goodVisible":Z
    .end local v3    # "percentage":F
    :cond_6
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->getScreenCenterDistance()I

    move-result v0

    .line 175
    .local v0, "dist":I
    const/4 v6, -0x1

    if-eq v0, v6, :cond_7

    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->getScreenCenterDistance()I

    move-result v6

    if-ge v0, v6, :cond_7

    .line 176
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 177
    invoke-interface {p1, v5}, Lcom/vkontakte/android/media/AutoPlay;->play(Z)V

    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 179
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onReady screenCenterDistance "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 180
    :cond_7
    invoke-interface {v2}, Lcom/vkontakte/android/media/AutoPlay;->getPercentageOnScreen()F

    move-result v6

    cmpg-float v6, v6, v10

    if-gtz v6, :cond_8

    .line 181
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 182
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 183
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onReady 0.2f "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 185
    :cond_8
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v6

    if-nez v6, :cond_9

    .line 186
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->waiting()V

    .line 188
    :cond_9
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v7, "VideoRecyclerViewHelper"

    aput-object v7, v6, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onReady nothing changes "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto/16 :goto_1
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 117
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->checkAutoPlayPreferences()V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 119
    .local v0, "now":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->context:Landroid/content/Context;

    if-ne p1, v1, :cond_0

    .line 120
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->getType()Lcom/vkontakte/android/media/AutoPlay$Type;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->canPlayByType(Lcom/vkontakte/android/media/AutoPlay$Type;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 121
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->isComplete()Z

    move-result v1

    if-nez v1, :cond_0

    .line 122
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/AutoPlay;->play(Z)V

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->cancel(Lcom/vkontakte/android/media/AutoPlay;)V

    goto :goto_0
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 3
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisible"    # I
    .param p3, "visibleCount"    # I
    .param p4, "totalCount"    # I

    .prologue
    const/4 v2, 0x1

    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->scrollState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 211
    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->scrollState:I

    if-eq v0, v2, :cond_0

    .line 212
    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    if-le p2, v0, :cond_2

    .line 213
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preload(IIIZ)V

    .line 218
    :cond_0
    :goto_0
    invoke-direct {p0, p2, p3}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->tryToPlayVideo(II)V

    .line 220
    :cond_1
    iput p2, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    .line 221
    iput p3, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastVisibleCount:I

    .line 222
    return-void

    .line 214
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    if-ge p2, v0, :cond_0

    .line 215
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, p4, v0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->preload(IIIZ)V

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 2
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 200
    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->scrollState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_1

    .line 202
    iget v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    iget v1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastVisibleCount:I

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->tryToPlayVideo(II)V

    .line 205
    :cond_1
    iput p2, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->scrollState:I

    .line 206
    return-void
.end method

.method public onUpdate(Landroid/support/v7/widget/RecyclerView;)V
    .locals 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->clear()V

    .line 84
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v3

    .line 85
    .local v3, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    instance-of v5, v3, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v5, :cond_0

    move-object v2, v3

    .line 86
    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    .line 87
    .local v2, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 88
    .local v0, "firstVisible":I
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v5

    sub-int v5, v0, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 89
    .local v4, "visibleCount":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    .line 90
    .local v1, "itemCount":I
    const/4 v5, -0x1

    iput v5, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->lastFirstVisible:I

    .line 91
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v0, v4, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onScroll(Landroid/widget/AbsListView;III)V

    .line 93
    .end local v0    # "firstVisible":I
    .end local v1    # "itemCount":I
    .end local v2    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .end local v4    # "visibleCount":I
    :cond_0
    return-void
.end method

.method public playPrepared(Lcom/vkontakte/android/media/AutoPlay;)V
    .locals 6
    .param p1, "autoPlay"    # Lcom/vkontakte/android/media/AutoPlay;

    .prologue
    const/4 v5, 0x0

    .line 138
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "VideoRecyclerViewHelper"

    aput-object v2, v1, v5

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "playPrepared "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 139
    invoke-interface {p1}, Lcom/vkontakte/android/media/AutoPlay;->isPrepared()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 141
    .local v0, "now":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 142
    invoke-interface {v0}, Lcom/vkontakte/android/media/AutoPlay;->pause()V

    .line 144
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->playingNow:Lcom/vkontakte/android/media/AutoPlay;

    .line 145
    invoke-interface {p1, v5}, Lcom/vkontakte/android/media/AutoPlay;->play(Z)V

    .line 147
    .end local v0    # "now":Lcom/vkontakte/android/media/AutoPlay;
    :cond_1
    return-void
.end method

.method public setProvider(Lcom/vkontakte/android/media/AutoPlayProvider;)V
    .locals 0
    .param p1, "provider"    # Lcom/vkontakte/android/media/AutoPlayProvider;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->provider:Lcom/vkontakte/android/media/AutoPlayProvider;

    .line 74
    return-void
.end method
