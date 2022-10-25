.class public Lcom/danikula/videocache/HttpProxyCacheServer;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/HttpProxyCacheServer$Builder;,
        Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;,
        Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/slf4j/Logger;

.field private static final PROXY_HOST:Ljava/lang/String; = "127.0.0.1"


# instance fields
.field private final clientsLock:Ljava/lang/Object;

.field private final clientsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/danikula/videocache/HttpProxyCacheServerClients;",
            ">;"
        }
    .end annotation
.end field

.field private final config:Lcom/danikula/videocache/Config;

.field private final pinger:Lcom/danikula/videocache/Pinger;

.field private final port:I

.field private final serverSocket:Ljava/net/ServerSocket;

.field private final socketProcessor:Ljava/util/concurrent/ExecutorService;

.field private final waitConnectionThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-string/jumbo v0, "HttpProxyCacheServer"

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    new-instance v0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    invoke-direct {v0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->access$000(Lcom/danikula/videocache/HttpProxyCacheServer$Builder;)Lcom/danikula/videocache/Config;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/danikula/videocache/HttpProxyCacheServer;-><init>(Lcom/danikula/videocache/Config;)V

    .line 68
    return-void
.end method

.method private constructor <init>(Lcom/danikula/videocache/Config;)V
    .locals 6
    .param p1, "config"    # Lcom/danikula/videocache/Config;

    .prologue
    const/16 v4, 0x8

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    .line 58
    invoke-static {v4}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    .line 59
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    .line 71
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/danikula/videocache/Config;

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    .line 73
    :try_start_0
    const-string/jumbo v3, "127.0.0.1"

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 74
    .local v1, "inetAddress":Ljava/net/InetAddress;
    new-instance v3, Ljava/net/ServerSocket;

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-direct {v3, v4, v5, v1}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    .line 75
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v3

    iput v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->port:I

    .line 76
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 77
    .local v2, "startSignal":Ljava/util/concurrent/CountDownLatch;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;

    invoke-direct {v4, p0, v2}, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/util/concurrent/CountDownLatch;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    .line 78
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 79
    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 80
    new-instance v3, Lcom/danikula/videocache/Pinger;

    const-string/jumbo v4, "127.0.0.1"

    iget v5, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->port:I

    invoke-direct {v3, v4, v5}, Lcom/danikula/videocache/Pinger;-><init>(Ljava/lang/String;I)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinger:Lcom/danikula/videocache/Pinger;

    .line 81
    sget-object v3, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Proxy cache server started. Is it alive? "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->isAlive()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    return-void

    .line 82
    .end local v1    # "inetAddress":Ljava/net/InetAddress;
    .end local v2    # "startSignal":Ljava/util/concurrent/CountDownLatch;
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 84
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Error starting local proxy server"

    invoke-direct {v3, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 82
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/danikula/videocache/Config;Lcom/danikula/videocache/HttpProxyCacheServer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/danikula/videocache/Config;
    .param p2, "x1"    # Lcom/danikula/videocache/HttpProxyCacheServer$1;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;-><init>(Lcom/danikula/videocache/Config;)V

    return-void
.end method

.method static synthetic access$100(Lcom/danikula/videocache/HttpProxyCacheServer;)V
    .locals 0
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->waitForRequest()V

    return-void
.end method

.method static synthetic access$200(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V
    .locals 0
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;
    .param p1, "x1"    # Ljava/net/Socket;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->processSocket(Ljava/net/Socket;)V

    return-void
.end method

.method private appendToProxyUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 186
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "http://%s:%d/%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "127.0.0.1"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->port:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p1}, Lcom/danikula/videocache/ProxyCacheUtils;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private closeSocket(Ljava/net/Socket;)V
    .locals 3
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 300
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 301
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v2, "Error closing socket"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private closeSocketInput(Ljava/net/Socket;)V
    .locals 3
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 276
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v1

    if-nez v1, :cond_0

    .line 277
    invoke-virtual {p1}, Ljava/net/Socket;->shutdownInput()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 286
    :cond_0
    :goto_0
    return-void

    .line 279
    :catch_0
    move-exception v0

    .line 282
    .local v0, "e":Ljava/net/SocketException;
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v2, "Releasing input stream\u2026 Socket is closed by client."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 283
    .end local v0    # "e":Ljava/net/SocketException;
    :catch_1
    move-exception v0

    .line 284
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v2, "Error closing socket input stream"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private closeSocketOutput(Ljava/net/Socket;)V
    .locals 4
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 290
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v1

    if-nez v1, :cond_0

    .line 291
    invoke-virtual {p1}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    :cond_0
    :goto_0
    return-void

    .line 293
    :catch_0
    move-exception v0

    .line 294
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v2, "Failed to close socket on proxy side: {}. It seems client have already closed connection."

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private getCacheFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 190
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    iget-object v0, v2, Lcom/danikula/videocache/Config;->cacheRoot:Ljava/io/File;

    .line 191
    .local v0, "cacheDir":Ljava/io/File;
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    iget-object v2, v2, Lcom/danikula/videocache/Config;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    invoke-interface {v2, p1}, Lcom/danikula/videocache/file/FileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 192
    .local v1, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method private getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 248
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 249
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 250
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    if-nez v0, :cond_0

    .line 251
    new-instance v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    invoke-direct {v0, p1, v1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;-><init>(Ljava/lang/String;Lcom/danikula/videocache/Config;)V

    .line 252
    .restart local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    :cond_0
    monitor-exit v2

    return-object v0

    .line 255
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getClientsCount()I
    .locals 5

    .prologue
    .line 259
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 260
    const/4 v1, 0x0

    .line 261
    .local v1, "count":I
    :try_start_0
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 262
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->getClientsCount()I

    move-result v4

    add-int/2addr v1, v4

    .line 263
    goto :goto_0

    .line 264
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :cond_0
    monitor-exit v3

    return v1

    .line 265
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private isAlive()Z
    .locals 3

    .prologue
    .line 182
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinger:Lcom/danikula/videocache/Pinger;

    const/4 v1, 0x3

    const/16 v2, 0x46

    invoke-virtual {v0, v1, v2}, Lcom/danikula/videocache/Pinger;->ping(II)Z

    move-result v0

    return v0
.end method

.method private onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 309
    sget-object v0, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v1, "HttpProxyCacheServer error"

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 310
    return-void
.end method

.method private processSocket(Ljava/net/Socket;)V
    .locals 8
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 226
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lcom/danikula/videocache/GetRequest;->read(Ljava/io/InputStream;)Lcom/danikula/videocache/GetRequest;

    move-result-object v2

    .line 227
    .local v2, "request":Lcom/danikula/videocache/GetRequest;
    sget-object v4, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Request to cache proxy:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 228
    iget-object v4, v2, Lcom/danikula/videocache/GetRequest;->uri:Ljava/lang/String;

    invoke-static {v4}, Lcom/danikula/videocache/ProxyCacheUtils;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 229
    .local v3, "url":Ljava/lang/String;
    iget-object v4, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinger:Lcom/danikula/videocache/Pinger;

    invoke-virtual {v4, v3}, Lcom/danikula/videocache/Pinger;->isPingRequest(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 230
    iget-object v4, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinger:Lcom/danikula/videocache/Pinger;

    invoke-virtual {v4, p1}, Lcom/danikula/videocache/Pinger;->responseToPing(Ljava/net/Socket;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    :goto_0
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 243
    sget-object v4, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 245
    .end local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .end local v3    # "url":Ljava/lang/String;
    :goto_1
    return-void

    .line 232
    .restart local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .restart local v3    # "url":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-direct {p0, v3}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v0

    .line 233
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0, v2, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->processRequest(Lcom/danikula/videocache/GetRequest;Ljava/net/Socket;)V
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 235
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .end local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .end local v3    # "url":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/net/SocketException;
    :try_start_2
    sget-object v4, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v5, "Closing socket\u2026 Socket is closed by client."

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 242
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 243
    sget-object v4, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_1

    .line 239
    .end local v1    # "e":Ljava/net/SocketException;
    :catch_1
    move-exception v4

    move-object v1, v4

    .line 240
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    new-instance v4, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v5, "Error processing request"

    invoke-direct {v4, v5, v1}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v4}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 242
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 243
    sget-object v4, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_1

    .line 242
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 243
    sget-object v5, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Opened connections: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    throw v4

    .line 239
    :catch_2
    move-exception v4

    move-object v1, v4

    goto :goto_2
.end method

.method private releaseSocket(Ljava/net/Socket;)V
    .locals 0
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 269
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocketInput(Ljava/net/Socket;)V

    .line 270
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocketOutput(Ljava/net/Socket;)V

    .line 271
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocket(Ljava/net/Socket;)V

    .line 272
    return-void
.end method

.method private shutdownClients()V
    .locals 4

    .prologue
    .line 204
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 205
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 206
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->shutdown()V

    goto :goto_0

    .line 209
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 208
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 209
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 210
    return-void
.end method

.method private touchFileSafely(Ljava/io/File;)V
    .locals 4
    .param p1, "cacheFile"    # Ljava/io/File;

    .prologue
    .line 197
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    iget-object v1, v1, Lcom/danikula/videocache/Config;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    invoke-interface {v1, p1}, Lcom/danikula/videocache/file/DiskUsage;->touch(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    :goto_0
    return-void

    .line 198
    :catch_0
    move-exception v0

    .line 199
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error touching file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private waitForRequest()V
    .locals 5

    .prologue
    .line 214
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_0

    .line 215
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 216
    .local v1, "socket":Ljava/net/Socket;
    sget-object v2, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Accept new socket "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 217
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;

    invoke-direct {v3, p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 219
    .end local v1    # "socket":Ljava/net/Socket;
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v3, "Error during waiting connection"

    invoke-direct {v2, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v2}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    .line 222
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    return-void
.end method


# virtual methods
.method public getProxyUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 100
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getProxyUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyUrl(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "allowCachedFileUri"    # Z

    .prologue
    .line 114
    if-eqz p2, :cond_1

    invoke-virtual {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->isCached(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 115
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->getCacheFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 116
    .local v0, "cacheFile":Ljava/io/File;
    invoke-direct {p0, v0}, Lcom/danikula/videocache/HttpProxyCacheServer;->touchFileSafely(Ljava/io/File;)V

    .line 117
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 119
    .end local v0    # "cacheFile":Ljava/io/File;
    .end local p1    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "url":Ljava/lang/String;
    :cond_1
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->appendToProxyUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public isCached(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 160
    const-string/jumbo v0, "Url can\'t be null!"

    invoke-static {p1, v0}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 161
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->getCacheFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public registerCacheListener(Lcom/danikula/videocache/CacheListener;Ljava/lang/String;)V
    .locals 4
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 123
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkAllNotNull([Ljava/lang/Object;)V

    .line 124
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 126
    :try_start_0
    invoke-direct {p0, p2}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->registerCacheListener(Lcom/danikula/videocache/CacheListener;)V
    :try_end_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :goto_0
    :try_start_1
    monitor-exit v2

    .line 131
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Error registering cache listener"

    invoke-interface {v1, v3, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 130
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public shutdown()V
    .locals 3

    .prologue
    .line 165
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v2, "Shutdown proxy server"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 167
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->shutdownClients()V

    .line 169
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    iget-object v1, v1, Lcom/danikula/videocache/Config;->sourceInfoStorage:Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;

    invoke-interface {v1}, Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;->release()V

    .line 171
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 173
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 174
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :cond_0
    :goto_0
    return-void

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v2, "Error shutting down proxy server"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V
    .locals 4
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;

    .prologue
    .line 145
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 147
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 148
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V

    goto :goto_0

    .line 150
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    return-void
.end method

.method public unregisterCacheListener(Lcom/danikula/videocache/CacheListener;Ljava/lang/String;)V
    .locals 4
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 134
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkAllNotNull([Ljava/lang/Object;)V

    .line 135
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 137
    :try_start_0
    invoke-direct {p0, p2}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V
    :try_end_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :goto_0
    :try_start_1
    monitor-exit v2

    .line 142
    return-void

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    sget-object v1, Lcom/danikula/videocache/HttpProxyCacheServer;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Error registering cache listener"

    invoke-interface {v1, v3, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 141
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
