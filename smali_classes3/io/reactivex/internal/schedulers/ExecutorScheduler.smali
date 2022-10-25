.class public final Lio/reactivex/internal/schedulers/ExecutorScheduler;
.super Lio/reactivex/Scheduler;
.source "ExecutorScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedDispose;,
        Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;,
        Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;
    }
.end annotation


# static fields
.field static final HELPER:Lio/reactivex/Scheduler;


# instance fields
.field final executor:Ljava/util/concurrent/Executor;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->single()Lio/reactivex/Scheduler;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->HELPER:Lio/reactivex/Scheduler;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0}, Lio/reactivex/Scheduler;-><init>()V

    .line 39
    iput-object p1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    .line 40
    return-void
.end method


# virtual methods
.method public createWorker()Lio/reactivex/Scheduler$Worker;
    .locals 2
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 45
    new-instance v0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;

    iget-object v1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;-><init>(Ljava/util/concurrent/Executor;)V

    return-object v0
.end method

.method public scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;
    .locals 6
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 51
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v1

    .line 53
    .local v1, "decoratedRun":Ljava/lang/Runnable;
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    instance-of v5, v5, Ljava/util/concurrent/ExecutorService;

    if-eqz v5, :cond_0

    .line 54
    new-instance v4, Lio/reactivex/internal/schedulers/ScheduledDirectTask;

    invoke-direct {v4, v1}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;-><init>(Ljava/lang/Runnable;)V

    .line 55
    .local v4, "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    iget-object v5, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    check-cast v5, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v5, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v3

    .line 56
    .local v3, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v4, v3}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;->setFuture(Ljava/util/concurrent/Future;)V

    .line 65
    .end local v3    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .end local v4    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    :goto_0
    return-object v4

    .line 60
    :cond_0
    new-instance v0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;

    invoke-direct {v0, v1}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;-><init>(Ljava/lang/Runnable;)V

    .line 61
    .local v0, "br":Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
    iget-object v5, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v5, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v0

    .line 62
    goto :goto_0

    .line 63
    .end local v0    # "br":Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
    :catch_0
    move-exception v2

    .line 64
    .local v2, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 65
    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    goto :goto_0
.end method

.method public scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 8
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 72
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    .line 73
    .local v0, "decoratedRun":Ljava/lang/Runnable;
    iget-object v6, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    instance-of v6, v6, Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v6, :cond_0

    .line 75
    :try_start_0
    new-instance v5, Lio/reactivex/internal/schedulers/ScheduledDirectTask;

    invoke-direct {v5, v0}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;-><init>(Ljava/lang/Runnable;)V

    .line 76
    .local v5, "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    iget-object v6, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    check-cast v6, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v6, v5, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v4

    .line 77
    .local v4, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v5, v4}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .end local v4    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .end local v5    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    :goto_0
    return-object v5

    .line 79
    :catch_0
    move-exception v3

    .line 80
    .local v3, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 81
    sget-object v5, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    goto :goto_0

    .line 85
    .end local v3    # "ex":Ljava/util/concurrent/RejectedExecutionException;
    :cond_0
    new-instance v2, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;

    invoke-direct {v2, v0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;-><init>(Ljava/lang/Runnable;)V

    .line 87
    .local v2, "dr":Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;
    sget-object v6, Lio/reactivex/internal/schedulers/ExecutorScheduler;->HELPER:Lio/reactivex/Scheduler;

    new-instance v7, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedDispose;

    invoke-direct {v7, p0, v2}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedDispose;-><init>(Lio/reactivex/internal/schedulers/ExecutorScheduler;Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;)V

    invoke-virtual {v6, v7, p2, p3, p4}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    .line 89
    .local v1, "delayed":Lio/reactivex/disposables/Disposable;
    iget-object v6, v2, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->timed:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v6, v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    move-object v5, v2

    .line 91
    goto :goto_0
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
    .line 97
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    instance-of v0, v0, Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    .line 98
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v7

    .line 100
    .local v7, "decoratedRun":Ljava/lang/Runnable;
    :try_start_0
    new-instance v1, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;

    invoke-direct {v1, v7}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;-><init>(Ljava/lang/Runnable;)V

    .line 101
    .local v1, "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler;->executor:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v9

    .line 102
    .local v9, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v1, v9}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v1    # "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    .end local v7    # "decoratedRun":Ljava/lang/Runnable;
    .end local v9    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_0
    return-object v1

    .line 104
    .restart local v7    # "decoratedRun":Ljava/lang/Runnable;
    :catch_0
    move-exception v8

    .line 105
    .local v8, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v8}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 106
    sget-object v1, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    goto :goto_0

    .line 109
    .end local v7    # "decoratedRun":Ljava/lang/Runnable;
    .end local v8    # "ex":Ljava/util/concurrent/RejectedExecutionException;
    :cond_0
    invoke-super/range {p0 .. p6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    goto :goto_0
.end method
