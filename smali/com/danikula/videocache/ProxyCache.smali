.class Lcom/danikula/videocache/ProxyCache;
.super Ljava/lang/Object;
.source "ProxyCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/slf4j/Logger;

.field private static final MAX_READ_SOURCE_ATTEMPTS:I = 0x1


# instance fields
.field private final cache:Lcom/danikula/videocache/Cache;

.field private volatile percentsAvailable:I

.field private final readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final source:Lcom/danikula/videocache/Source;

.field private volatile sourceReaderThread:Ljava/lang/Thread;

.field private final stopLock:Ljava/lang/Object;

.field private volatile stopped:Z

.field private final wc:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string/jumbo v0, "ProxyCache"

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/danikula/videocache/ProxyCache;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/danikula/videocache/Source;Lcom/danikula/videocache/Cache;)V
    .locals 1
    .param p1, "source"    # Lcom/danikula/videocache/Source;
    .param p2, "cache"    # Lcom/danikula/videocache/Cache;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 34
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/Source;

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    .line 35
    invoke-static {p2}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/Cache;

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 37
    return-void
.end method

.method static synthetic access$100(Lcom/danikula/videocache/ProxyCache;)V
    .locals 0
    .param p0, "x0"    # Lcom/danikula/videocache/ProxyCache;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->readSource()V

    return-void
.end method

.method private checkReadSourceErrorsCount()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 57
    .local v0, "errorsCount":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 58
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 59
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error reading source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " times"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    :cond_0
    return-void
.end method

.method private closeSource()V
    .locals 4

    .prologue
    .line 168
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v1}, Lcom/danikula/videocache/Source;->close()V
    :try_end_0
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    :goto_0
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error closing source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private isStopped()Z
    .locals 1

    .prologue
    .line 163
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private notifyNewCacheDataAvailable(JJ)V
    .locals 3
    .param p1, "cacheAvailable"    # J
    .param p3, "sourceAvailable"    # J

    .prologue
    .line 97
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/danikula/videocache/ProxyCache;->onCacheAvailable(JJ)V

    .line 99
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    monitor-enter v1

    .line 100
    :try_start_0
    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 101
    monitor-exit v1

    .line 102
    return-void

    .line 101
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private onSourceRead()V
    .locals 1

    .prologue
    .line 150
    const/16 v0, 0x64

    iput v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 151
    iget v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    invoke-virtual {p0, v0}, Lcom/danikula/videocache/ProxyCache;->onCachePercentsAvailableChanged(I)V

    .line 152
    return-void
.end method

.method private readSource()V
    .locals 10

    .prologue
    .line 119
    const/4 v4, -0x1

    .line 120
    .local v4, "sourceAvailable":I
    const/4 v2, 0x0

    .line 122
    .local v2, "offset":I
    :try_start_0
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v5}, Lcom/danikula/videocache/Cache;->available()I

    move-result v2

    .line 123
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5, v2}, Lcom/danikula/videocache/Source;->open(I)V

    .line 124
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5}, Lcom/danikula/videocache/Source;->length()I

    move-result v4

    .line 125
    const/16 v5, 0x2000

    new-array v0, v5, [B

    .line 127
    .local v0, "buffer":[B
    :goto_0
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5, v0}, Lcom/danikula/videocache/Source;->read([B)I

    move-result v3

    .local v3, "readBytes":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_1

    .line 128
    iget-object v6, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 129
    :try_start_1
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->isStopped()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 130
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 144
    int-to-long v6, v2

    int-to-long v8, v4

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    .line 146
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :goto_1
    return-void

    .line 132
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :cond_0
    :try_start_2
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v5, v0, v3}, Lcom/danikula/videocache/Cache;->append([BI)V

    .line 133
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 134
    add-int/2addr v2, v3

    .line 135
    int-to-long v6, v2

    int-to-long v8, v4

    :try_start_3
    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 139
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :catch_0
    move-exception v1

    .line 140
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_4
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 141
    invoke-virtual {p0, v1}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 143
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 144
    int-to-long v6, v2

    int-to-long v8, v4

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    goto :goto_1

    .line 133
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :catchall_0
    move-exception v5

    :try_start_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v5
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 143
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :catchall_1
    move-exception v5

    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 144
    int-to-long v6, v2

    int-to-long v8, v4

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    throw v5

    .line 137
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :cond_1
    :try_start_7
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->tryComplete()V

    .line 138
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->onSourceRead()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 143
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 144
    int-to-long v6, v2

    int-to-long v8, v4

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    goto :goto_1
.end method

.method private declared-synchronized readSourceAsync()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v1

    sget-object v2, Ljava/lang/Thread$State;->TERMINATED:Ljava/lang/Thread$State;

    if-eq v1, v2, :cond_1

    const/4 v0, 0x1

    .line 80
    .local v0, "readingInProgress":Z
    :goto_0
    iget-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    .line 81
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;-><init>(Lcom/danikula/videocache/ProxyCache;Lcom/danikula/videocache/ProxyCache$1;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Source reader for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    .line 82
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :cond_0
    monitor-exit p0

    return-void

    .line 79
    .end local v0    # "readingInProgress":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private tryComplete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v1

    .line 156
    :try_start_0
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->isStopped()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v0}, Lcom/danikula/videocache/Cache;->available()I

    move-result v0

    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v2}, Lcom/danikula/videocache/Source;->length()I

    move-result v2

    if-ne v0, v2, :cond_0

    .line 157
    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v0}, Lcom/danikula/videocache/Cache;->complete()V

    .line 159
    :cond_0
    monitor-exit v1

    .line 160
    return-void

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private waitForSourceData()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    monitor-enter v2

    .line 89
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    :try_start_1
    monitor-exit v2

    .line 94
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string/jumbo v3, "Waiting source data is interrupted!"

    invoke-direct {v1, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 93
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method protected onCacheAvailable(JJ)V
    .locals 11
    .param p1, "cacheAvailable"    # J
    .param p3, "sourceLength"    # J

    .prologue
    const-wide/16 v8, 0x0

    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 105
    cmp-long v5, p3, v8

    if-nez v5, :cond_1

    move v3, v2

    .line 106
    .local v3, "zeroLengthSource":Z
    :goto_0
    if-eqz v3, :cond_2

    const/16 v0, 0x64

    .line 107
    .local v0, "percents":I
    :goto_1
    iget v5, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    if-eq v0, v5, :cond_3

    move v1, v2

    .line 108
    .local v1, "percentsChanged":Z
    :goto_2
    cmp-long v5, p3, v8

    if-ltz v5, :cond_4

    .line 109
    .local v2, "sourceLengthKnown":Z
    :goto_3
    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 110
    invoke-virtual {p0, v0}, Lcom/danikula/videocache/ProxyCache;->onCachePercentsAvailableChanged(I)V

    .line 112
    :cond_0
    iput v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 113
    return-void

    .end local v0    # "percents":I
    .end local v1    # "percentsChanged":Z
    .end local v2    # "sourceLengthKnown":Z
    .end local v3    # "zeroLengthSource":Z
    :cond_1
    move v3, v4

    .line 105
    goto :goto_0

    .line 106
    .restart local v3    # "zeroLengthSource":Z
    :cond_2
    const-wide/16 v6, 0x64

    mul-long/2addr v6, p1

    div-long/2addr v6, p3

    long-to-int v0, v6

    goto :goto_1

    .restart local v0    # "percents":I
    :cond_3
    move v1, v4

    .line 107
    goto :goto_2

    .restart local v1    # "percentsChanged":Z
    :cond_4
    move v2, v4

    .line 108
    goto :goto_3
.end method

.method protected onCachePercentsAvailableChanged(I)V
    .locals 0
    .param p1, "percentsAvailable"    # I

    .prologue
    .line 116
    return-void
.end method

.method protected final onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 175
    instance-of v0, p1, Lcom/danikula/videocache/InterruptedProxyCacheException;

    .line 176
    .local v0, "interruption":Z
    if-eqz v0, :cond_0

    .line 177
    sget-object v1, Lcom/danikula/videocache/ProxyCache;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v2, "ProxyCache is interrupted"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 181
    :goto_0
    return-void

    .line 179
    :cond_0
    sget-object v1, Lcom/danikula/videocache/ProxyCache;->LOG:Lorg/slf4j/Logger;

    const-string/jumbo v2, "ProxyCache error"

    invoke-interface {v1, v2, p1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public read([BJI)I
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x64

    .line 40
    invoke-static {p1, p2, p3, p4}, Lcom/danikula/videocache/ProxyCacheUtils;->assertBuffer([BJI)V

    .line 42
    :goto_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->available()I

    move-result v1

    int-to-long v2, v1

    int-to-long v4, p4

    add-long/2addr v4, p2

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    iget-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-nez v1, :cond_0

    .line 43
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->readSourceAsync()V

    .line 44
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->waitForSourceData()V

    .line 45
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->checkReadSourceErrorsCount()V

    goto :goto_0

    .line 47
    :cond_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1, p1, p2, p3, p4}, Lcom/danikula/videocache/Cache;->read([BJI)I

    move-result v0

    .line 48
    .local v0, "read":I
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    if-eq v1, v6, :cond_1

    .line 49
    iput v6, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 50
    invoke-virtual {p0, v6}, Lcom/danikula/videocache/ProxyCache;->onCachePercentsAvailableChanged(I)V

    .line 52
    :cond_1
    return v0
.end method

.method public shutdown()V
    .locals 5

    .prologue
    .line 64
    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v2

    .line 65
    :try_start_0
    sget-object v1, Lcom/danikula/videocache/ProxyCache;->LOG:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Shutdown proxy for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    .line 68
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 69
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 71
    :cond_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->close()V
    :try_end_1
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 76
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    invoke-virtual {p0, v0}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 75
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
