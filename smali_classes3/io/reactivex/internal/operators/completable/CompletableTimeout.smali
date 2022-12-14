.class public final Lio/reactivex/internal/operators/completable/CompletableTimeout;
.super Lio/reactivex/Completable;
.source "CompletableTimeout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableTimeout$DisposeTask;,
        Lio/reactivex/internal/operators/completable/CompletableTimeout$TimeOutObserver;
    }
.end annotation


# instance fields
.field final other:Lio/reactivex/CompletableSource;

.field final scheduler:Lio/reactivex/Scheduler;

.field final source:Lio/reactivex/CompletableSource;

.field final timeout:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(Lio/reactivex/CompletableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Lio/reactivex/CompletableSource;)V
    .locals 0
    .param p1, "source"    # Lio/reactivex/CompletableSource;
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "other"    # Lio/reactivex/CompletableSource;

    .prologue
    .line 32
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 33
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->source:Lio/reactivex/CompletableSource;

    .line 34
    iput-wide p2, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->timeout:J

    .line 35
    iput-object p4, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->unit:Ljava/util/concurrent/TimeUnit;

    .line 36
    iput-object p5, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->scheduler:Lio/reactivex/Scheduler;

    .line 37
    iput-object p6, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->other:Lio/reactivex/CompletableSource;

    .line 38
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 8
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 42
    new-instance v1, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v1}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 43
    .local v1, "set":Lio/reactivex/disposables/CompositeDisposable;
    invoke-interface {p1, v1}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 47
    .local v0, "once":Ljava/util/concurrent/atomic/AtomicBoolean;
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->scheduler:Lio/reactivex/Scheduler;

    new-instance v4, Lio/reactivex/internal/operators/completable/CompletableTimeout$DisposeTask;

    invoke-direct {v4, p0, v0, v1, p1}, Lio/reactivex/internal/operators/completable/CompletableTimeout$DisposeTask;-><init>(Lio/reactivex/internal/operators/completable/CompletableTimeout;Ljava/util/concurrent/atomic/AtomicBoolean;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/CompletableObserver;)V

    iget-wide v6, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->timeout:J

    iget-object v5, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v6, v7, v5}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v2

    .line 49
    .local v2, "timer":Lio/reactivex/disposables/Disposable;
    invoke-virtual {v1, v2}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 51
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableTimeout;->source:Lio/reactivex/CompletableSource;

    new-instance v4, Lio/reactivex/internal/operators/completable/CompletableTimeout$TimeOutObserver;

    invoke-direct {v4, v1, v0, p1}, Lio/reactivex/internal/operators/completable/CompletableTimeout$TimeOutObserver;-><init>(Lio/reactivex/disposables/CompositeDisposable;Ljava/util/concurrent/atomic/AtomicBoolean;Lio/reactivex/CompletableObserver;)V

    invoke-interface {v3, v4}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    .line 52
    return-void
.end method
