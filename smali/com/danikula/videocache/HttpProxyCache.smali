.class Lcom/danikula/videocache/HttpProxyCache;
.super Lcom/danikula/videocache/ProxyCache;
.source "HttpProxyCache.java"


# static fields
.field private static final NO_CACHE_BARRIER:F = 0.2f


# instance fields
.field private final cache:Lcom/danikula/videocache/file/FileCache;

.field private listener:Lcom/danikula/videocache/CacheListener;

.field private final source:Lcom/danikula/videocache/HttpUrlSource;


# direct methods
.method public constructor <init>(Lcom/danikula/videocache/HttpUrlSource;Lcom/danikula/videocache/file/FileCache;)V
    .locals 0
    .param p1, "source"    # Lcom/danikula/videocache/HttpUrlSource;
    .param p2, "cache"    # Lcom/danikula/videocache/file/FileCache;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/danikula/videocache/ProxyCache;-><init>(Lcom/danikula/videocache/Source;Lcom/danikula/videocache/Cache;)V

    .line 29
    iput-object p2, p0, Lcom/danikula/videocache/HttpProxyCache;->cache:Lcom/danikula/videocache/file/FileCache;

    .line 30
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    .line 31
    return-void
.end method

.method private isUseCache(Lcom/danikula/videocache/GetRequest;)Z
    .locals 9
    .param p1, "request"    # Lcom/danikula/videocache/GetRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 51
    iget-object v5, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->length()I

    move-result v1

    .line 52
    .local v1, "sourceLength":I
    if-lez v1, :cond_2

    move v2, v3

    .line 53
    .local v2, "sourceLengthKnown":Z
    :goto_0
    iget-object v5, p0, Lcom/danikula/videocache/HttpProxyCache;->cache:Lcom/danikula/videocache/file/FileCache;

    invoke-virtual {v5}, Lcom/danikula/videocache/file/FileCache;->available()I

    move-result v0

    .line 55
    .local v0, "cacheAvailable":I
    if-eqz v2, :cond_0

    iget-boolean v5, p1, Lcom/danikula/videocache/GetRequest;->partial:Z

    if-eqz v5, :cond_0

    iget-wide v6, p1, Lcom/danikula/videocache/GetRequest;->rangeOffset:J

    long-to-float v5, v6

    int-to-float v6, v0

    int-to-float v7, v1

    const v8, 0x3e4ccccd    # 0.2f

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_1

    :cond_0
    move v4, v3

    :cond_1
    return v4

    .end local v0    # "cacheAvailable":I
    .end local v2    # "sourceLengthKnown":Z
    :cond_2
    move v2, v4

    .line 52
    goto :goto_0
.end method

.method private newResponseHeaders(Lcom/danikula/videocache/GetRequest;)Ljava/lang/String;
    .locals 14
    .param p1, "request"    # Lcom/danikula/videocache/GetRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 59
    iget-object v9, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    invoke-virtual {v9}, Lcom/danikula/videocache/HttpUrlSource;->getMime()Ljava/lang/String;

    move-result-object v5

    .line 60
    .local v5, "mime":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    move v6, v7

    .line 61
    .local v6, "mimeKnown":Z
    :goto_0
    iget-object v9, p0, Lcom/danikula/videocache/HttpProxyCache;->cache:Lcom/danikula/videocache/file/FileCache;

    invoke-virtual {v9}, Lcom/danikula/videocache/file/FileCache;->isCompleted()Z

    move-result v9

    if-eqz v9, :cond_1

    iget-object v9, p0, Lcom/danikula/videocache/HttpProxyCache;->cache:Lcom/danikula/videocache/file/FileCache;

    invoke-virtual {v9}, Lcom/danikula/videocache/file/FileCache;->available()I

    move-result v1

    .line 62
    .local v1, "length":I
    :goto_1
    if-ltz v1, :cond_2

    move v4, v7

    .line 63
    .local v4, "lengthKnown":Z
    :goto_2
    iget-boolean v9, p1, Lcom/danikula/videocache/GetRequest;->partial:Z

    if-eqz v9, :cond_3

    int-to-long v10, v1

    iget-wide v12, p1, Lcom/danikula/videocache/GetRequest;->rangeOffset:J

    sub-long v2, v10, v12

    .line 64
    .local v2, "contentLength":J
    :goto_3
    if-eqz v4, :cond_4

    iget-boolean v9, p1, Lcom/danikula/videocache/GetRequest;->partial:Z

    if-eqz v9, :cond_4

    move v0, v7

    .line 65
    .local v0, "addRange":Z
    :goto_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v9, p1, Lcom/danikula/videocache/GetRequest;->partial:Z

    if-eqz v9, :cond_5

    const-string/jumbo v9, "HTTP/1.1 206 PARTIAL CONTENT\n"

    .line 66
    :goto_5
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "Accept-Ranges: bytes\n"

    .line 67
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz v4, :cond_6

    const-string/jumbo v9, "Content-Length: %d\n"

    new-array v11, v7, [Ljava/lang/Object;

    .line 68
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v11, v8

    invoke-static {v9, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    :goto_6
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz v0, :cond_7

    const-string/jumbo v9, "Content-Range: bytes %d-%d/%d\n"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    iget-wide v12, p1, Lcom/danikula/videocache/GetRequest;->rangeOffset:J

    .line 69
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v11, v8

    add-int/lit8 v12, v1, -0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v7

    const/4 v12, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    :goto_7
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v6, :cond_8

    const-string/jumbo v10, "Content-Type: %s\n"

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v5, v7, v8

    .line 70
    invoke-static {v10, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    :goto_8
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\n"

    .line 71
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 72
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .end local v0    # "addRange":Z
    .end local v1    # "length":I
    .end local v2    # "contentLength":J
    .end local v4    # "lengthKnown":Z
    .end local v6    # "mimeKnown":Z
    :cond_0
    move v6, v8

    .line 60
    goto/16 :goto_0

    .line 61
    .restart local v6    # "mimeKnown":Z
    :cond_1
    iget-object v9, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    invoke-virtual {v9}, Lcom/danikula/videocache/HttpUrlSource;->length()I

    move-result v1

    goto/16 :goto_1

    .restart local v1    # "length":I
    :cond_2
    move v4, v8

    .line 62
    goto/16 :goto_2

    .line 63
    .restart local v4    # "lengthKnown":Z
    :cond_3
    int-to-long v2, v1

    goto/16 :goto_3

    .restart local v2    # "contentLength":J
    :cond_4
    move v0, v8

    .line 64
    goto/16 :goto_4

    .line 65
    .restart local v0    # "addRange":Z
    :cond_5
    const-string/jumbo v9, "HTTP/1.1 200 OK\n"

    goto :goto_5

    .line 68
    :cond_6
    const-string/jumbo v9, ""

    goto :goto_6

    .line 69
    :cond_7
    const-string/jumbo v9, ""

    goto :goto_7

    .line 70
    :cond_8
    const-string/jumbo v7, ""

    goto :goto_8
.end method

.method private responseWithCache(Ljava/io/OutputStream;J)V
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const/16 v2, 0x2000

    new-array v0, v2, [B

    .line 78
    .local v0, "buffer":[B
    :goto_0
    array-length v2, v0

    invoke-virtual {p0, v0, p2, p3, v2}, Lcom/danikula/videocache/HttpProxyCache;->read([BJI)I

    move-result v1

    .local v1, "readBytes":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 79
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 80
    int-to-long v2, v1

    add-long/2addr p2, v2

    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 83
    return-void
.end method

.method private responseWithoutCache(Ljava/io/OutputStream;J)V
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v1, Lcom/danikula/videocache/HttpUrlSource;

    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    invoke-direct {v1, v3}, Lcom/danikula/videocache/HttpUrlSource;-><init>(Lcom/danikula/videocache/HttpUrlSource;)V

    .line 88
    .local v1, "newSourceNoCache":Lcom/danikula/videocache/HttpUrlSource;
    long-to-int v3, p2

    :try_start_0
    invoke-virtual {v1, v3}, Lcom/danikula/videocache/HttpUrlSource;->open(I)V

    .line 89
    const/16 v3, 0x2000

    new-array v0, v3, [B

    .line 91
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v1, v0}, Lcom/danikula/videocache/HttpUrlSource;->read([B)I

    move-result v2

    .local v2, "readBytes":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 92
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 93
    int-to-long v4, v2

    add-long/2addr p2, v4

    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    invoke-virtual {v1}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    .line 99
    return-void

    .line 97
    .end local v0    # "buffer":[B
    .end local v2    # "readBytes":I
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    throw v3
.end method


# virtual methods
.method protected onCachePercentsAvailableChanged(I)V
    .locals 3
    .param p1, "percents"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCache;->listener:Lcom/danikula/videocache/CacheListener;

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCache;->listener:Lcom/danikula/videocache/CacheListener;

    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCache;->cache:Lcom/danikula/videocache/file/FileCache;

    iget-object v1, v1, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCache;->source:Lcom/danikula/videocache/HttpUrlSource;

    invoke-virtual {v2}, Lcom/danikula/videocache/HttpUrlSource;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1}, Lcom/danikula/videocache/CacheListener;->onCacheAvailable(Ljava/io/File;Ljava/lang/String;I)V

    .line 106
    :cond_0
    return-void
.end method

.method public processRequest(Lcom/danikula/videocache/GetRequest;Ljava/net/Socket;)V
    .locals 5
    .param p1, "request"    # Lcom/danikula/videocache/GetRequest;
    .param p2, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 38
    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-virtual {p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 39
    .local v2, "out":Ljava/io/OutputStream;
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCache;->newResponseHeaders(Lcom/danikula/videocache/GetRequest;)Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "responseHeaders":Ljava/lang/String;
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write([B)V

    .line 42
    iget-wide v0, p1, Lcom/danikula/videocache/GetRequest;->rangeOffset:J

    .line 43
    .local v0, "offset":J
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCache;->isUseCache(Lcom/danikula/videocache/GetRequest;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 44
    invoke-direct {p0, v2, v0, v1}, Lcom/danikula/videocache/HttpProxyCache;->responseWithCache(Ljava/io/OutputStream;J)V

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    invoke-direct {p0, v2, v0, v1}, Lcom/danikula/videocache/HttpProxyCache;->responseWithoutCache(Ljava/io/OutputStream;J)V

    goto :goto_0
.end method

.method public registerCacheListener(Lcom/danikula/videocache/CacheListener;)V
    .locals 0
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCache;->listener:Lcom/danikula/videocache/CacheListener;

    .line 35
    return-void
.end method
