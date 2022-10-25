.class final Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;
.super Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase;
.source "ParallelJoin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JoinSubscriptionDelayError"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4fa158f1d44428dbL


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;II)V
    .locals 0
    .param p2, "n"    # I
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;II)V"
        }
    .end annotation

    .prologue
    .line 325
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase;-><init>(Lorg/reactivestreams/Subscriber;II)V

    .line 326
    return-void
.end method


# virtual methods
.method drain()V
    .locals 1

    .prologue
    .line 384
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    :goto_0
    return-void

    .line 388
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->drainLoop()V

    goto :goto_0
.end method

.method drainLoop()V
    .locals 22

    .prologue
    .line 392
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    const/4 v10, 0x1

    .line 394
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;

    move-object/from16 v16, v0

    .line 395
    .local v16, "s":[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    move-object/from16 v0, v16

    array-length v11, v0

    .line 396
    .local v11, "n":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->actual:Lorg/reactivestreams/Subscriber;

    .line 400
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 401
    .local v14, "r":J
    const-wide/16 v4, 0x0

    .line 404
    .local v4, "e":J
    :cond_1
    cmp-long v19, v4, v14

    if-eqz v19, :cond_3

    .line 405
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->cancelled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 406
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->cleanup()V

    .line 492
    :goto_1
    return-void

    .line 410
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v19

    if-nez v19, :cond_4

    const/4 v3, 0x1

    .line 412
    .local v3, "d":Z
    :goto_2
    const/4 v6, 0x1

    .line 414
    .local v6, "empty":Z
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    if-ge v8, v11, :cond_6

    .line 415
    aget-object v9, v16, v8

    .line 417
    .local v9, "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    iget-object v12, v9, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 418
    .local v12, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    if-eqz v12, :cond_5

    .line 419
    invoke-interface {v12}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v17

    .line 421
    .local v17, "v":Ljava/lang/Object;, "TT;"
    if-eqz v17, :cond_5

    .line 422
    const/4 v6, 0x0

    .line 423
    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 424
    invoke-virtual {v9}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->requestOne()V

    .line 425
    const-wide/16 v20, 0x1

    add-long v4, v4, v20

    cmp-long v19, v4, v14

    if-nez v19, :cond_5

    .line 447
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v8    # "i":I
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    .end local v17    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    :goto_4
    cmp-long v19, v4, v14

    if-nez v19, :cond_e

    .line 448
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->cancelled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_9

    .line 449
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->cleanup()V

    goto :goto_1

    .line 410
    :cond_4
    const/4 v3, 0x0

    goto :goto_2

    .line 414
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v8    # "i":I
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .restart local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 432
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_6
    if-eqz v3, :cond_8

    if-eqz v6, :cond_8

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 434
    .local v7, "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_7

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 437
    :cond_7
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 442
    .end local v7    # "ex":Ljava/lang/Throwable;
    :cond_8
    if-eqz v6, :cond_1

    goto :goto_4

    .line 453
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v8    # "i":I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v19

    if-nez v19, :cond_b

    const/4 v3, 0x1

    .line 455
    .restart local v3    # "d":Z
    :goto_5
    const/4 v6, 0x1

    .line 457
    .restart local v6    # "empty":Z
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_6
    if-ge v8, v11, :cond_a

    .line 458
    aget-object v9, v16, v8

    .line 460
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    iget-object v13, v9, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 461
    .local v13, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v13, :cond_c

    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_c

    .line 462
    const/4 v6, 0x0

    .line 467
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_a
    if-eqz v3, :cond_e

    if-eqz v6, :cond_e

    .line 468
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 469
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_d

    .line 470
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 453
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v8    # "i":I
    :cond_b
    const/4 v3, 0x0

    goto :goto_5

    .line 457
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v8    # "i":I
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .restart local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_c
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 472
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .restart local v7    # "ex":Ljava/lang/Throwable;
    :cond_d
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_1

    .line 478
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v8    # "i":I
    :cond_e
    const-wide/16 v20, 0x0

    cmp-long v19, v4, v20

    if-eqz v19, :cond_f

    const-wide v20, 0x7fffffffffffffffL

    cmp-long v19, v14, v20

    if-eqz v19, :cond_f

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v19, v0

    neg-long v0, v4

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 482
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->get()I

    move-result v18

    .line 483
    .local v18, "w":I
    move/from16 v0, v18

    if-ne v0, v10, :cond_10

    .line 484
    neg-int v0, v10

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->addAndGet(I)I

    move-result v10

    .line 485
    if-nez v10, :cond_0

    goto/16 :goto_1

    .line 489
    :cond_10
    move/from16 v10, v18

    goto/16 :goto_0
.end method

.method onComplete()V
    .locals 1

    .prologue
    .line 378
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 379
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->drain()V

    .line 380
    return-void
.end method

.method onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 371
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 372
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 373
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->drain()V

    .line 374
    return-void
.end method

.method onNext(Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError<TT;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->get()I

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 331
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_3

    .line 332
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 333
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 334
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 336
    :cond_0
    const-wide/16 v2, 0x1

    invoke-virtual {p1, v2, v3}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->request(J)V

    .line 348
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_6

    .line 367
    :cond_2
    :goto_0
    return-void

    .line 338
    :cond_3
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->getQueue()Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-result-object v0

    .line 340
    .local v0, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    invoke-interface {v0, p2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 341
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->cancel()Z

    .line 342
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v3, "Queue full?!"

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 343
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 344
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->drainLoop()V

    goto :goto_0

    .line 352
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_4
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->getQueue()Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-result-object v0

    .line 354
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    invoke-interface {v0, p2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 355
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->cancel()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 356
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v3, "Queue full?!"

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 357
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 361
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_2

    .line 366
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionDelayError;->drainLoop()V

    goto :goto_0
.end method
