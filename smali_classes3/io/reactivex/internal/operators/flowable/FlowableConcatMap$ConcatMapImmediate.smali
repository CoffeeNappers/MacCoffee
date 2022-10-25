.class final Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;
.super Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber;
.source "FlowableConcatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableConcatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatMapImmediate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber",
        "<TT;TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6d9ede3055d54052L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;I)V
    .locals 1
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$BaseConcatMapSubscriber;-><init>(Lio/reactivex/functions/Function;I)V

    .line 191
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    .line 192
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 193
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 244
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->cancelled:Z

    if-nez v0, :cond_0

    .line 245
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->cancelled:Z

    .line 247
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->cancel()V

    .line 248
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 250
    :cond_0
    return-void
.end method

.method drain()V
    .locals 14

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 254
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v10

    if-nez v10, :cond_1

    .line 256
    :cond_0
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->cancelled:Z

    if-eqz v10, :cond_2

    .line 353
    :cond_1
    :goto_0
    return-void

    .line 260
    :cond_2
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->active:Z

    if-nez v10, :cond_8

    .line 261
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->done:Z

    .line 266
    .local v2, "d":Z
    :try_start_0
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v10}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 275
    .local v6, "v":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_3

    move v4, v8

    .line 277
    .local v4, "empty":Z
    :goto_1
    if-eqz v2, :cond_4

    if-eqz v4, :cond_4

    .line 278
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v8}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 267
    .end local v4    # "empty":Z
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v3

    .line 268
    .local v3, "e":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 269
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v8}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 270
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v8, v3}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 271
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v3    # "e":Ljava/lang/Throwable;
    .restart local v6    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    move v4, v9

    .line 275
    goto :goto_1

    .line 282
    .restart local v4    # "empty":Z
    :cond_4
    if-nez v4, :cond_8

    .line 286
    :try_start_1
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v10, v6}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string/jumbo v11, "The mapper returned a null Publisher"

    invoke-static {v10, v11}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 296
    .local v5, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    iget v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->sourceMode:I

    if-eq v10, v8, :cond_5

    .line 297
    iget v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->consumed:I

    add-int/lit8 v0, v10, 0x1

    .line 298
    .local v0, "c":I
    iget v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->limit:I

    if-ne v0, v10, :cond_6

    .line 299
    iput v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->consumed:I

    .line 300
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    int-to-long v12, v0

    invoke-interface {v10, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 307
    .end local v0    # "c":I
    :cond_5
    :goto_2
    instance-of v10, v5, Ljava/util/concurrent/Callable;

    if-eqz v10, :cond_9

    move-object v1, v5

    .line 309
    check-cast v1, Ljava/util/concurrent/Callable;

    .line 314
    .local v1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    :try_start_2
    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v7

    .line 324
    .local v7, "vr":Ljava/lang/Object;, "TR;"
    if-eqz v7, :cond_0

    .line 328
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v10}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->isUnbounded()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 329
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->get()I

    move-result v10

    if-nez v10, :cond_0

    invoke-virtual {p0, v9, v8}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->compareAndSet(II)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 330
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v10, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 331
    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->compareAndSet(II)Z

    move-result v10

    if-nez v10, :cond_0

    .line 332
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 287
    .end local v1    # "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .end local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v7    # "vr":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v3

    .line 288
    .restart local v3    # "e":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 290
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v8}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 291
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v8, v3}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 292
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 302
    .end local v3    # "e":Ljava/lang/Throwable;
    .restart local v0    # "c":I
    .restart local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_6
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->consumed:I

    goto :goto_2

    .line 315
    .end local v0    # "c":I
    .restart local v1    # "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    :catch_2
    move-exception v3

    .line 316
    .restart local v3    # "e":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 317
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v8}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 318
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v8, v3}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 319
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 338
    .end local v3    # "e":Ljava/lang/Throwable;
    .restart local v7    # "vr":Ljava/lang/Object;, "TR;"
    :cond_7
    iput-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->active:Z

    .line 339
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    new-instance v11, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$WeakScalarSubscription;

    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-direct {v11, v7, v12}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$WeakScalarSubscription;-><init>(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)V

    invoke-virtual {v10, v11}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 348
    .end local v1    # "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .end local v2    # "d":Z
    .end local v4    # "empty":Z
    .end local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    .end local v7    # "vr":Ljava/lang/Object;, "TR;"
    :cond_8
    :goto_3
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v10

    if-nez v10, :cond_0

    goto/16 :goto_0

    .line 343
    .restart local v2    # "d":Z
    .restart local v4    # "empty":Z
    .restart local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .restart local v6    # "v":Ljava/lang/Object;, "TT;"
    :cond_9
    iput-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->active:Z

    .line 344
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-interface {v5, v10}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_3
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 226
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 227
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 229
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 230
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v1}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 233
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TR;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 215
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->get()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->compareAndSet(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 217
    invoke-virtual {p0, v2, v1}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->compareAndSet(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v1}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 202
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 203
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->cancel()V

    .line 205
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 206
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v1}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 209
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 239
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->inner:Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;

    invoke-virtual {v0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapInner;->request(J)V

    .line 240
    return-void
.end method

.method subscribeActual()V
    .locals 1

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMap$ConcatMapImmediate;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 198
    return-void
.end method
