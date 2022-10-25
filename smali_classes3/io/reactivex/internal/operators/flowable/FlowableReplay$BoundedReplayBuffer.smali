.class Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableReplay.java"

# interfaces
.implements Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BoundedReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;",
        ">;",
        "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2090aef8efde5e9eL


# instance fields
.field index:J

.field size:I

.field tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    .line 758
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 759
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;-><init>(Ljava/lang/Object;J)V

    .line 760
    .local v0, "n":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 761
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->set(Ljava/lang/Object;)V

    .line 762
    return-void
.end method


# virtual methods
.method final addLast(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V
    .locals 1
    .param p1, "n"    # Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .prologue
    .line 769
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->set(Ljava/lang/Object;)V

    .line 770
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 771
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    .line 772
    return-void
.end method

.method final collect(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 935
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    .local p1, "output":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->getHead()Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    move-result-object v0

    .line 937
    .local v0, "n":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 938
    .local v1, "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    if-eqz v1, :cond_0

    .line 939
    iget-object v2, v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    .line 940
    .local v2, "o":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 941
    .local v3, "v":Ljava/lang/Object;
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 950
    .end local v2    # "o":Ljava/lang/Object;
    .end local v3    # "v":Ljava/lang/Object;
    :cond_0
    return-void

    .line 944
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v3    # "v":Ljava/lang/Object;
    :cond_1
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 945
    move-object v0, v1

    .line 949
    goto :goto_0
.end method

.method public final complete()V
    .locals 6

    .prologue
    .line 823
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->enterTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 824
    .local v1, "o":Ljava/lang/Object;
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;-><init>(Ljava/lang/Object;J)V

    .line 825
    .local v0, "n":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->addLast(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 826
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->truncateFinal()V

    .line 827
    return-void
.end method

.method enterTransform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 909
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    return-object p1
.end method

.method public final error(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 815
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->enterTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 816
    .local v1, "o":Ljava/lang/Object;
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;-><init>(Ljava/lang/Object;J)V

    .line 817
    .local v0, "n":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->addLast(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 818
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->truncateFinal()V

    .line 819
    return-void
.end method

.method getHead()Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    .locals 1

    .prologue
    .line 959
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    return-object v0
.end method

.method hasCompleted()Z
    .locals 1

    .prologue
    .line 955
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasError()Z
    .locals 1

    .prologue
    .line 952
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->tail:Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 918
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    return-object p1
.end method

.method public final next(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 807
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->enterTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 808
    .local v1, "o":Ljava/lang/Object;
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->index:J

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;-><init>(Ljava/lang/Object;J)V

    .line 809
    .local v0, "n":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->addLast(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 810
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->truncate()V

    .line 811
    return-void
.end method

.method final removeFirst()V
    .locals 4

    .prologue
    .line 777
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 778
    .local v0, "head":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 779
    .local v1, "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    if-nez v1, :cond_0

    .line 780
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Empty list!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 782
    :cond_0
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    .line 785
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->setFirst(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 786
    return-void
.end method

.method final removeSome(I)V
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 788
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 789
    .local v0, "head":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :goto_0
    if-lez p1, :cond_0

    .line 790
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "head":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 791
    .restart local v0    # "head":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    add-int/lit8 p1, p1, -0x1

    .line 792
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->size:I

    goto :goto_0

    .line 795
    :cond_0
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->setFirst(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 796
    return-void
.end method

.method public final replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 831
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    .local p1, "output":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    monitor-enter p1

    .line 832
    :try_start_0
    iget-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    if-eqz v9, :cond_1

    .line 833
    const/4 v9, 0x1

    iput-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    .line 834
    monitor-exit p1

    .line 894
    :cond_0
    :goto_0
    return-void

    .line 836
    :cond_1
    const/4 v9, 0x1

    iput-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    .line 837
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 839
    :goto_1
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->isDisposed()Z

    move-result v9

    if-nez v9, :cond_0

    .line 843
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->get()J

    move-result-wide v6

    .line 844
    .local v6, "r":J
    const-wide v10, 0x7fffffffffffffffL

    cmp-long v9, v6, v10

    if-nez v9, :cond_3

    const/4 v5, 0x1

    .line 845
    .local v5, "unbounded":Z
    :goto_2
    const-wide/16 v0, 0x0

    .line 847
    .local v0, "e":J
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 848
    .local v3, "node":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    if-nez v3, :cond_2

    .line 849
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->getHead()Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    move-result-object v3

    .line 850
    iput-object v3, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index:Ljava/lang/Object;

    .line 852
    iget-object v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    iget-wide v10, v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->index:J

    invoke-static {v9, v10, v11}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 855
    :cond_2
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-eqz v9, :cond_5

    .line 856
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 857
    .local v8, "v":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    if-eqz v8, :cond_5

    .line 858
    iget-object v9, v8, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    invoke-virtual {p0, v9}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 860
    .local v4, "o":Ljava/lang/Object;
    :try_start_1
    iget-object v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->child:Lorg/reactivestreams/Subscriber;

    invoke-static {v4, v9}, Lio/reactivex/internal/util/NotificationLite;->accept(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 861
    const/4 v9, 0x0

    iput-object v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 864
    :catch_0
    move-exception v2

    .line 865
    .local v2, "err":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 866
    const/4 v9, 0x0

    iput-object v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index:Ljava/lang/Object;

    .line 867
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->dispose()V

    .line 868
    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 869
    iget-object v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->child:Lorg/reactivestreams/Subscriber;

    invoke-interface {v9, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 837
    .end local v0    # "e":J
    .end local v2    # "err":Ljava/lang/Throwable;
    .end local v3    # "node":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    .end local v4    # "o":Ljava/lang/Object;
    .end local v5    # "unbounded":Z
    .end local v6    # "r":J
    .end local v8    # "v":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :catchall_0
    move-exception v9

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v9

    .line 844
    .restart local v6    # "r":J
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .line 873
    .restart local v0    # "e":J
    .restart local v3    # "node":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    .restart local v4    # "o":Ljava/lang/Object;
    .restart local v5    # "unbounded":Z
    .restart local v8    # "v":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :cond_4
    const-wide/16 v10, 0x1

    add-long/2addr v0, v10

    .line 874
    const-wide/16 v10, 0x1

    sub-long/2addr v6, v10

    .line 875
    move-object v3, v8

    .line 879
    invoke-virtual {p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->isDisposed()Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_0

    .line 884
    .end local v4    # "o":Ljava/lang/Object;
    .end local v8    # "v":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :cond_5
    const-wide/16 v10, 0x0

    cmp-long v9, v0, v10

    if-eqz v9, :cond_6

    .line 885
    iput-object v3, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->index:Ljava/lang/Object;

    .line 886
    if-nez v5, :cond_6

    .line 887
    invoke-virtual {p1, v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->produced(J)J

    .line 891
    :cond_6
    monitor-enter p1

    .line 892
    :try_start_3
    iget-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    if-nez v9, :cond_7

    .line 893
    const/4 v9, 0x0

    iput-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->emitting:Z

    .line 894
    monitor-exit p1

    goto/16 :goto_0

    .line 897
    :catchall_1
    move-exception v9

    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v9

    .line 896
    :cond_7
    const/4 v9, 0x0

    :try_start_4
    iput-boolean v9, p1, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->missed:Z

    .line 897
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto/16 :goto_1
.end method

.method final setFirst(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V
    .locals 0
    .param p1, "n"    # Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .prologue
    .line 802
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;->set(Ljava/lang/Object;)V

    .line 803
    return-void
.end method

.method truncate()V
    .locals 0

    .prologue
    .line 926
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    return-void
.end method

.method truncateFinal()V
    .locals 0

    .prologue
    .line 933
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer<TT;>;"
    return-void
.end method
