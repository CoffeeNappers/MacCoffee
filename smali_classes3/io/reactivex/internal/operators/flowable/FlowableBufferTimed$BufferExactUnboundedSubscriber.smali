.class final Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableBufferTimed.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableBufferTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferExactUnboundedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U::",
        "Ljava/util/Collection",
        "<-TT;>;>",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;TU;TU;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field buffer:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TU;"
        }
    .end annotation
.end field

.field final bufferSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TU;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field final scheduler:Lio/reactivex/Scheduler;

.field final timer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 1
    .param p3, "timespan"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 93
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 99
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 100
    iput-wide p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timespan:J

    .line 101
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 102
    iput-object p6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    .line 103
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Lorg/reactivestreams/Subscriber;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;TU;)Z"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 218
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 182
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 183
    return-void
.end method

.method public dispose()V
    .locals 0

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->cancel()V

    .line 224
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 159
    monitor-enter p0

    .line 160
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 161
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_1

    .line 162
    monitor-exit p0

    .line 171
    :cond_0
    :goto_0
    return-void

    .line 164
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 165
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v1, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 167
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->done:Z

    .line 168
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->enter()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 169
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, p0, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V

    goto :goto_0

    .line 165
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 149
    monitor-enter p0

    .line 150
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 151
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 153
    return-void

    .line 151
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 139
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 140
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-eqz v0, :cond_0

    .line 141
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 143
    :cond_0
    monitor-exit p0

    .line 144
    return-void

    .line 143
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 10
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 113
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "The supplied buffer is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .local v7, "b":Ljava/util/Collection;, "TU;"
    iput-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 123
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 125
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 126
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 128
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .line 129
    .local v8, "d":Lio/reactivex/disposables/Disposable;
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v8}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    invoke-interface {v8}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 134
    .end local v7    # "b":Ljava/util/Collection;, "TU;"
    .end local v8    # "d":Lio/reactivex/disposables/Disposable;
    :cond_0
    :goto_0
    return-void

    .line 114
    :catch_0
    move-exception v9

    .line 115
    .local v9, "e":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 116
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->cancel()V

    .line 117
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-static {v9, v0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->requested(J)V

    .line 176
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber<TT;TU;>;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The supplied buffer is null"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .local v2, "next":Ljava/util/Collection;, "TU;"
    monitor-enter p0

    .line 201
    :try_start_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 202
    .local v0, "current":Ljava/util/Collection;, "TU;"
    if-eqz v0, :cond_0

    .line 203
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->buffer:Ljava/util/Collection;

    .line 205
    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    if-nez v0, :cond_1

    .line 208
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v3}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 213
    .end local v0    # "current":Ljava/util/Collection;, "TU;"
    .end local v2    # "next":Ljava/util/Collection;, "TU;"
    :goto_0
    return-void

    .line 191
    :catch_0
    move-exception v1

    .line 192
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 193
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->cancel()V

    .line 194
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 205
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v2    # "next":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 212
    .restart local v0    # "current":Ljava/util/Collection;, "TU;"
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactUnboundedSubscriber;->fastPathEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method
