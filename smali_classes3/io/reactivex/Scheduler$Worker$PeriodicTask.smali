.class final Lio/reactivex/Scheduler$Worker$PeriodicTask;
.super Ljava/lang/Object;
.source "Scheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/Scheduler$Worker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "PeriodicTask"
.end annotation


# instance fields
.field count:J

.field final decoratedRun:Ljava/lang/Runnable;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end field

.field lastNowNanoseconds:J

.field final periodInNanoseconds:J

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end field

.field startInNanoseconds:J

.field final synthetic this$0:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Scheduler$Worker;JLjava/lang/Runnable;JLio/reactivex/internal/disposables/SequentialDisposable;J)V
    .locals 0
    .param p2, "firstStartInNanoseconds"    # J
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p4, "decoratedRun"    # Ljava/lang/Runnable;
    .param p5, "firstNowNanoseconds"    # J
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p7, "sd"    # Lio/reactivex/internal/disposables/SequentialDisposable;
    .param p8, "periodInNanoseconds"    # J

    .prologue
    .line 360
    iput-object p1, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 361
    iput-object p4, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->decoratedRun:Ljava/lang/Runnable;

    .line 362
    iput-object p7, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 363
    iput-wide p8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    .line 364
    iput-wide p5, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    .line 365
    iput-wide p2, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    .line 366
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x1

    .line 370
    iget-object v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->decoratedRun:Ljava/lang/Runnable;

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    .line 372
    iget-object v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v6}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v6

    if-nez v6, :cond_1

    .line 376
    iget-object v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v7}, Lio/reactivex/Scheduler$Worker;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    .line 378
    .local v4, "nowNanoseconds":J
    sget-wide v6, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    add-long/2addr v6, v4

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    add-long/2addr v6, v8

    sget-wide v8, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    add-long/2addr v6, v8

    cmp-long v6, v4, v6

    if-ltz v6, :cond_2

    .line 380
    :cond_0
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    add-long v2, v4, v6

    .line 385
    .local v2, "nextTick":J
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    add-long/2addr v8, v10

    iput-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    mul-long/2addr v6, v8

    sub-long v6, v2, v6

    iput-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    .line 389
    :goto_0
    iput-wide v4, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    .line 391
    sub-long v0, v2, v4

    .line 392
    .local v0, "delay":J
    iget-object v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    iget-object v7, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, v0, v1, v8}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    invoke-virtual {v6, v7}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 394
    .end local v0    # "delay":J
    .end local v2    # "nextTick":J
    .end local v4    # "nowNanoseconds":J
    :cond_1
    return-void

    .line 387
    .restart local v4    # "nowNanoseconds":J
    :cond_2
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    add-long/2addr v8, v10

    iput-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    iget-wide v10, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    mul-long/2addr v8, v10

    add-long v2, v6, v8

    .restart local v2    # "nextTick":J
    goto :goto_0
.end method
