.class final Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelFilterTry$BaseFilterSubscriber;
.source "ParallelFilterTry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelFilterTry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelFilterConditionalSubscriber"
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
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Predicate;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
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
    .line 199
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$BaseFilterSubscriber;-><init>(Lio/reactivex/functions/Predicate;Lio/reactivex/functions/BiFunction;)V

    .line 200
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 201
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 270
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 271
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->done:Z

    .line 272
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 274
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 260
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 261
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 266
    :goto_0
    return-void

    .line 264
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->done:Z

    .line 265
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 205
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 208
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 210
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
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 214
    iget-boolean v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->done:Z

    if-nez v8, :cond_0

    .line 215
    const-wide/16 v4, 0x0

    .line 221
    .local v4, "retries":J
    :pswitch_0
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v8, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 252
    .local v0, "b":Z
    if-eqz v0, :cond_1

    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v8, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    :goto_0
    move v7, v6

    .line 255
    .end local v0    # "b":Z
    .end local v4    # "retries":J
    :cond_0
    :goto_1
    :pswitch_1
    return v7

    .line 222
    .restart local v4    # "retries":J
    :catch_0
    move-exception v1

    .line 223
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 228
    :try_start_1
    iget-object v8, p0, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->errorHandler:Lio/reactivex/functions/BiFunction;

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

    .line 236
    .local v3, "h":Lio/reactivex/parallel/ParallelFailureHandling;
    sget-object v8, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$1;->$SwitchMap$io$reactivex$parallel$ParallelFailureHandling:[I

    invoke-virtual {v3}, Lio/reactivex/parallel/ParallelFailureHandling;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 246
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->cancel()V

    .line 247
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 229
    .end local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :catch_1
    move-exception v2

    .line 230
    .local v2, "exc":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 231
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->cancel()V

    .line 232
    new-instance v8, Lio/reactivex/exceptions/CompositeException;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Throwable;

    aput-object v1, v9, v7

    aput-object v2, v9, v6

    invoke-direct {v8, v9}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v8}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 242
    .end local v2    # "exc":Ljava/lang/Throwable;
    .restart local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    :pswitch_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->cancel()V

    .line 243
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilterTry$ParallelFilterConditionalSubscriber;->onComplete()V

    goto :goto_1

    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v3    # "h":Lio/reactivex/parallel/ParallelFailureHandling;
    .restart local v0    # "b":Z
    :cond_1
    move v6, v7

    .line 252
    goto :goto_0

    .line 236
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
