.class public Lio/sentry/DefaultSentryClientFactory;
.super Lio/sentry/SentryClientFactory;
.source "DefaultSentryClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/DefaultSentryClientFactory$1;,
        Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;
    }
.end annotation


# static fields
.field public static final ASYNC_GRACEFUL_SHUTDOWN_OPTION:Ljava/lang/String; = "async.gracefulshutdown"

.field public static final ASYNC_OPTION:Ljava/lang/String; = "async"

.field public static final ASYNC_PRIORITY_OPTION:Ljava/lang/String; = "async.priority"

.field public static final ASYNC_QUEUE_DISCARDNEW:Ljava/lang/String; = "discardnew"

.field public static final ASYNC_QUEUE_DISCARDOLD:Ljava/lang/String; = "discardold"

.field public static final ASYNC_QUEUE_OVERFLOW_DEFAULT:Ljava/lang/String; = "discardold"

.field public static final ASYNC_QUEUE_OVERFLOW_OPTION:Ljava/lang/String; = "async.queue.overflow"

.field public static final ASYNC_QUEUE_SIZE_OPTION:Ljava/lang/String; = "async.queuesize"

.field public static final ASYNC_QUEUE_SYNC:Ljava/lang/String; = "sync"

.field public static final ASYNC_SHUTDOWN_TIMEOUT_DEFAULT:J

.field public static final ASYNC_SHUTDOWN_TIMEOUT_OPTION:Ljava/lang/String; = "async.shutdowntimeout"

.field public static final ASYNC_THREADS_OPTION:Ljava/lang/String; = "async.threads"

.field public static final BUFFER_DIR_OPTION:Ljava/lang/String; = "buffer.dir"

.field public static final BUFFER_ENABLED_DEFAULT:Z = true

.field public static final BUFFER_ENABLED_OPTION:Ljava/lang/String; = "buffer.enabled"

.field public static final BUFFER_FLUSHTIME_DEFAULT:J = 0xea60L

.field public static final BUFFER_FLUSHTIME_OPTION:Ljava/lang/String; = "buffer.flushtime"

.field public static final BUFFER_GRACEFUL_SHUTDOWN_OPTION:Ljava/lang/String; = "buffer.gracefulshutdown"

.field public static final BUFFER_SHUTDOWN_TIMEOUT_DEFAULT:J

.field public static final BUFFER_SHUTDOWN_TIMEOUT_OPTION:Ljava/lang/String; = "buffer.shutdowntimeout"

.field public static final BUFFER_SIZE_DEFAULT:I = 0x32

.field public static final BUFFER_SIZE_OPTION:Ljava/lang/String; = "buffer.size"

.field public static final COMPRESSION_OPTION:Ljava/lang/String; = "compression"

.field public static final DIST_OPTION:Ljava/lang/String; = "dist"

.field public static final ENVIRONMENT_OPTION:Ljava/lang/String; = "environment"

.field public static final EXTRATAGS_OPTION:Ljava/lang/String; = "extratags"

.field private static final FALSE:Ljava/lang/String;

.field public static final HIDE_COMMON_FRAMES_OPTION:Ljava/lang/String; = "stacktrace.hidecommon"

.field public static final HTTP_PROXY_HOST_OPTION:Ljava/lang/String; = "http.proxy.host"

.field public static final HTTP_PROXY_PASS_OPTION:Ljava/lang/String; = "http.proxy.password"

.field public static final HTTP_PROXY_PORT_DEFAULT:I = 0x50

.field public static final HTTP_PROXY_PORT_OPTION:Ljava/lang/String; = "http.proxy.port"

.field public static final HTTP_PROXY_USER_OPTION:Ljava/lang/String; = "http.proxy.user"

.field public static final IN_APP_FRAMES_OPTION:Ljava/lang/String; = "stacktrace.app.packages"

.field public static final MAX_MESSAGE_LENGTH_OPTION:Ljava/lang/String; = "maxmessagelength"

.field public static final NAIVE_PROTOCOL:Ljava/lang/String; = "naive"

.field public static final QUEUE_SIZE_DEFAULT:I = 0x32

.field private static final REJECT_EXECUTION_HANDLERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/RejectedExecutionHandler;",
            ">;"
        }
    .end annotation
.end field

.field public static final RELEASE_OPTION:Ljava/lang/String; = "release"

.field public static final SAMPLE_RATE_OPTION:Ljava/lang/String; = "sample.rate"

.field public static final SERVERNAME_OPTION:Ljava/lang/String; = "servername"

.field public static final TAGS_OPTION:Ljava/lang/String; = "tags"

.field public static final TIMEOUT_DEFAULT:I

.field public static final TIMEOUT_OPTION:Ljava/lang/String; = "timeout"

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x1

    .line 56
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lio/sentry/DefaultSentryClientFactory;->TIMEOUT_DEFAULT:I

    .line 97
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lio/sentry/DefaultSentryClientFactory;->BUFFER_SHUTDOWN_TIMEOUT_DEFAULT:J

    .line 147
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lio/sentry/DefaultSentryClientFactory;->ASYNC_SHUTDOWN_TIMEOUT_DEFAULT:J

    .line 210
    const-class v0, Lio/sentry/DefaultSentryClientFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/DefaultSentryClientFactory;->logger:Lorg/slf4j/Logger;

    .line 211
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    .line 213
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    .line 215
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    const-string/jumbo v1, "sync"

    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor$CallerRunsPolicy;

    invoke-direct {v2}, Ljava/util/concurrent/ThreadPoolExecutor$CallerRunsPolicy;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    const-string/jumbo v1, "discardnew"

    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;

    invoke-direct {v2}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    const-string/jumbo v1, "discardold"

    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;

    invoke-direct {v2}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lio/sentry/SentryClientFactory;-><init>()V

    .line 815
    return-void
.end method


# virtual methods
.method protected configureSentryClient(Lio/sentry/SentryClient;Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;
    .locals 11
    .param p1, "sentryClient"    # Lio/sentry/SentryClient;
    .param p2, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 245
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getRelease(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v5

    .line 246
    .local v5, "release":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 247
    invoke-virtual {p1, v5}, Lio/sentry/SentryClient;->setRelease(Ljava/lang/String;)V

    .line 250
    :cond_0
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getDist(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, "dist":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 252
    invoke-virtual {p1, v0}, Lio/sentry/SentryClient;->setDist(Ljava/lang/String;)V

    .line 255
    :cond_1
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getEnvironment(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    .line 256
    .local v1, "environment":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 257
    invoke-virtual {p1, v1}, Lio/sentry/SentryClient;->setEnvironment(Ljava/lang/String;)V

    .line 260
    :cond_2
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getServerName(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v6

    .line 261
    .local v6, "serverName":Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 262
    invoke-virtual {p1, v6}, Lio/sentry/SentryClient;->setServerName(Ljava/lang/String;)V

    .line 265
    :cond_3
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getTags(Lio/sentry/dsn/Dsn;)Ljava/util/Map;

    move-result-object v8

    .line 266
    .local v8, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_4

    .line 267
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 268
    .local v7, "tagEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {p1, v9, v10}, Lio/sentry/SentryClient;->addTag(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 272
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v7    # "tagEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {p0, p2}, Lio/sentry/DefaultSentryClientFactory;->getExtraTags(Lio/sentry/dsn/Dsn;)Ljava/util/Set;

    move-result-object v3

    .line 273
    .local v3, "extraTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_5

    .line 274
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .restart local v4    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 275
    .local v2, "extraTag":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lio/sentry/SentryClient;->addExtraTag(Ljava/lang/String;)V

    goto :goto_1

    .line 279
    .end local v2    # "extraTag":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_5
    return-object p1
.end method

.method protected createAsyncConnection(Lio/sentry/dsn/Dsn;Lio/sentry/connection/Connection;)Lio/sentry/connection/Connection;
    .locals 15
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;
    .param p2, "connection"    # Lio/sentry/connection/Connection;

    .prologue
    .line 341
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncThreads(Lio/sentry/dsn/Dsn;)I

    move-result v2

    .line 342
    .local v2, "maxThreads":I
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncPriority(Lio/sentry/dsn/Dsn;)I

    move-result v0

    .line 345
    .local v0, "priority":I
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncQueueSize(Lio/sentry/dsn/Dsn;)I

    move-result v14

    .line 346
    .local v14, "queueSize":I
    const/4 v3, -0x1

    if-ne v14, v3, :cond_0

    .line 347
    new-instance v7, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 352
    .local v7, "queue":Ljava/util/concurrent/BlockingDeque;, "Ljava/util/concurrent/BlockingDeque<Ljava/lang/Runnable;>;"
    :goto_0
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;

    const/4 v3, 0x0

    invoke-direct {v8, v0, v3}, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;-><init>(ILio/sentry/DefaultSentryClientFactory$1;)V

    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getRejectedExecutionHandler(Lio/sentry/dsn/Dsn;)Ljava/util/concurrent/RejectedExecutionHandler;

    move-result-object v9

    move v3, v2

    invoke-direct/range {v1 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 356
    .local v1, "executorService":Ljava/util/concurrent/ExecutorService;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncGracefulShutdownEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v11

    .line 358
    .local v11, "gracefulShutdown":Z
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncShutdownTimeout(Lio/sentry/dsn/Dsn;)J

    move-result-wide v12

    .line 359
    .local v12, "shutdownTimeout":J
    new-instance v8, Lio/sentry/connection/AsyncConnection;

    move-object/from16 v9, p2

    move-object v10, v1

    invoke-direct/range {v8 .. v13}, Lio/sentry/connection/AsyncConnection;-><init>(Lio/sentry/connection/Connection;Ljava/util/concurrent/ExecutorService;ZJ)V

    return-object v8

    .line 349
    .end local v1    # "executorService":Ljava/util/concurrent/ExecutorService;
    .end local v7    # "queue":Ljava/util/concurrent/BlockingDeque;, "Ljava/util/concurrent/BlockingDeque<Ljava/lang/Runnable;>;"
    .end local v11    # "gracefulShutdown":Z
    .end local v12    # "shutdownTimeout":J
    :cond_0
    new-instance v7, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v7, v14}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    .restart local v7    # "queue":Ljava/util/concurrent/BlockingDeque;, "Ljava/util/concurrent/BlockingDeque<Ljava/lang/Runnable;>;"
    goto :goto_0
.end method

.method protected createConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;
    .locals 11
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 289
    invoke-virtual {p1}, Lio/sentry/dsn/Dsn;->getProtocol()Ljava/lang/String;

    move-result-object v8

    .line 292
    .local v8, "protocol":Ljava/lang/String;
    const-string/jumbo v6, "http"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, "https"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 293
    :cond_0
    sget-object v6, Lio/sentry/DefaultSentryClientFactory;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v7, "Using an {} connection to Sentry."

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v7, v10}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createHttpConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;

    move-result-object v1

    .line 305
    .local v1, "connection":Lio/sentry/connection/Connection;
    :goto_0
    const/4 v0, 0x0

    .line 306
    .local v0, "bufferedConnection":Lio/sentry/connection/BufferedConnection;
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBufferEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 307
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBuffer(Lio/sentry/dsn/Dsn;)Lio/sentry/buffer/Buffer;

    move-result-object v2

    .line 308
    .local v2, "eventBuffer":Lio/sentry/buffer/Buffer;
    if-eqz v2, :cond_1

    .line 309
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBufferFlushtime(Lio/sentry/dsn/Dsn;)J

    move-result-wide v3

    .line 310
    .local v3, "flushtime":J
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBufferedConnectionGracefulShutdownEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v5

    .line 311
    .local v5, "gracefulShutdown":Z
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBufferedConnectionShutdownTimeout(Lio/sentry/dsn/Dsn;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 312
    .local v9, "shutdownTimeout":Ljava/lang/Long;
    new-instance v0, Lio/sentry/connection/BufferedConnection;

    .end local v0    # "bufferedConnection":Lio/sentry/connection/BufferedConnection;
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lio/sentry/connection/BufferedConnection;-><init>(Lio/sentry/connection/Connection;Lio/sentry/buffer/Buffer;JZJ)V

    .line 314
    .restart local v0    # "bufferedConnection":Lio/sentry/connection/BufferedConnection;
    move-object v1, v0

    .line 319
    .end local v2    # "eventBuffer":Lio/sentry/buffer/Buffer;
    .end local v3    # "flushtime":J
    .end local v5    # "gracefulShutdown":Z
    .end local v9    # "shutdownTimeout":Ljava/lang/Long;
    :cond_1
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getAsyncEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 320
    invoke-virtual {p0, p1, v1}, Lio/sentry/DefaultSentryClientFactory;->createAsyncConnection(Lio/sentry/dsn/Dsn;Lio/sentry/connection/Connection;)Lio/sentry/connection/Connection;

    move-result-object v1

    .line 324
    :cond_2
    if-eqz v0, :cond_3

    .line 325
    invoke-virtual {v0, v1}, Lio/sentry/connection/BufferedConnection;->wrapConnectionWithBufferWriter(Lio/sentry/connection/Connection;)Lio/sentry/connection/Connection;

    move-result-object v1

    .line 328
    :cond_3
    return-object v1

    .line 295
    .end local v0    # "bufferedConnection":Lio/sentry/connection/BufferedConnection;
    .end local v1    # "connection":Lio/sentry/connection/Connection;
    :cond_4
    const-string/jumbo v6, "out"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 296
    sget-object v6, Lio/sentry/DefaultSentryClientFactory;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v7, "Using StdOut to send events."

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 297
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createStdOutConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;

    move-result-object v1

    .restart local v1    # "connection":Lio/sentry/connection/Connection;
    goto :goto_0

    .line 298
    .end local v1    # "connection":Lio/sentry/connection/Connection;
    :cond_5
    const-string/jumbo v6, "noop"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 299
    sget-object v6, Lio/sentry/DefaultSentryClientFactory;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v7, "Using noop to send events."

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 300
    new-instance v1, Lio/sentry/connection/NoopConnection;

    invoke-direct {v1}, Lio/sentry/connection/NoopConnection;-><init>()V

    .restart local v1    # "connection":Lio/sentry/connection/Connection;
    goto :goto_0

    .line 302
    .end local v1    # "connection":Lio/sentry/connection/Connection;
    :cond_6
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Couldn\'t create a connection for the protocol \'"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, "\'"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method protected createHttpConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;
    .locals 15
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 369
    invoke-virtual/range {p1 .. p1}, Lio/sentry/dsn/Dsn;->getUri()Ljava/net/URI;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lio/sentry/dsn/Dsn;->getProjectId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/sentry/connection/HttpConnection;->getSentryApiUrl(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 371
    .local v1, "sentryApiUrl":Ljava/net/URL;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getProxyHost(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v9

    .line 372
    .local v9, "proxyHost":Ljava/lang/String;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getProxyUser(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v12

    .line 373
    .local v12, "proxyUser":Ljava/lang/String;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getProxyPass(Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v10

    .line 374
    .local v10, "proxyPass":Ljava/lang/String;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getProxyPort(Lio/sentry/dsn/Dsn;)I

    move-result v11

    .line 376
    .local v11, "proxyPort":I
    const/4 v4, 0x0

    .line 377
    .local v4, "proxy":Ljava/net/Proxy;
    if-eqz v9, :cond_0

    .line 378
    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-direct {v8, v9, v11}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 379
    .local v8, "proxyAddr":Ljava/net/InetSocketAddress;
    new-instance v4, Ljava/net/Proxy;

    .end local v4    # "proxy":Ljava/net/Proxy;
    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-direct {v4, v2, v8}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 380
    .restart local v4    # "proxy":Ljava/net/Proxy;
    if-eqz v12, :cond_0

    if-eqz v10, :cond_0

    .line 381
    new-instance v2, Lio/sentry/connection/ProxyAuthenticator;

    invoke-direct {v2, v12, v10}, Lio/sentry/connection/ProxyAuthenticator;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 385
    .end local v8    # "proxyAddr":Ljava/net/InetSocketAddress;
    :cond_0
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getSampleRate(Lio/sentry/dsn/Dsn;)Ljava/lang/Double;

    move-result-object v13

    .line 386
    .local v13, "sampleRate":Ljava/lang/Double;
    const/4 v5, 0x0

    .line 387
    .local v5, "eventSampler":Lio/sentry/connection/EventSampler;
    if-eqz v13, :cond_1

    .line 388
    new-instance v5, Lio/sentry/connection/RandomEventSampler;

    .end local v5    # "eventSampler":Lio/sentry/connection/EventSampler;
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-direct {v5, v2, v3}, Lio/sentry/connection/RandomEventSampler;-><init>(D)V

    .line 391
    .restart local v5    # "eventSampler":Lio/sentry/connection/EventSampler;
    :cond_1
    new-instance v0, Lio/sentry/connection/HttpConnection;

    invoke-virtual/range {p1 .. p1}, Lio/sentry/dsn/Dsn;->getPublicKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lio/sentry/dsn/Dsn;->getSecretKey()Ljava/lang/String;

    move-result-object v3

    invoke-direct/range {v0 .. v5}, Lio/sentry/connection/HttpConnection;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/net/Proxy;Lio/sentry/connection/EventSampler;)V

    .line 394
    .local v0, "httpConnection":Lio/sentry/connection/HttpConnection;
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->createMarshaller(Lio/sentry/dsn/Dsn;)Lio/sentry/marshaller/Marshaller;

    move-result-object v7

    .line 395
    .local v7, "marshaller":Lio/sentry/marshaller/Marshaller;
    invoke-virtual {v0, v7}, Lio/sentry/connection/HttpConnection;->setMarshaller(Lio/sentry/marshaller/Marshaller;)V

    .line 397
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getTimeout(Lio/sentry/dsn/Dsn;)I

    move-result v14

    .line 398
    .local v14, "timeout":I
    invoke-virtual {v0, v14}, Lio/sentry/connection/HttpConnection;->setTimeout(I)V

    .line 400
    invoke-virtual/range {p0 .. p1}, Lio/sentry/DefaultSentryClientFactory;->getBypassSecurityEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v6

    .line 401
    .local v6, "bypassSecurityEnabled":Z
    invoke-virtual {v0, v6}, Lio/sentry/connection/HttpConnection;->setBypassSecurity(Z)V

    .line 403
    return-object v0
.end method

.method protected createMarshaller(Lio/sentry/dsn/Dsn;)Lio/sentry/marshaller/Marshaller;
    .locals 6
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 428
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getMaxMessageLength(Lio/sentry/dsn/Dsn;)I

    move-result v2

    .line 429
    .local v2, "maxMessageLength":I
    new-instance v1, Lio/sentry/marshaller/json/JsonMarshaller;

    invoke-direct {v1, v2}, Lio/sentry/marshaller/json/JsonMarshaller;-><init>(I)V

    .line 432
    .local v1, "marshaller":Lio/sentry/marshaller/json/JsonMarshaller;
    new-instance v3, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;

    invoke-direct {v3}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;-><init>()V

    .line 434
    .local v3, "stackTraceBinding":Lio/sentry/marshaller/json/StackTraceInterfaceBinding;
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getHideCommonFramesEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v4

    invoke-virtual {v3, v4}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->setRemoveCommonFramesWithEnclosing(Z)V

    .line 435
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getInAppFrames(Lio/sentry/dsn/Dsn;)Ljava/util/Collection;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/marshaller/json/StackTraceInterfaceBinding;->setInAppFrames(Ljava/util/Collection;)V

    .line 437
    const-class v4, Lio/sentry/event/interfaces/StackTraceInterface;

    invoke-virtual {v1, v4, v3}, Lio/sentry/marshaller/json/JsonMarshaller;->addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V

    .line 438
    const-class v4, Lio/sentry/event/interfaces/ExceptionInterface;

    new-instance v5, Lio/sentry/marshaller/json/ExceptionInterfaceBinding;

    invoke-direct {v5, v3}, Lio/sentry/marshaller/json/ExceptionInterfaceBinding;-><init>(Lio/sentry/marshaller/json/InterfaceBinding;)V

    invoke-virtual {v1, v4, v5}, Lio/sentry/marshaller/json/JsonMarshaller;->addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V

    .line 439
    const-class v4, Lio/sentry/event/interfaces/MessageInterface;

    new-instance v5, Lio/sentry/marshaller/json/MessageInterfaceBinding;

    invoke-direct {v5, v2}, Lio/sentry/marshaller/json/MessageInterfaceBinding;-><init>(I)V

    invoke-virtual {v1, v4, v5}, Lio/sentry/marshaller/json/JsonMarshaller;->addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V

    .line 440
    const-class v4, Lio/sentry/event/interfaces/UserInterface;

    new-instance v5, Lio/sentry/marshaller/json/UserInterfaceBinding;

    invoke-direct {v5}, Lio/sentry/marshaller/json/UserInterfaceBinding;-><init>()V

    invoke-virtual {v1, v4, v5}, Lio/sentry/marshaller/json/JsonMarshaller;->addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V

    .line 441
    new-instance v0, Lio/sentry/marshaller/json/HttpInterfaceBinding;

    invoke-direct {v0}, Lio/sentry/marshaller/json/HttpInterfaceBinding;-><init>()V

    .line 444
    .local v0, "httpBinding":Lio/sentry/marshaller/json/HttpInterfaceBinding;
    const-class v4, Lio/sentry/event/interfaces/HttpInterface;

    invoke-virtual {v1, v4, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V

    .line 447
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getCompressionEnabled(Lio/sentry/dsn/Dsn;)Z

    move-result v4

    invoke-virtual {v1, v4}, Lio/sentry/marshaller/json/JsonMarshaller;->setCompression(Z)V

    .line 449
    return-object v1
.end method

.method public createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;
    .locals 5
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 222
    new-instance v1, Lio/sentry/SentryClient;

    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;

    move-result-object v2

    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getContextManager(Lio/sentry/dsn/Dsn;)Lio/sentry/context/ContextManager;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lio/sentry/SentryClient;-><init>(Lio/sentry/connection/Connection;Lio/sentry/context/ContextManager;)V

    .line 227
    .local v1, "sentryClient":Lio/sentry/SentryClient;
    :try_start_0
    const-string/jumbo v2, "javax.servlet.ServletRequestListener"

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-static {v2, v3, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 228
    new-instance v2, Lio/sentry/event/helper/HttpEventBuilderHelper;

    invoke-direct {v2}, Lio/sentry/event/helper/HttpEventBuilderHelper;-><init>()V

    invoke-virtual {v1, v2}, Lio/sentry/SentryClient;->addBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :goto_0
    new-instance v2, Lio/sentry/event/helper/ContextBuilderHelper;

    invoke-direct {v2, v1}, Lio/sentry/event/helper/ContextBuilderHelper;-><init>(Lio/sentry/SentryClient;)V

    invoke-virtual {v1, v2}, Lio/sentry/SentryClient;->addBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V

    .line 234
    invoke-virtual {p0, v1, p1}, Lio/sentry/DefaultSentryClientFactory;->configureSentryClient(Lio/sentry/SentryClient;Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;

    move-result-object v2

    return-object v2

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    sget-object v2, Lio/sentry/DefaultSentryClientFactory;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "The current environment doesn\'t provide access to servlets, or provides an unsupported version."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected createStdOutConnection(Lio/sentry/dsn/Dsn;)Lio/sentry/connection/Connection;
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 414
    new-instance v0, Lio/sentry/connection/OutputStreamConnection;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1}, Lio/sentry/connection/OutputStreamConnection;-><init>(Ljava/io/OutputStream;)V

    .line 416
    .local v0, "stdOutConnection":Lio/sentry/connection/OutputStreamConnection;
    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createMarshaller(Lio/sentry/dsn/Dsn;)Lio/sentry/marshaller/Marshaller;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/sentry/connection/OutputStreamConnection;->setMarshaller(Lio/sentry/marshaller/Marshaller;)V

    .line 417
    return-object v0
.end method

.method protected getAsyncEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 496
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    const-string/jumbo v1, "async"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getAsyncGracefulShutdownEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 569
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    const-string/jumbo v1, "async.gracefulshutdown"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getAsyncPriority(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 589
    const-string/jumbo v0, "async.priority"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getAsyncQueueSize(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 579
    const-string/jumbo v0, "async.queuesize"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getAsyncShutdownTimeout(Lio/sentry/dsn/Dsn;)J
    .locals 4
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 559
    const-string/jumbo v0, "async.shutdowntimeout"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    sget-wide v2, Lio/sentry/DefaultSentryClientFactory;->ASYNC_SHUTDOWN_TIMEOUT_DEFAULT:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getAsyncThreads(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 599
    const-string/jumbo v0, "async.threads"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getBuffer(Lio/sentry/dsn/Dsn;)Lio/sentry/buffer/Buffer;
    .locals 4
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 792
    const-string/jumbo v1, "buffer.dir"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    .line 793
    .local v0, "bufferDir":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 794
    new-instance v1, Lio/sentry/buffer/DiskBuffer;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->getBufferSize(Lio/sentry/dsn/Dsn;)I

    move-result v3

    invoke-direct {v1, v2, v3}, Lio/sentry/buffer/DiskBuffer;-><init>(Ljava/io/File;I)V

    .line 796
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getBufferEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 778
    const-string/jumbo v1, "buffer.enabled"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    .line 779
    .local v0, "bufferEnabled":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 780
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 782
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected getBufferFlushtime(Lio/sentry/dsn/Dsn;)J
    .locals 4
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 549
    const-string/jumbo v0, "buffer.flushtime"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const-wide/32 v2, 0xea60

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getBufferSize(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 806
    const-string/jumbo v0, "buffer.size"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getBufferedConnectionGracefulShutdownEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 539
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    const-string/jumbo v1, "buffer.gracefulshutdown"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getBufferedConnectionShutdownTimeout(Lio/sentry/dsn/Dsn;)J
    .locals 4
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 529
    const-string/jumbo v0, "buffer.shutdowntimeout"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    sget-wide v2, Lio/sentry/DefaultSentryClientFactory;->BUFFER_SHUTDOWN_TIMEOUT_DEFAULT:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getBypassSecurityEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 610
    invoke-virtual {p1}, Lio/sentry/dsn/Dsn;->getProtocolSettings()Ljava/util/Set;

    move-result-object v0

    const-string/jumbo v1, "naive"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected getCompressionEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 737
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    const-string/jumbo v1, "compression"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getContextManager(Lio/sentry/dsn/Dsn;)Lio/sentry/context/ContextManager;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 462
    new-instance v0, Lio/sentry/context/ThreadLocalContextManager;

    invoke-direct {v0}, Lio/sentry/context/ThreadLocalContextManager;-><init>()V

    return-object v0
.end method

.method protected getDist(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 682
    const-string/jumbo v0, "dist"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getEnvironment(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 693
    const-string/jumbo v0, "environment"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getExtraTags(Lio/sentry/dsn/Dsn;)Ljava/util/Set;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/sentry/dsn/Dsn;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 727
    const-string/jumbo v0, "extratags"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/sentry/util/Util;->parseExtraTags(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected getHideCommonFramesEnabled(Lio/sentry/dsn/Dsn;)Z
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 747
    sget-object v0, Lio/sentry/DefaultSentryClientFactory;->FALSE:Ljava/lang/String;

    const-string/jumbo v1, "stacktrace.hidecommon"

    invoke-static {v1, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getInAppFrames(Lio/sentry/dsn/Dsn;)Ljava/util/Collection;
    .locals 8
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/sentry/dsn/Dsn;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 475
    const-string/jumbo v6, "stacktrace.app.packages"

    invoke-static {v6, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v2

    .line 476
    .local v2, "inAppFramesOption":Ljava/lang/String;
    invoke-static {v2}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 477
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    .line 486
    :cond_0
    return-object v4

    .line 480
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 481
    .local v4, "inAppPackages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v5, :cond_0

    aget-object v3, v0, v1

    .line 482
    .local v3, "inAppPackage":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 483
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected getMaxMessageLength(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 757
    const-string/jumbo v0, "maxmessagelength"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getProxyHost(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 640
    const-string/jumbo v0, "http.proxy.host"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getProxyPass(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 660
    const-string/jumbo v0, "http.proxy.password"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getProxyPort(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 630
    const-string/jumbo v0, "http.proxy.port"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x50

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getProxyUser(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 650
    const-string/jumbo v0, "http.proxy.user"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getRejectedExecutionHandler(Lio/sentry/dsn/Dsn;)Ljava/util/concurrent/RejectedExecutionHandler;
    .locals 7
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 506
    const-string/jumbo v3, "discardold"

    .line 507
    .local v3, "overflowName":Ljava/lang/String;
    const-string/jumbo v4, "async.queue.overflow"

    invoke-static {v4, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    .line 508
    .local v0, "asyncQueueOverflowOption":Ljava/lang/String;
    invoke-static {v0}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 509
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 512
    :cond_0
    sget-object v4, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/RejectedExecutionHandler;

    .line 513
    .local v1, "handler":Ljava/util/concurrent/RejectedExecutionHandler;
    if-nez v1, :cond_1

    .line 514
    sget-object v4, Lio/sentry/DefaultSentryClientFactory;->REJECT_EXECUTION_HANDLERS:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 515
    .local v2, "options":Ljava/lang/String;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "RejectedExecutionHandler not found: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\', valid choices are: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 519
    .end local v2    # "options":Ljava/lang/String;
    :cond_1
    return-object v1
.end method

.method protected getRelease(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 671
    const-string/jumbo v0, "release"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSampleRate(Lio/sentry/dsn/Dsn;)Ljava/lang/Double;
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 620
    const-string/jumbo v0, "sample.rate"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseDouble(Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method protected getServerName(Lio/sentry/dsn/Dsn;)Ljava/lang/String;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 704
    const-string/jumbo v0, "servername"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTags(Lio/sentry/dsn/Dsn;)Ljava/util/Map;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/sentry/dsn/Dsn;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 714
    const-string/jumbo v0, "tags"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/sentry/util/Util;->parseTags(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected getTimeout(Lio/sentry/dsn/Dsn;)I
    .locals 2
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 768
    const-string/jumbo v0, "timeout"

    invoke-static {v0, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    sget v1, Lio/sentry/DefaultSentryClientFactory;->TIMEOUT_DEFAULT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/sentry/util/Util;->parseInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method
