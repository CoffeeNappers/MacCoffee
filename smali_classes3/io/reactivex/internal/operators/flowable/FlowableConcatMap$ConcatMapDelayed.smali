.class final Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;
.super Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber;
.source "FlowableConcatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableConcatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatMapDelayed"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber",
        "<TT;TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x28e181349daae86aL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field final veryEnd:Z


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .param p3, "prefetch"    # I
    .param p4, "veryEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 395
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber;-><init>(Lio/reactivex/functions/Function;I)V

    .line 396
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    .line 397
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->veryEnd:Z

    .line 398
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 442
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->cancelled:Z

    if-nez v0, :cond_0

    .line 443
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->cancelled:Z

    .line 445
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->cancel()V

    .line 446
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 448
    :cond_0
    return-void
.end method

.method drain()V
    .locals 14

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 452
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->getAndIncrement()I

    move-result v11

    if-nez v11, :cond_1

    .line 455
    :cond_0
    :goto_0
    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->cancelled:Z

    if-eqz v11, :cond_2

    .line 557
    :cond_1
    :goto_1
    return-void

    .line 459
    :cond_2
    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->active:Z

    if-nez v11, :cond_a

    .line 461
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->done:Z

    .line 463
    .local v1, "d":Z
    if-eqz v1, :cond_3

    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->veryEnd:Z

    if-nez v11, :cond_3

    .line 464
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v11}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    .line 465
    .local v4, "ex":Ljava/lang/Throwable;
    if-eqz v4, :cond_3

    .line 466
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v10}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 474
    .end local v4    # "ex":Ljava/lang/Throwable;
    :cond_3
    :try_start_0
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 483
    .local v7, "v":Ljava/lang/Object;, "TT;"
    if-nez v7, :cond_4

    move v3, v9

    .line 485
    .local v3, "empty":Z
    :goto_2
    if-eqz v1, :cond_6

    if-eqz v3, :cond_6

    .line 486
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v4

    .line 487
    .restart local v4    # "ex":Ljava/lang/Throwable;
    if-eqz v4, :cond_5

    .line 488
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v9, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 475
    .end local v3    # "empty":Z
    .end local v4    # "ex":Ljava/lang/Throwable;
    .end local v7    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    .line 476
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 477
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v9}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 478
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 479
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v10}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v7    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    move v3, v10

    .line 483
    goto :goto_2

    .line 490
    .restart local v3    # "empty":Z
    .restart local v4    # "ex":Ljava/lang/Throwable;
    :cond_5
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v9}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 495
    .end local v4    # "ex":Ljava/lang/Throwable;
    :cond_6
    if-nez v3, :cond_a

    .line 499
    :try_start_1
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v11, v7}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    const-string/jumbo v12, "The mapper returned a null Publisher"

    invoke-static {v11, v12}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 509
    .local v5, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    iget v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->sourceMode:I

    if-eq v11, v9, :cond_7

    .line 510
    iget v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->consumed:I

    add-int/lit8 v0, v11, 0x1

    .line 511
    .local v0, "c":I
    iget v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->limit:I

    if-ne v0, v11, :cond_8

    .line 512
    iput v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->consumed:I

    .line 513
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    int-to-long v12, v0

    invoke-interface {v11, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 519
    .end local v0    # "c":I
    :cond_7
    :goto_3
    instance-of v11, v5, Ljava/util/concurrent/Callable;

    if-eqz v11, :cond_b

    move-object v6, v5

    .line 521
    check-cast v6, Ljava/util/concurrent/Callable;

    .line 526
    .local v6, "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    :try_start_2
    invoke-interface {v6}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v8

    .line 535
    .local v8, "vr":Ljava/lang/Object;, "TR;"
    if-eqz v8, :cond_0

    .line 539
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v11}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->isUnbounded()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 540
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v11, v8}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 500
    .end local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v6    # "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .end local v8    # "vr":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v2

    .line 501
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 503
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v9}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 504
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 505
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v10}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 515
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v0    # "c":I
    .restart local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_8
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->consumed:I

    goto :goto_3

    .line 527
    .end local v0    # "c":I
    .restart local v6    # "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    :catch_2
    move-exception v2

    .line 528
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 529
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v9}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 530
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 531
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v10}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 543
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v8    # "vr":Ljava/lang/Object;, "TR;"
    :cond_9
    iput-boolean v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->active:Z

    .line 544
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    new-instance v12, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$WeakScalarSubscription;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-direct {v12, v8, v13}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$WeakScalarSubscription;-><init>(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)V

    invoke-virtual {v11, v12}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 552
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v6    # "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .end local v7    # "v":Ljava/lang/Object;, "TT;"
    .end local v8    # "vr":Ljava/lang/Object;, "TR;"
    :cond_a
    :goto_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->decrementAndGet()I

    move-result v11

    if-nez v11, :cond_0

    goto/16 :goto_1

    .line 547
    .restart local v1    # "d":Z
    .restart local v3    # "empty":Z
    .restart local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .restart local v7    # "v":Ljava/lang/Object;, "TT;"
    :cond_b
    iput-boolean v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->active:Z

    .line 548
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-interface {v5, v11}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_4
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 423
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 424
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->veryEnd:Z

    if-nez v0, :cond_0

    .line 425
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 426
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->done:Z

    .line 428
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->active:Z

    .line 429
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->drain()V

    .line 433
    :goto_0
    return-void

    .line 431
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .prologue
    .line 417
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TR;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 418
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 407
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 408
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->done:Z

    .line 409
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->drain()V

    .line 413
    :goto_0
    return-void

    .line 411
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 437
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->request(J)V

    .line 438
    return-void
.end method

.method subscribeActual()V
    .locals 1

    .prologue
    .line 402
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapDelayed;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 403
    return-void
.end method
