.class final Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;
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
    name = "BufferExactBoundedSubscriber"
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

.field consumerIndex:J

.field final maxSize:I

.field producerIndex:J

.field final restartTimerOnMaxSize:Z

.field s:Lorg/reactivestreams/Subscription;

.field timer:Lio/reactivex/disposables/Disposable;

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field final w:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;IZLio/reactivex/Scheduler$Worker;)V
    .locals 1
    .param p3, "timespan"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "maxSize"    # I
    .param p7, "restartOnMaxSize"    # Z
    .param p8, "w"    # Lio/reactivex/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "IZ",
            "Lio/reactivex/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 413
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 414
    iput-wide p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timespan:J

    .line 415
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 416
    iput p6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->maxSize:I

    .line 417
    iput-boolean p7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    .line 418
    iput-object p8, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    .line 419
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Lorg/reactivestreams/Subscriber;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 388
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z

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
    .line 525
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    invoke-interface {p1, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 526
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 537
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 538
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->cancelled:Z

    .line 539
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->dispose()V

    .line 541
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 545
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    monitor-enter p0

    .line 546
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 547
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 549
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 550
    return-void

    .line 547
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 554
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 509
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    monitor-enter p0

    .line 510
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 511
    .local v0, "b":Ljava/util/Collection;, "TU;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 512
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 514
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v1, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 515
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->done:Z

    .line 516
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->enter()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 517
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, p0, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V

    .line 520
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v1}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 521
    return-void

    .line 512
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
    .line 499
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    monitor-enter p0

    .line 500
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 501
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 502
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 503
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 504
    return-void

    .line 501
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v4, 0x1

    .line 452
    monitor-enter p0

    .line 453
    :try_start_0
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 454
    .local v9, "b":Ljava/util/Collection;, "TU;"
    if-nez v9, :cond_0

    .line 455
    monitor-exit p0

    .line 495
    :goto_0
    return-void

    .line 458
    :cond_0
    invoke-interface {v9, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 460
    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v2

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->maxSize:I

    if-ge v2, v3, :cond_1

    .line 461
    monitor-exit p0

    goto :goto_0

    .line 463
    .end local v9    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v9    # "b":Ljava/util/Collection;, "TU;"
    :cond_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 465
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v2, :cond_2

    .line 466
    const/4 v2, 0x0

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 467
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->producerIndex:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->producerIndex:J

    .line 469
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timer:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 472
    :cond_2
    const/4 v2, 0x0

    invoke-virtual {p0, v9, v2, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->fastPathOrderedEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    .line 475
    :try_start_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The supplied buffer is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/util/Collection;

    move-object v9, v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 483
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v2, :cond_3

    .line 484
    monitor-enter p0

    .line 485
    :try_start_3
    iput-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 486
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->consumerIndex:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->consumerIndex:J

    .line 487
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 489
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timespan:J

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timespan:J

    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v3, p0

    invoke-virtual/range {v2 .. v8}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timer:Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 476
    :catch_0
    move-exception v10

    .line 477
    .local v10, "e":Ljava/lang/Throwable;
    invoke-static {v10}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 478
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->cancel()V

    .line 479
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 487
    .end local v10    # "e":Ljava/lang/Throwable;
    :catchall_1
    move-exception v2

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v2

    .line 491
    :cond_3
    monitor-enter p0

    .line 492
    :try_start_5
    iput-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 493
    monitor-exit p0

    goto :goto_0

    :catchall_2
    move-exception v2

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v2
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 9
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 423
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 447
    :goto_0
    return-void

    .line 426
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 431
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "The supplied buffer is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    .local v7, "b":Ljava/util/Collection;, "TU;"
    iput-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 442
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 444
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->timer:Lio/reactivex/disposables/Disposable;

    .line 446
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 432
    .end local v7    # "b":Ljava/util/Collection;, "TU;"
    :catch_0
    move-exception v8

    .line 433
    .local v8, "e":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 434
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 435
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 436
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-static {v8, v0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 532
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->requested(J)V

    .line 533
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 562
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber<TT;TU;>;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The supplied buffer is null"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    .local v2, "next":Ljava/util/Collection;, "TU;"
    monitor-enter p0

    .line 573
    :try_start_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 574
    .local v0, "current":Ljava/util/Collection;, "TU;"
    if-eqz v0, :cond_0

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->producerIndex:J

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->consumerIndex:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    .line 575
    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 581
    .end local v0    # "current":Ljava/util/Collection;, "TU;"
    .end local v2    # "next":Ljava/util/Collection;, "TU;"
    :goto_0
    return-void

    .line 563
    :catch_0
    move-exception v1

    .line 564
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 565
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->cancel()V

    .line 566
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 577
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "current":Ljava/util/Collection;, "TU;"
    .restart local v2    # "next":Ljava/util/Collection;, "TU;"
    :cond_1
    :try_start_2
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->buffer:Ljava/util/Collection;

    .line 578
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 580
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferExactBoundedSubscriber;->fastPathOrderedEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    goto :goto_0

    .line 578
    .end local v0    # "current":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3
.end method
