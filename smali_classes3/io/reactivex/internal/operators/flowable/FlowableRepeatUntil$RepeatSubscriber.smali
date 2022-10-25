.class final Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableRepeatUntil.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil;
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

.field final sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

.field final source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final stop:Lio/reactivex/functions/BooleanSupplier;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/BooleanSupplier;Lio/reactivex/internal/subscriptions/SubscriptionArbiter;Lorg/reactivestreams/Publisher;)V
    .locals 0
    .param p2, "until"    # Lio/reactivex/functions/BooleanSupplier;
    .param p3, "sa"    # Lio/reactivex/internal/subscriptions/SubscriptionArbiter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/BooleanSupplier;",
            "Lio/reactivex/internal/subscriptions/SubscriptionArbiter;",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p4, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 51
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 52
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    .line 53
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->source:Lorg/reactivestreams/Publisher;

    .line 54
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->stop:Lio/reactivex/functions/BooleanSupplier;

    .line 55
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->stop:Lio/reactivex/functions/BooleanSupplier;

    invoke-interface {v2}, Lio/reactivex/functions/BooleanSupplier;->getAsBoolean()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 82
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 83
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 87
    .end local v0    # "b":Z
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 79
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->subscribeNext()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 70
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 65
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->produced(J)V

    .line 66
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->sa:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 60
    return-void
.end method

.method subscribeNext()V
    .locals 2

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 94
    const/4 v0, 0x1

    .line 96
    .local v0, "missed":I
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->source:Lorg/reactivestreams/Publisher;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 98
    neg-int v1, v0

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableRepeatUntil$RepeatSubscriber;->addAndGet(I)I

    move-result v0

    .line 99
    if-nez v0, :cond_0

    .line 104
    .end local v0    # "missed":I
    :cond_1
    return-void
.end method
