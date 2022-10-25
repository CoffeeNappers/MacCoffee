.class Lcom/danikula/videocache/Pinger;
.super Ljava/lang/Object;
.source "Pinger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/Pinger$PingCallable;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/slf4j/Logger;

.field private static final PING_REQUEST:Ljava/lang/String; = "ping"

.field private static final PING_RESPONSE:Ljava/lang/String; = "ping ok"


# instance fields
.field private final host:Ljava/lang/String;

.field private final pingExecutor:Ljava/util/concurrent/ExecutorService;

.field private final port:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string/jumbo v0, "Pinger"

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/danikula/videocache/Pinger;->pingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 39
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/danikula/videocache/Pinger;->host:Ljava/lang/String;

    .line 40
    iput p2, p0, Lcom/danikula/videocache/Pinger;->port:I

    .line 41
    return-void
.end method

.method static synthetic access$100(Lcom/danikula/videocache/Pinger;)Z
    .locals 1
    .param p0, "x0"    # Lcom/danikula/videocache/Pinger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/danikula/videocache/Pinger;->pingServer()Z

    move-result v0

    return v0
.end method

.method private getPingUrl()Ljava/lang/String;
    .locals 5

    .prologue
    .line 101
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "http://%s:%d/%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/danikula/videocache/Pinger;->host:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/danikula/videocache/Pinger;->port:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "ping"

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private pingServer()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 82
    invoke-direct {p0}, Lcom/danikula/videocache/Pinger;->getPingUrl()Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "pingUrl":Ljava/lang/String;
    new-instance v5, Lcom/danikula/videocache/HttpUrlSource;

    invoke-direct {v5, v3}, Lcom/danikula/videocache/HttpUrlSource;-><init>(Ljava/lang/String;)V

    .line 85
    .local v5, "source":Lcom/danikula/videocache/HttpUrlSource;
    :try_start_0
    const-string/jumbo v7, "ping ok"

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 86
    .local v1, "expectedResponse":[B
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Lcom/danikula/videocache/HttpUrlSource;->open(I)V

    .line 87
    array-length v7, v1

    new-array v4, v7, [B

    .line 88
    .local v4, "response":[B
    invoke-virtual {v5, v4}, Lcom/danikula/videocache/HttpUrlSource;->read([B)I

    .line 89
    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    .line 90
    .local v2, "pingOk":Z
    sget-object v7, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Ping response: `"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "`, pinged? "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    .end local v1    # "expectedResponse":[B
    .end local v2    # "pingOk":Z
    .end local v4    # "response":[B
    :goto_0
    return v2

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    :try_start_1
    sget-object v7, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v8, "Error reading ping response"

    invoke-interface {v7, v8, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    move v2, v6

    goto :goto_0

    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    throw v6
.end method


# virtual methods
.method isPingRequest(Ljava/lang/String;)Z
    .locals 1
    .param p1, "request"    # Ljava/lang/String;

    .prologue
    .line 72
    const-string/jumbo v0, "ping"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method ping(II)Z
    .locals 12
    .param p1, "maxAttempts"    # I
    .param p2, "startTimeout"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 44
    if-lt p1, v7, :cond_0

    move v6, v7

    :goto_0
    invoke-static {v6}, Lcom/danikula/videocache/Preconditions;->checkArgument(Z)V

    .line 45
    if-lez p2, :cond_1

    move v6, v7

    :goto_1
    invoke-static {v6}, Lcom/danikula/videocache/Preconditions;->checkArgument(Z)V

    .line 47
    move v5, p2

    .line 48
    .local v5, "timeout":I
    const/4 v0, 0x0

    .line 49
    .local v0, "attempts":I
    :goto_2
    if-ge v0, p1, :cond_3

    .line 51
    :try_start_0
    iget-object v6, p0, Lcom/danikula/videocache/Pinger;->pingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/danikula/videocache/Pinger$PingCallable;

    const/4 v10, 0x0

    invoke-direct {v9, p0, v10}, Lcom/danikula/videocache/Pinger$PingCallable;-><init>(Lcom/danikula/videocache/Pinger;Lcom/danikula/videocache/Pinger$1;)V

    invoke-interface {v6, v9}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v3

    .line 52
    .local v3, "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    int-to-long v10, v5

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v10, v11, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v4

    .line 53
    .local v4, "pinged":Z
    if-eqz v4, :cond_2

    .line 68
    .end local v3    # "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    .end local v4    # "pinged":Z
    :goto_3
    return v7

    .end local v0    # "attempts":I
    .end local v5    # "timeout":I
    :cond_0
    move v6, v8

    .line 44
    goto :goto_0

    :cond_1
    move v6, v8

    .line 45
    goto :goto_1

    .line 56
    .restart local v0    # "attempts":I
    .restart local v5    # "timeout":I
    :catch_0
    move-exception v1

    .line 57
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    sget-object v6, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Error pinging server (attempt: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ", timeout: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "). "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 61
    .end local v1    # "e":Ljava/util/concurrent/TimeoutException;
    :cond_2
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 62
    mul-int/lit8 v5, v5, 0x2

    goto :goto_2

    .line 58
    :catch_1
    move-exception v1

    .line 59
    .local v1, "e":Ljava/lang/Exception;
    :goto_5
    sget-object v6, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v9, "Error pinging server due to unexpected error"

    invoke-interface {v6, v9, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 64
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    const-string/jumbo v6, "Error pinging server (attempts: %d, max timeout: %d). If you see this message, please, email me danikula@gmail.com or create issue here https://github.com/danikula/AndroidVideoCache/issues"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v8

    div-int/lit8 v10, v5, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    .line 64
    invoke-static {v6, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "error":Ljava/lang/String;
    sget-object v6, Lcom/danikula/videocache/Pinger;->LOG:Lorg/slf4j/Logger;

    new-instance v7, Lcom/danikula/videocache/ProxyCacheException;

    invoke-direct {v7, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, v2, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v7, v8

    .line 68
    goto :goto_3

    .line 58
    .end local v2    # "error":Ljava/lang/String;
    :catch_2
    move-exception v1

    goto :goto_5
.end method

.method responseToPing(Ljava/net/Socket;)V
    .locals 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 77
    .local v0, "out":Ljava/io/OutputStream;
    const-string/jumbo v1, "HTTP/1.1 200 OK\n\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 78
    const-string/jumbo v1, "ping ok"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 79
    return-void
.end method
