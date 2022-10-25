.class public Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;
.super Ljava/lang/Object;
.source "OkHttpDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/HttpDataSource;


# static fields
.field private static final skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[B>;"
        }
    .end annotation
.end field


# instance fields
.field private bytesRead:J

.field private bytesSkipped:J

.field private bytesToRead:J

.field private bytesToSkip:J

.field private final cacheControl:Lokhttp3/CacheControl;

.field private final callFactory:Lokhttp3/Call$Factory;

.field private final contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

.field private final listener:Lcom/google/android/exoplayer2/upstream/TransferListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;",
            ">;"
        }
    .end annotation
.end field

.field private opened:Z

.field private final requestProperties:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private response:Lokhttp3/Response;

.field private responseByteStream:Ljava/io/InputStream;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;)V
    .locals 1
    .param p1, "callFactory"    # Lokhttp3/Call$Factory;
    .param p2, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Call$Factory;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;)V
    .locals 6
    .param p1, "callFactory"    # Lokhttp3/Call$Factory;
    .param p2, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Call$Factory;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    .local p4, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V
    .locals 1
    .param p1, "callFactory"    # Lokhttp3/Call$Factory;
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p5, "cacheControl"    # Lokhttp3/CacheControl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Call$Factory;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;",
            ">;",
            "Lokhttp3/CacheControl;",
            ")V"
        }
    .end annotation

    .prologue
    .line 105
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    .local p4, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Call$Factory;

    iput-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->callFactory:Lokhttp3/Call$Factory;

    .line 107
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->userAgent:Ljava/lang/String;

    .line 108
    iput-object p3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    .line 109
    iput-object p4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    .line 110
    iput-object p5, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    .line 112
    return-void
.end method

.method private closeConnectionQuietly()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 377
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->close()V

    .line 378
    iput-object v1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    .line 379
    iput-object v1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    .line 380
    return-void
.end method

.method private makeRequest(Lcom/google/android/exoplayer2/upstream/DataSpec;)Lokhttp3/Request;
    .locals 14
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;

    .prologue
    .line 262
    iget-wide v4, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    .line 263
    .local v4, "position":J
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    .line 264
    .local v2, "length":J
    const/4 v9, 0x1

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer2/upstream/DataSpec;->isFlagSet(I)Z

    move-result v0

    .line 266
    .local v0, "allowGzip":Z
    iget-object v9, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v8

    .line 267
    .local v8, "url":Lokhttp3/HttpUrl;
    new-instance v9, Lokhttp3/Request$Builder;

    invoke-direct {v9}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v9, v8}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 268
    .local v1, "builder":Lokhttp3/Request$Builder;
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    if-eqz v9, :cond_0

    .line 269
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    invoke-virtual {v1, v9}, Lokhttp3/Request$Builder;->cacheControl(Lokhttp3/CacheControl;)Lokhttp3/Request$Builder;

    .line 271
    :cond_0
    iget-object v11, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v11

    .line 272
    :try_start_0
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 273
    .local v6, "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v1, v9, v10}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_0

    .line 275
    .end local v6    # "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception v9

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v9

    :cond_1
    :try_start_1
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 276
    const-wide/16 v10, 0x0

    cmp-long v9, v4, v10

    if-nez v9, :cond_2

    const-wide/16 v10, -0x1

    cmp-long v9, v2, v10

    if-eqz v9, :cond_4

    .line 277
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "bytes="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 278
    .local v7, "rangeRequest":Ljava/lang/String;
    const-wide/16 v10, -0x1

    cmp-long v9, v2, v10

    if-eqz v9, :cond_3

    .line 279
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-long v10, v4, v2

    const-wide/16 v12, 0x1

    sub-long/2addr v10, v12

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 281
    :cond_3
    const-string/jumbo v9, "Range"

    invoke-virtual {v1, v9, v7}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 283
    .end local v7    # "rangeRequest":Ljava/lang/String;
    :cond_4
    const-string/jumbo v9, "User-Agent"

    iget-object v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->userAgent:Ljava/lang/String;

    invoke-virtual {v1, v9, v10}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 284
    if-nez v0, :cond_5

    .line 285
    const-string/jumbo v9, "Accept-Encoding"

    const-string/jumbo v10, "identity"

    invoke-virtual {v1, v9, v10}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 287
    :cond_5
    iget-object v9, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->postBody:[B

    if-eqz v9, :cond_6

    .line 288
    const/4 v9, 0x0

    iget-object v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->postBody:[B

    invoke-static {v9, v10}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v9

    invoke-virtual {v1, v9}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    .line 290
    :cond_6
    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v9

    return-object v9
.end method

.method private readInternal([BII)I
    .locals 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, -0x1

    const/4 v3, -0x1

    .line 346
    if-nez p3, :cond_1

    .line 347
    const/4 v2, 0x0

    .line 370
    :cond_0
    :goto_0
    return v2

    .line 349
    :cond_1
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_3

    .line 350
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    sub-long v0, v4, v6

    .line 351
    .local v0, "bytesRemaining":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-nez v4, :cond_2

    move v2, v3

    .line 352
    goto :goto_0

    .line 354
    :cond_2
    int-to-long v4, p3

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int p3, v4

    .line 357
    .end local v0    # "bytesRemaining":J
    :cond_3
    iget-object v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    invoke-virtual {v4, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 358
    .local v2, "read":I
    if-ne v2, v3, :cond_5

    .line 359
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_4

    .line 361
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    :cond_4
    move v2, v3

    .line 363
    goto :goto_0

    .line 366
    :cond_5
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    .line 367
    iget-object v3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v3, :cond_0

    .line 368
    iget-object v3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v3, p0, v2}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onBytesTransferred(Ljava/lang/Object;I)V

    goto :goto_0
.end method

.method private skipInternal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToSkip:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 329
    :goto_0
    return-void

    .line 307
    :cond_0
    sget-object v3, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 308
    .local v2, "skipBuffer":[B
    if-nez v2, :cond_1

    .line 309
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 312
    :cond_1
    :goto_1
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToSkip:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    .line 313
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToSkip:J

    iget-wide v6, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    sub-long/2addr v4, v6

    array-length v3, v2

    int-to-long v6, v3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v1, v4

    .line 314
    .local v1, "readLength":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 315
    .local v0, "read":I
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 316
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-direct {v3}, Ljava/io/InterruptedIOException;-><init>()V

    throw v3

    .line 318
    :cond_2
    const/4 v3, -0x1

    if-ne v0, v3, :cond_3

    .line 319
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 321
    :cond_3
    iget-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    .line 322
    iget-object v3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v3, :cond_1

    .line 323
    iget-object v3, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v3, p0, v0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onBytesTransferred(Ljava/lang/Object;I)V

    goto :goto_1

    .line 328
    .end local v0    # "read":I
    .end local v1    # "readLength":I
    :cond_4
    sget-object v3, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected final bytesRead()J
    .locals 2

    .prologue
    .line 243
    iget-wide v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    return-wide v0
.end method

.method protected final bytesRemaining()J
    .locals 4

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    iget-wide v2, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method protected final bytesSkipped()J
    .locals 2

    .prologue
    .line 233
    iget-wide v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    return-wide v0
.end method

.method public clearAllRequestProperties()V
    .locals 2

    .prologue
    .line 143
    iget-object v1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 144
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 145
    monitor-exit v1

    .line 146
    return-void

    .line 145
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public clearRequestProperty(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    monitor-exit v1

    .line 139
    return-void

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->opened:Z

    if-eqz v0, :cond_1

    .line 218
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->opened:Z

    .line 219
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferEnd(Ljava/lang/Object;)V

    .line 222
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->closeConnectionQuietly()V

    .line 224
    :cond_1
    return-void
.end method

.method public getResponseHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public open(Lcom/google/android/exoplayer2/upstream/DataSpec;)J
    .locals 14
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    .line 150
    iput-object p1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 151
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesRead:J

    .line 152
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesSkipped:J

    .line 153
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->makeRequest(Lcom/google/android/exoplayer2/upstream/DataSpec;)Lokhttp3/Request;

    move-result-object v7

    .line 155
    .local v7, "request":Lokhttp3/Request;
    :try_start_0
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->callFactory:Lokhttp3/Call$Factory;

    invoke-interface {v9, v7}, Lokhttp3/Call$Factory;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v9

    invoke-interface {v9}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v9

    iput-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    .line 156
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v9

    iput-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->responseByteStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->code()I

    move-result v8

    .line 165
    .local v8, "responseCode":I
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->isSuccessful()Z

    move-result v9

    if-nez v9, :cond_1

    .line 166
    invoke-virtual {v7}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v5

    .line 167
    .local v5, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->closeConnectionQuietly()V

    .line 168
    new-instance v4, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    invoke-direct {v4, v8, v5, p1}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/util/Map;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 170
    .local v4, "exception":Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;
    const/16 v9, 0x1a0

    if-ne v8, v9, :cond_0

    .line 171
    new-instance v9, Lcom/google/android/exoplayer2/upstream/DataSourceException;

    const/4 v10, 0x0

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer2/upstream/DataSourceException;-><init>(I)V

    invoke-virtual {v4, v9}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 173
    :cond_0
    throw v4

    .line 157
    .end local v4    # "exception":Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;
    .end local v5    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v8    # "responseCode":I
    :catch_0
    move-exception v3

    .line 158
    .local v3, "e":Ljava/io/IOException;
    new-instance v9, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Unable to connect to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {v9, v10, v3, p1, v11}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer2/upstream/DataSpec;I)V

    throw v9

    .line 177
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v8    # "responseCode":I
    :cond_1
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v6

    .line 178
    .local v6, "mediaType":Lokhttp3/MediaType;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lokhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v2

    .line 179
    .local v2, "contentType":Ljava/lang/String;
    :goto_0
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    invoke-interface {v9, v2}, Lcom/google/android/exoplayer2/util/Predicate;->evaluate(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 180
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->closeConnectionQuietly()V

    .line 181
    new-instance v9, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidContentTypeException;

    invoke-direct {v9, v2, p1}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidContentTypeException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    throw v9

    .line 178
    .end local v2    # "contentType":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 187
    .restart local v2    # "contentType":Ljava/lang/String;
    :cond_3
    const/16 v9, 0xc8

    if-ne v8, v9, :cond_5

    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-eqz v9, :cond_5

    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    :goto_1
    iput-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToSkip:J

    .line 190
    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-eqz v9, :cond_6

    .line 191
    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    iput-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    .line 197
    :goto_2
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->opened:Z

    .line 198
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v9, :cond_4

    .line 199
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v9, p0, p1}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferStart(Ljava/lang/Object;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 202
    :cond_4
    iget-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    return-wide v10

    .line 187
    :cond_5
    const-wide/16 v10, 0x0

    goto :goto_1

    .line 193
    :cond_6
    iget-object v9, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    .line 194
    .local v0, "contentLength":J
    const-wide/16 v10, -0x1

    cmp-long v9, v0, v10

    if-eqz v9, :cond_7

    iget-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToSkip:J

    sub-long v10, v0, v10

    :goto_3
    iput-wide v10, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->bytesToRead:J

    goto :goto_2

    :cond_7
    const-wide/16 v10, -0x1

    goto :goto_3
.end method

.method public read([BII)I
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    .line 208
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->skipInternal()V

    .line 209
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->readInternal([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;

    iget-object v2, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    const/4 v3, 0x2

    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Lcom/google/android/exoplayer2/upstream/DataSpec;I)V

    throw v1
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    iget-object v1, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 129
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    monitor-exit v1

    .line 131
    return-void

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
