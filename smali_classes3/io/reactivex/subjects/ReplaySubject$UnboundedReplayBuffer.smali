.class final Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ReplaySubject.java"

# interfaces
.implements Lio/reactivex/subjects/ReplaySubject$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/subjects/ReplaySubject;
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
        "Lio/reactivex/subjects/ReplaySubject$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0xa2f4068c73be4b3L


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
    .line 529
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 530
    new-instance v0, Ljava/util/ArrayList;

    const-string/jumbo v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 531
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
    .line 535
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 536
    iget v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 537
    return-void
.end method

.method public addFinal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "notificationLite"    # Ljava/lang/Object;

    .prologue
    .line 541
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    iget v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 543
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->done:Z

    .line 544
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
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    const/4 v3, 0x0

    .line 549
    iget v2, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 550
    .local v2, "s":I
    if-eqz v2, :cond_3

    .line 551
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 552
    .local v0, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    add-int/lit8 v4, v2, -0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 553
    .local v1, "o":Ljava/lang/Object;
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 554
    :cond_0
    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    move-object v1, v3

    .line 561
    .end local v0    # "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v1

    .line 557
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

    .line 561
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
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 567
    iget v4, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 568
    .local v4, "s":I
    if-nez v4, :cond_1

    .line 569
    array-length v5, p1

    if-eqz v5, :cond_0

    .line 570
    aput-object v6, p1, v7

    :cond_0
    move-object v0, p1

    .line 598
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .local v0, "array":[Ljava/lang/Object;, "[TT;"
    :goto_0
    return-object v0

    .line 574
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_1
    iget-object v1, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 575
    .local v1, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    add-int/lit8 v5, v4, -0x1

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 577
    .local v3, "o":Ljava/lang/Object;
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 578
    :cond_2
    add-int/lit8 v4, v4, -0x1

    .line 579
    if-nez v4, :cond_4

    .line 580
    array-length v5, p1

    if-eqz v5, :cond_3

    .line 581
    aput-object v6, p1, v7

    :cond_3
    move-object v0, p1

    .line 583
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0

    .line 588
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_4
    array-length v5, p1

    if-ge v5, v4, :cond_5

    .line 589
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    move-object p1, v5

    check-cast p1, [Ljava/lang/Object;

    .line 591
    :cond_5
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_6

    .line 592
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, p1, v2

    .line 591
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 594
    :cond_6
    array-length v5, p1

    if-le v5, v4, :cond_7

    .line 595
    aput-object v6, p1, v4

    :cond_7
    move-object v0, p1

    .line 598
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0
.end method

.method public replay(Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/ReplaySubject$ReplayDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    .local p1, "rs":Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;, "Lio/reactivex/subjects/ReplaySubject$ReplayDisposable<TT;>;"
    const/4 v8, 0x0

    .line 604
    invoke-virtual {p1}, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->getAndIncrement()I

    move-result v7

    if-eqz v7, :cond_0

    .line 670
    :goto_0
    return-void

    .line 608
    :cond_0
    const/4 v4, 0x1

    .line 609
    .local v4, "missed":I
    iget-object v1, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    .line 610
    .local v1, "b":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v0, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->actual:Lio/reactivex/Observer;

    .line 612
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v3, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    .line 614
    .local v3, "indexObject":Ljava/lang/Integer;
    if-eqz v3, :cond_2

    .line 615
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 623
    .local v2, "index":I
    :cond_1
    :goto_1
    iget-boolean v7, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->cancelled:Z

    if-eqz v7, :cond_3

    .line 624
    iput-object v8, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    goto :goto_0

    .line 617
    .end local v2    # "index":I
    :cond_2
    const/4 v2, 0x0

    .line 618
    .restart local v2    # "index":I
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    goto :goto_1

    .line 628
    :cond_3
    iget v6, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 630
    .local v6, "s":I
    :goto_2
    if-eq v6, v2, :cond_7

    .line 632
    iget-boolean v7, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->cancelled:Z

    if-eqz v7, :cond_4

    .line 633
    iput-object v8, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    goto :goto_0

    .line 637
    :cond_4
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 639
    .local v5, "o":Ljava/lang/Object;
    iget-boolean v7, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->done:Z

    if-eqz v7, :cond_6

    .line 640
    add-int/lit8 v7, v2, 0x1

    if-ne v7, v6, :cond_6

    .line 641
    iget v6, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 642
    add-int/lit8 v7, v2, 0x1

    if-ne v7, v6, :cond_6

    .line 643
    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 644
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 648
    :goto_3
    iput-object v8, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    .line 649
    const/4 v7, 0x1

    iput-boolean v7, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->cancelled:Z

    goto :goto_0

    .line 646
    :cond_5
    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v7

    invoke-interface {v0, v7}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 655
    :cond_6
    invoke-interface {v0, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 656
    add-int/lit8 v2, v2, 0x1

    .line 657
    goto :goto_2

    .line 659
    .end local v5    # "o":Ljava/lang/Object;
    :cond_7
    iget v7, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    if-ne v2, v7, :cond_1

    .line 663
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    .line 665
    neg-int v7, v4

    invoke-virtual {p1, v7}, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->addAndGet(I)I

    move-result v4

    .line 666
    if-nez v4, :cond_1

    goto :goto_0
.end method

.method public size()I
    .locals 4

    .prologue
    .line 674
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer<TT;>;"
    iget v1, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->size:I

    .line 675
    .local v1, "s":I
    if-eqz v1, :cond_2

    .line 676
    iget-object v2, p0, Lio/reactivex/subjects/ReplaySubject$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 677
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 678
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 682
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
