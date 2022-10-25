.class final Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "FlowableCombineLatest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CombineLatestCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4687de9589e4abbdL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final combiner:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field

.field completedSources:I

.field final delayErrors:Z

.field volatile done:Z

.field final error:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final latest:[Ljava/lang/Object;

.field nonEmptySources:I

.field outputFused:Z

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

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IIZ)V
    .locals 3
    .param p3, "n"    # I
    .param p4, "bufferSize"    # I
    .param p5, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IIZ)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 183
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    .line 184
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    .line 186
    new-array v0, p3, [Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .line 187
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber<TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 188
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    invoke-direct {v2, p0, v1, p4}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;II)V

    aput-object v2, v0, v1

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    :cond_0
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .line 191
    new-array v2, p3, [Ljava/lang/Object;

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->latest:[Ljava/lang/Object;

    .line 192
    new-instance v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v2, p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 193
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 194
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 195
    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->delayErrors:Z

    .line 196
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 208
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelled:Z

    .line 209
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 210
    return-void
.end method

.method cancelAll()V
    .locals 4

    .prologue
    .line 453
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 454
    .local v2, "inner":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;->cancel()V

    .line 453
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 456
    .end local v2    # "inner":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber<TT;>;"
    :cond_0
    return-void
.end method

.method checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lorg/reactivestreams/Subscriber",
            "<*>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    .local p3, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    const/4 v1, 0x1

    .line 413
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelled:Z

    if-eqz v2, :cond_0

    .line 414
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 415
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 449
    :goto_0
    return v1

    .line 419
    :cond_0
    if-eqz p1, :cond_4

    .line 420
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->delayErrors:Z

    if-eqz v2, :cond_2

    .line 421
    if-eqz p2, :cond_4

    .line 422
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 423
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v0

    .line 425
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    sget-object v2, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v2, :cond_1

    .line 426
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 428
    :cond_1
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 433
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v0

    .line 435
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    sget-object v2, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v2, :cond_3

    .line 436
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 437
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 438
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 441
    :cond_3
    if-eqz p2, :cond_4

    .line 442
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 444
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 449
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 484
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 485
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 401
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 410
    :goto_0
    return-void

    .line 405
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->outputFused:Z

    if-eqz v0, :cond_1

    .line 406
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drainOutput()V

    goto :goto_0

    .line 408
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drainAsync()V

    goto :goto_0
.end method

.method drainAsync()V
    .locals 18

    .prologue
    .line 334
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    .line 335
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 337
    .local v9, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    const/4 v8, 0x1

    .line 341
    .local v8, "missed":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    .line 342
    .local v10, "r":J
    const-wide/16 v4, 0x0

    .line 344
    .local v4, "e":J
    :goto_0
    cmp-long v15, v4, v10

    if-eqz v15, :cond_4

    .line 345
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    .line 347
    .local v3, "d":Z
    invoke-virtual {v9}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v12

    .line 349
    .local v12, "v":Ljava/lang/Object;
    if-nez v12, :cond_2

    const/4 v6, 0x1

    .line 351
    .local v6, "empty":Z
    :goto_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6, v2, v9}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 398
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v12    # "v":Ljava/lang/Object;
    :cond_1
    :goto_2
    return-void

    .line 349
    .restart local v3    # "d":Z
    .restart local v12    # "v":Ljava/lang/Object;
    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    .line 355
    .restart local v6    # "empty":Z
    :cond_3
    if-eqz v6, :cond_7

    .line 383
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v12    # "v":Ljava/lang/Object;
    :cond_4
    cmp-long v15, v4, v10

    if-nez v15, :cond_5

    .line 384
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    invoke-virtual {v9}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1, v2, v9}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 389
    :cond_5
    const-wide/16 v16, 0x0

    cmp-long v15, v4, v16

    if-eqz v15, :cond_6

    const-wide v16, 0x7fffffffffffffffL

    cmp-long v15, v10, v16

    if-eqz v15, :cond_6

    .line 390
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v0, v4

    move-wide/from16 v16, v0

    invoke-virtual/range {v15 .. v17}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 393
    :cond_6
    neg-int v15, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->addAndGet(I)I

    move-result v8

    .line 394
    if-nez v8, :cond_0

    goto :goto_2

    .line 359
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v12    # "v":Ljava/lang/Object;
    :cond_7
    invoke-virtual {v9}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Ljava/lang/Object;

    move-object v13, v15

    check-cast v13, [Ljava/lang/Object;

    .line 364
    .local v13, "va":[Ljava/lang/Object;, "[TT;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    invoke-interface {v15, v13}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    const-string/jumbo v16, "The combiner returned a null value"

    invoke-static/range {v15 .. v16}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v14

    .line 376
    .local v14, "w":Ljava/lang/Object;, "TR;"
    invoke-interface {v2, v14}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 378
    check-cast v12, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .end local v12    # "v":Ljava/lang/Object;
    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;->requestOne()V

    .line 380
    const-wide/16 v16, 0x1

    add-long v4, v4, v16

    .line 381
    goto :goto_0

    .line 365
    .end local v14    # "w":Ljava/lang/Object;, "TR;"
    .restart local v12    # "v":Ljava/lang/Object;
    :catch_0
    move-exception v7

    .line 366
    .local v7, "ex":Ljava/lang/Throwable;
    invoke-static {v7}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 368
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 369
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v15, v7}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 370
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v15}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v7

    .line 372
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method drainOutput()V
    .locals 7

    .prologue
    .line 292
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    .line 293
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 295
    .local v5, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    const/4 v4, 0x1

    .line 299
    .local v4, "missed":I
    :cond_0
    iget-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelled:Z

    if-eqz v6, :cond_1

    .line 300
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 330
    :goto_0
    return-void

    .line 304
    :cond_1
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .line 305
    .local v3, "ex":Ljava/lang/Throwable;
    if-eqz v3, :cond_2

    .line 306
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 308
    invoke-interface {v0, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 312
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    .line 314
    .local v1, "d":Z
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v2

    .line 316
    .local v2, "empty":Z
    if-nez v2, :cond_3

    .line 317
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 320
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    .line 321
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 325
    :cond_4
    neg-int v6, v4

    invoke-virtual {p0, v6}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->addAndGet(I)I

    move-result v4

    .line 326
    if-nez v4, :cond_0

    goto :goto_0
.end method

.method innerComplete(I)V
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 257
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    monitor-enter p0

    .line 258
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->latest:[Ljava/lang/Object;

    .line 260
    .local v1, "os":[Ljava/lang/Object;
    aget-object v2, v1, p1

    if-eqz v2, :cond_1

    .line 261
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->completedSources:I

    add-int/lit8 v0, v2, 0x1

    .line 263
    .local v0, "localCompletedSources":I
    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 264
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    .line 272
    .end local v0    # "localCompletedSources":I
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drain()V

    .line 274
    :goto_1
    return-void

    .line 266
    .restart local v0    # "localCompletedSources":I
    :cond_0
    :try_start_1
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->completedSources:I

    .line 267
    monitor-exit p0

    goto :goto_1

    .line 272
    .end local v0    # "localCompletedSources":I
    .end local v1    # "os":[Ljava/lang/Object;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 270
    .restart local v1    # "os":[Ljava/lang/Object;
    :cond_1
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method innerError(ILjava/lang/Throwable;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 278
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p2}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 279
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->delayErrors:Z

    if-nez v0, :cond_0

    .line 280
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelAll()V

    .line 281
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    .line 282
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drain()V

    .line 289
    :goto_0
    return-void

    .line 284
    :cond_0
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->innerComplete(I)V

    goto :goto_0

    .line 287
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerValue(ILjava/lang/Object;)V
    .locals 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 228
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->latest:[Ljava/lang/Object;

    .line 230
    .local v1, "os":[Ljava/lang/Object;
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->nonEmptySources:I

    .line 232
    .local v0, "localNonEmptySources":I
    aget-object v3, v1, p1

    if-nez v3, :cond_0

    .line 233
    add-int/lit8 v0, v0, 0x1

    .line 234
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->nonEmptySources:I

    .line 237
    :cond_0
    aput-object p2, v1, p1

    .line 239
    array-length v3, v1

    if-ne v3, v0, :cond_1

    .line 241
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    aget-object v4, v4, p1

    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 243
    const/4 v2, 0x0

    .line 247
    .local v2, "replenishInsteadOfDrain":Z
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    if-eqz v2, :cond_2

    .line 250
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;->requestOne()V

    .line 254
    :goto_1
    return-void

    .line 245
    .end local v2    # "replenishInsteadOfDrain":Z
    :cond_1
    const/4 v2, 0x1

    .restart local v2    # "replenishInsteadOfDrain":Z
    goto :goto_0

    .line 247
    .end local v0    # "localNonEmptySources":I
    .end local v1    # "os":[Ljava/lang/Object;
    .end local v2    # "replenishInsteadOfDrain":Z
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 252
    .restart local v0    # "localNonEmptySources":I
    .restart local v1    # "os":[Ljava/lang/Object;
    .restart local v2    # "replenishInsteadOfDrain":Z
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drain()V

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 489
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public poll()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 472
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 473
    .local v1, "e":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 474
    const/4 v2, 0x0

    .line 479
    .end local v1    # "e":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 476
    .restart local v1    # "e":Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    .line 477
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    invoke-interface {v3, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 478
    .local v2, "r":Ljava/lang/Object;, "TR;"
    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .end local v1    # "e":Ljava/lang/Object;
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;->requestOne()V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 200
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 202
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->drain()V

    .line 204
    :cond_0
    return-void
.end method

.method public requestFusion(I)I
    .locals 3
    .param p1, "requestedMode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    const/4 v1, 0x0

    .line 460
    and-int/lit8 v2, p1, 0x4

    if-eqz v2, :cond_0

    .line 465
    :goto_0
    return v1

    .line 463
    :cond_0
    and-int/lit8 v0, p1, 0x2

    .line 464
    .local v0, "m":I
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->outputFused:Z

    move v1, v0

    .line 465
    goto :goto_0
.end method

.method subscribe([Lorg/reactivestreams/Publisher;I)V
    .locals 4
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;

    .line 215
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber<TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 216
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->done:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->cancelled:Z

    if-eqz v2, :cond_1

    .line 221
    :cond_0
    return-void

    .line 219
    :cond_1
    aget-object v2, p1, v1

    aget-object v3, v0, v1

    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 215
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
