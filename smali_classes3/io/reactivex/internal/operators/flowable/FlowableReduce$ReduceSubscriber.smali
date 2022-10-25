.class final Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;
.super Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;
.source "FlowableReduce.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReduce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReduceSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription",
        "<TT;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x40b970e193918fd6L


# instance fields
.field final reducer:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 55
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    .line 56
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    invoke-super {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->cancel()V

    .line 117
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 118
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 119
    return-void
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    sget-object v2, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v1, v2, :cond_0

    .line 112
    :goto_0
    return-void

    .line 104
    :cond_0
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 106
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->value:Ljava/lang/Object;

    .line 107
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    .line 108
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->complete(Ljava/lang/Object;)V

    goto :goto_0

    .line 110
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_0

    .line 92
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 97
    :goto_0
    return-void

    .line 95
    :cond_0
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 96
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    sget-object v3, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v2, v3, :cond_0

    .line 87
    :goto_0
    return-void

    .line 75
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->value:Ljava/lang/Object;

    .line 76
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 77
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->value:Ljava/lang/Object;

    goto :goto_0

    .line 80
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    invoke-interface {v2, v1, p1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The reducer returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->value:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 83
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 84
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 63
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduce$ReduceSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 65
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 67
    :cond_0
    return-void
.end method
