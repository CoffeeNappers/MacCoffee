.class final Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableRetryBiPredicate.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RetryBiSubscriber"
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

.field final predicate:Lio/reactivex/functions/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiPredicate",
            "<-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field retries:I

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
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/BiPredicate;Lio/reactivex/internal/subscriptions/SubscriptionArbiter;Lorg/reactivestreams/Publisher;)V
    .locals 0
    .param p3, "sa"    # Lio/reactivex/internal/subscriptions/SubscriptionArbiter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/internal/subscriptions/SubscriptionArbiter;",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-Ljava/lang/Integer;-Ljava/lang/Throwable;>;"
    .local p4, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 55
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 56
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    .line 57
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->source:Lorg/reactivestreams/Publisher;

    .line 58
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->predicate:Lio/reactivex/functions/BiPredicate;

    .line 59
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 91
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->predicate:Lio/reactivex/functions/BiPredicate;

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->retries:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->retries:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 81
    .local v0, "b":Z
    if-nez v0, :cond_0

    .line 82
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 86
    .end local v0    # "b":Z
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 78
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->subscribeNext()V

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
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 69
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->produced(J)V

    .line 70
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 64
    return-void
.end method

.method subscribeNext()V
    .locals 2

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 98
    const/4 v0, 0x1

    .line 100
    .local v0, "missed":I
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    .end local v0    # "missed":I
    :cond_1
    :goto_0
    return-void

    .line 103
    .restart local v0    # "missed":I
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->source:Lorg/reactivestreams/Publisher;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 105
    neg-int v1, v0

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableRetryBiPredicate$RetryBiSubscriber;->addAndGet(I)I

    move-result v0

    .line 106
    if-nez v0, :cond_0

    goto :goto_0
.end method
