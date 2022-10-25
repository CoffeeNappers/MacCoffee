.class final Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "BehaviorProcessor.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/processors/BehaviorProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BehaviorSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2db3b5785ea03c8eL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field emitting:Z

.field fastPath:Z

.field index:J

.field next:Z

.field queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final state:Lio/reactivex/processors/BehaviorProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/BehaviorProcessor",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/BehaviorProcessor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/processors/BehaviorProcessor",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 446
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "state":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 447
    iput-object p1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 448
    iput-object p2, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->state:Lio/reactivex/processors/BehaviorProcessor;

    .line 449
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 460
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-nez v0, :cond_0

    .line 461
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    .line 463
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->state:Lio/reactivex/processors/BehaviorProcessor;

    invoke-virtual {v0, p0}, Lio/reactivex/processors/BehaviorProcessor;->remove(Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;)V

    .line 465
    :cond_0
    return-void
.end method

.method emitFirst()V
    .locals 6

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    const/4 v3, 0x1

    .line 468
    iget-boolean v4, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v4, :cond_1

    .line 499
    :cond_0
    :goto_0
    return-void

    .line 472
    :cond_1
    monitor-enter p0

    .line 473
    :try_start_0
    iget-boolean v4, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v4, :cond_2

    .line 474
    monitor-exit p0

    goto :goto_0

    .line 490
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 476
    :cond_2
    :try_start_1
    iget-boolean v4, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->next:Z

    if-eqz v4, :cond_3

    .line 477
    monitor-exit p0

    goto :goto_0

    .line 480
    :cond_3
    iget-object v2, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->state:Lio/reactivex/processors/BehaviorProcessor;

    .line 482
    .local v2, "s":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, v2, Lio/reactivex/processors/BehaviorProcessor;->readLock:Ljava/util/concurrent/locks/Lock;

    .line 483
    .local v1, "readLock":Ljava/util/concurrent/locks/Lock;
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 484
    iget-wide v4, v2, Lio/reactivex/processors/BehaviorProcessor;->index:J

    iput-wide v4, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->index:J

    .line 485
    iget-object v4, v2, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 486
    .local v0, "o":Ljava/lang/Object;
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 488
    if-eqz v0, :cond_4

    :goto_1
    iput-boolean v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitting:Z

    .line 489
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->next:Z

    .line 490
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 492
    if-eqz v0, :cond_0

    .line 493
    invoke-virtual {p0, v0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->test(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 497
    invoke-virtual {p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitLoop()V

    goto :goto_0

    .line 488
    :cond_4
    const/4 v3, 0x0

    goto :goto_1
.end method

.method emitLoop()V
    .locals 2

    .prologue
    .line 560
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    :goto_0
    iget-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v1, :cond_0

    .line 568
    :goto_1
    return-void

    .line 564
    :cond_0
    monitor-enter p0

    .line 565
    :try_start_0
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 566
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_1

    .line 567
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitting:Z

    .line 568
    monitor-exit p0

    goto :goto_1

    .line 571
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 570
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_1
    const/4 v1, 0x0

    :try_start_1
    iput-object v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 571
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 573
    invoke-virtual {v0, p0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->forEachWhile(Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate;)V

    goto :goto_0
.end method

.method emitNext(Ljava/lang/Object;J)V
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "stateIndex"    # J

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    const/4 v4, 0x1

    .line 502
    iget-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v1, :cond_0

    .line 528
    :goto_0
    return-void

    .line 505
    :cond_0
    iget-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->fastPath:Z

    if-nez v1, :cond_5

    .line 506
    monitor-enter p0

    .line 507
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v1, :cond_1

    .line 508
    monitor-exit p0

    goto :goto_0

    .line 523
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 510
    :cond_1
    :try_start_1
    iget-wide v2, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->index:J

    cmp-long v1, v2, p2

    if-nez v1, :cond_2

    .line 511
    monitor-exit p0

    goto :goto_0

    .line 513
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitting:Z

    if-eqz v1, :cond_4

    .line 514
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 515
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_3

    .line 516
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 517
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 519
    :cond_3
    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 520
    monitor-exit p0

    goto :goto_0

    .line 522
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->next:Z

    .line 523
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 524
    iput-boolean v4, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->fastPath:Z

    .line 527
    :cond_5
    invoke-virtual {p0, p1}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->test(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public isFull()Z
    .locals 4

    .prologue
    .line 578
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 453
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 454
    invoke-static {p0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 456
    :cond_0
    return-void
.end method

.method public test(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    const/4 v2, 0x1

    .line 532
    iget-boolean v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v3, :cond_0

    .line 555
    :goto_0
    return v2

    .line 536
    :cond_0
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 537
    iget-object v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 540
    :cond_1
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 541
    iget-object v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 545
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->get()J

    move-result-wide v0

    .line 546
    .local v0, "r":J
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-eqz v3, :cond_4

    .line 547
    iget-object v2, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 548
    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v0, v2

    if-eqz v2, :cond_3

    .line 549
    invoke-virtual {p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->decrementAndGet()J

    .line 551
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 553
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancel()V

    .line 554
    iget-object v3, p0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v4, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v5, "Could not deliver value due to lack of requests"

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
