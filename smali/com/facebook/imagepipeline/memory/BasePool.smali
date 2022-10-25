.class public abstract Lcom/facebook/imagepipeline/memory/BasePool;
.super Ljava/lang/Object;
.source "BasePool.java"

# interfaces
.implements Lcom/facebook/imagepipeline/memory/Pool;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;,
        Lcom/facebook/imagepipeline/memory/BasePool$SizeTooLargeException;,
        Lcom/facebook/imagepipeline/memory/BasePool$InvalidSizeException;,
        Lcom/facebook/imagepipeline/memory/BasePool$InvalidValueException;,
        Lcom/facebook/imagepipeline/memory/BasePool$Counter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/memory/Pool",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private mAllowNewBuckets:Z

.field final mBuckets:Landroid/util/SparseArray;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/facebook/imagepipeline/memory/Bucket",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field final mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field final mInUseValues:Ljava/util/Set;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation
.end field

.field final mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

.field final mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

.field private final mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

.field final mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V
    .locals 2
    .param p1, "memoryTrimmableRegistry"    # Lcom/facebook/common/memory/MemoryTrimmableRegistry;
    .param p2, "poolParams"    # Lcom/facebook/imagepipeline/memory/PoolParams;
    .param p3, "poolStatsTracker"    # Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .prologue
    .line 168
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    .line 169
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    .line 170
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/PoolParams;

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    .line 171
    invoke-static {p3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .line 174
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    .line 175
    new-instance v0, Landroid/util/SparseIntArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->initBuckets(Landroid/util/SparseIntArray;)V

    .line 177
    invoke-static {}, Lcom/facebook/common/internal/Sets;->newIdentityHashSet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    .line 179
    new-instance v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 180
    new-instance v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    .line 181
    return-void
.end method

.method private declared-synchronized ensurePoolSizeInvariant()V
    .locals 1

    .prologue
    .line 444
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    monitor-exit p0

    return-void

    .line 444
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized initBuckets(Landroid/util/SparseIntArray;)V
    .locals 8
    .param p1, "inUseCounts"    # Landroid/util/SparseIntArray;

    .prologue
    .line 453
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->clear()V

    .line 459
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget-object v2, v5, Lcom/facebook/imagepipeline/memory/PoolParams;->bucketSizes:Landroid/util/SparseIntArray;

    .line 460
    .local v2, "bucketSizes":Landroid/util/SparseIntArray;
    if-eqz v2, :cond_1

    .line 461
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/util/SparseIntArray;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 462
    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v1

    .line 463
    .local v1, "bucketSize":I
    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    .line 464
    .local v4, "maxLength":I
    const/4 v5, 0x0

    invoke-virtual {p1, v1, v5}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 465
    .local v0, "bucketInUseCount":I
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    new-instance v6, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 468
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v7

    invoke-direct {v6, v7, v4, v0}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(III)V

    .line 465
    invoke-virtual {v5, v1, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 461
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 472
    .end local v0    # "bucketInUseCount":I
    .end local v1    # "bucketSize":I
    .end local v4    # "maxLength":I
    :cond_0
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 476
    .end local v3    # "i":I
    :goto_1
    monitor-exit p0

    return-void

    .line 474
    :cond_1
    const/4 v5, 0x1

    :try_start_1
    iput-boolean v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 453
    .end local v2    # "bucketSizes":Landroid/util/SparseIntArray;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private logStats()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InvalidAccessToGuardedField"
        }
    .end annotation

    .prologue
    .line 685
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 686
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v1, "Used = (%d, %d); Free = (%d, %d)"

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    .line 689
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    .line 690
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    .line 691
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v5, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    .line 692
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 686
    invoke-static/range {v0 .. v5}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 694
    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract alloc(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation
.end method

.method declared-synchronized canAllocate(I)Z
    .locals 5
    .param p1, "sizeInBytes"    # I
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    const/4 v2, 0x0

    .line 655
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v0, v3, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    .line 659
    .local v0, "hardCap":I
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    sub-int v3, v0, v3

    if-le p1, v3, :cond_0

    .line 660
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v3}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onHardCapReached()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 676
    :goto_0
    monitor-exit p0

    return v2

    .line 665
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v1, v3, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    .line 666
    .local v1, "softCap":I
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v3, v4

    sub-int v3, v1, v3

    if-le p1, v3, :cond_1

    .line 667
    sub-int v3, v1, p1

    invoke-virtual {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSize(I)V

    .line 671
    :cond_1
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v3, v3, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v3, v4

    sub-int v3, v0, v3

    if-le p1, v3, :cond_2

    .line 672
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v3}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onHardCapReached()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 655
    .end local v0    # "hardCap":I
    .end local v1    # "softCap":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 676
    .restart local v0    # "hardCap":I
    .restart local v1    # "softCap":I
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method protected abstract free(Ljava/lang/Object;)V
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation
.end method

.method public get(I)Ljava/lang/Object;
    .locals 9
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .prologue
    .line 204
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->ensurePoolSizeInvariant()V

    .line 206
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSize(I)I

    move-result v1

    .line 207
    .local v1, "bucketedSize":I
    const/4 v3, -0x1

    .line 209
    .local v3, "sizeInBytes":I
    monitor-enter p0

    .line 210
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v0

    .line 212
    .local v0, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    if-eqz v0, :cond_1

    .line 214
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->get()Ljava/lang/Object;

    move-result-object v4

    .line 215
    .local v4, "value":Ljava/lang/Object;, "TV;"
    if-eqz v4, :cond_1

    .line 216
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    invoke-static {v5}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 220
    invoke-virtual {p0, v4}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSizeForValue(Ljava/lang/Object;)I

    move-result v1

    .line 221
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v3

    .line 222
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v5, v3}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    .line 223
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v5, v3}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    .line 224
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v5, v3}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onValueReuse(I)V

    .line 225
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 226
    const/4 v5, 0x2

    invoke-static {v5}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 227
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v6, "get (reuse) (object, size) = (%x, %s)"

    .line 230
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 231
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 227
    invoke-static {v5, v6, v7, v8}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 233
    :cond_0
    monitor-exit p0

    .line 293
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :goto_0
    return-object v4

    .line 238
    :cond_1
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v3

    .line 239
    invoke-virtual {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->canAllocate(I)Z

    move-result v5

    if-nez v5, :cond_2

    .line 240
    new-instance v5, Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    iget-object v7, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v7, v7, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v8, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v8, v8, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-direct {v5, v6, v7, v8, v3}, Lcom/facebook/imagepipeline/memory/BasePool$PoolSizeViolationException;-><init>(IIII)V

    throw v5

    .line 252
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :catchall_0
    move-exception v5

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 248
    .restart local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :cond_2
    :try_start_1
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v5, v3}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    .line 249
    if-eqz v0, :cond_3

    .line 250
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->incrementInUseCount()V

    .line 252
    :cond_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 254
    const/4 v4, 0x0

    .line 259
    .restart local v4    # "value":Ljava/lang/Object;, "TV;"
    :try_start_2
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->alloc(I)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v4

    .line 278
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :goto_1
    monitor-enter p0

    .line 279
    :try_start_3
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    invoke-static {v5}, Lcom/facebook/common/internal/Preconditions;->checkState(Z)V

    .line 281
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSoftCap()V

    .line 282
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v5, v3}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onAlloc(I)V

    .line 283
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 284
    const/4 v5, 0x2

    invoke-static {v5}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 285
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v6, "get (alloc) (object, size) = (%x, %s)"

    .line 288
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 289
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 285
    invoke-static {v5, v6, v7, v8}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 291
    :cond_4
    monitor-exit p0

    goto :goto_0

    :catchall_1
    move-exception v5

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5

    .line 260
    .restart local v4    # "value":Ljava/lang/Object;, "TV;"
    :catch_0
    move-exception v2

    .line 263
    .local v2, "e":Ljava/lang/Throwable;
    monitor-enter p0

    .line 264
    :try_start_4
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v5, v3}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    .line 265
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v0

    .line 266
    if-eqz v0, :cond_5

    .line 267
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->decrementInUseCount()V

    .line 269
    :cond_5
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 270
    invoke-static {v2}, Lcom/facebook/common/internal/Throwables;->propagateIfPossible(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 269
    :catchall_2
    move-exception v5

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v5
.end method

.method declared-synchronized getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;
    .locals 5
    .param p1, "bucketedSize"    # I
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/imagepipeline/memory/Bucket",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 609
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 610
    .local v0, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    if-nez v0, :cond_0

    iget-boolean v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mAllowNewBuckets:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    :cond_0
    move-object v1, v0

    .line 620
    :goto_0
    monitor-exit p0

    return-object v1

    .line 615
    :cond_1
    const/4 v2, 0x2

    :try_start_1
    invoke-static {v2}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 616
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v3, "creating new bucket %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 618
    :cond_2
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->newBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v1

    .line 619
    .local v1, "newBucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 609
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    .end local v1    # "newBucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected abstract getBucketedSize(I)I
.end method

.method protected abstract getBucketedSizeForValue(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)I"
        }
    .end annotation
.end method

.method protected abstract getSizeInBytes(I)I
.end method

.method public declared-synchronized getStats()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 700
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 701
    .local v4, "stats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 702
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    .line 703
    .local v2, "bucketedSize":I
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 704
    .local v1, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "buckets_used_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 705
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 706
    .local v0, "BUCKET_USED_KEY":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/memory/Bucket;->getInUseCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 709
    .end local v0    # "BUCKET_USED_KEY":Ljava/lang/String;
    .end local v1    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    .end local v2    # "bucketedSize":I
    :cond_0
    const-string/jumbo v5, "soft_cap"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    const-string/jumbo v5, "hard_cap"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeHardCap:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    const-string/jumbo v5, "used_count"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    const-string/jumbo v5, "used_bytes"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    const-string/jumbo v5, "free_count"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    const-string/jumbo v5, "free_bytes"

    iget-object v6, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v6, v6, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 716
    monitor-exit p0

    return-object v4

    .line 700
    .end local v3    # "i":I
    .end local v4    # "stats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method protected initialize()V
    .locals 1

    .prologue
    .line 187
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mMemoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    invoke-interface {v0, p0}, Lcom/facebook/common/memory/MemoryTrimmableRegistry;->registerMemoryTrimmable(Lcom/facebook/common/memory/MemoryTrimmable;)V

    .line 188
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v0, p0}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->setBasePool(Lcom/facebook/imagepipeline/memory/BasePool;)V

    .line 189
    return-void
.end method

.method declared-synchronized isMaxSizeSoftCapExceeded()Z
    .locals 3
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 636
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v1, v1, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v2, v2, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v2, v2, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    if-le v1, v2, :cond_1

    const/4 v0, 0x1

    .line 638
    .local v0, "isMaxSizeSoftCapExceeded":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 639
    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v1}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onSoftCapReached()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 641
    :cond_0
    monitor-exit p0

    return v0

    .line 636
    .end local v0    # "isMaxSizeSoftCapExceeded":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected isReusable(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .prologue
    .line 435
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    const/4 v0, 0x1

    return v0
.end method

.method newBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;
    .locals 4
    .param p1, "bucketedSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/imagepipeline/memory/Bucket",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 624
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    new-instance v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 625
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v1

    const v2, 0x7fffffff

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/memory/Bucket;-><init>(III)V

    .line 624
    return-object v0
.end method

.method protected onParamsChanged()V
    .locals 0

    .prologue
    .line 424
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    return-void
.end method

.method public release(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 308
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucketedSizeForValue(Ljava/lang/Object;)I

    move-result v1

    .line 311
    .local v1, "bucketedSize":I
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getSizeInBytes(I)I

    move-result v2

    .line 312
    .local v2, "sizeInBytes":I
    monitor-enter p0

    .line 313
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/facebook/imagepipeline/memory/BasePool;->getBucket(I)Lcom/facebook/imagepipeline/memory/Bucket;

    move-result-object v0

    .line 314
    .local v0, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mInUseValues:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 317
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v4, "release (free, value unrecognized) (object, size) = (%x, %s)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 320
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    .line 321
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    .line 317
    invoke-static {v3, v4, v5}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 322
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    .line 323
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v3, v2}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onFree(I)V

    .line 366
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 367
    monitor-exit p0

    .line 368
    return-void

    .line 334
    :cond_1
    if-eqz v0, :cond_2

    .line 335
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->isMaxLengthExceeded()Z

    move-result v3

    if-nez v3, :cond_2

    .line 336
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v3

    if-nez v3, :cond_2

    .line 337
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->isReusable(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 338
    :cond_2
    if-eqz v0, :cond_3

    .line 339
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->decrementInUseCount()V

    .line 342
    :cond_3
    const/4 v3, 0x2

    invoke-static {v3}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 343
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v4, "release (free) (object, size) = (%x, %s)"

    .line 346
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 347
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 343
    invoke-static {v3, v4, v5, v6}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 349
    :cond_4
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    .line 350
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    .line 351
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v3, v2}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onFree(I)V

    goto :goto_0

    .line 367
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 353
    .restart local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :cond_5
    :try_start_1
    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/memory/Bucket;->release(Ljava/lang/Object;)V

    .line 354
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->increment(I)V

    .line 355
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v3, v2}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V

    .line 356
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolStatsTracker:Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    invoke-interface {v3, v2}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker;->onValueRelease(I)V

    .line 357
    const/4 v3, 0x2

    invoke-static {v3}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 358
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v4, "release (reuse) (object, size) = (%x, %s)"

    .line 361
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 362
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 358
    invoke-static {v3, v4, v5, v6}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public trim(Lcom/facebook/common/memory/MemoryTrimType;)V
    .locals 0
    .param p1, "memoryTrimType"    # Lcom/facebook/common/memory/MemoryTrimType;

    .prologue
    .line 378
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToNothing()V

    .line 379
    return-void
.end method

.method trimToNothing()V
    .locals 7
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 486
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    new-instance v1, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 487
    .local v1, "bucketsToTrim":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/imagepipeline/memory/Bucket<TV;>;>;"
    new-instance v3, Landroid/util/SparseIntArray;

    invoke-direct {v3}, Landroid/util/SparseIntArray;-><init>()V

    .line 489
    .local v3, "inUseCounts":Landroid/util/SparseIntArray;
    monitor-enter p0

    .line 490
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    :try_start_0
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 491
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 492
    .local v0, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->getFreeListSize()I

    move-result v5

    if-lez v5, :cond_0

    .line 493
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    :cond_0
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->getInUseCount()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 490
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 499
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :cond_1
    invoke-direct {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->initBuckets(Landroid/util/SparseIntArray;)V

    .line 502
    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    invoke-virtual {v5}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->reset()V

    .line 503
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 504
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 507
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->onParamsChanged()V

    .line 512
    const/4 v2, 0x0

    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 513
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 518
    .restart local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :goto_2
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->pop()Ljava/lang/Object;

    move-result-object v4

    .line 519
    .local v4, "item":Ljava/lang/Object;, "TV;"
    if-nez v4, :cond_2

    .line 512
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 504
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    .end local v4    # "item":Ljava/lang/Object;, "TV;"
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 522
    .restart local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    .restart local v4    # "item":Ljava/lang/Object;, "TV;"
    :cond_2
    invoke-virtual {p0, v4}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    goto :goto_2

    .line 525
    .end local v0    # "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    .end local v4    # "item":Ljava/lang/Object;, "TV;"
    :cond_3
    return-void
.end method

.method declared-synchronized trimToSize(I)V
    .locals 9
    .param p1, "targetSize"    # I
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 557
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v4, v4, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v5, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v4, v5

    sub-int/2addr v4, p1

    iget-object v5, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v5, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 558
    .local v1, "bytesToFree":I
    if-gtz v1, :cond_1

    .line 598
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 561
    :cond_1
    const/4 v4, 0x2

    :try_start_1
    invoke-static {v4}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 562
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v5, "trimToSize: TargetSize = %d; Initial Size = %d; Bytes to free = %d"

    .line 565
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v7, v7, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v8, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v8, v8, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v7, v8

    .line 566
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 567
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 562
    invoke-static {v4, v5, v6, v7, v8}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 569
    :cond_2
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 573
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 574
    if-gtz v1, :cond_4

    .line 590
    :cond_3
    invoke-direct {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->logStats()V

    .line 591
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/facebook/common/logging/FLog;->isLoggable(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 592
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->TAG:Ljava/lang/Class;

    const-string/jumbo v5, "trimToSize: TargetSize = %d; Final Size = %d"

    .line 595
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mUsed:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v7, v7, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    iget-object v8, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v8, v8, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->mNumBytes:I

    add-int/2addr v7, v8

    .line 596
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 592
    invoke-static {v4, v5, v6, v7}, Lcom/facebook/common/logging/FLog;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 557
    .end local v1    # "bytesToFree":I
    .end local v2    # "i":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 577
    .restart local v1    # "bytesToFree":I
    .restart local v2    # "i":I
    :cond_4
    :try_start_2
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mBuckets:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/Bucket;

    .line 578
    .local v0, "bucket":Lcom/facebook/imagepipeline/memory/Bucket;, "Lcom/facebook/imagepipeline/memory/Bucket<TV;>;"
    :goto_2
    if-lez v1, :cond_5

    .line 579
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/Bucket;->pop()Ljava/lang/Object;

    move-result-object v3

    .line 580
    .local v3, "value":Ljava/lang/Object;, "TV;"
    if-nez v3, :cond_6

    .line 573
    .end local v3    # "value":Ljava/lang/Object;, "TV;"
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 583
    .restart local v3    # "value":Ljava/lang/Object;, "TV;"
    :cond_6
    invoke-virtual {p0, v3}, Lcom/facebook/imagepipeline/memory/BasePool;->free(Ljava/lang/Object;)V

    .line 584
    iget v4, v0, Lcom/facebook/imagepipeline/memory/Bucket;->mItemSize:I

    sub-int/2addr v1, v4

    .line 585
    iget-object v4, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mFree:Lcom/facebook/imagepipeline/memory/BasePool$Counter;

    iget v5, v0, Lcom/facebook/imagepipeline/memory/Bucket;->mItemSize:I

    invoke-virtual {v4, v5}, Lcom/facebook/imagepipeline/memory/BasePool$Counter;->decrement(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method declared-synchronized trimToSoftCap()V
    .locals 1
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 536
    .local p0, "this":Lcom/facebook/imagepipeline/memory/BasePool;, "Lcom/facebook/imagepipeline/memory/BasePool<TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BasePool;->isMaxSizeSoftCapExceeded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 537
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/BasePool;->mPoolParams:Lcom/facebook/imagepipeline/memory/PoolParams;

    iget v0, v0, Lcom/facebook/imagepipeline/memory/PoolParams;->maxSizeSoftCap:I

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/BasePool;->trimToSize(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 539
    :cond_0
    monitor-exit p0

    return-void

    .line 536
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
