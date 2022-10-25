.class final Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableRetryPredicate.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepeatSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x628271a96862fff0L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final predicate:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field remaining:J

.field final sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

.field final source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JLio/reactivex/functions/Predicate;Lio/reactivex/internal/subscriptions/SubscriptionArbiter;Lorg/reactivestreams/Publisher;)V
    .locals 0
    .param p2, "count"    # J
    .param p5, "sa"    # Lio/reactivex/internal/subscriptions/SubscriptionArbiter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;J",
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/internal/subscriptions/SubscriptionArbiter;",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p4, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-Ljava/lang/Throwable;>;"
    .local p6, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 58
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    .line 59
    iput-object p6, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->source:Lorg/reactivestreams/Publisher;

    .line 60
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    .line 61
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->remaining:J

    .line 62
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 102
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->remaining:J

    .line 77
    .local v2, "r":J
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    .line 78
    const-wide/16 v4, 0x1

    sub-long v4, v2, v4

    iput-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->remaining:J

    .line 80
    :cond_0
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_1

    .line 81
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 97
    :goto_0
    return-void

    .line 85
    :cond_1
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v4, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 91
    .local v0, "b":Z
    if-nez v0, :cond_2

    .line 92
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 86
    .end local v0    # "b":Z
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 88
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v5, Lio/reactivex/exceptions/CompositeException;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Throwable;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object v1, v6, v7

    invoke-direct {v5, v6}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v4, v5}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 95
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->subscribeNext()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 72
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->produced(J)V

    .line 73
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 67
    return-void
.end method

.method subscribeNext()V
    .locals 2

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 109
    const/4 v0, 0x1

    .line 111
    .local v0, "missed":I
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 122
    .end local v0    # "missed":I
    :cond_1
    :goto_0
    return-void

    .line 114
    .restart local v0    # "missed":I
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->source:Lorg/reactivestreams/Publisher;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 116
    neg-int v1, v0

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableRetryPredicate$RepeatSubscriber;->addAndGet(I)I

    move-result v0

    .line 117
    if-nez v0, :cond_0

    goto :goto_0
.end method
