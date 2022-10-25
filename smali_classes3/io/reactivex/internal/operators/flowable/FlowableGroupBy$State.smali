.class final Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "FlowableGroupBy.java"

# interfaces
.implements Lorg/reactivestreams/Publisher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableGroupBy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TT;>;",
        "Lorg/reactivestreams/Publisher",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x35762a4bbab31538L


# instance fields
.field final actual:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;>;"
        }
    .end annotation
.end field

.field final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final delayError:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field outputFused:Z

.field final parent:Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber",
            "<*TK;TT;>;"
        }
    .end annotation
.end field

.field produced:I

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method constructor <init>(ILio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;Ljava/lang/Object;Z)V
    .locals 1
    .param p1, "bufferSize"    # I
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber",
            "<*TK;TT;>;TK;Z)V"
        }
    .end annotation

    .prologue
    .line 431
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    .local p2, "parent":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<*TK;TT;>;"
    .local p3, "key":Ljava/lang/Object;, "TK;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 416
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 421
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 423
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    .line 425
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 432
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 433
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->parent:Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;

    .line 434
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->key:Ljava/lang/Object;

    .line 435
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->delayError:Z

    .line 436
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 448
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 449
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->parent:Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancel(Ljava/lang/Object;)V

    .line 451
    :cond_0
    return-void
.end method

.method checkTerminated(ZZLorg/reactivestreams/Subscriber;Z)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    .local p3, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v1, 0x1

    .line 591
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 592
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 621
    :goto_0
    return v1

    .line 596
    :cond_0
    if-eqz p1, :cond_4

    .line 597
    if-eqz p4, :cond_2

    .line 598
    if-eqz p2, :cond_4

    .line 599
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->error:Ljava/lang/Throwable;

    .line 600
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 601
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 603
    :cond_1
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 608
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->error:Ljava/lang/Throwable;

    .line 609
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 610
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 611
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 614
    :cond_3
    if-eqz p2, :cond_4

    .line 615
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 621
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 656
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 657
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 481
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 489
    :goto_0
    return-void

    .line 484
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->outputFused:Z

    if-eqz v0, :cond_1

    .line 485
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drainFused()V

    goto :goto_0

    .line 487
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drainNormal()V

    goto :goto_0
.end method

.method drainFused()V
    .locals 6

    .prologue
    .line 492
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    const/4 v3, 0x1

    .line 494
    .local v3, "missed":I
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 495
    .local v4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscriber;

    .line 498
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    if-eqz v0, :cond_5

    .line 499
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 500
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 530
    :cond_1
    :goto_1
    return-void

    .line 504
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->done:Z

    .line 506
    .local v1, "d":Z
    if-eqz v1, :cond_3

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->delayError:Z

    if-nez v5, :cond_3

    .line 507
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->error:Ljava/lang/Throwable;

    .line 508
    .local v2, "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_3

    .line 509
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 510
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 515
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_3
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 517
    if-eqz v1, :cond_5

    .line 518
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->error:Ljava/lang/Throwable;

    .line 519
    .restart local v2    # "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_4

    .line 520
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 522
    :cond_4
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 528
    .end local v1    # "d":Z
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_5
    neg-int v5, v3

    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->addAndGet(I)I

    move-result v3

    .line 529
    if-eqz v3, :cond_1

    .line 533
    if-nez v0, :cond_0

    .line 534
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    check-cast v0, Lorg/reactivestreams/Subscriber;

    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    goto :goto_0
.end method

.method drainNormal()V
    .locals 14

    .prologue
    .line 540
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    const/4 v6, 0x1

    .line 542
    .local v6, "missed":I
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 543
    .local v7, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->delayError:Z

    .line 544
    .local v2, "delayError":Z
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscriber;

    .line 546
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    if-eqz v0, :cond_7

    .line 547
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 548
    .local v8, "r":J
    const-wide/16 v4, 0x0

    .line 550
    .local v4, "e":J
    :goto_1
    cmp-long v11, v4, v8

    if-eqz v11, :cond_4

    .line 551
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->done:Z

    .line 552
    .local v1, "d":Z
    invoke-virtual {v7}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v10

    .line 553
    .local v10, "v":Ljava/lang/Object;, "TT;"
    if-nez v10, :cond_2

    const/4 v3, 0x1

    .line 555
    .local v3, "empty":Z
    :goto_2
    invoke-virtual {p0, v1, v3, v0, v2}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Z)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 588
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v4    # "e":J
    .end local v8    # "r":J
    .end local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    return-void

    .line 553
    .restart local v1    # "d":Z
    .restart local v4    # "e":J
    .restart local v8    # "r":J
    .restart local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    .line 559
    .restart local v3    # "empty":Z
    :cond_3
    if-eqz v3, :cond_8

    .line 568
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    cmp-long v11, v4, v8

    if-nez v11, :cond_5

    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->done:Z

    invoke-virtual {v7}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v12

    invoke-virtual {p0, v11, v12, v0, v2}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Z)Z

    move-result v11

    if-nez v11, :cond_1

    .line 572
    :cond_5
    const-wide/16 v12, 0x0

    cmp-long v11, v4, v12

    if-eqz v11, :cond_7

    .line 573
    const-wide v12, 0x7fffffffffffffffL

    cmp-long v11, v8, v12

    if-eqz v11, :cond_6

    .line 574
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v12, v4

    invoke-virtual {v11, v12, v13}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 576
    :cond_6
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->parent:Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;

    iget-object v11, v11, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v11, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 580
    .end local v4    # "e":J
    .end local v8    # "r":J
    :cond_7
    neg-int v11, v6

    invoke-virtual {p0, v11}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->addAndGet(I)I

    move-result v6

    .line 581
    if-eqz v6, :cond_1

    .line 584
    if-nez v0, :cond_0

    .line 585
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    check-cast v0, Lorg/reactivestreams/Subscriber;

    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    goto :goto_0

    .line 563
    .restart local v1    # "d":Z
    .restart local v3    # "empty":Z
    .restart local v4    # "e":J
    .restart local v8    # "r":J
    .restart local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_8
    invoke-interface {v0, v10}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 565
    const-wide/16 v12, 0x1

    add-long/2addr v4, v12

    .line 566
    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 651
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 476
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->done:Z

    .line 477
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drain()V

    .line 478
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 470
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->error:Ljava/lang/Throwable;

    .line 471
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->done:Z

    .line 472
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drain()V

    .line 473
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 465
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 466
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drain()V

    .line 467
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 636
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 637
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_0

    .line 638
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->produced:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->produced:I

    .line 646
    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 641
    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->produced:I

    .line 642
    .local v0, "p":I
    if-eqz v0, :cond_1

    .line 643
    const/4 v2, 0x0

    iput v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->produced:I

    .line 644
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->parent:Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;

    iget-object v2, v2, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    int-to-long v4, v0

    invoke-interface {v2, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 646
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 440
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 441
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 442
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drain()V

    .line 444
    :cond_0
    return-void
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 626
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 627
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->outputFused:Z

    .line 628
    const/4 v0, 0x2

    .line 630
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public subscribe(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 455
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State<TT;TK;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 456
    invoke-interface {p1, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 457
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 458
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$State;->drain()V

    .line 462
    :goto_0
    return-void

    .line 460
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Only one Subscriber allowed!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
