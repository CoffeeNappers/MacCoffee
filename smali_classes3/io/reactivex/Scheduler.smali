.class public abstract Lio/reactivex/Scheduler;
.super Ljava/lang/Object;
.source "Scheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/Scheduler$DisposeTask;,
        Lio/reactivex/Scheduler$PeriodicDirectTask;,
        Lio/reactivex/Scheduler$Worker;
    }
.end annotation


# static fields
.field static final CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 40
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-string/jumbo v1, "rx2.scheduler.drift-tolerance"

    const-wide/16 v2, 0xf

    invoke-static {v1, v2, v3}, Ljava/lang/Long;->getLong(Ljava/lang/String;J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 436
    return-void
.end method

.method public static clockDriftTolerance()J
    .locals 2

    .prologue
    .line 51
    sget-wide v0, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    return-wide v0
.end method


# virtual methods
.method public abstract createWorker()Lio/reactivex/Scheduler$Worker;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end method

.method public now(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;
    .locals 3
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 111
    const-wide/16 v0, 0x0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, p1, v0, v1, v2}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 4
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v2

    .line 131
    .local v2, "w":Lio/reactivex/Scheduler$Worker;
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    .line 133
    .local v0, "decoratedRun":Ljava/lang/Runnable;
    new-instance v1, Lio/reactivex/Scheduler$DisposeTask;

    invoke-direct {v1, v0, v2}, Lio/reactivex/Scheduler$DisposeTask;-><init>(Ljava/lang/Runnable;Lio/reactivex/Scheduler$Worker;)V

    .line 135
    .local v1, "task":Lio/reactivex/Scheduler$DisposeTask;
    invoke-virtual {v2, v1, p2, p3, p4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 137
    return-object v1
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
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v0

    .line 162
    .local v0, "w":Lio/reactivex/Scheduler$Worker;
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v8

    .line 164
    .local v8, "decoratedRun":Ljava/lang/Runnable;
    new-instance v1, Lio/reactivex/Scheduler$PeriodicDirectTask;

    invoke-direct {v1, v8, v0}, Lio/reactivex/Scheduler$PeriodicDirectTask;-><init>(Ljava/lang/Runnable;Lio/reactivex/Scheduler$Worker;)V

    .local v1, "periodicTask":Lio/reactivex/Scheduler$PeriodicDirectTask;
    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    .line 166
    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    .line 167
    .local v7, "d":Lio/reactivex/disposables/Disposable;
    sget-object v2, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    if-ne v7, v2, :cond_0

    .line 171
    .end local v7    # "d":Lio/reactivex/disposables/Disposable;
    :goto_0
    return-object v7

    .restart local v7    # "d":Lio/reactivex/disposables/Disposable;
    :cond_0
    move-object v7, v1

    goto :goto_0
.end method

.method public shutdown()V
    .locals 0

    .prologue
    .line 95
    return-void
.end method

.method public start()V
    .locals 0

    .prologue
    .line 85
    return-void
.end method

.method public when(Lio/reactivex/functions/Function;)Lio/reactivex/Scheduler;
    .locals 1
    .param p1    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lio/reactivex/Scheduler;",
            ":",
            "Lio/reactivex/disposables/Disposable;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<",
            "Lio/reactivex/Flowable",
            "<",
            "Lio/reactivex/Flowable",
            "<",
            "Lio/reactivex/Completable;",
            ">;>;",
            "Lio/reactivex/Completable;",
            ">;)TS;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 251
    .local p1, "combine":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<Lio/reactivex/Flowable<Lio/reactivex/Flowable<Lio/reactivex/Completable;>;>;Lio/reactivex/Completable;>;"
    new-instance v0, Lio/reactivex/internal/schedulers/SchedulerWhen;

    invoke-direct {v0, p1, p0}, Lio/reactivex/internal/schedulers/SchedulerWhen;-><init>(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)V

    return-object v0
.end method
