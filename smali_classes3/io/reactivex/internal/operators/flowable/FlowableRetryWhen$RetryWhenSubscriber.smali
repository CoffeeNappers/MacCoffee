.class final Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;
.super Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber;
.source "FlowableRetryWhen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RetryWhenSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber",
        "<TT;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2531bbef65964705L


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/FlowableProcessor;Lorg/reactivestreams/Subscription;)V
    .locals 0
    .param p3, "receiver"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/processors/FlowableProcessor",
            "<",
            "Ljava/lang/Throwable;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "processor":Lio/reactivex/processors/FlowableProcessor;, "Lio/reactivex/processors/FlowableProcessor<Ljava/lang/Throwable;>;"
    invoke-direct {p0, p1, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/FlowableProcessor;Lorg/reactivestreams/Subscription;)V

    .line 73
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;->receiver:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 84
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;->again(Ljava/lang/Object;)V

    .line 78
    return-void
.end method
