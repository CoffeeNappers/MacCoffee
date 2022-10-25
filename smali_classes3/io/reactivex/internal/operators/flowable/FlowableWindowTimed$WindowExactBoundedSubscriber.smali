.class final Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableWindowTimed.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactBoundedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;",
        "Ljava/lang/Object;",
        "Lio/reactivex/Flowable",
        "<TT;>;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field count:J

.field final maxSize:J

.field producerIndex:J

.field final restartTimerOnMaxSize:Z

.field s:Lorg/reactivestreams/Subscription;

.field final scheduler:Lio/reactivex/Scheduler;

.field volatile terminated:Z

.field final timer:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field window:Lio/reactivex/processors/UnicastProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation
.end field

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IJZ)V
    .locals 1
    .param p2, "timespan"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "bufferSize"    # I
    .param p7, "maxSize"    # J
    .param p9, "restartTimerOnMaxSize"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "IJZ)V"
        }
    .end annotation

    .prologue
    .line 302
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 296
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 303
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    .line 304
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 305
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    .line 306
    iput p6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    .line 307
    iput-wide p7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    .line 308
    iput-boolean p9, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    .line 309
    if-eqz p9, :cond_0

    .line 310
    invoke-virtual {p5}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    .line 314
    :goto_0
    return-void

    .line 312
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    goto :goto_0
.end method

.method static synthetic access$000(Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)Z
    .locals 1
    .param p0, "x0"    # Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;

    .prologue
    .line 275
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    return v0
.end method

.method static synthetic access$100(Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .locals 1
    .param p0, "x0"    # Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;

    .prologue
    .line 275
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 450
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    .line 451
    return-void
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 454
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-static {v1}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 455
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    .line 456
    .local v0, "w":Lio/reactivex/Scheduler$Worker;
    if-eqz v0, :cond_0

    .line 457
    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 459
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 25

    .prologue
    .line 462
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v19, v0

    .line 463
    .local v19, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 464
    .local v9, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    move-object/from16 v24, v0

    .line 466
    .local v24, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    const/16 v17, 0x1

    .line 470
    .local v17, "missed":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->terminated:Z

    if-eqz v2, :cond_1

    .line 471
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 472
    invoke-interface/range {v19 .. v19}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 473
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    .line 574
    :goto_1
    return-void

    .line 477
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    .line 479
    .local v13, "d":Z
    invoke-interface/range {v19 .. v19}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v18

    .line 481
    .local v18, "o":Ljava/lang/Object;
    if-nez v18, :cond_3

    const/4 v14, 0x1

    .line 482
    .local v14, "empty":Z
    :goto_2
    move-object/from16 v0, v18

    instance-of v0, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    move/from16 v16, v0

    .line 484
    .local v16, "isHolder":Z
    if-eqz v13, :cond_5

    if-nez v14, :cond_2

    if-eqz v16, :cond_5

    .line 485
    :cond_2
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 486
    invoke-interface/range {v19 .. v19}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 487
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->error:Ljava/lang/Throwable;

    .line 488
    .local v15, "err":Ljava/lang/Throwable;
    if-eqz v15, :cond_4

    .line 489
    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Lio/reactivex/processors/UnicastProcessor;->onError(Ljava/lang/Throwable;)V

    .line 493
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    goto :goto_1

    .line 481
    .end local v14    # "empty":Z
    .end local v15    # "err":Ljava/lang/Throwable;
    .end local v16    # "isHolder":Z
    :cond_3
    const/4 v14, 0x0

    goto :goto_2

    .line 491
    .restart local v14    # "empty":Z
    .restart local v15    # "err":Ljava/lang/Throwable;
    .restart local v16    # "isHolder":Z
    :cond_4
    invoke-virtual/range {v24 .. v24}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    goto :goto_3

    .line 497
    .end local v15    # "err":Ljava/lang/Throwable;
    :cond_5
    if-eqz v14, :cond_6

    .line 569
    move/from16 v0, v17

    neg-int v2, v0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->leave(I)I

    move-result v17

    .line 570
    if-nez v17, :cond_0

    goto :goto_1

    .line 501
    :cond_6
    if-eqz v16, :cond_9

    move-object/from16 v12, v18

    .line 502
    check-cast v12, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    .line 503
    .local v12, "consumerIndexHolder":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-nez v2, :cond_7

    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    iget-wide v4, v12, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;->index:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 504
    :cond_7
    invoke-virtual/range {v24 .. v24}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    .line 505
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    .line 506
    move-object/from16 v0, p0

    iget v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v2}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v24

    .line 507
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 509
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v20

    .line 510
    .local v20, "r":J
    const-wide/16 v2, 0x0

    cmp-long v2, v20, v2

    if-eqz v2, :cond_8

    .line 511
    move-object/from16 v0, v24

    invoke-interface {v9, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 512
    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v20, v2

    if-eqz v2, :cond_0

    .line 513
    const-wide/16 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    goto/16 :goto_0

    .line 516
    :cond_8
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 517
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 518
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 519
    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v3, "Could not deliver first window due to lack of requests."

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v9, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 520
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    goto/16 :goto_1

    .line 527
    .end local v12    # "consumerIndexHolder":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    .end local v20    # "r":J
    :cond_9
    invoke-static/range {v18 .. v18}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    .line 528
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    const-wide/16 v4, 0x1

    add-long v10, v2, v4

    .line 530
    .local v10, "c":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    cmp-long v2, v10, v2

    if-ltz v2, :cond_c

    .line 531
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    .line 532
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    .line 534
    invoke-virtual/range {v24 .. v24}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    .line 536
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v20

    .line 538
    .restart local v20    # "r":J
    const-wide/16 v2, 0x0

    cmp-long v2, v20, v2

    if-eqz v2, :cond_b

    .line 539
    move-object/from16 v0, p0

    iget v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v2}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v24

    .line 540
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 541
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    move-object/from16 v0, v24

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 542
    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v20, v2

    if-eqz v2, :cond_a

    .line 543
    const-wide/16 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    .line 546
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v2, :cond_0

    .line 547
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v2}, Lio/reactivex/internal/disposables/SequentialDisposable;->get()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lio/reactivex/disposables/Disposable;

    .line 548
    .local v23, "tm":Lio/reactivex/disposables/Disposable;
    invoke-interface/range {v23 .. v23}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 550
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    move-object/from16 v0, p0

    invoke-direct {v3, v4, v5, v0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    move-object/from16 v0, p0

    iget-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    move-object/from16 v0, p0

    iget-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v2 .. v8}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v22

    .line 552
    .local v22, "task":Lio/reactivex/disposables/Disposable;
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v2, v0, v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 553
    invoke-interface/range {v22 .. v22}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto/16 :goto_0

    .line 558
    .end local v22    # "task":Lio/reactivex/disposables/Disposable;
    .end local v23    # "tm":Lio/reactivex/disposables/Disposable;
    :cond_b
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 559
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 560
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v3, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v4, "Could not deliver window due to lack of requests"

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 561
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    goto/16 :goto_1

    .line 565
    .end local v20    # "r":J
    :cond_c
    move-object/from16 v0, p0

    iput-wide v10, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 434
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    .line 435
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    .line 439
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 440
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    .line 441
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 422
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->error:Ljava/lang/Throwable;

    .line 423
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    .line 424
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 425
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    .line 428
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 429
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    .line 430
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v4, 0x0

    const-wide/16 v2, 0x1

    .line 362
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->terminated:Z

    if-eqz v0, :cond_1

    .line 418
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->fastEnter()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 367
    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 368
    .local v13, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    invoke-virtual {v13, p1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    .line 370
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    add-long v8, v0, v2

    .line 372
    .local v8, "c":J
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    cmp-long v0, v8, v0

    if-ltz v0, :cond_6

    .line 373
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    .line 374
    iput-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    .line 376
    invoke-virtual {v13}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    .line 378
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v10

    .line 380
    .local v10, "r":J
    cmp-long v0, v10, v4

    if-eqz v0, :cond_5

    .line 381
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v13

    .line 382
    iput-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 383
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, v13}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 384
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, v10, v0

    if-eqz v0, :cond_2

    .line 385
    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    .line 387
    :cond_2
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v0, :cond_3

    .line 388
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/reactivex/disposables/Disposable;

    .line 390
    .local v12, "tm":Lio/reactivex/disposables/Disposable;
    invoke-interface {v12}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 391
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    invoke-direct {v1, v2, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    .line 393
    .local v7, "task":Lio/reactivex/disposables/Disposable;
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, v12, v7}, Lio/reactivex/internal/disposables/SequentialDisposable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 394
    invoke-interface {v7}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 408
    .end local v7    # "task":Lio/reactivex/disposables/Disposable;
    .end local v10    # "r":J
    .end local v12    # "tm":Lio/reactivex/disposables/Disposable;
    :cond_3
    :goto_1
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->leave(I)I

    move-result v0

    if-eqz v0, :cond_0

    .line 417
    .end local v8    # "c":J
    .end local v13    # "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    goto :goto_0

    .line 398
    .restart local v8    # "c":J
    .restart local v10    # "r":J
    .restart local v13    # "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 399
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 400
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v2, "Could not deliver window due to lack of requests"

    invoke-direct {v1, v2}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 401
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    goto/16 :goto_0

    .line 405
    .end local v10    # "r":J
    :cond_6
    iput-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    goto :goto_1

    .line 412
    .end local v8    # "c":J
    .end local v13    # "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_7
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 413
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 14
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    const-wide v12, 0x7fffffffffffffffL

    .line 318
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 322
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 324
    .local v7, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    invoke-interface {v7, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 326
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    if-eqz v0, :cond_1

    .line 358
    .end local v7    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    :cond_0
    :goto_0
    return-void

    .line 330
    .restart local v7    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    :cond_1
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v9

    .line 331
    .local v9, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iput-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 333
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v10

    .line 334
    .local v10, "r":J
    const-wide/16 v2, 0x0

    cmp-long v0, v10, v2

    if-eqz v0, :cond_3

    .line 335
    invoke-interface {v7, v9}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 336
    cmp-long v0, v10, v12

    if-eqz v0, :cond_2

    .line 337
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    .line 347
    :cond_2
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    invoke-direct {v1, v2, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    .line 348
    .local v1, "consumerIndexHolder":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v0, :cond_4

    .line 349
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .line 354
    .local v8, "d":Lio/reactivex/disposables/Disposable;
    :goto_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, v8}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 355
    invoke-interface {p1, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 340
    .end local v1    # "consumerIndexHolder":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    .end local v8    # "d":Lio/reactivex/disposables/Disposable;
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    .line 341
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 342
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v2, "Could not deliver initial window due to lack of requests."

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v7, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 351
    .restart local v1    # "consumerIndexHolder":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    :cond_4
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .restart local v8    # "d":Lio/reactivex/disposables/Disposable;
    goto :goto_1
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 445
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber<TT;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested(J)V

    .line 446
    return-void
.end method
