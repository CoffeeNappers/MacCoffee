.class public Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;
.super Ljava/io/InputStream;
.source "PooledByteBufferInputStream.java"


# annotations
.annotation build Ljavax/annotation/concurrent/NotThreadSafe;
.end annotation


# instance fields
.field mMark:I
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation
.end field

.field mOffset:I
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation
.end field

.field final mPooledByteBuffer:Lcom/facebook/imagepipeline/memory/PooledByteBuffer;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/memory/PooledByteBuffer;)V
    .locals 2
    .param p1, "pooledByteBuffer"    # Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    invoke-interface {p1}, Lcom/facebook/imagepipeline/memory/PooledByteBuffer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Z)V

    .line 40
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    iput-object v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mPooledByteBuffer:Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    .line 41
    iput v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    .line 42
    iput v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mMark:I

    .line 43
    return-void

    :cond_0
    move v0, v1

    .line 39
    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mPooledByteBuffer:Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/memory/PooledByteBuffer;->size()I

    move-result v0

    iget v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public mark(I)V
    .locals 1
    .param p1, "readlimit"    # I

    .prologue
    .line 61
    iget v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    iput v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mMark:I

    .line 62
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public read()I
    .locals 3

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->available()I

    move-result v0

    if-gtz v0, :cond_0

    .line 76
    const/4 v0, -0x1

    .line 78
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mPooledByteBuffer:Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    iget v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    invoke-interface {v0, v1}, Lcom/facebook/imagepipeline/memory/PooledByteBuffer;->read(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "buffer"    # [B

    .prologue
    .line 83
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 5
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 96
    if-ltz p2, :cond_0

    if-ltz p3, :cond_0

    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_1

    .line 97
    :cond_0
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "length="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "; regionStart="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "; regionLength="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->available()I

    move-result v0

    .line 104
    .local v0, "available":I
    if-gtz v0, :cond_2

    .line 105
    const/4 v1, -0x1

    .line 115
    :goto_0
    return v1

    .line 108
    :cond_2
    if-gtz p3, :cond_3

    .line 109
    const/4 v1, 0x0

    goto :goto_0

    .line 112
    :cond_3
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 113
    .local v1, "numToRead":I
    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mPooledByteBuffer:Lcom/facebook/imagepipeline/memory/PooledByteBuffer;

    iget v3, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    invoke-interface {v2, v3, p1, p2, v1}, Lcom/facebook/imagepipeline/memory/PooledByteBuffer;->read(I[BII)V

    .line 114
    iget v2, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 125
    iget v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mMark:I

    iput v0, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    .line 126
    return-void
.end method

.method public skip(J)J
    .locals 5
    .param p1, "byteCount"    # J

    .prologue
    .line 135
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Z)V

    .line 136
    long-to-int v1, p1

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->available()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 137
    .local v0, "skipped":I
    iget v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/facebook/imagepipeline/memory/PooledByteBufferInputStream;->mOffset:I

    .line 138
    int-to-long v2, v0

    return-wide v2

    .line 135
    .end local v0    # "skipped":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
