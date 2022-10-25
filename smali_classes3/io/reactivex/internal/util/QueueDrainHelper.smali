.class public final Lio/reactivex/internal/util/QueueDrainHelper;
.super Ljava/lang/Object;
.source "QueueDrainHelper.java"


# static fields
.field static final COMPLETED_MASK:J = -0x8000000000000000L

.field static final REQUESTED_MASK:J = 0x7fffffffffffffffL


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkTerminated(ZZLio/reactivex/Observer;ZLio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/ObservableQueueDrain;)Z
    .locals 3
    .param p0, "d"    # Z
    .param p1, "empty"    # Z
    .param p3, "delayError"    # Z
    .param p5, "disposable"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(ZZ",
            "Lio/reactivex/Observer",
            "<*>;Z",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<*>;",
            "Lio/reactivex/disposables/Disposable;",
            "Lio/reactivex/internal/util/ObservableQueueDrain",
            "<TT;TU;>;)Z"
        }
    .end annotation

    .prologue
    .local p2, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<*>;"
    .local p4, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<*>;"
    .local p6, "qd":Lio/reactivex/internal/util/ObservableQueueDrain;, "Lio/reactivex/internal/util/ObservableQueueDrain<TT;TU;>;"
    const/4 v1, 0x1

    .line 162
    invoke-interface {p6}, Lio/reactivex/internal/util/ObservableQueueDrain;->cancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 163
    invoke-interface {p4}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 164
    invoke-interface {p5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 196
    :goto_0
    return v1

    .line 168
    :cond_0
    if-eqz p0, :cond_4

    .line 169
    if-eqz p3, :cond_2

    .line 170
    if-eqz p1, :cond_4

    .line 171
    invoke-interface {p5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 172
    invoke-interface {p6}, Lio/reactivex/internal/util/ObservableQueueDrain;->error()Ljava/lang/Throwable;

    move-result-object v0

    .line 173
    .local v0, "err":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 174
    invoke-interface {p2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 176
    :cond_1
    invoke-interface {p2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 181
    .end local v0    # "err":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {p6}, Lio/reactivex/internal/util/ObservableQueueDrain;->error()Ljava/lang/Throwable;

    move-result-object v0

    .line 182
    .restart local v0    # "err":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 183
    invoke-interface {p4}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 184
    invoke-interface {p5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 185
    invoke-interface {p2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 188
    :cond_3
    if-eqz p1, :cond_4

    .line 189
    invoke-interface {p5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 190
    invoke-interface {p2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 196
    .end local v0    # "err":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static checkTerminated(ZZLorg/reactivestreams/Subscriber;ZLio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/internal/util/QueueDrain;)Z
    .locals 3
    .param p0, "d"    # Z
    .param p1, "empty"    # Z
    .param p3, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(ZZ",
            "Lorg/reactivestreams/Subscriber",
            "<*>;Z",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<*>;",
            "Lio/reactivex/internal/util/QueueDrain",
            "<TT;TU;>;)Z"
        }
    .end annotation

    .prologue
    .local p2, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p4, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<*>;"
    .local p5, "qd":Lio/reactivex/internal/util/QueueDrain;, "Lio/reactivex/internal/util/QueueDrain<TT;TU;>;"
    const/4 v1, 0x1

    .line 95
    invoke-interface {p5}, Lio/reactivex/internal/util/QueueDrain;->cancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    invoke-interface {p4}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 125
    :goto_0
    return v1

    .line 100
    :cond_0
    if-eqz p0, :cond_4

    .line 101
    if-eqz p3, :cond_2

    .line 102
    if-eqz p1, :cond_4

    .line 103
    invoke-interface {p5}, Lio/reactivex/internal/util/QueueDrain;->error()Ljava/lang/Throwable;

    move-result-object v0

    .line 104
    .local v0, "err":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 105
    invoke-interface {p2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 107
    :cond_1
    invoke-interface {p2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 112
    .end local v0    # "err":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {p5}, Lio/reactivex/internal/util/QueueDrain;->error()Ljava/lang/Throwable;

    move-result-object v0

    .line 113
    .restart local v0    # "err":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 114
    invoke-interface {p4}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 115
    invoke-interface {p2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 118
    :cond_3
    if-eqz p1, :cond_4

    .line 119
    invoke-interface {p2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 125
    .end local v0    # "err":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static createQueue(I)Lio/reactivex/internal/fuseable/SimpleQueue;
    .locals 2
    .param p0, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 208
    if-gez p0, :cond_0

    .line 209
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    neg-int v1, p0

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 211
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    invoke-direct {v0, p0}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    goto :goto_0
.end method

.method public static drainLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lio/reactivex/Observer;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/ObservableQueueDrain;)V
    .locals 9
    .param p2, "delayError"    # Z
    .param p3, "dispose"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TT;>;",
            "Lio/reactivex/Observer",
            "<-TU;>;Z",
            "Lio/reactivex/disposables/Disposable;",
            "Lio/reactivex/internal/util/ObservableQueueDrain",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p4, "qd":Lio/reactivex/internal/util/ObservableQueueDrain;, "Lio/reactivex/internal/util/ObservableQueueDrain<TT;TU;>;"
    const/4 v7, 0x1

    .line 133
    .local v7, "missed":I
    :cond_0
    invoke-interface {p4}, Lio/reactivex/internal/util/ObservableQueueDrain;->done()Z

    move-result v0

    invoke-interface {p0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->isEmpty()Z

    move-result v1

    move-object v2, p1

    move v3, p2

    move-object v4, p0

    move-object v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Lio/reactivex/internal/util/QueueDrainHelper;->checkTerminated(ZZLio/reactivex/Observer;ZLio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/ObservableQueueDrain;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 158
    :cond_1
    :goto_0
    return-void

    .line 150
    .local v0, "d":Z
    .local v1, "empty":Z
    .local v8, "v":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-interface {p4, p1, v8}, Lio/reactivex/internal/util/ObservableQueueDrain;->accept(Lio/reactivex/Observer;Ljava/lang/Object;)V

    .line 138
    .end local v0    # "d":Z
    .end local v1    # "empty":Z
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {p4}, Lio/reactivex/internal/util/ObservableQueueDrain;->done()Z

    move-result v0

    .line 139
    .restart local v0    # "d":Z
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    .line 140
    .restart local v8    # "v":Ljava/lang/Object;, "TT;"
    if-nez v8, :cond_4

    const/4 v1, 0x1

    .restart local v1    # "empty":Z
    :goto_1
    move-object v2, p1

    move v3, p2

    move-object v4, p0

    move-object v5, p3

    move-object v6, p4

    .line 142
    invoke-static/range {v0 .. v6}, Lio/reactivex/internal/util/QueueDrainHelper;->checkTerminated(ZZLio/reactivex/Observer;ZLio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/ObservableQueueDrain;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 146
    if-eqz v1, :cond_2

    .line 153
    neg-int v2, v7

    invoke-interface {p4, v2}, Lio/reactivex/internal/util/ObservableQueueDrain;->leave(I)I

    move-result v7

    .line 154
    if-nez v7, :cond_0

    goto :goto_0

    .line 140
    .end local v1    # "empty":Z
    :cond_4
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V
    .locals 10
    .param p2, "delayError"    # Z
    .param p3, "dispose"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TT;>;",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;Z",
            "Lio/reactivex/disposables/Disposable;",
            "Lio/reactivex/internal/util/QueueDrain",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p4, "qd":Lio/reactivex/internal/util/QueueDrain;, "Lio/reactivex/internal/util/QueueDrain<TT;TU;>;"
    const/4 v6, 0x1

    .line 52
    .local v6, "missed":I
    :cond_0
    :goto_0
    invoke-interface {p4}, Lio/reactivex/internal/util/QueueDrain;->done()Z

    move-result v0

    .line 54
    .local v0, "d":Z
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    .line 56
    .local v7, "v":Ljava/lang/Object;, "TT;"
    if-nez v7, :cond_2

    const/4 v1, 0x1

    .local v1, "empty":Z
    :goto_1
    move-object v2, p1

    move v3, p2

    move-object v4, p0

    move-object v5, p4

    .line 58
    invoke-static/range {v0 .. v5}, Lio/reactivex/internal/util/QueueDrainHelper;->checkTerminated(ZZLorg/reactivestreams/Subscriber;ZLio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/internal/util/QueueDrain;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 59
    if-eqz p3, :cond_1

    .line 60
    invoke-interface {p3}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 91
    :cond_1
    :goto_2
    return-void

    .line 56
    .end local v1    # "empty":Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 65
    .restart local v1    # "empty":Z
    :cond_3
    if-eqz v1, :cond_4

    .line 86
    neg-int v2, v6

    invoke-interface {p4, v2}, Lio/reactivex/internal/util/QueueDrain;->leave(I)I

    move-result v6

    .line 87
    if-nez v6, :cond_0

    goto :goto_2

    .line 69
    :cond_4
    invoke-interface {p4}, Lio/reactivex/internal/util/QueueDrain;->requested()J

    move-result-wide v8

    .line 70
    .local v8, "r":J
    const-wide/16 v2, 0x0

    cmp-long v2, v8, v2

    if-eqz v2, :cond_5

    .line 71
    invoke-interface {p4, p1, v7}, Lio/reactivex/internal/util/QueueDrain;->accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v8, v2

    if-eqz v2, :cond_0

    .line 73
    const-wide/16 v2, 0x1

    invoke-interface {p4, v2, v3}, Lio/reactivex/internal/util/QueueDrain;->produced(J)J

    goto :goto_0

    .line 77
    :cond_5
    invoke-interface {p0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 78
    if-eqz p3, :cond_6

    .line 79
    invoke-interface {p3}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 81
    :cond_6
    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v3, "Could not emit value due to lack of requests."

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method static isCancelled(Lio/reactivex/functions/BooleanSupplier;)Z
    .locals 2
    .param p0, "cancelled"    # Lio/reactivex/functions/BooleanSupplier;

    .prologue
    .line 277
    :try_start_0
    invoke-interface {p0}, Lio/reactivex/functions/BooleanSupplier;->getAsBoolean()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 280
    :goto_0
    return v1

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 280
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static postComplete(Lorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)V
    .locals 12
    .param p2, "state"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p3, "isCancelled"    # Lio/reactivex/functions/BooleanSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Queue",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Lio/reactivex/functions/BooleanSupplier;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p1, "queue":Ljava/util/Queue;, "Ljava/util/Queue<TT;>;"
    const-wide/16 v10, 0x0

    const-wide/high16 v8, -0x8000000000000000L

    .line 394
    invoke-interface {p1}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 395
    invoke-interface {p0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 418
    :cond_0
    :goto_0
    return-void

    .line 399
    :cond_1
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lio/reactivex/internal/util/QueueDrainHelper;->postCompleteDrain(JLorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 404
    :cond_2
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 406
    .local v6, "r":J
    and-long v2, v6, v8

    cmp-long v2, v2, v10

    if-nez v2, :cond_0

    .line 410
    or-long v0, v6, v8

    .line 412
    .local v0, "u":J
    invoke-virtual {p2, v6, v7, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 414
    cmp-long v2, v6, v10

    if-eqz v2, :cond_0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 415
    invoke-static/range {v0 .. v5}, Lio/reactivex/internal/util/QueueDrainHelper;->postCompleteDrain(JLorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)Z

    goto :goto_0
.end method

.method static postCompleteDrain(JLorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)Z
    .locals 8
    .param p0, "n"    # J
    .param p4, "state"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p5, "isCancelled"    # Lio/reactivex/functions/BooleanSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Queue",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Lio/reactivex/functions/BooleanSupplier;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 320
    .local p2, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "queue":Ljava/util/Queue;, "Ljava/util/Queue<TT;>;"
    const-wide/high16 v4, -0x8000000000000000L

    and-long v0, p0, v4

    .line 324
    .local v0, "e":J
    :cond_0
    :goto_0
    cmp-long v3, v0, p0

    if-eqz v3, :cond_3

    .line 325
    invoke-static {p5}, Lio/reactivex/internal/util/QueueDrainHelper;->isCancelled(Lio/reactivex/functions/BooleanSupplier;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 326
    const/4 v3, 0x1

    .line 356
    :goto_1
    return v3

    .line 329
    :cond_1
    invoke-interface {p3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 331
    .local v2, "t":Ljava/lang/Object;, "TT;"
    if-nez v2, :cond_2

    .line 332
    invoke-interface {p2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 333
    const/4 v3, 0x1

    goto :goto_1

    .line 336
    :cond_2
    invoke-interface {p2, v2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 337
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 338
    goto :goto_0

    .line 340
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-static {p5}, Lio/reactivex/internal/util/QueueDrainHelper;->isCancelled(Lio/reactivex/functions/BooleanSupplier;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 341
    const/4 v3, 0x1

    goto :goto_1

    .line 344
    :cond_4
    invoke-interface {p3}, Ljava/util/Queue;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 345
    invoke-interface {p2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 346
    const/4 v3, 0x1

    goto :goto_1

    .line 349
    :cond_5
    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide p0

    .line 351
    cmp-long v3, p0, v0

    if-nez v3, :cond_0

    .line 353
    const-wide v4, 0x7fffffffffffffffL

    and-long/2addr v4, v0

    neg-long v4, v4

    invoke-virtual {p4, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide p0

    .line 355
    const-wide v4, 0x7fffffffffffffffL

    and-long/2addr v4, p0

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_6

    .line 356
    const/4 v3, 0x0

    goto :goto_1

    .line 359
    :cond_6
    const-wide/high16 v4, -0x8000000000000000L

    and-long v0, p0, v4

    goto :goto_0
.end method

.method public static postCompleteRequest(JLorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)Z
    .locals 14
    .param p0, "n"    # J
    .param p4, "state"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p5, "isCancelled"    # Lio/reactivex/functions/BooleanSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Queue",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Lio/reactivex/functions/BooleanSupplier;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 252
    .local p2, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "queue":Ljava/util/Queue;, "Ljava/util/Queue<TT;>;"
    :cond_0
    invoke-virtual/range {p4 .. p4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 255
    .local v8, "r":J
    const-wide v2, 0x7fffffffffffffffL

    and-long v10, v8, v2

    .line 258
    .local v10, "r0":J
    const-wide/high16 v2, -0x8000000000000000L

    and-long/2addr v2, v8

    invoke-static {v10, v11, p0, p1}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v4

    or-long v12, v2, v4

    .line 260
    .local v12, "u":J
    move-object/from16 v0, p4

    invoke-virtual {v0, v8, v9, v12, v13}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 262
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v8, v2

    if-nez v2, :cond_1

    .line 264
    const-wide/high16 v2, -0x8000000000000000L

    or-long/2addr v2, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-static/range {v2 .. v7}, Lio/reactivex/internal/util/QueueDrainHelper;->postCompleteDrain(JLorg/reactivestreams/Subscriber;Ljava/util/Queue;Ljava/util/concurrent/atomic/AtomicLong;Lio/reactivex/functions/BooleanSupplier;)Z

    .line 266
    const/4 v2, 0x1

    .line 269
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static request(Lorg/reactivestreams/Subscription;I)V
    .locals 2
    .param p0, "s"    # Lorg/reactivestreams/Subscription;
    .param p1, "prefetch"    # I

    .prologue
    .line 221
    if-gez p1, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    :goto_0
    invoke-interface {p0, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 222
    return-void

    .line 221
    :cond_0
    int-to-long v0, p1

    goto :goto_0
.end method
