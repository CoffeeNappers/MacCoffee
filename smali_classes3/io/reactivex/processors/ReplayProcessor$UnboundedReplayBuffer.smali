.class final Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ReplayProcessor.java"

# interfaces
.implements Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/processors/ReplayProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UnboundedReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3ddb289978ca6d74L


# instance fields
.field final buffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field volatile done:Z

.field volatile size:I


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "capacityHint"    # I

    .prologue
    .line 531
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 532
    new-instance v0, Ljava/util/ArrayList;

    const-string/jumbo v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 533
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 537
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 538
    iget v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 539
    return-void
.end method

.method public addFinal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "notificationLite"    # Ljava/lang/Object;

    .prologue
    .line 543
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->lazySet(Ljava/lang/Object;)V

    .line 544
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 545
    iget v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 546
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    .line 547
    return-void
.end method

.method public getValue()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    const/4 v3, 0x0

    .line 552
    iget v2, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 553
    .local v2, "s":I
    if-eqz v2, :cond_3

    .line 554
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 555
    .local v0, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    add-int/lit8 v4, v2, -0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 556
    .local v1, "o":Ljava/lang/Object;
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 557
    :cond_0
    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    move-object v1, v3

    .line 564
    .end local v0    # "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v1

    .line 560
    .restart local v0    # "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v3, v2, -0x2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .end local v0    # "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "o":Ljava/lang/Object;
    :cond_3
    move-object v1, v3

    .line 564
    goto :goto_0
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 570
    iget v4, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 571
    .local v4, "s":I
    if-nez v4, :cond_1

    .line 572
    array-length v5, p1

    if-eqz v5, :cond_0

    .line 573
    aput-object v6, p1, v7

    :cond_0
    move-object v0, p1

    .line 601
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .local v0, "array":[Ljava/lang/Object;, "[TT;"
    :goto_0
    return-object v0

    .line 577
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_1
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 578
    .local v1, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    add-int/lit8 v5, v4, -0x1

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 580
    .local v3, "o":Ljava/lang/Object;
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 581
    :cond_2
    add-int/lit8 v4, v4, -0x1

    .line 582
    if-nez v4, :cond_4

    .line 583
    array-length v5, p1

    if-eqz v5, :cond_3

    .line 584
    aput-object v6, p1, v7

    :cond_3
    move-object v0, p1

    .line 586
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0

    .line 591
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_4
    array-length v5, p1

    if-ge v5, v4, :cond_5

    .line 592
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    move-object p1, v5

    check-cast p1, [Ljava/lang/Object;

    .line 594
    :cond_5
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_6

    .line 595
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, p1, v2

    .line 594
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 597
    :cond_6
    array-length v5, p1

    if-le v5, v4, :cond_7

    .line 598
    aput-object v6, p1, v4

    :cond_7
    move-object v0, p1

    .line 601
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0
.end method

.method public replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 607
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-virtual/range {p1 .. p1}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->getAndIncrement()I

    move-result v13

    if-eqz v13, :cond_0

    .line 689
    :goto_0
    return-void

    .line 611
    :cond_0
    const/4 v8, 0x1

    .line 612
    .local v8, "missed":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 613
    .local v3, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    move-object/from16 v0, p1

    iget-object v2, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 615
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p1

    iget-object v7, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    .line 617
    .local v7, "indexObject":Ljava/lang/Integer;
    if-eqz v7, :cond_2

    .line 618
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 626
    .local v6, "index":I
    :cond_1
    :goto_1
    move-object/from16 v0, p1

    iget-boolean v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v13, :cond_3

    .line 627
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    goto :goto_0

    .line 620
    .end local v6    # "index":I
    :cond_2
    const/4 v6, 0x0

    .line 621
    .restart local v6    # "index":I
    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    move-object/from16 v0, p1

    iput-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    goto :goto_1

    .line 631
    :cond_3
    move-object/from16 v0, p0

    iget v12, v0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 632
    .local v12, "s":I
    move-object/from16 v0, p1

    iget-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    .line 633
    .local v10, "r":J
    const-wide/16 v4, 0x0

    .line 635
    .local v4, "e":J
    :goto_2
    if-eq v12, v6, :cond_7

    .line 637
    move-object/from16 v0, p1

    iget-boolean v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v13, :cond_4

    .line 638
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    goto :goto_0

    .line 642
    :cond_4
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 644
    .local v9, "o":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    if-eqz v13, :cond_6

    .line 645
    add-int/lit8 v13, v6, 0x1

    if-ne v13, v12, :cond_6

    .line 646
    move-object/from16 v0, p0

    iget v12, v0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 647
    add-int/lit8 v13, v6, 0x1

    if-ne v13, v12, :cond_6

    .line 648
    invoke-static {v9}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 649
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 653
    :goto_3
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    .line 654
    const/4 v13, 0x1

    move-object/from16 v0, p1

    iput-boolean v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    goto :goto_0

    .line 651
    :cond_5
    invoke-static {v9}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v2, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 660
    :cond_6
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-nez v13, :cond_a

    .line 661
    move-object/from16 v0, p1

    iget-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    add-long v10, v14, v4

    .line 662
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-nez v13, :cond_a

    .line 673
    .end local v9    # "o":Ljava/lang/Object;
    :cond_7
    const-wide/16 v14, 0x0

    cmp-long v13, v4, v14

    if-eqz v13, :cond_8

    .line 674
    move-object/from16 v0, p1

    iget-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    const-wide v16, 0x7fffffffffffffffL

    cmp-long v13, v14, v16

    if-eqz v13, :cond_8

    .line 675
    move-object/from16 v0, p1

    iget-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v10

    .line 678
    :cond_8
    move-object/from16 v0, p0

    iget v13, v0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    if-eq v6, v13, :cond_9

    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-nez v13, :cond_1

    .line 682
    :cond_9
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    move-object/from16 v0, p1

    iput-object v13, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    .line 684
    neg-int v13, v8

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->addAndGet(I)I

    move-result v8

    .line 685
    if-nez v8, :cond_1

    goto/16 :goto_0

    .line 667
    .restart local v9    # "o":Ljava/lang/Object;
    :cond_a
    invoke-interface {v2, v9}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 668
    const-wide/16 v14, 0x1

    sub-long/2addr v10, v14

    .line 669
    const-wide/16 v14, 0x1

    sub-long/2addr v4, v14

    .line 670
    add-int/lit8 v6, v6, 0x1

    .line 671
    goto/16 :goto_2
.end method

.method public size()I
    .locals 4

    .prologue
    .line 693
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer<TT;>;"
    iget v1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    .line 694
    .local v1, "s":I
    if-eqz v1, :cond_2

    .line 695
    iget-object v2, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 696
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 697
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 701
    .end local v0    # "o":Ljava/lang/Object;
    .end local v1    # "s":I
    :cond_1
    :goto_0
    return v1

    .restart local v1    # "s":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
