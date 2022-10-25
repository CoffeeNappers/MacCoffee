.class final Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;
.super Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;
.source "ParallelReduceFull.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelReduceFull;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelReduceFullMainSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4a8674a85e439ebdL


# instance fields
.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final error:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final reducer:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;"
        }
    .end annotation
.end field

.field final remaining:Ljava/util/concurrent/atomic/AtomicInteger;

.field final subscribers:[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/functions/BiFunction;)V
    .locals 3
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber<TT;>;"
    .local p1, "subscriber":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 62
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 64
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 71
    new-array v0, p2, [Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;

    .line 72
    .local v0, "a":[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;, "[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber<TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 73
    new-instance v2, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;

    invoke-direct {v2, p0, p3}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;-><init>(Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;Lio/reactivex/functions/BiFunction;)V

    aput-object v2, v0, v1

    .line 72
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 75
    :cond_0
    iput-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;

    .line 76
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    .line 77
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 78
    return-void
.end method


# virtual methods
.method addValue(Ljava/lang/Object;)Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v2, 0x0

    .line 82
    :cond_0
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;

    .line 84
    .local v1, "curr":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    if-nez v1, :cond_1

    .line 85
    new-instance v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;

    .end local v1    # "curr":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    invoke-direct {v1}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;-><init>()V

    .line 86
    .restart local v1    # "curr":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 91
    :cond_1
    invoke-virtual {v1}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->tryAcquireSlot()I

    move-result v0

    .line 92
    .local v0, "c":I
    if-gez v0, :cond_2

    .line 93
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 96
    :cond_2
    if-nez v0, :cond_3

    .line 97
    iput-object p1, v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->first:Ljava/lang/Object;

    .line 102
    :goto_1
    invoke-virtual {v1}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->releaseSlot()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 103
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .end local v1    # "curr":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    :goto_2
    return-object v1

    .line 99
    .restart local v1    # "curr":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    :cond_3
    iput-object p1, v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->second:Ljava/lang/Object;

    goto :goto_1

    :cond_4
    move-object v1, v2

    .line 106
    goto :goto_2
.end method

.method public cancel()V
    .locals 4

    .prologue
    .line 112
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;

    .local v0, "arr$":[Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 113
    .local v2, "inner":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;->cancel()V

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 115
    .end local v2    # "inner":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullInnerSubscriber<TT;>;"
    :cond_0
    return-void
.end method

.method innerComplete(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    if-eqz p1, :cond_1

    .line 131
    :goto_0
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->addValue(Ljava/lang/Object;)Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;

    move-result-object v1

    .line 133
    .local v1, "sp":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    if-eqz v1, :cond_1

    .line 136
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    iget-object v3, v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->first:Ljava/lang/Object;

    iget-object v4, v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->second:Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The reducer returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    goto :goto_0

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 139
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->innerError(Ljava/lang/Throwable;)V

    .line 159
    .end local v0    # "ex":Ljava/lang/Throwable;
    .end local v1    # "sp":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    :cond_0
    :goto_1
    return-void

    .line 149
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v2

    if-nez v2, :cond_0

    .line 150
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;

    .line 151
    .restart local v1    # "sp":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair<TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 153
    if-eqz v1, :cond_2

    .line 154
    iget-object v2, v1, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$SlotPair;->first:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->complete(Ljava/lang/Object;)V

    goto :goto_1

    .line 156
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1
.end method

.method innerError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 118
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->error:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 119
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->cancel()V

    .line 120
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelReduceFull$ParallelReduceFullMainSubscriber;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 123
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
