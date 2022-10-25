.class final Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;
.super Ljava/util/ArrayList;
.source "FlowableReplay.java"

# interfaces
.implements Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReplay;
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
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x62057d556fa2a2d8L


# instance fields
.field volatile size:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "capacityHint"    # I

    .prologue
    .line 645
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 646
    return-void
.end method


# virtual methods
.method public complete()V
    .locals 1

    .prologue
    .line 661
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 662
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    .line 663
    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 655
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 656
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    .line 657
    return-void
.end method

.method public next(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 649
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 650
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    .line 651
    return-void
.end method

.method public replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 667
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer<TT;>;"
    .local p1, "output":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    monitor-enter p1

    .line 668
    :try_start_0
    iget-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    if-eqz v12, :cond_1

    .line 669
    const/4 v12, 0x1

    iput-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    .line 670
    monitor-exit p1

    .line 720
    :cond_0
    :goto_0
    return-void

    .line 672
    :cond_1
    const/4 v12, 0x1

    iput-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    .line 673
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 674
    iget-object v0, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->child:Lorg/reactivestreams/Subscriber;

    .line 677
    .local v0, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :goto_1
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->isDisposed()Z

    move-result v12

    if-nez v12, :cond_0

    .line 680
    iget v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->size:I

    .line 682
    .local v7, "sourceIndex":I
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 683
    .local v2, "destinationIndexObject":Ljava/lang/Integer;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 685
    .local v1, "destinationIndex":I
    :goto_2
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->get()J

    move-result-wide v8

    .line 686
    .local v8, "r":J
    move-wide v10, v8

    .line 687
    .local v10, "r0":J
    const-wide/16 v4, 0x0

    .line 689
    .local v4, "e":J
    :goto_3
    const-wide/16 v12, 0x0

    cmp-long v12, v8, v12

    if-eqz v12, :cond_3

    if-ge v1, v7, :cond_3

    .line 690
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 692
    .local v6, "o":Ljava/lang/Object;
    :try_start_1
    invoke-static {v6, v0}, Lio/reactivex/internal/util/NotificationLite;->accept(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result v12

    if-nez v12, :cond_0

    .line 703
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->isDisposed()Z

    move-result v12

    if-nez v12, :cond_0

    .line 706
    add-int/lit8 v1, v1, 0x1

    .line 707
    const-wide/16 v12, 0x1

    sub-long/2addr v8, v12

    .line 708
    const-wide/16 v12, 0x1

    add-long/2addr v4, v12

    .line 709
    goto :goto_3

    .line 673
    .end local v0    # "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v1    # "destinationIndex":I
    .end local v2    # "destinationIndexObject":Ljava/lang/Integer;
    .end local v4    # "e":J
    .end local v6    # "o":Ljava/lang/Object;
    .end local v7    # "sourceIndex":I
    .end local v8    # "r":J
    .end local v10    # "r0":J
    :catchall_0
    move-exception v12

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v12

    .line 683
    .restart local v0    # "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .restart local v2    # "destinationIndexObject":Ljava/lang/Integer;
    .restart local v7    # "sourceIndex":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    .line 695
    .restart local v1    # "destinationIndex":I
    .restart local v4    # "e":J
    .restart local v6    # "o":Ljava/lang/Object;
    .restart local v8    # "r":J
    .restart local v10    # "r0":J
    :catch_0
    move-exception v3

    .line 696
    .local v3, "err":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 697
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->dispose()V

    .line 698
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 699
    invoke-interface {v0, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 710
    .end local v3    # "err":Ljava/lang/Throwable;
    .end local v6    # "o":Ljava/lang/Object;
    :cond_3
    const-wide/16 v12, 0x0

    cmp-long v12, v4, v12

    if-eqz v12, :cond_4

    .line 711
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    iput-object v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index:Ljava/lang/Object;

    .line 712
    const-wide v12, 0x7fffffffffffffffL

    cmp-long v12, v10, v12

    if-eqz v12, :cond_4

    .line 713
    invoke-virtual {p1, v4, v5}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->produced(J)J

    .line 717
    :cond_4
    monitor-enter p1

    .line 718
    :try_start_3
    iget-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    if-nez v12, :cond_5

    .line 719
    const/4 v12, 0x0

    iput-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    .line 720
    monitor-exit p1

    goto :goto_0

    .line 723
    :catchall_1
    move-exception v12

    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v12

    .line 722
    :cond_5
    const/4 v12, 0x0

    :try_start_4
    iput-boolean v12, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    .line 723
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto/16 :goto_1
.end method
