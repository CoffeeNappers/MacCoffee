.class public final Lio/reactivex/internal/operators/flowable/FlowableUsing;
.super Lio/reactivex/Flowable;
.source "FlowableUsing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "D:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final disposer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;"
        }
    .end annotation
.end field

.field final eager:Z

.field final resourceSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+TD;>;"
        }
    .end annotation
.end field

.field final sourceSupplier:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;Z)V
    .locals 0
    .param p4, "eager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+TD;>;",
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;Z)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing;, "Lio/reactivex/internal/operators/flowable/FlowableUsing<TT;TD;>;"
    .local p1, "resourceSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TD;>;"
    .local p2, "sourceSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TD;+Lorg/reactivestreams/Publisher<+TT;>;>;"
    .local p3, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 37
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    .line 38
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    .line 39
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->disposer:Lio/reactivex/functions/Consumer;

    .line 40
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->eager:Z

    .line 41
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
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing;, "Lio/reactivex/internal/operators/flowable/FlowableUsing<TT;TD;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v5}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 57
    .local v2, "resource":Ljava/lang/Object;, "TD;"
    :try_start_1
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v5, v2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 71
    .local v3, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->disposer:Lio/reactivex/functions/Consumer;

    iget-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->eager:Z

    invoke-direct {v4, p1, v2, v5, v6}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;Lio/reactivex/functions/Consumer;Z)V

    .line 73
    .local v4, "us":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    invoke-interface {v3, v4}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 74
    .end local v2    # "resource":Ljava/lang/Object;, "TD;"
    .end local v3    # "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    .end local v4    # "us":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 51
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 58
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v2    # "resource":Ljava/lang/Object;, "TD;"
    :catch_1
    move-exception v0

    .line 59
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 61
    :try_start_2
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing;->disposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v5, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 67
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 62
    :catch_2
    move-exception v1

    .line 63
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 64
    new-instance v5, Lio/reactivex/exceptions/CompositeException;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Throwable;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v7, 0x1

    aput-object v1, v6, v7

    invoke-direct {v5, v6}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v5, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
