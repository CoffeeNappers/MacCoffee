.class final Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "ObservableTakeLastTimed.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TakeLastTimedObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4eca0434695949bbL


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final count:J

.field d:Lio/reactivex/disposables/Disposable;

.field final delayError:Z

.field error:Ljava/lang/Throwable;

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final scheduler:Lio/reactivex/Scheduler;

.field final time:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IZ)V
    .locals 2
    .param p2, "count"    # J
    .param p4, "time"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p7, "scheduler"    # Lio/reactivex/Scheduler;
    .param p8, "bufferSize"    # I
    .param p9, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "IZ)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->actual:Lio/reactivex/Observer;

    .line 68
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->count:J

    .line 69
    iput-wide p4, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->time:J

    .line 70
    iput-object p6, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 71
    iput-object p7, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    .line 72
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 73
    iput-boolean p9, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->delayError:Z

    .line 74
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    const/4 v1, 0x1

    .line 119
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 120
    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->cancelled:Z

    .line 121
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 123
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 127
    :cond_0
    return-void
.end method

.method drain()V
    .locals 14

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {p0, v7, v8}, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->compareAndSet(ZZ)Z

    move-result v7

    if-nez v7, :cond_0

    .line 168
    :goto_0
    return-void

    .line 139
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->actual:Lio/reactivex/Observer;

    .line 140
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 141
    .local v5, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->delayError:Z

    .line 144
    .local v1, "delayError":Z
    :cond_1
    :goto_1
    iget-boolean v7, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->cancelled:Z

    if-eqz v7, :cond_2

    .line 145
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 149
    :cond_2
    if-nez v1, :cond_3

    .line 150
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 151
    .local v3, "ex":Ljava/lang/Throwable;
    if-eqz v3, :cond_3

    .line 152
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 153
    invoke-interface {v0, v3}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 158
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_3
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    .line 159
    .local v6, "ts":Ljava/lang/Object;
    if-nez v6, :cond_4

    const/4 v2, 0x1

    .line 161
    .local v2, "empty":Z
    :goto_2
    if-eqz v2, :cond_6

    .line 162
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 163
    .restart local v3    # "ex":Ljava/lang/Throwable;
    if-eqz v3, :cond_5

    .line 164
    invoke-interface {v0, v3}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 159
    .end local v2    # "empty":Z
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_4
    const/4 v2, 0x0

    goto :goto_2

    .line 166
    .restart local v2    # "empty":Z
    .restart local v3    # "ex":Ljava/lang/Throwable;
    :cond_5
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 172
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_6
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    .line 174
    .local v4, "o":Ljava/lang/Object;, "TT;"
    check-cast v6, Ljava/lang/Long;

    .end local v6    # "ts":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    iget-object v10, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v10}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v10

    iget-wide v12, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->time:J

    sub-long/2addr v10, v12

    cmp-long v7, v8, v10

    if-ltz v7, :cond_1

    .line 178
    invoke-interface {v0, v4}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->drain()V

    .line 115
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 109
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->drain()V

    .line 110
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 88
    .local v4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    iget-object v10, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    iget-object v11, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v10, v11}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    .line 89
    .local v2, "now":J
    iget-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->time:J

    .line 90
    .local v6, "time":J
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->count:J

    .line 91
    .local v0, "c":J
    const-wide v10, 0x7fffffffffffffffL

    cmp-long v10, v0, v10

    if-nez v10, :cond_1

    const/4 v5, 0x1

    .line 93
    .local v5, "unbounded":Z
    :goto_0
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v4, v10, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    :goto_1
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_2

    .line 96
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->peek()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 97
    .local v8, "ts":J
    sub-long v10, v2, v6

    cmp-long v10, v8, v10

    if-lez v10, :cond_0

    if-nez v5, :cond_2

    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->size()I

    move-result v10

    shr-int/lit8 v10, v10, 0x1

    int-to-long v10, v10

    cmp-long v10, v10, v0

    if-lez v10, :cond_2

    .line 98
    :cond_0
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    .line 99
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    goto :goto_1

    .line 91
    .end local v5    # "unbounded":Z
    .end local v8    # "ts":J
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 104
    .restart local v5    # "unbounded":Z
    :cond_2
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 78
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 80
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTakeLastTimed$TakeLastTimedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 82
    :cond_0
    return-void
.end method
