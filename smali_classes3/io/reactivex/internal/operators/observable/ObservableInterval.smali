.class public final Lio/reactivex/internal/operators/observable/ObservableInterval;
.super Lio/reactivex/Observable;
.source "ObservableInterval.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/Observable",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final initialDelay:J

.field final period:J

.field final scheduler:Lio/reactivex/Scheduler;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 1
    .param p1, "initialDelay"    # J
    .param p3, "period"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 29
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 30
    iput-wide p1, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->initialDelay:J

    .line 31
    iput-wide p3, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->period:J

    .line 32
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->unit:Ljava/util/concurrent/TimeUnit;

    .line 33
    iput-object p6, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->scheduler:Lio/reactivex/Scheduler;

    .line 34
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Long;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;-><init>(Lio/reactivex/Observer;)V

    .line 39
    .local v1, "is":Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 41
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->initialDelay:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->period:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    .line 43
    .local v7, "d":Lio/reactivex/disposables/Disposable;
    invoke-virtual {v1, v7}, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;->setResource(Lio/reactivex/disposables/Disposable;)V

    .line 44
    return-void
.end method
