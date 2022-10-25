.class final Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;
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
    name = "ParallelMapTryConditionalSubscriber"
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
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
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
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
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
    .line 201
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 203
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 204
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    .line 205
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 214
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 215
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 291
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 296
    :goto_0
    return-void

    .line 294
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    .line 295
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 281
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 282
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 287
    :goto_0
    return-void

    .line 285
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    .line 286
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

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
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 229
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 231
    :cond_0
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 219
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 222
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 224
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 209
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 210
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
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v6, 0x0

    .line 235
    iget-boolean v7, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->done:Z

    if-eqz v7, :cond_0

    .line 275
    :goto_0
    :pswitch_0
    return v6

    .line 238
    :cond_0
    const-wide/16 v4, 0x0

    .line 244
    .local v4, "retries":J
    :pswitch_1
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v7, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The mapper returned a null value"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 275
    .local v3, "v":Ljava/lang/Object;, "TR;"
    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v6, v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_0

    .line 245
    .end local v3    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v0

    .line 246
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 251
    :try_start_1
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

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

    .line 259
    .local v2, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v7, Lio/reactivex/internal/operators/parallel/ParallelMapTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v2}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 269
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->cancel()V

    .line 270
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 252
    .end local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v1

    .line 253
    .local v1, "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 254
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->cancel()V

    .line 255
    new-instance v7, Lio/reactivex/exceptions/CompositeException;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Throwable;

    aput-object v0, v8, v6

    const/4 v9, 0x1

    aput-object v1, v8, v9

    invoke-direct {v7, v8}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v7}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 265
    .end local v1    # "exc":Ljava/lang/Throwable;
    .restart local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->cancel()V

    .line 266
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;->onComplete()V

    goto :goto_0

    .line 259
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
