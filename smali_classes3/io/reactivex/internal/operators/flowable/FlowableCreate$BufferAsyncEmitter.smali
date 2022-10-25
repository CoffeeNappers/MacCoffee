.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;
.super Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
.source "FlowableCreate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferAsyncEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x21aef8f9f7f1cbc3L


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;I)V
    .locals 1
    .param p2, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 429
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 430
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 431
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 432
    return-void
.end method


# virtual methods
.method drain()V
    .locals 14

    .prologue
    .line 483
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v9

    if-eqz v9, :cond_0

    .line 556
    :goto_0
    return-void

    .line 487
    :cond_0
    const/4 v6, 0x1

    .line 488
    .local v6, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->actual:Lorg/reactivestreams/Subscriber;

    .line 489
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 492
    .local v8, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->get()J

    move-result-wide v10

    .line 493
    .local v10, "r":J
    const-wide/16 v2, 0x0

    .line 495
    .local v2, "e":J
    :goto_1
    cmp-long v9, v2, v10

    if-eqz v9, :cond_6

    .line 496
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 497
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 501
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 503
    .local v1, "d":Z
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    .line 505
    .local v7, "o":Ljava/lang/Object;, "TT;"
    if-nez v7, :cond_3

    const/4 v4, 0x1

    .line 507
    .local v4, "empty":Z
    :goto_2
    if-eqz v1, :cond_5

    if-eqz v4, :cond_5

    .line 508
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 509
    .local v5, "ex":Ljava/lang/Throwable;
    if-eqz v5, :cond_4

    .line 510
    invoke-super {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 505
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_3
    const/4 v4, 0x0

    goto :goto_2

    .line 512
    .restart local v4    # "empty":Z
    .restart local v5    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-super {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onComplete()V

    goto :goto_0

    .line 517
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_5
    if-eqz v4, :cond_7

    .line 526
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_6
    cmp-long v9, v2, v10

    if-nez v9, :cond_a

    .line 527
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 528
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 521
    .restart local v1    # "d":Z
    .restart local v4    # "empty":Z
    .restart local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 523
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    .line 524
    goto :goto_1

    .line 532
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_8
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 534
    .restart local v1    # "d":Z
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v4

    .line 536
    .restart local v4    # "empty":Z
    if-eqz v1, :cond_a

    if-eqz v4, :cond_a

    .line 537
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 538
    .restart local v5    # "ex":Ljava/lang/Throwable;
    if-eqz v5, :cond_9

    .line 539
    invoke-super {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 541
    :cond_9
    invoke-super {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onComplete()V

    goto :goto_0

    .line 547
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_a
    const-wide/16 v12, 0x0

    cmp-long v9, v2, v12

    if-eqz v9, :cond_b

    .line 548
    invoke-static {p0, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 551
    :cond_b
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v12, v6

    invoke-virtual {v9, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v6

    .line 552
    if-nez v6, :cond_1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 466
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 467
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 468
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 450
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 451
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 462
    :goto_0
    return-void

    .line 455
    :cond_1
    if-nez p1, :cond_2

    .line 456
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 459
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_2
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 460
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 461
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 436
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 446
    :cond_0
    :goto_0
    return-void

    .line 440
    :cond_1
    if-nez p1, :cond_2

    .line 441
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 444
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 445
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    goto :goto_0
.end method

.method onRequested()V
    .locals 0

    .prologue
    .line 472
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 473
    return-void
.end method

.method onUnsubscribed()V
    .locals 1

    .prologue
    .line 477
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 478
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 480
    :cond_0
    return-void
.end method
