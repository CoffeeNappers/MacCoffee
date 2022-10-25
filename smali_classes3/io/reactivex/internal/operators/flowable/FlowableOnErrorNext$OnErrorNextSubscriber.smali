.class final Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;
.super Ljava/lang/Object;
.source "FlowableOnErrorNext.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OnErrorNextSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final allowFatal:Z

.field final arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

.field done:Z

.field final nextSupplier:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;"
        }
    .end annotation
.end field

.field once:Z


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Z)V
    .locals 1
    .param p3, "allowFatal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;Z)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "nextSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+Lorg/reactivestreams/Publisher<+TT;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 54
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->nextSupplier:Lio/reactivex/functions/Function;

    .line 55
    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->allowFatal:Z

    .line 56
    new-instance v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-direct {v0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    .line 57
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber<TT;>;"
    const/4 v1, 0x1

    .line 114
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 120
    :goto_0
    return-void

    .line 117
    :cond_0
    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    .line 118
    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    .line 119
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber<TT;>;"
    const/4 v7, 0x1

    .line 77
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    if-eqz v3, :cond_1

    .line 78
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 79
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 110
    :goto_0
    return-void

    .line 82
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    :cond_1
    iput-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    .line 87
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->allowFatal:Z

    if-eqz v3, :cond_2

    instance-of v3, p1, Ljava/lang/Exception;

    if-nez v3, :cond_2

    .line 88
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 95
    :cond_2
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->nextSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .local v2, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    if-nez v2, :cond_3

    .line 103
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Publisher is null"

    invoke-direct {v1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 104
    .local v1, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v1, p1}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 105
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 96
    .end local v1    # "npe":Ljava/lang/NullPointerException;
    .end local v2    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 98
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    aput-object v0, v5, v7

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 109
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v2    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_3
    invoke-interface {v2, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

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
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v0, :cond_1

    .line 73
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 70
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->produced(J)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 62
    return-void
.end method
