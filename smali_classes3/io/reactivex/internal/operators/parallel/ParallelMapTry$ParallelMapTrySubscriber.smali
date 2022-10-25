.class final Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;
.super Ljava/lang/Object;
.source "ParallelMapTry.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ConditionalSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelMapTry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelMapTrySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field done:Z

.field final errorHandler:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Throwable;",
            "Lio/reactivex/parallel/ParallelFailureHandling;",
            ">;"
        }
    .end annotation
.end field

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Throwable;",
            "Lio/reactivex/parallel/ParallelFailureHandling;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 91
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 92
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    .line 93
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 103
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    .line 184
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 170
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 171
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 176
    :goto_0
    return-void

    .line 174
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    .line 175
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    if-nez v0, :cond_0

    .line 117
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 119
    :cond_0
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 110
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 112
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 98
    return-void
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 123
    iget-boolean v8, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->done:Z

    if-eqz v8, :cond_0

    .line 164
    :goto_0
    :pswitch_0
    return v6

    .line 126
    :cond_0
    const-wide/16 v4, 0x0

    .line 132
    .local v4, "retries":J
    :pswitch_1
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v8, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    const-string/jumbo v9, "The mapper returned a null value"

    invoke-static {v8, v9}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 163
    .local v3, "v":Ljava/lang/Object;, "TR;"
    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v6, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    move v6, v7

    .line 164
    goto :goto_0

    .line 133
    .end local v3    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v0

    .line 134
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 139
    :try_start_1
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    const-wide/16 v10, 0x1

    add-long/2addr v4, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9, v0}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    const-string/jumbo v9, "The errorHandler returned a null item"

    invoke-static {v8, v9}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/parallel/ParallelFailureHandling;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    .local v2, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v8, Lio/reactivex/internal/operators/parallel/ParallelMapTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v2}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->cancel()V

    .line 158
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 140
    .end local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v1

    .line 141
    .local v1, "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 142
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->cancel()V

    .line 143
    new-instance v8, Lio/reactivex/exceptions/CompositeException;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Throwable;

    aput-object v0, v9, v6

    aput-object v1, v9, v7

    invoke-direct {v8, v9}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v8}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 153
    .end local v1    # "exc":Ljava/lang/Throwable;
    .restart local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->cancel()V

    .line 154
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;->onComplete()V

    goto :goto_0

    .line 147
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
