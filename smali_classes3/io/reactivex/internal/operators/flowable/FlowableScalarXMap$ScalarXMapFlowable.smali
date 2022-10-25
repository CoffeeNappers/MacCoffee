.class final Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;
.super Lio/reactivex/Flowable;
.source "FlowableScalarXMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableScalarXMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScalarXMapFlowable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;, "Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 129
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;->value:Ljava/lang/Object;

    .line 130
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;->mapper:Lio/reactivex/functions/Function;

    .line 131
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;, "Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;->mapper:Lio/reactivex/functions/Function;

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap$ScalarXMapFlowable;->value:Ljava/lang/Object;

    invoke-interface {v4, v5}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The mapper returned a null Publisher"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .local v2, "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    instance-of v4, v2, Ljava/util/concurrent/Callable;

    if-eqz v4, :cond_1

    .line 147
    :try_start_1
    check-cast v2, Ljava/util/concurrent/Callable;

    .end local v2    # "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 154
    .local v3, "u":Ljava/lang/Object;, "TR;"
    if-nez v3, :cond_0

    .line 155
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 162
    .end local v3    # "u":Ljava/lang/Object;, "TR;"
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 148
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    .line 149
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 150
    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 158
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "u":Ljava/lang/Object;, "TR;"
    :cond_0
    new-instance v4, Lio/reactivex/internal/subscriptions/ScalarSubscription;

    invoke-direct {v4, p1, v3}, Lio/reactivex/internal/subscriptions/ScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)V

    invoke-interface {p1, v4}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0

    .line 160
    .end local v3    # "u":Ljava/lang/Object;, "TR;"
    .restart local v2    # "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_1
    invoke-interface {v2, p1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
