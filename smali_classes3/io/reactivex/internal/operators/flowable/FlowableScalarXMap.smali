.class public final Lio/reactivex/internal/operators/flowable/FlowableScalarXMap;
.super Ljava/lang/Object;
.source "FlowableScalarXMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static scalarXMap(Ljava/lang/Object;Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TU;>;>;)",
            "Lio/reactivex/Flowable",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "value":Ljava/lang/Object;, "TT;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TU;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;-><init>(Ljava/lang/Object;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public static tryScalarXMapSubscribe(Lorg/reactivestreams/Publisher;Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    .local p1, "subscriber":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    const/4 v4, 0x1

    .line 50
    instance-of v5, p0, Ljava/util/concurrent/Callable;

    if-eqz v5, :cond_3

    .line 54
    :try_start_0
    check-cast p0, Ljava/util/concurrent/Callable;

    .end local p0    # "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 61
    .local v2, "t":Ljava/lang/Object;, "TT;"
    if-nez v2, :cond_0

    .line 62
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 98
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    :goto_0
    return v4

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 57
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 69
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    :try_start_1
    invoke-interface {p2, v2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "The mapper returned a null Publisher"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 76
    .local v1, "r":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    instance-of v5, v1, Ljava/util/concurrent/Callable;

    if-eqz v5, :cond_2

    .line 80
    :try_start_2
    check-cast v1, Ljava/util/concurrent/Callable;

    .end local v1    # "r":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v3

    .line 87
    .local v3, "u":Ljava/lang/Object;, "TR;"
    if-nez v3, :cond_1

    .line 88
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 70
    .end local v3    # "u":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v0

    .line 71
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 72
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 81
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_2
    move-exception v0

    .line 82
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 83
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 91
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "u":Ljava/lang/Object;, "TR;"
    :cond_1
    new-instance v5, Lio/reactivex/internal/subscriptions/ScalarSubscription;

    invoke-direct {v5, p1, v3}, Lio/reactivex/internal/subscriptions/ScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)V

    invoke-interface {p1, v5}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0

    .line 93
    .end local v3    # "u":Ljava/lang/Object;, "TR;"
    .restart local v1    # "r":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_2
    invoke-interface {v1, p1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 98
    .end local v1    # "r":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    .restart local p0    # "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method
