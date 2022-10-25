.class final Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableOnBackpressureLatest.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BackpressureLatestSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x24360dbf312449bL


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

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;


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
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 53
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 54
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->cancelled:Z

    .line 96
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 98
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 102
    :cond_0
    return-void
.end method

.method checkTerminated(ZZLorg/reactivestreams/Subscriber;Ljava/util/concurrent/atomic/AtomicReference;)Z
    .locals 4
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lorg/reactivestreams/Subscriber",
            "<*>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    .local p3, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p4, "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 150
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->cancelled:Z

    if-eqz v2, :cond_0

    .line 151
    invoke-virtual {p4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 168
    :goto_0
    return v1

    .line 155
    :cond_0
    if-eqz p1, :cond_2

    .line 156
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->error:Ljava/lang/Throwable;

    .line 157
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {p4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 159
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 162
    :cond_1
    if-eqz p2, :cond_2

    .line 163
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 168
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method drain()V
    .locals 14

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 105
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->getAndIncrement()I

    move-result v11

    if-eqz v11, :cond_1

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 109
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v5, 0x1

    .line 110
    .local v5, "missed":I
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 111
    .local v7, "r":Ljava/util/concurrent/atomic/AtomicLong;
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 114
    .local v6, "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    :cond_2
    const-wide/16 v2, 0x0

    .line 116
    .local v2, "e":J
    :goto_1
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v12

    cmp-long v11, v2, v12

    if-eqz v11, :cond_3

    .line 117
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->done:Z

    .line 118
    .local v1, "d":Z
    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 119
    .local v8, "v":Ljava/lang/Object;, "TT;"
    if-nez v8, :cond_6

    move v4, v9

    .line 121
    .local v4, "empty":Z
    :goto_2
    invoke-virtual {p0, v1, v4, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 125
    if-eqz v4, :cond_7

    .line 134
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v12

    cmp-long v11, v2, v12

    if-nez v11, :cond_4

    iget-boolean v12, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->done:Z

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_8

    move v11, v9

    :goto_3
    invoke-virtual {p0, v12, v11, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 138
    :cond_4
    const-wide/16 v12, 0x0

    cmp-long v11, v2, v12

    if-eqz v11, :cond_5

    .line 139
    invoke-static {v7, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 142
    :cond_5
    neg-int v11, v5

    invoke-virtual {p0, v11}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->addAndGet(I)I

    move-result v5

    .line 143
    if-nez v5, :cond_2

    goto :goto_0

    .restart local v1    # "d":Z
    .restart local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_6
    move v4, v10

    .line 119
    goto :goto_2

    .line 129
    .restart local v4    # "empty":Z
    :cond_7
    invoke-interface {v0, v8}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 131
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    .line 132
    goto :goto_1

    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_8
    move v11, v10

    .line 134
    goto :goto_3
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->done:Z

    .line 81
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->drain()V

    .line 82
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->error:Ljava/lang/Throwable;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->done:Z

    .line 75
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->drain()V

    .line 76
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
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->drain()V

    .line 69
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 60
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 61
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 63
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 88
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureLatest$BackpressureLatestSubscriber;->drain()V

    .line 90
    :cond_0
    return-void
.end method
