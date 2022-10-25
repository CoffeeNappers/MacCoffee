.class final Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableFlatMap.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFlatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MergeSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field static final CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<**>;"
        }
    .end annotation
.end field

.field static final EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<**>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x1d634c9cafb5cc5aL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field final delayErrors:Z

.field volatile done:Z

.field final errs:Lio/reactivex/internal/util/AtomicThrowable;

.field lastId:J

.field lastIndex:I

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field volatile queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TU;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field scalarEmitted:I

.field final scalarLimit:I

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<**>;>;"
        }
    .end annotation
.end field

.field uniqueId:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 82
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 84
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    return-void
.end method

.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;ZII)V
    .locals 2
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TU;>;>;ZII)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TU;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 76
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    .line 80
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 86
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 99
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 100
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 101
    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->delayErrors:Z

    .line 102
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    .line 103
    iput p5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->bufferSize:I

    .line 104
    const/4 v0, 0x1

    shr-int/lit8 v1, p4, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarLimit:I

    .line 105
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 106
    return-void
.end method


# virtual methods
.method addInner(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<TT;TU;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    const/4 v3, 0x0

    .line 170
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 171
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    if-ne v0, v4, :cond_1

    .line 172
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->dispose()V

    .line 180
    :goto_0
    return v3

    .line 175
    :cond_1
    array-length v2, v0

    .line 176
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 177
    .local v1, "b":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    aput-object p1, v1, v2

    .line 179
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 180
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public cancel()V
    .locals 2

    .prologue
    .line 351
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    if-nez v1, :cond_0

    .line 352
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    .line 353
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 354
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->disposeAll()V

    .line 355
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_0

    .line 356
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 357
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-eqz v0, :cond_0

    .line 358
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 362
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_0
    return-void
.end method

.method checkTerminate()Z
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    const/4 v1, 0x1

    .line 555
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    if-eqz v2, :cond_1

    .line 556
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->clearScalarQueue()V

    .line 567
    :cond_0
    :goto_0
    return v1

    .line 559
    :cond_1
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->delayErrors:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 560
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->clearScalarQueue()V

    .line 561
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 562
    .local v0, "ex":Ljava/lang/Throwable;
    sget-object v2, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v2, :cond_0

    .line 563
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 567
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method clearScalarQueue()V
    .locals 1

    .prologue
    .line 571
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 572
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-eqz v0, :cond_0

    .line 573
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 575
    :cond_0
    return-void
.end method

.method disposeAll()V
    .locals 8

    .prologue
    .line 578
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 579
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    sget-object v6, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    if-eq v0, v6, :cond_1

    .line 580
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v7, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 581
    .restart local v0    # "a":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    sget-object v6, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    if-eq v0, v6, :cond_1

    .line 582
    move-object v1, v0

    .local v1, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_0

    aget-object v4, v1, v3

    .line 583
    .local v4, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    invoke-virtual {v4}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->dispose()V

    .line 582
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 585
    .end local v4    # "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    :cond_0
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v6}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v2

    .line 586
    .local v2, "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_1

    sget-object v6, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v2, v6, :cond_1

    .line 587
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 591
    .end local v1    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    :cond_1
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 365
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 366
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drainLoop()V

    .line 368
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 34

    .prologue
    .line 371
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 372
    .local v4, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    const/4 v15, 0x1

    .line 374
    .local v15, "missed":I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-eqz v31, :cond_2

    .line 552
    :cond_1
    :goto_0
    return-void

    .line 377
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v21, v0

    .line 379
    .local v21, "svq":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v22

    .line 380
    .local v22, "r":J
    const-wide v32, 0x7fffffffffffffffL

    cmp-long v31, v22, v32

    if-nez v31, :cond_8

    const/16 v30, 0x1

    .line 382
    .local v30, "unbounded":Z
    :goto_1
    const-wide/16 v24, 0x0

    .line 384
    .local v24, "replenishMain":J
    if-eqz v21, :cond_6

    .line 386
    :cond_3
    const-wide/16 v26, 0x0

    .line 387
    .local v26, "scalarEmission":J
    const/16 v17, 0x0

    .line 388
    :goto_2
    const-wide/16 v32, 0x0

    cmp-long v31, v22, v32

    if-eqz v31, :cond_4

    .line 389
    invoke-interface/range {v21 .. v21}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v17

    .line 391
    .local v17, "o":Ljava/lang/Object;, "TU;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 394
    if-nez v17, :cond_9

    .line 404
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_4
    const-wide/16 v32, 0x0

    cmp-long v31, v26, v32

    if-eqz v31, :cond_5

    .line 405
    if-eqz v30, :cond_a

    .line 406
    const-wide v22, 0x7fffffffffffffffL

    .line 411
    :cond_5
    :goto_3
    const-wide/16 v32, 0x0

    cmp-long v31, v22, v32

    if-eqz v31, :cond_6

    if-nez v17, :cond_3

    .line 417
    .end local v26    # "scalarEmission":J
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    .line 418
    .local v5, "d":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v21, v0

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 420
    .local v9, "inner":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    array-length v0, v9

    move/from16 v16, v0

    .line 422
    .local v16, "n":I
    if-eqz v5, :cond_c

    if-eqz v21, :cond_7

    invoke-interface/range {v21 .. v21}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->isEmpty()Z

    move-result v31

    if-eqz v31, :cond_c

    :cond_7
    if-nez v16, :cond_c

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v6

    .line 424
    .local v6, "ex":Ljava/lang/Throwable;
    sget-object v31, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    move-object/from16 v0, v31

    if-eq v6, v0, :cond_1

    .line 425
    if-nez v6, :cond_b

    .line 426
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 380
    .end local v5    # "d":Z
    .end local v6    # "ex":Ljava/lang/Throwable;
    .end local v9    # "inner":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    .end local v16    # "n":I
    .end local v24    # "replenishMain":J
    .end local v30    # "unbounded":Z
    :cond_8
    const/16 v30, 0x0

    goto :goto_1

    .line 398
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    .restart local v24    # "replenishMain":J
    .restart local v26    # "scalarEmission":J
    .restart local v30    # "unbounded":Z
    :cond_9
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 400
    const-wide/16 v32, 0x1

    add-long v24, v24, v32

    .line 401
    const-wide/16 v32, 0x1

    add-long v26, v26, v32

    .line 402
    const-wide/16 v32, 0x1

    sub-long v22, v22, v32

    goto :goto_2

    .line 408
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v31, v0

    move-wide/from16 v0, v26

    neg-long v0, v0

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v22

    goto :goto_3

    .line 428
    .end local v26    # "scalarEmission":J
    .restart local v5    # "d":Z
    .restart local v6    # "ex":Ljava/lang/Throwable;
    .restart local v9    # "inner":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    .restart local v16    # "n":I
    :cond_b
    invoke-interface {v4, v6}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 434
    .end local v6    # "ex":Ljava/lang/Throwable;
    :cond_c
    const/4 v10, 0x0

    .line 435
    .local v10, "innerCompleted":Z
    if-eqz v16, :cond_16

    .line 436
    move-object/from16 v0, p0

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastId:J

    move-wide/from16 v28, v0

    .line 437
    .local v28, "startId":J
    move-object/from16 v0, p0

    iget v8, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastIndex:I

    .line 439
    .local v8, "index":I
    move/from16 v0, v16

    if-le v0, v8, :cond_d

    aget-object v31, v9, v8

    move-object/from16 v0, v31

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->id:J

    move-wide/from16 v32, v0

    cmp-long v31, v32, v28

    if-eqz v31, :cond_10

    .line 440
    :cond_d
    move/from16 v0, v16

    if-gt v0, v8, :cond_e

    .line 441
    const/4 v8, 0x0

    .line 443
    :cond_e
    move v14, v8

    .line 444
    .local v14, "j":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    move/from16 v0, v16

    if-ge v7, v0, :cond_f

    .line 445
    aget-object v31, v9, v14

    move-object/from16 v0, v31

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->id:J

    move-wide/from16 v32, v0

    cmp-long v31, v32, v28

    if-nez v31, :cond_18

    .line 453
    :cond_f
    move v8, v14

    .line 454
    move-object/from16 v0, p0

    iput v14, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastIndex:I

    .line 455
    aget-object v31, v9, v14

    move-object/from16 v0, v31

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->id:J

    move-wide/from16 v32, v0

    move-wide/from16 v0, v32

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastId:J

    .line 458
    .end local v7    # "i":I
    .end local v14    # "j":I
    :cond_10
    move v14, v8

    .line 460
    .restart local v14    # "j":I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_5
    move/from16 v0, v16

    if-ge v7, v0, :cond_15

    .line 461
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 465
    aget-object v13, v9, v14

    .line 467
    .local v13, "is":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    const/16 v17, 0x0

    .line 469
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 472
    iget-object v0, v13, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    move-object/from16 v20, v0

    .line 473
    .local v20, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-nez v20, :cond_1a

    .line 518
    :cond_12
    :goto_6
    iget-boolean v11, v13, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->done:Z

    .line 519
    .local v11, "innerDone":Z
    iget-object v12, v13, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 520
    .local v12, "innerQueue":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-eqz v11, :cond_14

    if-eqz v12, :cond_13

    invoke-interface {v12}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v31

    if-eqz v31, :cond_14

    .line 521
    :cond_13
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->removeInner(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)V

    .line 522
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 525
    const-wide/16 v32, 0x1

    add-long v24, v24, v32

    .line 526
    const/4 v10, 0x1

    .line 528
    :cond_14
    const-wide/16 v32, 0x0

    cmp-long v31, v22, v32

    if-nez v31, :cond_20

    .line 537
    .end local v11    # "innerDone":Z
    .end local v12    # "innerQueue":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    .end local v13    # "is":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    .end local v20    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_15
    move-object/from16 v0, p0

    iput v14, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastIndex:I

    .line 538
    aget-object v31, v9, v14

    move-object/from16 v0, v31

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->id:J

    move-wide/from16 v32, v0

    move-wide/from16 v0, v32

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->lastId:J

    .line 541
    .end local v7    # "i":I
    .end local v8    # "index":I
    .end local v14    # "j":I
    .end local v28    # "startId":J
    :cond_16
    const-wide/16 v32, 0x0

    cmp-long v31, v24, v32

    if-eqz v31, :cond_17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    move/from16 v31, v0

    if-nez v31, :cond_17

    .line 542
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-wide/from16 v1, v24

    invoke-interface {v0, v1, v2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 544
    :cond_17
    if-nez v10, :cond_0

    .line 547
    neg-int v0, v15

    move/from16 v31, v0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->addAndGet(I)I

    move-result v15

    .line 548
    if-nez v15, :cond_0

    goto/16 :goto_0

    .line 448
    .restart local v7    # "i":I
    .restart local v8    # "index":I
    .restart local v14    # "j":I
    .restart local v28    # "startId":J
    :cond_18
    add-int/lit8 v14, v14, 0x1

    .line 449
    move/from16 v0, v16

    if-ne v14, v0, :cond_19

    .line 450
    const/4 v14, 0x0

    .line 444
    :cond_19
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_4

    .line 476
    .restart local v13    # "is":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    .restart local v20    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_1a
    const-wide/16 v18, 0x0

    .line 477
    .local v18, "produced":J
    :goto_7
    const-wide/16 v32, 0x0

    cmp-long v31, v22, v32

    if-eqz v31, :cond_1b

    .line 480
    :try_start_0
    invoke-interface/range {v20 .. v20}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 493
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    if-nez v17, :cond_1e

    .line 506
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_1b
    const-wide/16 v32, 0x0

    cmp-long v31, v18, v32

    if-eqz v31, :cond_1c

    .line 507
    if-nez v30, :cond_1f

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v31, v0

    move-wide/from16 v0, v18

    neg-long v0, v0

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v22

    .line 512
    :goto_8
    move-wide/from16 v0, v18

    invoke-virtual {v13, v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->requestMore(J)V

    .line 514
    :cond_1c
    const-wide/16 v32, 0x0

    cmp-long v31, v22, v32

    if-eqz v31, :cond_12

    if-nez v17, :cond_11

    goto/16 :goto_6

    .line 481
    :catch_0
    move-exception v6

    .line 482
    .restart local v6    # "ex":Ljava/lang/Throwable;
    invoke-static {v6}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 483
    invoke-virtual {v13}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->dispose()V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 485
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 488
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->removeInner(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)V

    .line 489
    const/4 v10, 0x1

    .line 490
    add-int/lit8 v7, v7, 0x1

    .line 460
    .end local v6    # "ex":Ljava/lang/Throwable;
    .end local v18    # "produced":J
    :cond_1d
    :goto_9
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_5

    .line 497
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    .restart local v18    # "produced":J
    :cond_1e
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 499
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->checkTerminate()Z

    move-result v31

    if-nez v31, :cond_1

    .line 503
    const-wide/16 v32, 0x1

    sub-long v22, v22, v32

    .line 504
    const-wide/16 v32, 0x1

    add-long v18, v18, v32

    goto :goto_7

    .line 510
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_1f
    const-wide v22, 0x7fffffffffffffffL

    goto :goto_8

    .line 532
    .end local v18    # "produced":J
    .restart local v11    # "innerDone":Z
    .restart local v12    # "innerQueue":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_20
    add-int/lit8 v14, v14, 0x1

    .line 533
    move/from16 v0, v16

    if-ne v14, v0, :cond_1d

    .line 534
    const/4 v14, 0x0

    goto :goto_9
.end method

.method getInnerQueue(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)Lio/reactivex/internal/fuseable/SimpleQueue;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<TT;TU;>;)",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    iget-object v0, p1, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 270
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-nez v0, :cond_0

    .line 271
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    .line 272
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iput-object v0, p1, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 274
    :cond_0
    return-object v0
.end method

.method getMainQueue()Lio/reactivex/internal/fuseable/SimpleQueue;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 218
    .local v0, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    if-nez v0, :cond_0

    .line 219
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_1

    .line 220
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 224
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    :goto_0
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 226
    :cond_0
    return-object v0

    .line 222
    :cond_1
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    goto :goto_0
.end method

.method innerError(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;Ljava/lang/Throwable;)V
    .locals 6
    .param p2, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<TT;TU;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 594
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v4, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 595
    const/4 v4, 0x1

    iput-boolean v4, p1, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->done:Z

    .line 596
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->delayErrors:Z

    if-nez v4, :cond_0

    .line 597
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 598
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .local v1, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, v1, v2

    .line 599
    .local v0, "a":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->dispose()V

    .line 598
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 602
    .end local v0    # "a":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    .end local v1    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drain()V

    .line 606
    :goto_1
    return-void

    .line 604
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 334
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 339
    :goto_0
    return-void

    .line 337
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    .line 338
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 319
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 320
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 329
    :goto_0
    return-void

    .line 323
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    .line 325
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drain()V

    goto :goto_0

    .line 327
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->done:Z

    if-eqz v5, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v5, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "The mapper returned a null Publisher"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .local v3, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TU;>;"
    instance-of v5, v3, Ljava/util/concurrent/Callable;

    if-eqz v5, :cond_3

    .line 143
    :try_start_1
    check-cast v3, Ljava/util/concurrent/Callable;

    .end local v3    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TU;>;"
    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 151
    .local v4, "u":Ljava/lang/Object;, "TU;"
    if-eqz v4, :cond_2

    .line 152
    invoke-virtual {p0, v4}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->tryEmitScalar(Ljava/lang/Object;)V

    goto :goto_0

    .line 133
    .end local v4    # "u":Ljava/lang/Object;, "TU;"
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 135
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v5}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 136
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 144
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    .line 145
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 146
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->errs:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v5, v1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 147
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drain()V

    goto :goto_0

    .line 154
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "u":Ljava/lang/Object;, "TU;"
    :cond_2
    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    const v6, 0x7fffffff

    if-eq v5, v6, :cond_0

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    if-nez v5, :cond_0

    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarLimit:I

    if-ne v5, v6, :cond_0

    .line 156
    const/4 v5, 0x0

    iput v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    .line 157
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarLimit:I

    int-to-long v6, v6

    invoke-interface {v5, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 161
    .end local v4    # "u":Ljava/lang/Object;, "TU;"
    .restart local v3    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TU;>;"
    :cond_3
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->uniqueId:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    iput-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->uniqueId:J

    invoke-direct {v2, p0, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;J)V

    .line 162
    .local v2, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->addInner(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 163
    invoke-interface {v3, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 112
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 113
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 114
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_1

    .line 115
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method removeInner(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    const/4 v7, 0x0

    .line 187
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 188
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->CANCELLED:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    if-ne v0, v5, :cond_2

    .line 211
    :cond_1
    :goto_0
    return-void

    .line 191
    :cond_2
    array-length v4, v0

    .line 192
    .local v4, "n":I
    const/4 v3, -0x1

    .line 193
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 194
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 195
    move v3, v2

    .line 199
    :cond_3
    if-ltz v3, :cond_1

    .line 203
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 204
    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 210
    .local v1, "b":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 193
    .end local v1    # "b":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 206
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;

    .line 207
    .restart local v1    # "b":[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<**>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 343
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 345
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drain()V

    .line 347
    :cond_0
    return-void
.end method

.method tryEmit(Ljava/lang/Object;Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "value":Ljava/lang/Object;, "TU;"
    .local p2, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->get()I

    move-result v1

    if-nez v1, :cond_6

    const/4 v1, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v4}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 279
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    .line 280
    .local v2, "r":J
    iget-object v0, p2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 281
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_4

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 282
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 283
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    .line 284
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 286
    :cond_1
    const-wide/16 v4, 0x1

    invoke-virtual {p2, v4, v5}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->requestMore(J)V

    .line 296
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_9

    .line 314
    .end local v2    # "r":J
    :cond_3
    :goto_0
    return-void

    .line 288
    .restart local v2    # "r":J
    :cond_4
    if-nez v0, :cond_5

    .line 289
    invoke-virtual {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getInnerQueue(Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;)Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v0

    .line 291
    :cond_5
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 292
    new-instance v1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v4, "Inner queue full?!"

    invoke-direct {v1, v4}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 300
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    .end local v2    # "r":J
    :cond_6
    iget-object v0, p2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 301
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-nez v0, :cond_7

    .line 302
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    .line 303
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iput-object v0, p2, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$InnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 305
    :cond_7
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 306
    new-instance v1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v4, "Inner queue full?!"

    invoke-direct {v1, v4}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 309
    :cond_8
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_3

    .line 313
    :cond_9
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drainLoop()V

    goto :goto_0
.end method

.method tryEmitScalar(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber<TT;TU;>;"
    .local p1, "value":Ljava/lang/Object;, "TU;"
    const/4 v6, 0x0

    .line 230
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->get()I

    move-result v1

    if-nez v1, :cond_6

    const/4 v1, 0x1

    invoke-virtual {p0, v6, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 231
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    .line 232
    .local v2, "r":J
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 233
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_4

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 234
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 235
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    .line 236
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 238
    :cond_1
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->maxConcurrency:I

    const v4, 0x7fffffff

    if-eq v1, v4, :cond_2

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->cancelled:Z

    if-nez v1, :cond_2

    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarLimit:I

    if-ne v1, v4, :cond_2

    .line 240
    iput v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarEmitted:I

    .line 241
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->scalarLimit:I

    int-to-long v4, v4

    invoke-interface {v1, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 252
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_8

    .line 266
    .end local v2    # "r":J
    :cond_3
    :goto_0
    return-void

    .line 244
    .restart local v2    # "r":J
    :cond_4
    if-nez v0, :cond_5

    .line 245
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getMainQueue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v0

    .line 247
    :cond_5
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 248
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Scalar queue full?!"

    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 256
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    .end local v2    # "r":J
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getMainQueue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v0

    .line 257
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 258
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Scalar queue full?!"

    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 261
    :cond_7
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_3

    .line 265
    :cond_8
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap$MergeSubscriber;->drainLoop()V

    goto :goto_0
.end method
