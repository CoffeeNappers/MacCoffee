.class public final Lio/reactivex/internal/schedulers/SingleScheduler;
.super Lio/reactivex/Scheduler;
.source "SingleScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;
    }
.end annotation


# static fields
.field private static final KEY_SINGLE_PRIORITY:Ljava/lang/String; = "rx2.single-priority"

.field static final SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

.field static final SINGLE_THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

.field private static final THREAD_NAME_PREFIX:Ljava/lang/String; = "RxSingleScheduler"


# instance fields
.field final executor:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field final threadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 42
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    sput-object v1, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    .line 43
    sget-object v1, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 45
    const/16 v1, 0xa

    const-string/jumbo v2, "rx2.single-priority"

    const/4 v3, 0x5

    invoke-static {v2, v3}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 48
    .local v0, "priority":I
    new-instance v1, Lio/reactivex/internal/schedulers/RxThreadFactory;

    const-string/jumbo v2, "RxSingleScheduler"

    invoke-direct {v1, v2, v0, v4}, Lio/reactivex/internal/schedulers/RxThreadFactory;-><init>(Ljava/lang/String;IZ)V

    sput-object v1, Lio/reactivex/internal/schedulers/SingleScheduler;->SINGLE_THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lio/reactivex/internal/schedulers/SingleScheduler;->SINGLE_THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

    invoke-direct {p0, v0}, Lio/reactivex/internal/schedulers/SingleScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 2
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 59
    invoke-direct {p0}, Lio/reactivex/Scheduler;-><init>()V

    .line 31
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    .line 60
    iput-object p1, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 61
    iget-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lio/reactivex/internal/schedulers/SingleScheduler;->createExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method static createExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1
    .param p0, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 65
    invoke-static {p0}, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->create(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createWorker()Lio/reactivex/Scheduler$Worker;
    .locals 2
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 103
    new-instance v1, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;

    iget-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v1
.end method

.method public scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 6
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 109
    new-instance v2, Lio/reactivex/internal/schedulers/ScheduledDirectTask;

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;-><init>(Ljava/lang/Runnable;)V

    .line 112
    .local v2, "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    const-wide/16 v4, 0x0

    cmp-long v3, p2, v4

    if-gtz v3, :cond_0

    .line 113
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v3, v2}, Ljava/util/concurrent/ScheduledExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 117
    .local v1, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_0
    invoke-virtual {v2, v1}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;->setFuture(Ljava/util/concurrent/Future;)V

    .line 121
    .end local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .end local v2    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    :goto_1
    return-object v2

    .line 115
    .restart local v2    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v3, v2, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    goto :goto_0

    .line 119
    .end local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v0

    .line 120
    .local v0, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 121
    sget-object v2, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    goto :goto_1
.end method

.method public schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 10
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "initialDelay"    # J
    .param p4, "period"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 128
    new-instance v1, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;-><init>(Ljava/lang/Runnable;)V

    .line 130
    .local v1, "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v8

    .line 131
    .local v8, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v1, v8}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .end local v1    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    .end local v8    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_0
    return-object v1

    .line 133
    .restart local v1    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    :catch_0
    move-exception v7

    .line 134
    .local v7, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v7}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 135
    sget-object v1, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    goto :goto_0
.end method

.method public shutdown()V
    .locals 3

    .prologue
    .line 91
    iget-object v1, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 92
    .local v0, "current":Ljava/util/concurrent/ScheduledExecutorService;
    sget-object v1, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    if-eq v0, v1, :cond_0

    .line 93
    iget-object v1, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Ljava/util/concurrent/ScheduledExecutorService;
    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 94
    .restart local v0    # "current":Ljava/util/concurrent/ScheduledExecutorService;
    sget-object v1, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    if-eq v0, v1, :cond_0

    .line 95
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 98
    :cond_0
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    .line 70
    const/4 v1, 0x0

    .line 72
    .local v1, "next":Ljava/util/concurrent/ScheduledExecutorService;
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 73
    .local v0, "current":Ljava/util/concurrent/ScheduledExecutorService;
    sget-object v2, Lio/reactivex/internal/schedulers/SingleScheduler;->SHUTDOWN:Ljava/util/concurrent/ScheduledExecutorService;

    if-eq v0, v2, :cond_2

    .line 74
    if-eqz v1, :cond_1

    .line 75
    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 83
    :cond_1
    :goto_0
    return-void

    .line 79
    :cond_2
    if-nez v1, :cond_3

    .line 80
    iget-object v2, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v2}, Lio/reactivex/internal/schedulers/SingleScheduler;->createExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 82
    :cond_3
    iget-object v2, p0, Lio/reactivex/internal/schedulers/SingleScheduler;->executor:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method
