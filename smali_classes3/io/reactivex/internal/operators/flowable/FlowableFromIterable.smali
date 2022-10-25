.class public final Lio/reactivex/internal/operators/flowable/FlowableFromIterable;
.super Lio/reactivex/Flowable;
.source "FlowableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;,
        Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;,
        Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final source:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable<TT;>;"
    .local p1, "source":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 33
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable;->source:Ljava/lang/Iterable;

    .line 34
    return-void
.end method

.method public static subscribe(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :try_start_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 60
    .local v1, "hasNext":Z
    if-nez v1, :cond_0

    .line 61
    invoke-static {p0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 71
    .end local v1    # "hasNext":Z
    :goto_0
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 56
    invoke-static {v0, p0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 65
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "hasNext":Z
    :cond_0
    instance-of v2, p0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    if-eqz v2, :cond_1

    .line 66
    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;

    move-object v2, p0

    check-cast v2, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-direct {v3, v2, p1}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Ljava/util/Iterator;)V

    invoke-interface {p0, v3}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0

    .line 69
    :cond_1
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;

    invoke-direct {v2, p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;-><init>(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V

    invoke-interface {p0, v2}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable;->source:Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 47
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-static {p1, v1}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable;->subscribe(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V

    .line 48
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :goto_0
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 43
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
