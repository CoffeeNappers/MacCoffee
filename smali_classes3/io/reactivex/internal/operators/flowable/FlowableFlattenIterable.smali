.class public final Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableFlattenIterable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable$FlattenIterableSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;TR;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final prefetch:I


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Lio/reactivex/functions/Function;I)V
    .locals 0
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;, "Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable<TT;TR;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 41
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->mapper:Lio/reactivex/functions/Function;

    .line 42
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->prefetch:I

    .line 43
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;, "Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->source:Lio/reactivex/Flowable;

    instance-of v4, v4, Ljava/util/concurrent/Callable;

    if-eqz v4, :cond_1

    .line 52
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->source:Lio/reactivex/Flowable;

    check-cast v4, Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 59
    .local v3, "v":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_0

    .line 60
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 81
    .end local v3    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 55
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 67
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v4, v3}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .line 69
    .local v2, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TR;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 76
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    invoke-static {p1, v1}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable;->subscribe(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V

    goto :goto_0

    .line 70
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    .end local v2    # "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TR;>;"
    :catch_1
    move-exception v0

    .line 71
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 72
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 80
    .end local v0    # "ex":Ljava/lang/Throwable;
    .end local v3    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->source:Lio/reactivex/Flowable;

    new-instance v5, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable$FlattenIterableSubscriber;

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->mapper:Lio/reactivex/functions/Function;

    iget v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable;->prefetch:I

    invoke-direct {v5, p1, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableFlattenIterable$FlattenIterableSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;I)V

    invoke-virtual {v4, v5}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    goto :goto_0
.end method
