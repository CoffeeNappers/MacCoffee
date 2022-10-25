.class public Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;
.super Ljava/lang/Object;
.source "NativePooledByteBufferFactory.java"

# interfaces
.implements Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private final mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

.field private final mPooledByteStreams:Lcom/facebook/imagepipeline/memory/PooledByteStreams;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;Lcom/facebook/imagepipeline/memory/PooledByteStreams;)V
    .locals 0
    .param p1, "pool"    # Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;
    .param p2, "pooledByteStreams"    # Lcom/facebook/imagepipeline/memory/PooledByteStreams;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    .line 36
    iput-object p2, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPooledByteStreams:Lcom/facebook/imagepipeline/memory/PooledByteStreams;

    .line 37
    return-void
.end method


# virtual methods
.method newByteBuf(Ljava/io/InputStream;Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "outputStream"    # Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPooledByteStreams:Lcom/facebook/imagepipeline/memory/PooledByteStreams;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/imagepipeline/memory/PooledByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 122
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->toByteBuffer()Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public newByteBuffer(I)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    .locals 3
    .param p1, "size"    # I

    .prologue
    .line 41
    if-lez p1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Z)V

    .line 42
    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-virtual {v1, p1}, Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-static {v1, v2}, Lcom/facebook/common/references/CloseableReference;->of(Ljava/lang/Object;Lcom/facebook/common/references/ResourceReleaser;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    .line 44
    .local v0, "chunkRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/NativeMemoryChunk;>;"
    :try_start_0
    new-instance v1, Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    invoke-direct {v1, v0, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;-><init>(Lcom/facebook/common/references/CloseableReference;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    .line 44
    return-object v1

    .line 41
    .end local v0    # "chunkRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/NativeMemoryChunk;>;"
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 46
    .restart local v0    # "chunkRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/NativeMemoryChunk;>;"
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    throw v1
.end method

.method public newByteBuffer(Ljava/io/InputStream;)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;-><init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;)V

    .line 61
    .local v0, "outputStream":Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuf(Ljava/io/InputStream;Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 63
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    .line 61
    return-object v1

    .line 63
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    throw v1
.end method

.method public newByteBuffer(Ljava/io/InputStream;I)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-direct {v0, v1, p2}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;-><init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;I)V

    .line 101
    .local v0, "outputStream":Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuf(Ljava/io/InputStream;Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 103
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    .line 101
    return-object v1

    .line 103
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    throw v1
.end method

.method public newByteBuffer([B)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    .locals 4
    .param p1, "bytes"    # [B

    .prologue
    .line 75
    new-instance v1, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    iget-object v2, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    array-length v3, p1

    invoke-direct {v1, v2, v3}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;-><init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;I)V

    .line 78
    .local v1, "outputStream":Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    const/4 v2, 0x0

    :try_start_0
    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->write([BII)V

    .line 79
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->toByteBuffer()Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 83
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    .line 79
    return-object v2

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_1
    invoke-static {v0}, Lcom/facebook/common/internal/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;->close()V

    throw v2
.end method

.method public bridge synthetic newByteBuffer(I)Lcom/facebook/imagepipeline/memory/PooledByteBuffer;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuffer(I)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newByteBuffer(Ljava/io/InputStream;)Lcom/facebook/imagepipeline/memory/PooledByteBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuffer(Ljava/io/InputStream;)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newByteBuffer(Ljava/io/InputStream;I)Lcom/facebook/imagepipeline/memory/PooledByteBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuffer(Ljava/io/InputStream;I)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newByteBuffer([B)Lcom/facebook/imagepipeline/memory/PooledByteBuffer;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newByteBuffer([B)Lcom/facebook/imagepipeline/memory/NativePooledByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public newOutputStream()Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    .locals 2

    .prologue
    .line 131
    new-instance v0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;-><init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;)V

    return-object v0
.end method

.method public newOutputStream(I)Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;
    .locals 2
    .param p1, "initialCapacity"    # I

    .prologue
    .line 141
    new-instance v0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    iget-object v1, p0, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->mPool:Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;

    invoke-direct {v0, v1, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;-><init>(Lcom/facebook/imagepipeline/memory/NativeMemoryChunkPool;I)V

    return-object v0
.end method

.method public bridge synthetic newOutputStream()Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newOutputStream()Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newOutputStream(I)Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/NativePooledByteBufferFactory;->newOutputStream(I)Lcom/facebook/imagepipeline/memory/NativePooledByteBufferOutputStream;

    move-result-object v0

    return-object v0
.end method
