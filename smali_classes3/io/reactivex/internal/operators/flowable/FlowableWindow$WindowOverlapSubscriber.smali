.class final Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableWindow.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowOverlapSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x21b3dc811227de88L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final firstRequest:Ljava/util/concurrent/atomic/AtomicBoolean;

.field index:J

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field produced:J

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final size:J

.field final skip:J

.field final windows:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JJI)V
    .locals 2
    .param p2, "size"    # J
    .param p4, "skip"    # J
    .param p6, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;JJI)V"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 331
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 332
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->size:J

    .line 333
    iput-wide p4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->skip:J

    .line 334
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 335
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    .line 336
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 337
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->firstRequest:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 338
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 339
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 340
    iput p6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->bufferSize:I

    .line 341
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    const/4 v2, 0x1

    .line 523
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->cancelled:Z

    .line 524
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 525
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->run()V

    .line 527
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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    .local p3, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    const/4 v1, 0x1

    .line 481
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->cancelled:Z

    if-eqz v2, :cond_0

    .line 482
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 500
    :goto_0
    return v1

    .line 486
    :cond_0
    if-eqz p1, :cond_2

    .line 487
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->error:Ljava/lang/Throwable;

    .line 489
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 490
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 491
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 494
    :cond_1
    if-eqz p2, :cond_2

    .line 495
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 500
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method drain()V
    .locals 14

    .prologue
    .line 430
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v10

    if-eqz v10, :cond_1

    .line 478
    :cond_0
    :goto_0
    return-void

    .line 434
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 435
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 436
    .local v6, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Lio/reactivex/processors/UnicastProcessor<TT;>;>;"
    const/4 v5, 0x1

    .line 440
    .local v5, "missed":I
    :cond_2
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 441
    .local v8, "r":J
    const-wide/16 v2, 0x0

    .line 443
    .local v2, "e":J
    :goto_1
    cmp-long v10, v2, v8

    if-eqz v10, :cond_3

    .line 444
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    .line 446
    .local v1, "d":Z
    invoke-virtual {v6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/reactivex/processors/UnicastProcessor;

    .line 448
    .local v7, "t":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    if-nez v7, :cond_6

    const/4 v4, 0x1

    .line 450
    .local v4, "empty":Z
    :goto_2
    invoke-virtual {p0, v1, v4, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 454
    if-eqz v4, :cond_7

    .line 463
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "t":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_3
    cmp-long v10, v2, v8

    if-nez v10, :cond_4

    .line 464
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    invoke-virtual {v6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v11

    invoke-virtual {p0, v10, v11, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 469
    :cond_4
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-eqz v10, :cond_5

    const-wide v10, 0x7fffffffffffffffL

    cmp-long v10, v8, v10

    if-eqz v10, :cond_5

    .line 470
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v12, v2

    invoke-virtual {v10, v12, v13}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 473
    :cond_5
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v11, v5

    invoke-virtual {v10, v11}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v5

    .line 474
    if-nez v5, :cond_2

    goto :goto_0

    .line 448
    .restart local v1    # "d":Z
    .restart local v7    # "t":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_6
    const/4 v4, 0x0

    goto :goto_2

    .line 458
    .restart local v4    # "empty":Z
    :cond_7
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 460
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    .line 461
    goto :goto_1
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 416
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 427
    :goto_0
    return-void

    .line 420
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Processor;

    .line 421
    .local v1, "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    invoke-interface {v1}, Lorg/reactivestreams/Processor;->onComplete()V

    goto :goto_1

    .line 423
    .end local v1    # "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->clear()V

    .line 425
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    .line 426
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 399
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 400
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 412
    :goto_0
    return-void

    .line 404
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Processor;

    .line 405
    .local v1, "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    invoke-interface {v1, p1}, Lorg/reactivestreams/Processor;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 407
    .end local v1    # "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->clear()V

    .line 409
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->error:Ljava/lang/Throwable;

    .line 410
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    .line 411
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v12, 0x1

    const-wide/16 v10, 0x0

    .line 353
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->done:Z

    if-eqz v7, :cond_0

    .line 395
    :goto_0
    return-void

    .line 357
    :cond_0
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->index:J

    .line 359
    .local v0, "i":J
    cmp-long v7, v0, v10

    if-nez v7, :cond_1

    .line 360
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->cancelled:Z

    if-nez v7, :cond_1

    .line 361
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->getAndIncrement()I

    .line 363
    iget v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->bufferSize:I

    invoke-static {v7, p0}, Lio/reactivex/processors/UnicastProcessor;->create(ILjava/lang/Runnable;)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v3

    .line 365
    .local v3, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v7, v3}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 367
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v7, v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 368
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->drain()V

    .line 372
    .end local v3    # "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    :cond_1
    add-long/2addr v0, v12

    .line 374
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/reactivestreams/Processor;

    .line 375
    .local v6, "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    invoke-interface {v6, p1}, Lorg/reactivestreams/Processor;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 378
    .end local v6    # "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    :cond_2
    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->produced:J

    add-long v4, v8, v12

    .line 379
    .local v4, "p":J
    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->size:J

    cmp-long v7, v4, v8

    if-nez v7, :cond_4

    .line 380
    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->skip:J

    sub-long v8, v4, v8

    iput-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->produced:J

    .line 382
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->windows:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/reactivestreams/Processor;

    .line 383
    .restart local v6    # "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    if-eqz v6, :cond_3

    .line 384
    invoke-interface {v6}, Lorg/reactivestreams/Processor;->onComplete()V

    .line 390
    .end local v6    # "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    :cond_3
    :goto_2
    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->skip:J

    cmp-long v7, v0, v8

    if-nez v7, :cond_5

    .line 391
    iput-wide v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->index:J

    goto :goto_0

    .line 387
    :cond_4
    iput-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->produced:J

    goto :goto_2

    .line 393
    :cond_5
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->index:J

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 345
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 346
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 347
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 349
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 9
    .param p1, "n"    # J

    .prologue
    .line 505
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 506
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v4, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 508
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->firstRequest:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->firstRequest:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 509
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->skip:J

    const-wide/16 v6, 0x1

    sub-long v6, p1, v6

    invoke-static {v4, v5, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v0

    .line 510
    .local v0, "u":J
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->size:J

    invoke-static {v4, v5, v0, v1}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v2

    .line 511
    .local v2, "v":J
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 517
    .end local v2    # "v":J
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->drain()V

    .line 519
    .end local v0    # "u":J
    :cond_0
    return-void

    .line 513
    :cond_1
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->skip:J

    invoke-static {v4, v5, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v0

    .line 514
    .restart local v0    # "u":J
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 531
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 532
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowOverlapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 534
    :cond_0
    return-void
.end method
