.class final Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;
.super Ljava/lang/Object;
.source "ParallelDoOnNextTry.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ConditionalSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelDoOnNextSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
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
            "<-TT;>;"
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

.field final onNext:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
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
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 90
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    .line 91
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    .line 92
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 102
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 182
    :goto_0
    return-void

    .line 180
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->done:Z

    .line 181
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 168
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 173
    :goto_0
    return-void

    .line 171
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->done:Z

    .line 172
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

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
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 118
    :cond_0
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 109
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 111
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 97
    return-void
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 122
    iget-boolean v7, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->done:Z

    if-eqz v7, :cond_0

    .line 161
    :goto_0
    :pswitch_0
    return v3

    .line 125
    :cond_0
    const-wide/16 v4, 0x0

    .line 129
    .local v4, "retries":J
    :pswitch_1
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v7, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    move v3, v6

    .line 161
    goto :goto_0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 136
    :try_start_1
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    const-wide/16 v8, 0x1

    add-long/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v7, v8, v0}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The errorHandler returned a null item"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/parallel/ParallelFailureHandling;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 144
    .local v2, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v7, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v2}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 154
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->cancel()V

    .line 155
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 137
    .end local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v1

    .line 138
    .local v1, "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 139
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->cancel()V

    .line 140
    new-instance v7, Lio/reactivex/exceptions/CompositeException;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Throwable;

    aput-object v0, v8, v3

    aput-object v1, v8, v6

    invoke-direct {v7, v8}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v7}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 150
    .end local v1    # "exc":Ljava/lang/Throwable;
    .restart local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->cancel()V

    .line 151
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextSubscriber;->onComplete()V

    goto :goto_0

    .line 144
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
