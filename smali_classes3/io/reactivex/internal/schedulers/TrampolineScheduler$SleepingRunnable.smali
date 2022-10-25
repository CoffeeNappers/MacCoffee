.class final Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;
.super Ljava/lang/Object;
.source "TrampolineScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/TrampolineScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SleepingRunnable"
.end annotation


# instance fields
.field private final execTime:J

.field private final run:Ljava/lang/Runnable;

.field private final worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;J)V
    .locals 1
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "worker"    # Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;
    .param p3, "execTime"    # J

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p1, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->run:Ljava/lang/Runnable;

    .line 179
    iput-object p2, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    .line 180
    iput-wide p3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    .line 181
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 185
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    iget-boolean v3, v3, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->disposed:Z

    if-nez v3, :cond_1

    .line 186
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v6}, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    .line 187
    .local v4, "t":J
    iget-wide v6, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    cmp-long v3, v6, v4

    if-lez v3, :cond_0

    .line 188
    iget-wide v6, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    sub-long v0, v6, v4

    .line 189
    .local v0, "delay":J
    const-wide/16 v6, 0x0

    cmp-long v3, v0, v6

    if-lez v3, :cond_0

    .line 191
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .end local v0    # "delay":J
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    iget-boolean v3, v3, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->disposed:Z

    if-nez v3, :cond_1

    .line 201
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->run:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 204
    .end local v4    # "t":J
    :cond_1
    :goto_0
    return-void

    .line 192
    .restart local v0    # "delay":J
    .restart local v4    # "t":J
    :catch_0
    move-exception v2

    .line 193
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 194
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
