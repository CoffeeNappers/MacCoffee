.class public final Lio/reactivex/internal/operators/flowable/FlowableAmb;
.super Lio/reactivex/Flowable;
.source "FlowableAmb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbInnerSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;
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
.field final sources:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lorg/reactivestreams/Publisher;Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAmb;, "Lio/reactivex/internal/operators/flowable/FlowableAmb<TT;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 30
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableAmb;->sources:[Lorg/reactivestreams/Publisher;

    .line 31
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableAmb;->sourcesIterable:Ljava/lang/Iterable;

    .line 32
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAmb;, "Lio/reactivex/internal/operators/flowable/FlowableAmb<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v10, 0x0

    .line 37
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableAmb;->sources:[Lorg/reactivestreams/Publisher;

    .line 38
    .local v7, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    const/4 v2, 0x0

    .line 39
    .local v2, "count":I
    if-nez v7, :cond_3

    .line 40
    const/16 v8, 0x8

    new-array v7, v8, [Lorg/reactivestreams/Publisher;

    .line 42
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableAmb;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    move v3, v2

    .end local v2    # "count":I
    .local v3, "count":I
    :goto_0
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/reactivestreams/Publisher;

    .line 43
    .local v6, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    if-nez v6, :cond_0

    .line 44
    new-instance v8, Ljava/lang/NullPointerException;

    const-string/jumbo v9, "One of the sources is null"

    invoke-direct {v8, v9}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v8, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    move v2, v3

    .line 74
    .end local v3    # "count":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    .restart local v2    # "count":I
    :goto_1
    return-void

    .line 47
    .end local v2    # "count":I
    .restart local v3    # "count":I
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_0
    array-length v8, v7

    if-ne v3, v8, :cond_1

    .line 48
    shr-int/lit8 v8, v3, 0x2

    add-int/2addr v8, v3

    new-array v1, v8, [Lorg/reactivestreams/Publisher;

    .line 49
    .local v1, "b":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v8, v1, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 50
    move-object v7, v1

    .line 52
    .end local v1    # "b":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_1
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "count":I
    .restart local v2    # "count":I
    :try_start_2
    aput-object v6, v7, v3
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v3, v2

    .line 53
    .end local v2    # "count":I
    .restart local v3    # "count":I
    goto :goto_0

    .end local v6    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_2
    move v2, v3

    .line 63
    .end local v3    # "count":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .restart local v2    # "count":I
    :goto_2
    if-nez v2, :cond_4

    .line 64
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    goto :goto_1

    .line 54
    :catch_0
    move-exception v4

    .line 55
    .local v4, "e":Ljava/lang/Throwable;
    :goto_3
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 56
    invoke-static {v4, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_1

    .line 60
    .end local v4    # "e":Ljava/lang/Throwable;
    :cond_3
    array-length v2, v7

    goto :goto_2

    .line 67
    :cond_4
    const/4 v8, 0x1

    if-ne v2, v8, :cond_5

    .line 68
    aget-object v8, v7, v10

    invoke-interface {v8, p1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_1

    .line 72
    :cond_5
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;

    invoke-direct {v0, p1, v2}, Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;-><init>(Lorg/reactivestreams/Subscriber;I)V

    .line 73
    .local v0, "ac":Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator<TT;>;"
    invoke-virtual {v0, v7}, Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;->subscribe([Lorg/reactivestreams/Publisher;)V

    goto :goto_1

    .line 54
    .end local v0    # "ac":Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableAmb$AmbCoordinator<TT;>;"
    .end local v2    # "count":I
    .restart local v3    # "count":I
    .restart local v5    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v4

    move v2, v3

    .end local v3    # "count":I
    .restart local v2    # "count":I
    goto :goto_3
.end method
