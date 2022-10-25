.class final Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableSkipLastTimed.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SkipLastTimedObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
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

.field final delayError:Z

.field volatile done:Z

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

.field s:Lio/reactivex/disposables/Disposable;

.field final scheduler:Lio/reactivex/Scheduler;

.field final time:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IZ)V
    .locals 2
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "bufferSize"    # I
    .param p7, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "IZ)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 64
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->actual:Lio/reactivex/Observer;

    .line 65
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->time:J

    .line 66
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 67
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    .line 68
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 69
    iput-boolean p7, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->delayError:Z

    .line 70
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->cancelled:Z

    .line 108
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 110
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 111
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 114
    :cond_0
    return-void
.end method

.method drain()V
    .locals 22

    .prologue
    .line 122
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->getAndIncrement()I

    move-result v17

    if-eqz v17, :cond_0

    .line 196
    :goto_0
    return-void

    .line 126
    :cond_0
    const/4 v7, 0x1

    .line 128
    .local v7, "missed":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->actual:Lio/reactivex/Observer;

    .line 129
    .local v2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    move-object/from16 v0, p0

    iget-object v10, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 130
    .local v10, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->delayError:Z

    .line 131
    .local v4, "delayError":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 132
    .local v15, "unit":Ljava/util/concurrent/TimeUnit;
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    .line 133
    .local v11, "scheduler":Lio/reactivex/Scheduler;
    move-object/from16 v0, p0

    iget-wide v12, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->time:J

    .line 138
    .local v12, "time":J
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 143
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->done:Z

    .line 145
    .local v3, "d":Z
    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->peek()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Long;

    .line 147
    .local v14, "ts":Ljava/lang/Long;
    if-nez v14, :cond_4

    const/4 v6, 0x1

    .line 149
    .local v6, "empty":Z
    :goto_2
    invoke-virtual {v11, v15}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v8

    .line 151
    .local v8, "now":J
    if-nez v6, :cond_3

    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v18

    sub-long v20, v8, v12

    cmp-long v17, v18, v20

    if-lez v17, :cond_3

    .line 152
    const/4 v6, 0x1

    .line 155
    :cond_3
    if-eqz v3, :cond_8

    .line 156
    if-eqz v4, :cond_6

    .line 157
    if-eqz v6, :cond_8

    .line 158
    move-object/from16 v0, p0

    iget-object v5, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 159
    .local v5, "e":Ljava/lang/Throwable;
    if-eqz v5, :cond_5

    .line 160
    invoke-interface {v2, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 147
    .end local v5    # "e":Ljava/lang/Throwable;
    .end local v6    # "empty":Z
    .end local v8    # "now":J
    :cond_4
    const/4 v6, 0x0

    goto :goto_2

    .line 162
    .restart local v5    # "e":Ljava/lang/Throwable;
    .restart local v6    # "empty":Z
    .restart local v8    # "now":J
    :cond_5
    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 167
    .end local v5    # "e":Ljava/lang/Throwable;
    :cond_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 168
    .restart local v5    # "e":Ljava/lang/Throwable;
    if-eqz v5, :cond_7

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 170
    invoke-interface {v2, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 173
    :cond_7
    if-eqz v6, :cond_8

    .line 174
    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 180
    .end local v5    # "e":Ljava/lang/Throwable;
    :cond_8
    if-eqz v6, :cond_9

    .line 191
    neg-int v0, v7

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->addAndGet(I)I

    move-result v7

    .line 192
    if-nez v7, :cond_1

    goto/16 :goto_0

    .line 184
    :cond_9
    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    .line 186
    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v16

    .line 188
    .local v16, "v":Ljava/lang/Object;, "TT;"
    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 118
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->done:Z

    .line 101
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->drain()V

    .line 102
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->error:Ljava/lang/Throwable;

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->done:Z

    .line 95
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->drain()V

    .line 96
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 84
    .local v2, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->scheduler:Lio/reactivex/Scheduler;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    .line 86
    .local v0, "now":J
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->drain()V

    .line 89
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;, "Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 76
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSkipLastTimed$SkipLastTimedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 78
    :cond_0
    return-void
.end method
