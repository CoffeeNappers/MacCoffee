.class Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;
.super Ljava/lang/Object;
.source "AudioOkHttpDataSource.java"

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
.field private audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

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
            "Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;",
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
    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

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
    .line 85
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    .line 86
    return-void
.end method

.method private constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;)V
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
            "Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    .local p4, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V

    .line 100
    return-void
.end method

.method constructor <init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/util/Predicate;Lcom/google/android/exoplayer2/upstream/TransferListener;Lokhttp3/CacheControl;)V
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
            "Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;",
            ">;",
            "Lokhttp3/CacheControl;",
            ")V"
        }
    .end annotation

    .prologue
    .line 114
    .local p3, "contentTypePredicate":Lcom/google/android/exoplayer2/util/Predicate;, "Lcom/google/android/exoplayer2/util/Predicate<Ljava/lang/String;>;"
    .local p4, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    .line 115
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Call$Factory;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->callFactory:Lokhttp3/Call$Factory;

    .line 116
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->userAgent:Ljava/lang/String;

    .line 117
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    .line 118
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    .line 119
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    .line 121
    return-void
.end method

.method private closeConnectionQuietly()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 405
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->close()V

    .line 406
    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    .line 407
    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    .line 408
    return-void
.end method

.method private makeRequest(Lcom/google/android/exoplayer2/upstream/DataSpec;)Lokhttp3/Request;
    .locals 20
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;

    .prologue
    .line 274
    move-object/from16 v0, p1

    iget-wide v10, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    .line 275
    .local v10, "position":J
    move-object/from16 v0, p1

    iget-wide v6, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    .line 276
    .local v6, "length":J
    move-object/from16 v0, p1

    iget v14, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->flags:I

    and-int/lit8 v14, v14, 0x1

    if-eqz v14, :cond_2

    const/4 v2, 0x1

    .line 278
    .local v2, "allowGzip":Z
    :goto_0
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v14}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->getMidFromUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    .line 279
    .local v8, "mid":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v14}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->getPlayedUrlFromUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    .line 280
    .local v3, "audioUrl":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 282
    :try_start_0
    invoke-static {v8}, Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 288
    :cond_0
    :goto_1
    invoke-static {v3}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v13

    .line 289
    .local v13, "url":Lokhttp3/HttpUrl;
    new-instance v14, Lokhttp3/Request$Builder;

    invoke-direct {v14}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v14, v13}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v4

    .line 290
    .local v4, "builder":Lokhttp3/Request$Builder;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    if-eqz v14, :cond_1

    .line 291
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->cacheControl:Lokhttp3/CacheControl;

    invoke-virtual {v4, v14}, Lokhttp3/Request$Builder;->cacheControl(Lokhttp3/CacheControl;)Lokhttp3/Request$Builder;

    .line 293
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    move-object/from16 v16, v0

    monitor-enter v16

    .line 294
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v14}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 295
    .local v9, "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v4, v14, v15}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_2

    .line 297
    .end local v9    # "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception v14

    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v14

    .line 276
    .end local v2    # "allowGzip":Z
    .end local v3    # "audioUrl":Ljava/lang/String;
    .end local v4    # "builder":Lokhttp3/Request$Builder;
    .end local v8    # "mid":Ljava/lang/String;
    .end local v13    # "url":Lokhttp3/HttpUrl;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 283
    .restart local v2    # "allowGzip":Z
    .restart local v3    # "audioUrl":Ljava/lang/String;
    .restart local v8    # "mid":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 284
    .local v5, "e":Ljava/lang/Exception;
    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v5, v14}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 297
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v4    # "builder":Lokhttp3/Request$Builder;
    .restart local v13    # "url":Lokhttp3/HttpUrl;
    :cond_3
    :try_start_2
    monitor-exit v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 298
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-nez v14, :cond_4

    const-wide/16 v14, -0x1

    cmp-long v14, v6, v14

    if-eqz v14, :cond_6

    .line 299
    :cond_4
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "bytes="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "-"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 300
    .local v12, "rangeRequest":Ljava/lang/String;
    const-wide/16 v14, -0x1

    cmp-long v14, v6, v14

    if-eqz v14, :cond_5

    .line 301
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-long v16, v10, v6

    const-wide/16 v18, 0x1

    sub-long v16, v16, v18

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 303
    :cond_5
    const-string/jumbo v14, "Range"

    invoke-virtual {v4, v14, v12}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 305
    .end local v12    # "rangeRequest":Ljava/lang/String;
    :cond_6
    const-string/jumbo v14, "User-Agent"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->userAgent:Ljava/lang/String;

    invoke-virtual {v4, v14, v15}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 306
    if-nez v2, :cond_7

    .line 307
    const-string/jumbo v14, "Accept-Encoding"

    const-string/jumbo v15, "identity"

    invoke-virtual {v4, v14, v15}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 309
    :cond_7
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->postBody:[B

    if-eqz v14, :cond_8

    .line 310
    const/4 v14, 0x0

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/google/android/exoplayer2/upstream/DataSpec;->postBody:[B

    invoke-static {v14, v15}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v14

    invoke-virtual {v4, v14}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    .line 312
    :cond_8
    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v14

    return-object v14
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

    .line 371
    if-nez p3, :cond_1

    .line 372
    const/4 v2, 0x0

    .line 398
    :cond_0
    :goto_0
    return v2

    .line 374
    :cond_1
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_3

    .line 375
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    sub-long v0, v4, v6

    .line 376
    .local v0, "bytesRemaining":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-nez v4, :cond_2

    move v2, v3

    .line 377
    goto :goto_0

    .line 379
    :cond_2
    int-to-long v4, p3

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int p3, v4

    .line 382
    .end local v0    # "bytesRemaining":J
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    invoke-virtual {v4, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 384
    .local v2, "read":I
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    invoke-virtual {v4, p1, p2, v2}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->read([BII)V

    .line 386
    if-ne v2, v3, :cond_5

    .line 387
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_4

    .line 389
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    :cond_4
    move v2, v3

    .line 391
    goto :goto_0

    .line 394
    :cond_5
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    .line 395
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v3, :cond_0

    .line 396
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v3, p0, v2}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onBytesTransferred(Ljava/lang/Object;I)V

    goto :goto_0
.end method

.method private skipInternal()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 324
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToSkip:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 354
    :goto_0
    return-void

    .line 329
    :cond_0
    sget-object v3, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 330
    .local v2, "skipBuffer":[B
    if-nez v2, :cond_1

    .line 331
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 334
    :cond_1
    :goto_1
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToSkip:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    .line 335
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToSkip:J

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    sub-long/2addr v4, v6

    array-length v3, v2

    int-to-long v6, v3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v1, v4

    .line 336
    .local v1, "readLength":I
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->responseByteStream:Ljava/io/InputStream;

    invoke-virtual {v3, v2, v8, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 338
    .local v0, "read":I
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    invoke-virtual {v3, v2, v8, v0}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->read([BII)V

    .line 340
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 341
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-direct {v3}, Ljava/io/InterruptedIOException;-><init>()V

    throw v3

    .line 343
    :cond_2
    const/4 v3, -0x1

    if-ne v0, v3, :cond_3

    .line 344
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 346
    :cond_3
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    .line 347
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v3, :cond_1

    .line 348
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v3, p0, v0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onBytesTransferred(Ljava/lang/Object;I)V

    goto :goto_1

    .line 353
    .end local v0    # "read":I
    .end local v1    # "readLength":I
    :cond_4
    sget-object v3, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected final bytesRead()J
    .locals 2

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    return-wide v0
.end method

.method protected final bytesRemaining()J
    .locals 4

    .prologue
    .line 267
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method protected final bytesSkipped()J
    .locals 2

    .prologue
    .line 245
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    return-wide v0
.end method

.method public clearAllRequestProperties()V
    .locals 2

    .prologue
    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 153
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 154
    monitor-exit v1

    .line 155
    return-void

    .line 154
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
    .line 144
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 146
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    monitor-exit v1

    .line 148
    return-void

    .line 147
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
    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->close()V

    .line 229
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->opened:Z

    if-eqz v0, :cond_1

    .line 230
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->opened:Z

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferEnd(Ljava/lang/Object;)V

    .line 234
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->closeConnectionQuietly()V

    .line 236
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
    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

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
    .line 159
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    .line 160
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesRead:J

    .line 161
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesSkipped:J

    .line 162
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->makeRequest(Lcom/google/android/exoplayer2/upstream/DataSpec;)Lokhttp3/Request;

    move-result-object v7

    .line 164
    .local v7, "request":Lokhttp3/Request;
    :try_start_0
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->callFactory:Lokhttp3/Call$Factory;

    invoke-interface {v9, v7}, Lokhttp3/Call$Factory;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v9

    invoke-interface {v9}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    .line 165
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->responseByteStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->code()I

    move-result v8

    .line 174
    .local v8, "responseCode":I
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->isSuccessful()Z

    move-result v9

    if-nez v9, :cond_1

    .line 175
    invoke-virtual {v7}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v5

    .line 176
    .local v5, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->closeConnectionQuietly()V

    .line 177
    new-instance v4, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    invoke-direct {v4, v8, v5, p1}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/util/Map;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 179
    .local v4, "exception":Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;
    const/16 v9, 0x1a0

    if-ne v8, v9, :cond_0

    .line 180
    new-instance v9, Lcom/google/android/exoplayer2/upstream/DataSourceException;

    const/4 v10, 0x0

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer2/upstream/DataSourceException;-><init>(I)V

    invoke-virtual {v4, v9}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 182
    :cond_0
    throw v4

    .line 166
    .end local v4    # "exception":Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;
    .end local v5    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v8    # "responseCode":I
    :catch_0
    move-exception v3

    .line 167
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

    .line 186
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v8    # "responseCode":I
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v6

    .line 187
    .local v6, "mediaType":Lokhttp3/MediaType;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lokhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "contentType":Ljava/lang/String;
    :goto_0
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer2/util/Predicate;

    invoke-interface {v9, v2}, Lcom/google/android/exoplayer2/util/Predicate;->evaluate(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->closeConnectionQuietly()V

    .line 190
    new-instance v9, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidContentTypeException;

    invoke-direct {v9, v2, p1}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidContentTypeException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    throw v9

    .line 187
    .end local v2    # "contentType":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 196
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
    iput-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToSkip:J

    .line 199
    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-eqz v9, :cond_6

    .line 200
    iget-wide v10, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->length:J

    iput-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    .line 206
    :goto_2
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->opened:Z

    .line 207
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    if-eqz v9, :cond_4

    .line 208
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    invoke-interface {v9, p0, p1}, Lcom/google/android/exoplayer2/upstream/TransferListener;->onTransferStart(Ljava/lang/Object;Lcom/google/android/exoplayer2/upstream/DataSpec;)V

    .line 211
    :cond_4
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->audioCacheHelper:Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;

    iget-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    invoke-virtual {v9, p1, v10, v11}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->open(Lcom/google/android/exoplayer2/upstream/DataSpec;J)V

    .line 213
    iget-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

    return-wide v10

    .line 196
    :cond_5
    const-wide/16 v10, 0x0

    goto :goto_1

    .line 202
    :cond_6
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->response:Lokhttp3/Response;

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    .line 203
    .local v0, "contentLength":J
    const-wide/16 v10, -0x1

    cmp-long v9, v0, v10

    if-eqz v9, :cond_7

    iget-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToSkip:J

    sub-long v10, v0, v10

    :goto_3
    iput-wide v10, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->bytesToRead:J

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
    .line 219
    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->skipInternal()V

    .line 220
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->readInternal([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    const/4 v3, 0x2

    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Lcom/google/android/exoplayer2/upstream/DataSpec;I)V

    throw v1
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 138
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    monitor-exit v1

    .line 140
    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
