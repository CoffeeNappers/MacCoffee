.class public Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;
.super Lcom/facebook/imagepipeline/memory/BasePool;
.source "GenericByteArrayPool.java"

# interfaces
.implements Lcom/facebook/imagepipeline/memory/ByteArrayPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/memory/BasePool",
        "<[B>;",
        "Lcom/facebook/imagepipeline/memory/ByteArrayPool;"
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private final mBucketSizes:[I


# direct methods
.method public constructor <init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V
    .locals 4
    .param p1, "memoryTrimmableRegistry"    # Lcom/facebook/common/memory/MemoryTrimmableRegistry;
    .param p2, "poolParams"    # Lcom/facebook/imagepipeline/memory/PoolParams;
    .param p3, "poolStatsTracker"    # Lcom/facebook/imagepipeline/memory/PoolStatsTracker;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/memory/BasePool;-><init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V

    .line 44
    iget-object v0, p2, Lcom/facebook/imagepipeline/memory/PoolParams;->bucketSizes:Landroid/util/SparseIntArray;

    .line 45
    .local v0, "bucketSizes":Landroid/util/SparseIntArray;
    invoke-virtual {v0}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->mBucketSizes:[I

    .line 46
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 47
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->mBucketSizes:[I

    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    aput v3, v2, v1

    .line 46
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->initialize()V

    .line 50
    return-void
.end method


# virtual methods
.method protected bridge synthetic alloc(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->alloc(I)[B

    move-result-object v0

    return-object v0
.end method

.method protected alloc(I)[B
    .locals 1
    .param p1, "bucketedSize"    # I

    .prologue
    .line 67
    new-array v0, p1, [B

    return-object v0
.end method

.method protected bridge synthetic free(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 29
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->free([B)V

    return-void
.end method

.method protected free([B)V
    .locals 0
    .param p1, "value"    # [B

    .prologue
    .line 76
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void
.end method

.method protected getBucketedSize(I)I
    .locals 5
    .param p1, "requestSize"    # I

    .prologue
    .line 102
    move v1, p1

    .line 103
    .local v1, "intRequestSize":I
    if-gtz v1, :cond_0

    .line 104
    new-instance v2, Lcom/facebook/imagepipeline/memory/BasePool$InvalidSizeException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/imagepipeline/memory/BasePool$InvalidSizeException;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 108
    :cond_0
    iget-object v3, p0, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->mBucketSizes:[I

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_2

    aget v0, v3, v2

    .line 109
    .local v0, "bucketedSize":I
    if-lt v0, v1, :cond_1

    .line 116
    .end local v0    # "bucketedSize":I
    :goto_1
    return v0

    .line 108
    .restart local v0    # "bucketedSize":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bucketedSize":I
    :cond_2
    move v0, p1

    .line 116
    goto :goto_1
.end method

.method protected bridge synthetic getBucketedSizeForValue(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 29
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->getBucketedSizeForValue([B)I

    move-result v0

    return v0
.end method

.method protected getBucketedSizeForValue([B)I
    .locals 1
    .param p1, "value"    # [B

    .prologue
    .line 126
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    array-length v0, p1

    return v0
.end method

.method public getMinBufferSize()I
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/GenericByteArrayPool;->mBucketSizes:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method protected getSizeInBytes(I)I
    .locals 0
    .param p1, "bucketedSize"    # I

    .prologue
    .line 87
    return p1
.end method
