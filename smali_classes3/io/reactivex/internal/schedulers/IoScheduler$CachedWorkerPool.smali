.class final Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;
.super Ljava/lang/Object;
.source "IoScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/IoScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CachedWorkerPool"
.end annotation


# instance fields
.field final allWorkers:Lio/reactivex/disposables/CompositeDisposable;

.field private final evictorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private final evictorTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;",
            ">;"
        }
    .end annotation
.end field

.field private final keepAliveTime:J

.field private final threadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method constructor <init>(JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ThreadFactory;)V
    .locals 9
    .param p1, "keepAliveTime"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    if-eqz p3, :cond_1

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    :goto_0
    iput-wide v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->keepAliveTime:J

    .line 73
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v1, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 74
    new-instance v1, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v1}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v1, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->allWorkers:Lio/reactivex/disposables/CompositeDisposable;

    .line 75
    iput-object p4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 77
    const/4 v0, 0x0

    .line 78
    .local v0, "evictor":Ljava/util/concurrent/ScheduledExecutorService;
    const/4 v7, 0x0

    .line 79
    .local v7, "task":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-eqz p3, :cond_0

    .line 80
    const/4 v1, 0x1

    sget-object v2, Lio/reactivex/internal/schedulers/IoScheduler;->EVICTOR_THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

    invoke-static {v1, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    .line 81
    iget-wide v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->keepAliveTime:J

    iget-wide v4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->keepAliveTime:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v7

    .line 83
    :cond_0
    iput-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 84
    iput-object v7, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorTask:Ljava/util/concurrent/Future;

    .line 85
    return-void

    .line 72
    .end local v0    # "evictor":Ljava/util/concurrent/ScheduledExecutorService;
    .end local v7    # "task":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :cond_1
    const-wide/16 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method evictExpiredWorkers()V
    .locals 6

    .prologue
    .line 117
    iget-object v4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 118
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->now()J

    move-result-wide v0

    .line 120
    .local v0, "currentTimestamp":J
    iget-object v4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;

    .line 121
    .local v3, "threadWorker":Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    invoke-virtual {v3}, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;->getExpirationTime()J

    move-result-wide v4

    cmp-long v4, v4, v0

    if-gtz v4, :cond_1

    .line 122
    iget-object v4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 123
    iget-object v4, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->allWorkers:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v4, v3}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto :goto_0

    .line 132
    .end local v0    # "currentTimestamp":J
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "threadWorker":Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    :cond_1
    return-void
.end method

.method get()Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    .locals 3

    .prologue
    .line 93
    iget-object v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->allWorkers:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v2}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    sget-object v0, Lio/reactivex/internal/schedulers/IoScheduler;->SHUTDOWN_THREAD_WORKER:Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;

    .line 106
    :goto_0
    return-object v0

    .line 96
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 97
    iget-object v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;

    .line 98
    .local v0, "threadWorker":Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    if-eqz v0, :cond_0

    goto :goto_0

    .line 104
    .end local v0    # "threadWorker":Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    :cond_1
    new-instance v1, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;

    iget-object v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v1, v2}, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 105
    .local v1, "w":Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;
    iget-object v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->allWorkers:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v2, v1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    move-object v0, v1

    .line 106
    goto :goto_0
.end method

.method now()J
    .locals 2

    .prologue
    .line 135
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method release(Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;)V
    .locals 4
    .param p1, "threadWorker"    # Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;

    .prologue
    .line 111
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->keepAliveTime:J

    add-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Lio/reactivex/internal/schedulers/IoScheduler$ThreadWorker;->setExpirationTime(J)V

    .line 113
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->expiringWorkerQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 114
    return-void
.end method

.method public run()V
    .locals 0

    .prologue
    .line 89
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictExpiredWorkers()V

    .line 90
    return-void
.end method

.method shutdown()V
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->allWorkers:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 140
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorTask:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 143
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorService:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_1

    .line 144
    iget-object v0, p0, Lio/reactivex/internal/schedulers/IoScheduler$CachedWorkerPool;->evictorService:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 146
    :cond_1
    return-void
.end method
