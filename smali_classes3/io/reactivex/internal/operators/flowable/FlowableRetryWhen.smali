.class public final Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableRetryWhen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final handler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lorg/reactivestreams/Publisher",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lorg/reactivestreams/Publisher",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable<Ljava/lang/Throwable;>;+Lorg/reactivestreams/Publisher<*>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 33
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;->handler:Lio/reactivex/functions/Function;

    .line 34
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v5, Lio/reactivex/subscribers/SerializedSubscriber;

    invoke-direct {v5, p1}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 40
    .local v5, "z":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    const/16 v6, 0x8

    invoke-static {v6}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v6

    invoke-virtual {v6}, Lio/reactivex/processors/UnicastProcessor;->toSerialized()Lio/reactivex/processors/FlowableProcessor;

    move-result-object v1

    .line 45
    .local v1, "processor":Lio/reactivex/processors/FlowableProcessor;, "Lio/reactivex/processors/FlowableProcessor<Ljava/lang/Throwable;>;"
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;->handler:Lio/reactivex/functions/Function;

    invoke-interface {v6, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "handler returned a null Publisher"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .local v4, "when":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<*>;"
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen;->source:Lio/reactivex/Flowable;

    invoke-direct {v2, v6}, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;-><init>(Lorg/reactivestreams/Publisher;)V

    .line 54
    .local v2, "receiver":Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver<TT;Ljava/lang/Throwable;>;"
    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;

    invoke-direct {v3, v5, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/FlowableProcessor;Lorg/reactivestreams/Subscription;)V

    .line 56
    .local v3, "subscriber":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber<TT;>;"
    iput-object v3, v2, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;->subscriber:Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber;

    .line 58
    invoke-interface {p1, v3}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 60
    invoke-interface {v4, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 62
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;->onNext(Ljava/lang/Object;)V

    .line 63
    .end local v2    # "receiver":Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenReceiver<TT;Ljava/lang/Throwable;>;"
    .end local v3    # "subscriber":Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRetryWhen$RetryWhenSubscriber<TT;>;"
    .end local v4    # "when":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<*>;"
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 48
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
