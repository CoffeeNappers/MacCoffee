.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;
.super Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
.source "FlowableCreate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LatestAsyncEmitter"
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
.field private static final serialVersionUID:J = 0x37d61f4a35bdda6fL


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final queue:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 572
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 573
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 574
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 575
    return-void
.end method


# virtual methods
.method drain()V
    .locals 14

    .prologue
    .line 624
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v9

    if-eqz v9, :cond_0

    .line 697
    :goto_0
    return-void

    .line 628
    :cond_0
    const/4 v6, 0x1

    .line 629
    .local v6, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->actual:Lorg/reactivestreams/Subscriber;

    .line 630
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 633
    .local v8, "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->get()J

    move-result-wide v10

    .line 634
    .local v10, "r":J
    const-wide/16 v2, 0x0

    .line 636
    .local v2, "e":J
    :goto_1
    cmp-long v9, v2, v10

    if-eqz v9, :cond_6

    .line 637
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 638
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 642
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 644
    .local v1, "d":Z
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 646
    .local v7, "o":Ljava/lang/Object;, "TT;"
    if-nez v7, :cond_3

    const/4 v4, 0x1

    .line 648
    .local v4, "empty":Z
    :goto_2
    if-eqz v1, :cond_5

    if-eqz v4, :cond_5

    .line 649
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 650
    .local v5, "ex":Ljava/lang/Throwable;
    if-eqz v5, :cond_4

    .line 651
    invoke-super {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 646
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_3
    const/4 v4, 0x0

    goto :goto_2

    .line 653
    .restart local v4    # "empty":Z
    .restart local v5    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-super {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onComplete()V

    goto :goto_0

    .line 658
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_5
    if-eqz v4, :cond_7

    .line 667
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_6
    cmp-long v9, v2, v10

    if-nez v9, :cond_b

    .line 668
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 669
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 662
    .restart local v1    # "d":Z
    .restart local v4    # "empty":Z
    .restart local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 664
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    .line 665
    goto :goto_1

    .line 673
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_8
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 675
    .restart local v1    # "d":Z
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_9

    const/4 v4, 0x1

    .line 677
    .restart local v4    # "empty":Z
    :goto_3
    if-eqz v1, :cond_b

    if-eqz v4, :cond_b

    .line 678
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 679
    .restart local v5    # "ex":Ljava/lang/Throwable;
    if-eqz v5, :cond_a

    .line 680
    invoke-super {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 675
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_9
    const/4 v4, 0x0

    goto :goto_3

    .line 682
    .restart local v4    # "empty":Z
    .restart local v5    # "ex":Ljava/lang/Throwable;
    :cond_a
    invoke-super {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onComplete()V

    goto :goto_0

    .line 688
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_b
    const-wide/16 v12, 0x0

    cmp-long v9, v2, v12

    if-eqz v9, :cond_c

    .line 689
    invoke-static {p0, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 692
    :cond_c
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v12, v6

    invoke-virtual {v9, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v6

    .line 693
    if-nez v6, :cond_1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 607
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 608
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 609
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 593
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 594
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 603
    :goto_0
    return-void

    .line 597
    :cond_1
    if-nez p1, :cond_2

    .line 598
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 600
    :cond_2
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 601
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 602
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

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
    .line 579
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 589
    :cond_0
    :goto_0
    return-void

    .line 583
    :cond_1
    if-nez p1, :cond_2

    .line 584
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 587
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 588
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    goto :goto_0
.end method

.method onRequested()V
    .locals 0

    .prologue
    .line 613
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 614
    return-void
.end method

.method onUnsubscribed()V
    .locals 2

    .prologue
    .line 618
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 619
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 621
    :cond_0
    return-void
.end method
