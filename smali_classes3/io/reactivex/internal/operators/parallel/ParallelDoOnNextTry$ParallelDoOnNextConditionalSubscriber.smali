.class final Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;
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
    name = "ParallelDoOnNextConditionalSubscriber"
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
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
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
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
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
    .line 198
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 200
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    .line 201
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    .line 202
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 211
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 212
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 286
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 291
    :goto_0
    return-void

    .line 289
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    .line 290
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 276
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 277
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 282
    :goto_0
    return-void

    .line 280
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    .line 281
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

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
    .line 225
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 226
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 228
    :cond_0
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 216
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 219
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 221
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 206
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 207
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
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    .line 232
    iget-boolean v6, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->done:Z

    if-eqz v6, :cond_0

    .line 270
    :goto_0
    :pswitch_0
    return v3

    .line 235
    :cond_0
    const-wide/16 v4, 0x0

    .line 239
    .local v4, "retries":J
    :pswitch_1
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v3, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 246
    :try_start_1
    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

    const-wide/16 v8, 0x1

    add-long/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The errorHandler returned a null item"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/parallel/ParallelFailureHandling;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 254
    .local v2, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v6, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v2}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 264
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->cancel()V

    .line 265
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 247
    .end local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v1

    .line 248
    .local v1, "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 249
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->cancel()V

    .line 250
    new-instance v6, Lio/reactivex/exceptions/CompositeException;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Throwable;

    aput-object v0, v7, v3

    const/4 v8, 0x1

    aput-object v1, v7, v8

    invoke-direct {v6, v7}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v6}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 260
    .end local v1    # "exc":Ljava/lang/Throwable;
    .restart local v2    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->cancel()V

    .line 261
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelDoOnNextTry$ParallelDoOnNextConditionalSubscriber;->onComplete()V

    goto :goto_0

    .line 254
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
