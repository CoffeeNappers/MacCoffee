.class final Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelFilterTry$BaseFilterSubscriber;
.source "ParallelFilterTry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelFilterTry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelFilterSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$BaseFilterSubscriber",
        "<TT;>;"
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


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Predicate;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
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
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$BaseFilterSubscriber;-><init>(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/BiFunction;)V

    .line 111
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 112
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 185
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->done:Z

    .line 187
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 189
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 176
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 181
    :goto_0
    return-void

    .line 179
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->done:Z

    .line 180
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 119
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 121
    :cond_0
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
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 125
    iget-boolean v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->done:Z

    if-nez v8, :cond_1

    .line 126
    const-wide/16 v4, 0x0

    .line 132
    .local v4, "retries":J
    :pswitch_0
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v8, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 163
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 164
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v7, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 170
    .end local v0    # "b":Z
    .end local v4    # "retries":J
    :goto_0
    return v6

    .line 133
    .restart local v4    # "retries":J
    :catch_0
    move-exception v1

    .line 134
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 139
    :try_start_1
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    const-wide/16 v10, 0x1

    add-long/2addr v4, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    const-string/jumbo v9, "The errorHandler returned a null item"

    invoke-static {v8, v9}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/parallel/ParallelFailureHandling;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    .local v3, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v8, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v3}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->cancel()V

    .line 158
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->onError(Ljava/lang/Throwable;)V

    move v6, v7

    .line 159
    goto :goto_0

    .line 140
    .end local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v2

    .line 141
    .local v2, "exc":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 142
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->cancel()V

    .line 143
    new-instance v8, Lio/reactivex/exceptions/CompositeException;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Throwable;

    aput-object v1, v9, v7

    aput-object v2, v9, v6

    invoke-direct {v8, v9}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v8}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->onError(Ljava/lang/Throwable;)V

    move v6, v7

    .line 144
    goto :goto_0

    .end local v2    # "exc":Ljava/lang/Throwable;
    .restart local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_1
    move v6, v7

    .line 151
    goto :goto_0

    .line 153
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->cancel()V

    .line 154
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterSubscriber;->onComplete()V

    move v6, v7

    .line 155
    goto :goto_0

    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    .restart local v0    # "b":Z
    :cond_0
    move v6, v7

    .line 167
    goto :goto_0

    .end local v0    # "b":Z
    .end local v4    # "retries":J
    :cond_1
    move v6, v7

    .line 170
    goto :goto_0

    .line 147
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
