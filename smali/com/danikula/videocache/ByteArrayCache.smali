.class public Lcom/danikula/videocache/ByteArrayCache;
.super Ljava/lang/Object;
.source "ByteArrayCache.java"

# interfaces
.implements Lcom/danikula/videocache/Cache;


# instance fields
.field private volatile completed:Z

.field private volatile data:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-direct {p0, v0}, Lcom/danikula/videocache/ByteArrayCache;-><init>([B)V

    .line 18
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    .line 22
    return-void
.end method


# virtual methods
.method public append([BI)V
    .locals 4
    .param p1, "newData"    # [B
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 42
    iget-object v1, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    if-ltz p2, :cond_0

    array-length v1, p1

    if-gt p2, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkArgument(Z)V

    .line 45
    iget-object v1, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    iget-object v3, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    array-length v3, v3

    add-int/2addr v3, p2

    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 46
    .local v0, "appendedData":[B
    iget-object v1, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    array-length v1, v1

    invoke-static {p1, v2, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    iput-object v0, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    .line 48
    return-void

    .end local v0    # "appendedData":[B
    :cond_0
    move v1, v2

    .line 43
    goto :goto_0
.end method

.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    array-length v0, v0

    return v0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 52
    return-void
.end method

.method public complete()V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/danikula/videocache/ByteArrayCache;->completed:Z

    .line 57
    return-void
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/danikula/videocache/ByteArrayCache;->completed:Z

    return v0
.end method

.method public read([BJI)I
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    array-length v0, v0

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 27
    const/4 v0, -0x1

    .line 32
    :goto_0
    return v0

    .line 29
    :cond_0
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Too long offset for memory cache "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/danikula/videocache/ByteArrayCache;->data:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    long-to-int v1, p2

    invoke-virtual {v0, p1, v1, p4}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v0

    goto :goto_0
.end method
