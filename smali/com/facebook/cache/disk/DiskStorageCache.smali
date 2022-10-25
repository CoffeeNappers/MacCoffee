.class public Lcom/facebook/cache/disk/DiskStorageCache;
.super Ljava/lang/Object;
.source "DiskStorageCache.java"

# interfaces
.implements Lcom/facebook/cache/disk/FileCache;
.implements Lcom/facebook/common/disk/DiskTrimmable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/cache/disk/DiskStorageCache$Params;,
        Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# static fields
.field private static final FILECACHE_SIZE_UPDATE_PERIOD_MS:J

.field private static final FUTURE_TIMESTAMP_THRESHOLD_MS:J

.field private static final SHARED_PREFS_FILENAME_PREFIX:Ljava/lang/String; = "disk_entries_list"

.field public static final START_OF_VERSIONING:I = 0x1

.field private static final TAG:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final TRIMMING_LOWER_BOUND:D = 0.02

.field private static final UNINITIALIZED:J = -0x1L


# instance fields
.field private final mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

.field private final mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

.field private mCacheSizeLastUpdateTime:J
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mCacheSizeLimit:J

.field private final mCacheSizeLimitMinimum:J

.field private final mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

.field private final mClock:Lcom/facebook/common/time/Clock;

.field private final mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private final mDefaultCacheSizeLimit:J

.field private final mEntryEvictionComparatorSupplier:Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;

.field private final mIndexPopulateAtStartupEnabled:Z

.field private mIndexReady:Z

.field private final mLock:Ljava/lang/Object;

.field private final mLowDiskSpaceCacheSizeLimit:J

.field final mResourceIndex:Ljava/util/Set;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mStatFsHelper:Lcom/facebook/common/statfs/StatFsHelper;

.field private final mStorage:Lcom/facebook/cache/disk/DiskStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 50
    const-class v0, Lcom/facebook/cache/disk/DiskStorageCache;

    sput-object v0, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    .line 57
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/facebook/cache/disk/DiskStorageCache;->FUTURE_TIMESTAMP_THRESHOLD_MS:J

    .line 59
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1e

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/facebook/cache/disk/DiskStorageCache;->FILECACHE_SIZE_UPDATE_PERIOD_MS:J

    return-void
.end method

.method public constructor <init>(Lcom/facebook/cache/disk/DiskStorage;Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;Lcom/facebook/cache/disk/DiskStorageCache$Params;Lcom/facebook/cache/common/CacheEventListener;Lcom/facebook/cache/common/CacheErrorLogger;Lcom/facebook/common/disk/DiskTrimmableRegistry;Landroid/content/Context;Ljava/util/concurrent/Executor;Z)V
    .locals 2
    .param p1, "diskStorage"    # Lcom/facebook/cache/disk/DiskStorage;
    .param p2, "entryEvictionComparatorSupplier"    # Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;
    .param p3, "params"    # Lcom/facebook/cache/disk/DiskStorageCache$Params;
    .param p4, "cacheEventListener"    # Lcom/facebook/cache/common/CacheEventListener;
    .param p5, "cacheErrorLogger"    # Lcom/facebook/cache/common/CacheErrorLogger;
    .param p6, "diskTrimmableRegistry"    # Lcom/facebook/common/disk/DiskTrimmableRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "context"    # Landroid/content/Context;
    .param p8, "executorForBackgrountInit"    # Ljava/util/concurrent/Executor;
    .param p9, "indexPopulateAtStartupEnabled"    # Z

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    .line 164
    iget-wide v0, p3, Lcom/facebook/cache/disk/DiskStorageCache$Params;->mLowDiskSpaceCacheSizeLimit:J

    iput-wide v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLowDiskSpaceCacheSizeLimit:J

    .line 165
    iget-wide v0, p3, Lcom/facebook/cache/disk/DiskStorageCache$Params;->mDefaultCacheSizeLimit:J

    iput-wide v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mDefaultCacheSizeLimit:J

    .line 166
    iget-wide v0, p3, Lcom/facebook/cache/disk/DiskStorageCache$Params;->mDefaultCacheSizeLimit:J

    iput-wide v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    .line 167
    invoke-static {}, Lcom/facebook/common/statfs/StatFsHelper;->getInstance()Lcom/facebook/common/statfs/StatFsHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStatFsHelper:Lcom/facebook/common/statfs/StatFsHelper;

    .line 169
    iput-object p1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    .line 171
    iput-object p2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mEntryEvictionComparatorSupplier:Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;

    .line 173
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLastUpdateTime:J

    .line 175
    iput-object p4, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    .line 177
    iget-wide v0, p3, Lcom/facebook/cache/disk/DiskStorageCache$Params;->mCacheSizeLimitMinimum:J

    iput-wide v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimitMinimum:J

    .line 179
    iput-object p5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 181
    new-instance v0, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-direct {v0}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;-><init>()V

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    .line 183
    if-eqz p6, :cond_0

    .line 184
    invoke-interface {p6, p0}, Lcom/facebook/common/disk/DiskTrimmableRegistry;->registerDiskTrimmable(Lcom/facebook/common/disk/DiskTrimmable;)V

    .line 186
    :cond_0
    invoke-static {}, Lcom/facebook/common/time/SystemClock;->get()Lcom/facebook/common/time/SystemClock;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mClock:Lcom/facebook/common/time/Clock;

    .line 188
    iput-boolean p9, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    .line 190
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    .line 192
    iget-boolean v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    if-eqz v0, :cond_1

    .line 193
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 195
    new-instance v0, Lcom/facebook/cache/disk/DiskStorageCache$1;

    invoke-direct {v0, p0}, Lcom/facebook/cache/disk/DiskStorageCache$1;-><init>(Lcom/facebook/cache/disk/DiskStorageCache;)V

    invoke-interface {p8, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 209
    :goto_0
    new-instance v0, Lcom/facebook/cache/disk/DiskStorageCache$2;

    invoke-direct {v0, p0, p7}, Lcom/facebook/cache/disk/DiskStorageCache$2;-><init>(Lcom/facebook/cache/disk/DiskStorageCache;Landroid/content/Context;)V

    invoke-interface {p8, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 216
    return-void

    .line 206
    :cond_1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/facebook/cache/disk/DiskStorageCache;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/cache/disk/DiskStorageCache;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/facebook/cache/disk/DiskStorageCache;)Z
    .locals 1
    .param p0, "x0"    # Lcom/facebook/cache/disk/DiskStorageCache;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/facebook/cache/disk/DiskStorageCache;)Ljava/util/concurrent/CountDownLatch;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/cache/disk/DiskStorageCache;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method static synthetic access$300(Lcom/facebook/cache/disk/DiskStorageCache;)Lcom/facebook/cache/disk/DiskStorage;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/cache/disk/DiskStorageCache;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    return-object v0
.end method

.method static synthetic access$400(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-static {p0, p1}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeDeleteSharedPreferencesFile(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private endInsert(Lcom/facebook/cache/disk/DiskStorage$Inserter;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)Lcom/facebook/binaryresource/BinaryResource;
    .locals 8
    .param p1, "inserter"    # Lcom/facebook/cache/disk/DiskStorage$Inserter;
    .param p2, "key"    # Lcom/facebook/cache/common/CacheKey;
    .param p3, "resourceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 355
    :try_start_0
    invoke-interface {p1, p2}, Lcom/facebook/cache/disk/DiskStorage$Inserter;->commit(Ljava/lang/Object;)Lcom/facebook/binaryresource/BinaryResource;

    move-result-object v0

    .line 356
    .local v0, "resource":Lcom/facebook/binaryresource/BinaryResource;
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v1, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 357
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-interface {v0}, Lcom/facebook/binaryresource/BinaryResource;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    invoke-virtual {v1, v4, v5, v6, v7}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->increment(JJ)V

    .line 358
    monitor-exit v2

    return-object v0

    .line 359
    .end local v0    # "resource":Lcom/facebook/binaryresource/BinaryResource;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private evictAboveSize(JLcom/facebook/cache/common/CacheEventListener$EvictionReason;)V
    .locals 23
    .param p1, "desiredSize"    # J
    .param p3, "reason"    # Lcom/facebook/cache/common/CacheEventListener$EvictionReason;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation

    .prologue
    .line 510
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v15}, Lcom/facebook/cache/disk/DiskStorage;->getEntries()Ljava/util/Collection;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/facebook/cache/disk/DiskStorageCache;->getSortedEntries(Ljava/util/Collection;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 520
    .local v5, "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v15}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v6

    .line 521
    .local v6, "cacheSizeBeforeClearance":J
    sub-long v8, v6, p1

    .line 522
    .local v8, "deleteSize":J
    const/4 v14, 0x0

    .line 523
    .local v14, "itemCount":I
    const-wide/16 v16, 0x0

    .line 524
    .local v16, "sumItemSizes":J
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_0
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/facebook/cache/disk/DiskStorage$Entry;

    .line 525
    .local v12, "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    cmp-long v18, v16, v8

    if-lez v18, :cond_2

    .line 543
    .end local v12    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    move-wide/from16 v0, v16

    neg-long v0, v0

    move-wide/from16 v18, v0

    neg-int v0, v14

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v20

    invoke-virtual {v15, v0, v1, v2, v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->increment(JJ)V

    .line 544
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v15}, Lcom/facebook/cache/disk/DiskStorage;->purgeUnexpectedResources()V

    .line 545
    return-void

    .line 511
    .end local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .end local v6    # "cacheSizeBeforeClearance":J
    .end local v8    # "deleteSize":J
    .end local v14    # "itemCount":I
    .end local v16    # "sumItemSizes":J
    :catch_0
    move-exception v13

    .line 512
    .local v13, "ioe":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v18, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->EVICTION:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v19, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "evictAboveSize: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 515
    invoke-virtual {v13}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 512
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v15, v0, v1, v2, v13}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 517
    throw v13

    .line 528
    .end local v13    # "ioe":Ljava/io/IOException;
    .restart local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .restart local v6    # "cacheSizeBeforeClearance":J
    .restart local v8    # "deleteSize":J
    .restart local v12    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    .restart local v14    # "itemCount":I
    .restart local v16    # "sumItemSizes":J
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v12}, Lcom/facebook/cache/disk/DiskStorage;->remove(Lcom/facebook/cache/disk/DiskStorage$Entry;)J

    move-result-wide v10

    .line 529
    .local v10, "deletedSize":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v18, v0

    invoke-interface {v12}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getId()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 530
    const-wide/16 v18, 0x0

    cmp-long v18, v10, v18

    if-lez v18, :cond_0

    .line 531
    add-int/lit8 v14, v14, 0x1

    .line 532
    add-long v16, v16, v10

    .line 533
    invoke-static {}, Lcom/facebook/cache/disk/SettableCacheEvent;->obtain()Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v18

    .line 534
    invoke-interface {v12}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getId()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/facebook/cache/disk/SettableCacheEvent;->setResourceId(Ljava/lang/String;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v18

    .line 535
    move-object/from16 v0, v18

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/facebook/cache/disk/SettableCacheEvent;->setEvictionReason(Lcom/facebook/cache/common/CacheEventListener$EvictionReason;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v18

    .line 536
    move-object/from16 v0, v18

    invoke-virtual {v0, v10, v11}, Lcom/facebook/cache/disk/SettableCacheEvent;->setItemSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v18

    sub-long v20, v6, v16

    .line 537
    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v18

    .line 538
    move-object/from16 v0, v18

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheLimit(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v4

    .line 539
    .local v4, "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Lcom/facebook/cache/common/CacheEventListener;->onEviction(Lcom/facebook/cache/common/CacheEvent;)V

    .line 540
    invoke-virtual {v4}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    goto/16 :goto_0
.end method

.method private getSortedEntries(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/facebook/cache/disk/DiskStorage$Entry;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/facebook/cache/disk/DiskStorage$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 556
    .local p1, "allEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mClock:Lcom/facebook/common/time/Clock;

    invoke-interface {v3}, Lcom/facebook/common/time/Clock;->now()J

    move-result-wide v6

    sget-wide v8, Lcom/facebook/cache/disk/DiskStorageCache;->FUTURE_TIMESTAMP_THRESHOLD_MS:J

    add-long v4, v6, v8

    .line 557
    .local v4, "threshold":J
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 558
    .local v2, "sortedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 559
    .local v1, "listToSort":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/cache/disk/DiskStorage$Entry;

    .line 560
    .local v0, "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    invoke-interface {v0}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getTimestamp()J

    move-result-wide v6

    cmp-long v6, v6, v4

    if-lez v6, :cond_0

    .line 561
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 563
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 566
    .end local v0    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    :cond_1
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mEntryEvictionComparatorSupplier:Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;

    invoke-interface {v3}, Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;->get()Lcom/facebook/cache/disk/EntryEvictionComparator;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 567
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 568
    return-object v2
.end method

.method private static maybeDeleteSharedPreferencesFile(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 782
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 783
    .local v0, "applicationContext":Landroid/content/Context;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 784
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "shared_prefs"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "disk_entries_list"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 790
    .local v3, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 792
    .local v2, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 793
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 798
    :cond_0
    :goto_0
    return-void

    .line 795
    :catch_0
    move-exception v1

    .line 796
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v5, "Fail to delete SharedPreference from file system. "

    invoke-static {v4, v5}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private maybeEvictFilesInCacheDir()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    iget-object v4, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 482
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    move-result v2

    .line 485
    .local v2, "calculatedRightNow":Z
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->updateFileCacheSizeLimit()V

    .line 487
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v0

    .line 490
    .local v0, "cacheSize":J
    iget-wide v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    cmp-long v3, v0, v6

    if-lez v3, :cond_0

    if-nez v2, :cond_0

    .line 491
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->reset()V

    .line 492
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    .line 496
    :cond_0
    iget-wide v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    cmp-long v3, v0, v6

    if-lez v3, :cond_1

    .line 497
    iget-wide v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    const-wide/16 v8, 0x9

    mul-long/2addr v6, v8

    const-wide/16 v8, 0xa

    div-long/2addr v6, v8

    sget-object v3, Lcom/facebook/cache/common/CacheEventListener$EvictionReason;->CACHE_FULL:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    invoke-direct {p0, v6, v7, v3}, Lcom/facebook/cache/disk/DiskStorageCache;->evictAboveSize(JLcom/facebook/cache/common/CacheEventListener$EvictionReason;)V

    .line 501
    :cond_1
    monitor-exit v4

    .line 502
    return-void

    .line 501
    .end local v0    # "cacheSize":J
    .end local v2    # "calculatedRightNow":Z
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private maybeUpdateFileCacheSize()Z
    .locals 6
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation

    .prologue
    .line 705
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mClock:Lcom/facebook/common/time/Clock;

    invoke-interface {v2}, Lcom/facebook/common/time/Clock;->now()J

    move-result-wide v0

    .line 706
    .local v0, "now":J
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v2}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLastUpdateTime:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLastUpdateTime:J

    sub-long v2, v0, v2

    sget-wide v4, Lcom/facebook/cache/disk/DiskStorageCache;->FILECACHE_SIZE_UPDATE_PERIOD_MS:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 709
    :cond_0
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSizeAndIndex()Z

    move-result v2

    .line 711
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private maybeUpdateFileCacheSizeAndIndex()Z
    .locals 26
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation

    .prologue
    .line 716
    const-wide/16 v14, 0x0

    .line 717
    .local v14, "size":J
    const/4 v4, 0x0

    .line 718
    .local v4, "count":I
    const/4 v7, 0x0

    .line 719
    .local v7, "foundFutureTimestamp":Z
    const/4 v9, 0x0

    .line 720
    .local v9, "numFutureFiles":I
    const/16 v16, 0x0

    .line 721
    .local v16, "sizeFutureFiles":I
    const-wide/16 v10, -0x1

    .line 722
    .local v10, "maxTimeDelta":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mClock:Lcom/facebook/common/time/Clock;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/facebook/common/time/Clock;->now()J

    move-result-wide v12

    .line 723
    .local v12, "now":J
    sget-wide v20, Lcom/facebook/cache/disk/DiskStorageCache;->FUTURE_TIMESTAMP_THRESHOLD_MS:J

    add-long v18, v12, v20

    .line 725
    .local v18, "timeThreshold":J
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_1

    .line 726
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v17, v0

    .line 733
    .local v17, "tempResourceIndex":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/facebook/cache/disk/DiskStorage;->getEntries()Ljava/util/Collection;

    move-result-object v5

    .line 734
    .local v5, "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_0
    :goto_1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/cache/disk/DiskStorage$Entry;

    .line 735
    .local v6, "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    add-int/lit8 v4, v4, 0x1

    .line 736
    invoke-interface {v6}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getSize()J

    move-result-wide v22

    add-long v14, v14, v22

    .line 739
    invoke-interface {v6}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getTimestamp()J

    move-result-wide v22

    cmp-long v21, v22, v18

    if-lez v21, :cond_3

    .line 740
    const/4 v7, 0x1

    .line 741
    add-int/lit8 v9, v9, 0x1

    .line 742
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v22, v0

    invoke-interface {v6}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getSize()J

    move-result-wide v24

    add-long v22, v22, v24

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v16, v0

    .line 743
    invoke-interface {v6}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getTimestamp()J

    move-result-wide v22

    sub-long v22, v22, v12

    move-wide/from16 v0, v22

    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->max(JJ)J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v10

    goto :goto_1

    .line 727
    .end local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .end local v6    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    .end local v17    # "tempResourceIndex":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_2

    .line 728
    new-instance v17, Ljava/util/HashSet;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashSet;-><init>()V

    .restart local v17    # "tempResourceIndex":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    goto :goto_0

    .line 730
    .end local v17    # "tempResourceIndex":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    const/16 v17, 0x0

    .restart local v17    # "tempResourceIndex":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    goto :goto_0

    .line 744
    .restart local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .restart local v6    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    :cond_3
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_0

    .line 745
    invoke-interface {v6}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 766
    .end local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .end local v6    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    :catch_0
    move-exception v8

    .line 767
    .local v8, "ioe":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    move-object/from16 v20, v0

    sget-object v21, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->GENERIC_IO:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v22, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "calcFileCacheSize: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    .line 770
    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 767
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3, v8}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 772
    const/16 v20, 0x0

    .line 775
    .end local v8    # "ioe":Ljava/io/IOException;
    :goto_2
    return v20

    .line 748
    .restart local v5    # "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    :cond_4
    if-eqz v7, :cond_5

    .line 749
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    move-object/from16 v20, v0

    sget-object v21, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->READ_INVALID_ENTRY:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v22, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Future timestamp found in "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, " files , with a total size of "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, " bytes, and a maximum time delta of "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, "ms"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x0

    invoke-interface/range {v20 .. v24}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 757
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getCount()J

    move-result-wide v20

    int-to-long v0, v4

    move-wide/from16 v22, v0

    cmp-long v20, v20, v22

    if-nez v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v20

    cmp-long v20, v20, v14

    if-eqz v20, :cond_8

    .line 758
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_9

    .line 759
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexReady:Z

    .line 764
    :cond_7
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    move-object/from16 v20, v0

    int-to-long v0, v4

    move-wide/from16 v22, v0

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v14, v15, v1, v2}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->set(JJ)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 774
    :cond_8
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLastUpdateTime:J

    .line 775
    const/16 v20, 0x1

    goto/16 :goto_2

    .line 760
    :cond_9
    :try_start_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_7

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->clear()V

    .line 762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_3
.end method

.method private startInsert(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/cache/disk/DiskStorage$Inserter;
    .locals 1
    .param p1, "resourceId"    # Ljava/lang/String;
    .param p2, "key"    # Lcom/facebook/cache/common/CacheKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeEvictFilesInCacheDir()V

    .line 343
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v0, p1, p2}, Lcom/facebook/cache/disk/DiskStorage;->insert(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/cache/disk/DiskStorage$Inserter;

    move-result-object v0

    return-object v0
.end method

.method private trimBy(D)V
    .locals 11
    .param p1, "trimRatio"    # D

    .prologue
    .line 678
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 681
    :try_start_0
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->reset()V

    .line 682
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    .line 683
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v0

    .line 684
    .local v0, "cacheSize":J
    long-to-double v8, v0

    mul-double/2addr v8, p1

    double-to-long v8, v8

    sub-long v4, v0, v8

    .line 685
    .local v4, "newMaxBytesInFiles":J
    sget-object v3, Lcom/facebook/cache/common/CacheEventListener$EvictionReason;->CACHE_MANAGER_TRIMMED:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    invoke-direct {p0, v4, v5, v3}, Lcom/facebook/cache/disk/DiskStorageCache;->evictAboveSize(JLcom/facebook/cache/common/CacheEventListener$EvictionReason;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 695
    .end local v0    # "cacheSize":J
    .end local v4    # "newMaxBytesInFiles":J
    :goto_0
    :try_start_1
    monitor-exit v6

    .line 696
    return-void

    .line 688
    :catch_0
    move-exception v2

    .line 689
    .local v2, "ioe":Ljava/io/IOException;
    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v7, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->EVICTION:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v8, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "trimBy: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 692
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 689
    invoke-interface {v3, v7, v8, v9, v2}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 695
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method private updateFileCacheSizeLimit()V
    .locals 8
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "mLock"
    .end annotation

    .prologue
    .line 579
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    .line 580
    invoke-interface {v2}, Lcom/facebook/cache/disk/DiskStorage;->isExternal()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v1, Lcom/facebook/common/statfs/StatFsHelper$StorageType;->EXTERNAL:Lcom/facebook/common/statfs/StatFsHelper$StorageType;

    .line 583
    .local v1, "storageType":Lcom/facebook/common/statfs/StatFsHelper$StorageType;
    :goto_0
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStatFsHelper:Lcom/facebook/common/statfs/StatFsHelper;

    iget-wide v4, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mDefaultCacheSizeLimit:J

    iget-object v3, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    .line 586
    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v6

    sub-long/2addr v4, v6

    .line 584
    invoke-virtual {v2, v1, v4, v5}, Lcom/facebook/common/statfs/StatFsHelper;->testLowDiskSpace(Lcom/facebook/common/statfs/StatFsHelper$StorageType;J)Z

    move-result v0

    .line 587
    .local v0, "isAvailableSpaceLowerThanHighLimit":Z
    if-eqz v0, :cond_1

    .line 588
    iget-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLowDiskSpaceCacheSizeLimit:J

    iput-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    .line 592
    :goto_1
    return-void

    .line 580
    .end local v0    # "isAvailableSpaceLowerThanHighLimit":Z
    .end local v1    # "storageType":Lcom/facebook/common/statfs/StatFsHelper$StorageType;
    :cond_0
    sget-object v1, Lcom/facebook/common/statfs/StatFsHelper$StorageType;->INTERNAL:Lcom/facebook/common/statfs/StatFsHelper$StorageType;

    goto :goto_0

    .line 590
    .restart local v0    # "isAvailableSpaceLowerThanHighLimit":Z
    .restart local v1    # "storageType":Lcom/facebook/common/statfs/StatFsHelper$StorageType;
    :cond_1
    iget-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mDefaultCacheSizeLimit:J

    iput-wide v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimit:J

    goto :goto_1
.end method


# virtual methods
.method protected awaitIndex()V
    .locals 3
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 235
    :try_start_0
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    :goto_0
    return-void

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v2, "Memory Index is not ready yet. "

    invoke-static {v1, v2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public clearAll()V
    .locals 7

    .prologue
    .line 603
    iget-object v2, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 605
    :try_start_0
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v1}, Lcom/facebook/cache/disk/DiskStorage;->clearAll()V

    .line 606
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 607
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v1}, Lcom/facebook/cache/common/CacheEventListener;->onCleared()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 615
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v1}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->reset()V

    .line 616
    monitor-exit v2

    .line 617
    return-void

    .line 608
    :catch_0
    move-exception v0

    .line 609
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v3, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->EVICTION:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v4, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "clearAll: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 612
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 609
    invoke-interface {v1, v3, v4, v5, v0}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 616
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public clearOldEntries(J)J
    .locals 29
    .param p1, "cacheExpirationMs"    # J

    .prologue
    .line 429
    const-wide/16 v20, 0x0

    .line 430
    .local v20, "oldestRemainingEntryAgeMs":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    move-object/from16 v22, v0

    monitor-enter v22

    .line 432
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mClock:Lcom/facebook/common/time/Clock;

    invoke-interface {v15}, Lcom/facebook/common/time/Clock;->now()J

    move-result-wide v18

    .line 433
    .local v18, "now":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v15}, Lcom/facebook/cache/disk/DiskStorage;->getEntries()Ljava/util/Collection;

    move-result-object v4

    .line 434
    .local v4, "allEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v15}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v6

    .line 435
    .local v6, "cacheSizeBeforeClearance":J
    const/4 v14, 0x0

    .line 436
    .local v14, "itemsRemovedCount":I
    const-wide/16 v16, 0x0

    .line 437
    .local v16, "itemsRemovedSize":J
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_0
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/facebook/cache/disk/DiskStorage$Entry;

    .line 439
    .local v8, "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    const-wide/16 v24, 0x1

    invoke-interface {v8}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getTimestamp()J

    move-result-wide v26

    sub-long v26, v18, v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->abs(J)J

    move-result-wide v26

    invoke-static/range {v24 .. v27}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    .line 440
    .local v10, "entryAgeMs":J
    cmp-long v23, v10, p1

    if-ltz v23, :cond_2

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v8}, Lcom/facebook/cache/disk/DiskStorage;->remove(Lcom/facebook/cache/disk/DiskStorage$Entry;)J

    move-result-wide v12

    .line 442
    .local v12, "entryRemovedSize":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    move-object/from16 v23, v0

    invoke-interface {v8}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getId()Ljava/lang/String;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 443
    const-wide/16 v24, 0x0

    cmp-long v23, v12, v24

    if-lez v23, :cond_0

    .line 444
    add-int/lit8 v14, v14, 0x1

    .line 445
    add-long v16, v16, v12

    .line 446
    invoke-static {}, Lcom/facebook/cache/disk/SettableCacheEvent;->obtain()Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v23

    .line 447
    invoke-interface {v8}, Lcom/facebook/cache/disk/DiskStorage$Entry;->getId()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/facebook/cache/disk/SettableCacheEvent;->setResourceId(Ljava/lang/String;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v23

    sget-object v24, Lcom/facebook/cache/common/CacheEventListener$EvictionReason;->CONTENT_STALE:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    .line 448
    invoke-virtual/range {v23 .. v24}, Lcom/facebook/cache/disk/SettableCacheEvent;->setEvictionReason(Lcom/facebook/cache/common/CacheEventListener$EvictionReason;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v23

    .line 449
    move-object/from16 v0, v23

    invoke-virtual {v0, v12, v13}, Lcom/facebook/cache/disk/SettableCacheEvent;->setItemSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v23

    sub-long v24, v6, v16

    .line 450
    invoke-virtual/range {v23 .. v25}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v5

    .line 451
    .local v5, "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v5}, Lcom/facebook/cache/common/CacheEventListener;->onEviction(Lcom/facebook/cache/common/CacheEvent;)V

    .line 452
    invoke-virtual {v5}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 463
    .end local v4    # "allEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .end local v5    # "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    .end local v6    # "cacheSizeBeforeClearance":J
    .end local v8    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    .end local v10    # "entryAgeMs":J
    .end local v12    # "entryRemovedSize":J
    .end local v14    # "itemsRemovedCount":I
    .end local v16    # "itemsRemovedSize":J
    .end local v18    # "now":J
    :catch_0
    move-exception v9

    .line 464
    .local v9, "ioe":Ljava/io/IOException;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v23, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->EVICTION:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v24, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v26, "clearOldEntries: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 467
    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 464
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v15, v0, v1, v2, v9}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 470
    .end local v9    # "ioe":Ljava/io/IOException;
    :cond_1
    :goto_1
    monitor-exit v22
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 471
    return-wide v20

    .line 455
    .restart local v4    # "allEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .restart local v6    # "cacheSizeBeforeClearance":J
    .restart local v8    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    .restart local v10    # "entryAgeMs":J
    .restart local v14    # "itemsRemovedCount":I
    .restart local v16    # "itemsRemovedSize":J
    .restart local v18    # "now":J
    :cond_2
    :try_start_2
    move-wide/from16 v0, v20

    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v20

    goto/16 :goto_0

    .line 458
    .end local v8    # "entry":Lcom/facebook/cache/disk/DiskStorage$Entry;
    .end local v10    # "entryAgeMs":J
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v15}, Lcom/facebook/cache/disk/DiskStorage;->purgeUnexpectedResources()V

    .line 459
    if-lez v14, :cond_1

    .line 460
    invoke-direct/range {p0 .. p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    .line 461
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    move-wide/from16 v0, v16

    neg-long v0, v0

    move-wide/from16 v24, v0

    neg-int v0, v14

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v26, v0

    move-wide/from16 v0, v24

    move-wide/from16 v2, v26

    invoke-virtual {v15, v0, v1, v2, v3}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->increment(JJ)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 470
    .end local v4    # "allEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/cache/disk/DiskStorage$Entry;>;"
    .end local v6    # "cacheSizeBeforeClearance":J
    .end local v14    # "itemsRemovedCount":I
    .end local v16    # "itemsRemovedSize":J
    .end local v18    # "now":J
    :catchall_0
    move-exception v15

    :try_start_3
    monitor-exit v22
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v15
.end method

.method public getCount()J
    .locals 2

    .prologue
    .line 599
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v0}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDumpInfo()Lcom/facebook/cache/disk/DiskStorage$DiskDumpInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v0}, Lcom/facebook/cache/disk/DiskStorage;->getDumpInfo()Lcom/facebook/cache/disk/DiskStorage$DiskDumpInfo;

    move-result-object v0

    return-object v0
.end method

.method public getResource(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/binaryresource/BinaryResource;
    .locals 11
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;

    .prologue
    .line 261
    const/4 v5, 0x0

    .line 262
    .local v5, "resourceId":Ljava/lang/String;
    invoke-static {}, Lcom/facebook/cache/disk/SettableCacheEvent;->obtain()Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v7

    .line 263
    invoke-virtual {v7, p1}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheKey(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v1

    .line 265
    .local v1, "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    :try_start_0
    iget-object v8, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 266
    const/4 v4, 0x0

    .line 267
    .local v4, "resource":Lcom/facebook/binaryresource/BinaryResource;
    :try_start_1
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getResourceIds(Lcom/facebook/cache/common/CacheKey;)Ljava/util/List;

    move-result-object v6

    .line 268
    .local v6, "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_0

    .line 269
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 270
    invoke-virtual {v1, v5}, Lcom/facebook/cache/disk/SettableCacheEvent;->setResourceId(Ljava/lang/String;)Lcom/facebook/cache/disk/SettableCacheEvent;

    .line 271
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v7, v5, p1}, Lcom/facebook/cache/disk/DiskStorage;->getResource(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/binaryresource/BinaryResource;

    move-result-object v4

    .line 272
    if-eqz v4, :cond_1

    .line 276
    :cond_0
    if-nez v4, :cond_2

    .line 277
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v7, v1}, Lcom/facebook/cache/common/CacheEventListener;->onMiss(Lcom/facebook/cache/common/CacheEvent;)V

    .line 278
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v7, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 283
    :goto_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 295
    invoke-virtual {v1}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    .line 293
    .end local v2    # "i":I
    .end local v4    # "resource":Lcom/facebook/binaryresource/BinaryResource;
    .end local v6    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_2
    return-object v4

    .line 268
    .restart local v2    # "i":I
    .restart local v4    # "resource":Lcom/facebook/binaryresource/BinaryResource;
    .restart local v6    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 280
    :cond_2
    :try_start_2
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v7, v1}, Lcom/facebook/cache/common/CacheEventListener;->onHit(Lcom/facebook/cache/common/CacheEvent;)V

    .line 281
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v7, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 284
    .end local v2    # "i":I
    .end local v6    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v7
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 285
    .end local v4    # "resource":Lcom/facebook/binaryresource/BinaryResource;
    :catch_0
    move-exception v3

    .line 286
    .local v3, "ioe":Ljava/io/IOException;
    :try_start_4
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v8, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->GENERIC_IO:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v9, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v10, "getResource"

    invoke-interface {v7, v8, v9, v10, v3}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 291
    invoke-virtual {v1, v3}, Lcom/facebook/cache/disk/SettableCacheEvent;->setException(Ljava/io/IOException;)Lcom/facebook/cache/disk/SettableCacheEvent;

    .line 292
    iget-object v7, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v7, v1}, Lcom/facebook/cache/common/CacheEventListener;->onReadException(Lcom/facebook/cache/common/CacheEvent;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 293
    const/4 v4, 0x0

    .line 295
    invoke-virtual {v1}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    goto :goto_2

    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_1
    move-exception v7

    invoke-virtual {v1}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    throw v7
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 595
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v0}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public hasKey(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 9
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 636
    iget-object v8, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 637
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/facebook/cache/disk/DiskStorageCache;->hasKeySync(Lcom/facebook/cache/common/CacheKey;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 638
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v5, v6

    .line 652
    :goto_0
    return v5

    .line 641
    :cond_0
    const/4 v3, 0x0

    .line 642
    .local v3, "resourceId":Ljava/lang/String;
    :try_start_1
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getResourceIds(Lcom/facebook/cache/common/CacheKey;)Ljava/util/List;

    move-result-object v4

    .line 643
    .local v4, "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 644
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 645
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v5, v3, p1}, Lcom/facebook/cache/disk/DiskStorage;->contains(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 646
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 647
    :try_start_2
    monitor-exit v8

    move v5, v6

    goto :goto_0

    .line 643
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 650
    :cond_2
    monitor-exit v8

    move v5, v7

    goto :goto_0

    .line 651
    .end local v2    # "i":I
    .end local v4    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 652
    .local v1, "e":Ljava/io/IOException;
    monitor-exit v8

    move v5, v7

    goto :goto_0

    .line 654
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "resourceId":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5
.end method

.method public hasKeySync(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 6
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;

    .prologue
    .line 621
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 622
    const/4 v2, 0x0

    .line 623
    .local v2, "resourceId":Ljava/lang/String;
    :try_start_0
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getResourceIds(Lcom/facebook/cache/common/CacheKey;)Ljava/util/List;

    move-result-object v3

    .line 624
    .local v3, "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 625
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 626
    iget-object v4, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 627
    const/4 v4, 0x1

    monitor-exit v5

    .line 630
    :goto_1
    return v4

    .line 624
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 630
    :cond_1
    const/4 v4, 0x0

    monitor-exit v5

    goto :goto_1

    .line 631
    .end local v1    # "i":I
    .end local v3    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public insert(Lcom/facebook/cache/common/CacheKey;Lcom/facebook/cache/common/WriterCallback;)Lcom/facebook/binaryresource/BinaryResource;
    .locals 8
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;
    .param p2, "callback"    # Lcom/facebook/cache/common/WriterCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 366
    invoke-static {}, Lcom/facebook/cache/disk/SettableCacheEvent;->obtain()Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v5

    .line 367
    invoke-virtual {v5, p1}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheKey(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v0

    .line 368
    .local v0, "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v5, v0}, Lcom/facebook/cache/common/CacheEventListener;->onWriteAttempt(Lcom/facebook/cache/common/CacheEvent;)V

    .line 370
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 372
    :try_start_0
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getFirstResourceId(Lcom/facebook/cache/common/CacheKey;)Ljava/lang/String;

    move-result-object v4

    .line 373
    .local v4, "resourceId":Ljava/lang/String;
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 374
    invoke-virtual {v0, v4}, Lcom/facebook/cache/disk/SettableCacheEvent;->setResourceId(Ljava/lang/String;)Lcom/facebook/cache/disk/SettableCacheEvent;

    .line 377
    :try_start_1
    invoke-direct {p0, v4, p1}, Lcom/facebook/cache/disk/DiskStorageCache;->startInsert(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/cache/disk/DiskStorage$Inserter;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v1

    .line 379
    .local v1, "inserter":Lcom/facebook/cache/disk/DiskStorage$Inserter;
    :try_start_2
    invoke-interface {v1, p2, p1}, Lcom/facebook/cache/disk/DiskStorage$Inserter;->writeData(Lcom/facebook/cache/common/WriterCallback;Ljava/lang/Object;)V

    .line 381
    invoke-direct {p0, v1, p1, v4}, Lcom/facebook/cache/disk/DiskStorageCache;->endInsert(Lcom/facebook/cache/disk/DiskStorage$Inserter;Lcom/facebook/cache/common/CacheKey;Ljava/lang/String;)Lcom/facebook/binaryresource/BinaryResource;

    move-result-object v3

    .line 382
    .local v3, "resource":Lcom/facebook/binaryresource/BinaryResource;
    invoke-interface {v3}, Lcom/facebook/binaryresource/BinaryResource;->size()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lcom/facebook/cache/disk/SettableCacheEvent;->setItemSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v5

    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    .line 383
    invoke-virtual {v6}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheSize(J)Lcom/facebook/cache/disk/SettableCacheEvent;

    .line 384
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v5, v0}, Lcom/facebook/cache/common/CacheEventListener;->onWriteSuccess(Lcom/facebook/cache/common/CacheEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 387
    :try_start_3
    invoke-interface {v1}, Lcom/facebook/cache/disk/DiskStorage$Inserter;->cleanUp()Z

    move-result v5

    if-nez v5, :cond_0

    .line 388
    sget-object v5, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v6, "Failed to delete temp file"

    invoke-static {v5, v6}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 397
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    .line 385
    return-object v3

    .line 373
    .end local v1    # "inserter":Lcom/facebook/cache/disk/DiskStorage$Inserter;
    .end local v3    # "resource":Lcom/facebook/binaryresource/BinaryResource;
    .end local v4    # "resourceId":Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v5

    .line 387
    .restart local v1    # "inserter":Lcom/facebook/cache/disk/DiskStorage$Inserter;
    .restart local v4    # "resourceId":Ljava/lang/String;
    :catchall_1
    move-exception v5

    :try_start_5
    invoke-interface {v1}, Lcom/facebook/cache/disk/DiskStorage$Inserter;->cleanUp()Z

    move-result v6

    if-nez v6, :cond_1

    .line 388
    sget-object v6, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v7, "Failed to delete temp file"

    invoke-static {v6, v7}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V

    :cond_1
    throw v5
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 391
    .end local v1    # "inserter":Lcom/facebook/cache/disk/DiskStorage$Inserter;
    :catch_0
    move-exception v2

    .line 392
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v0, v2}, Lcom/facebook/cache/disk/SettableCacheEvent;->setException(Ljava/io/IOException;)Lcom/facebook/cache/disk/SettableCacheEvent;

    .line 393
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v5, v0}, Lcom/facebook/cache/common/CacheEventListener;->onWriteException(Lcom/facebook/cache/common/CacheEvent;)V

    .line 394
    sget-object v5, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    const-string/jumbo v6, "Failed inserting a file into the cache"

    invoke-static {v5, v6, v2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 395
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 397
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_2
    move-exception v5

    invoke-virtual {v0}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    throw v5
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v0}, Lcom/facebook/cache/disk/DiskStorage;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public isIndexReady()Z
    .locals 1

    .prologue
    .line 246
    iget-boolean v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexReady:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mIndexPopulateAtStartupEnabled:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public probe(Lcom/facebook/cache/common/CacheKey;)Z
    .locals 9
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;

    .prologue
    const/4 v7, 0x0

    .line 311
    const/4 v4, 0x0

    .line 313
    .local v4, "resourceId":Ljava/lang/String;
    :try_start_0
    iget-object v8, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    :try_start_1
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getResourceIds(Lcom/facebook/cache/common/CacheKey;)Ljava/util/List;

    move-result-object v5

    .line 315
    .local v5, "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 316
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 317
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v6, v4, p1}, Lcom/facebook/cache/disk/DiskStorage;->touch(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 318
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 319
    const/4 v6, 0x1

    monitor-exit v8

    .line 331
    .end local v3    # "i":I
    .end local v5    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    return v6

    .line 315
    .restart local v3    # "i":I
    .restart local v5    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 322
    :cond_1
    monitor-exit v8

    move v6, v7

    goto :goto_1

    .line 323
    .end local v3    # "i":I
    .end local v5    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v6

    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v6
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 324
    :catch_0
    move-exception v2

    .line 325
    .local v2, "e":Ljava/io/IOException;
    invoke-static {}, Lcom/facebook/cache/disk/SettableCacheEvent;->obtain()Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v6

    .line 326
    invoke-virtual {v6, p1}, Lcom/facebook/cache/disk/SettableCacheEvent;->setCacheKey(Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v6

    .line 327
    invoke-virtual {v6, v4}, Lcom/facebook/cache/disk/SettableCacheEvent;->setResourceId(Ljava/lang/String;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v6

    .line 328
    invoke-virtual {v6, v2}, Lcom/facebook/cache/disk/SettableCacheEvent;->setException(Ljava/io/IOException;)Lcom/facebook/cache/disk/SettableCacheEvent;

    move-result-object v1

    .line 329
    .local v1, "cacheEvent":Lcom/facebook/cache/disk/SettableCacheEvent;
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheEventListener:Lcom/facebook/cache/common/CacheEventListener;

    invoke-interface {v6, v1}, Lcom/facebook/cache/common/CacheEventListener;->onReadException(Lcom/facebook/cache/common/CacheEvent;)V

    .line 330
    invoke-virtual {v1}, Lcom/facebook/cache/disk/SettableCacheEvent;->recycle()V

    move v6, v7

    .line 331
    goto :goto_1
.end method

.method public remove(Lcom/facebook/cache/common/CacheKey;)V
    .locals 11
    .param p1, "key"    # Lcom/facebook/cache/common/CacheKey;

    .prologue
    .line 403
    iget-object v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 405
    const/4 v3, 0x0

    .line 406
    .local v3, "resourceId":Ljava/lang/String;
    :try_start_0
    invoke-static {p1}, Lcom/facebook/cache/common/CacheKeyUtil;->getResourceIds(Lcom/facebook/cache/common/CacheKey;)Ljava/util/List;

    move-result-object v4

    .line 407
    .local v4, "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 408
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 409
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mStorage:Lcom/facebook/cache/disk/DiskStorage;

    invoke-interface {v5, v3}, Lcom/facebook/cache/disk/DiskStorage;->remove(Ljava/lang/String;)J

    .line 410
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mResourceIndex:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 412
    .end local v2    # "i":I
    .end local v4    # "resourceIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 413
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheErrorLogger:Lcom/facebook/cache/common/CacheErrorLogger;

    sget-object v7, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->DELETE_FILE:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    sget-object v8, Lcom/facebook/cache/disk/DiskStorageCache;->TAG:Ljava/lang/Class;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "delete: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 416
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 413
    invoke-interface {v5, v7, v8, v9, v1}, Lcom/facebook/cache/common/CacheErrorLogger;->logError(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    monitor-exit v6

    .line 420
    return-void

    .line 419
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method public trimToMinimum()V
    .locals 12

    .prologue
    const-wide/16 v8, 0x0

    .line 659
    iget-object v5, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 660
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->maybeUpdateFileCacheSize()Z

    .line 661
    iget-object v4, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheStats:Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;

    invoke-virtual {v4}, Lcom/facebook/cache/disk/DiskStorageCache$CacheStats;->getSize()J

    move-result-wide v0

    .line 662
    .local v0, "cacheSize":J
    iget-wide v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimitMinimum:J

    cmp-long v4, v6, v8

    if-lez v4, :cond_0

    cmp-long v4, v0, v8

    if-lez v4, :cond_0

    iget-wide v6, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimitMinimum:J

    cmp-long v4, v0, v6

    if-gez v4, :cond_1

    .line 663
    :cond_0
    monitor-exit v5

    .line 670
    :goto_0
    return-void

    .line 665
    :cond_1
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    iget-wide v8, p0, Lcom/facebook/cache/disk/DiskStorageCache;->mCacheSizeLimitMinimum:J

    long-to-double v8, v8

    long-to-double v10, v0

    div-double/2addr v8, v10

    sub-double v2, v6, v8

    .line 666
    .local v2, "trimRatio":D
    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpl-double v4, v2, v6

    if-lez v4, :cond_2

    .line 667
    invoke-direct {p0, v2, v3}, Lcom/facebook/cache/disk/DiskStorageCache;->trimBy(D)V

    .line 669
    :cond_2
    monitor-exit v5

    goto :goto_0

    .end local v0    # "cacheSize":J
    .end local v2    # "trimRatio":D
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public trimToNothing()V
    .locals 0

    .prologue
    .line 674
    invoke-virtual {p0}, Lcom/facebook/cache/disk/DiskStorageCache;->clearAll()V

    .line 675
    return-void
.end method
