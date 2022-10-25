.class public final Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableWithLatestFromMany.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$SingletonArrayFunc;,
        Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestInnerSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;
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
.field final combiner:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "TR;>;"
        }
    .end annotation
.end field

.field final otherArray:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<*>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field final otherIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<*>;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Ljava/lang/Iterable;Lio/reactivex/functions/Function;)V
    .locals 1
    .param p1    # Lio/reactivex/Flowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Iterable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p3    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<*>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "TR;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;, "Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany<TT;TR;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "otherIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/reactivestreams/Publisher<*>;>;"
    .local p3, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;TR;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherArray:[Lorg/reactivestreams/Publisher;

    .line 56
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherIterable:Ljava/lang/Iterable;

    .line 57
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->combiner:Lio/reactivex/functions/Function;

    .line 58
    return-void
.end method

.method public constructor <init>(Lio/reactivex/Flowable;[Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Function;)V
    .locals 1
    .param p1    # Lio/reactivex/Flowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # [Lorg/reactivestreams/Publisher;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;[",
            "Lorg/reactivestreams/Publisher",
            "<*>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "TR;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;, "Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany<TT;TR;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "otherArray":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<*>;"
    .local p3, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;TR;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 48
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherArray:[Lorg/reactivestreams/Publisher;

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherIterable:Ljava/lang/Iterable;

    .line 50
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->combiner:Lio/reactivex/functions/Function;

    .line 51
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;, "Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherArray:[Lorg/reactivestreams/Publisher;

    .line 63
    .local v5, "others":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<*>;"
    const/4 v3, 0x0

    .line 64
    .local v3, "n":I
    if-nez v5, :cond_2

    .line 65
    const/16 v8, 0x8

    new-array v5, v8, [Lorg/reactivestreams/Publisher;

    .line 68
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->otherIterable:Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    move v4, v3

    .end local v3    # "n":I
    .local v4, "n":I
    :goto_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/reactivestreams/Publisher;

    .line 69
    .local v6, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<*>;"
    array-length v8, v5

    if-ne v4, v8, :cond_0

    .line 70
    shr-int/lit8 v8, v4, 0x1

    add-int/2addr v8, v4

    invoke-static {v5, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, [Lorg/reactivestreams/Publisher;

    move-object v5, v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    :cond_0
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "n":I
    .restart local v3    # "n":I
    :try_start_2
    aput-object v6, v5, v4
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v4, v3

    .line 73
    .end local v3    # "n":I
    .restart local v4    # "n":I
    goto :goto_0

    .end local v6    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<*>;"
    :cond_1
    move v3, v4

    .line 84
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "n":I
    .restart local v3    # "n":I
    :goto_1
    if-nez v3, :cond_3

    .line 85
    new-instance v8, Lio/reactivex/internal/operators/flowable/FlowableMap;

    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->source:Lio/reactivex/Flowable;

    new-instance v10, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$SingletonArrayFunc;

    invoke-direct {v10, p0}, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$SingletonArrayFunc;-><init>(Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;)V

    invoke-direct {v8, v9, v10}, Lio/reactivex/internal/operators/flowable/FlowableMap;-><init>(Lio/reactivex/Flowable;Lio/reactivex/functions/Function;)V

    invoke-virtual {v8, p1}, Lio/reactivex/internal/operators/flowable/FlowableMap;->subscribeActual(Lorg/reactivestreams/Subscriber;)V

    .line 94
    :goto_2
    return-void

    .line 74
    :catch_0
    move-exception v1

    .line 75
    .local v1, "ex":Ljava/lang/Throwable;
    :goto_3
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 76
    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_2

    .line 81
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_2
    array-length v3, v5

    goto :goto_1

    .line 89
    :cond_3
    new-instance v7, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;

    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->combiner:Lio/reactivex/functions/Function;

    invoke-direct {v7, p1, v8, v3}, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;I)V

    .line 90
    .local v7, "parent":Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber<TT;TR;>;"
    invoke-interface {p1, v7}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 91
    invoke-virtual {v7, v5, v3}, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;->subscribe([Lorg/reactivestreams/Publisher;I)V

    .line 93
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany;->source:Lio/reactivex/Flowable;

    invoke-virtual {v8, v7}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    goto :goto_2

    .line 74
    .end local v3    # "n":I
    .end local v7    # "parent":Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWithLatestFromMany$WithLatestFromSubscriber<TT;TR;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "n":I
    :catch_1
    move-exception v1

    move v3, v4

    .end local v4    # "n":I
    .restart local v3    # "n":I
    goto :goto_3
.end method
