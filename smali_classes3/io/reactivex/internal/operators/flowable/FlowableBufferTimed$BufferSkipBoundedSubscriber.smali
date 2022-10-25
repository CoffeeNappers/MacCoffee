.class final Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableBufferTimed.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableBufferTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferSkipBoundedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber$RemoveFromBuffer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U::",
        "Ljava/util/Collection",
        "<-TT;>;>",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;TU;TU;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field final bufferSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TU;>;"
        }
    .end annotation
.end field

.field final buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TU;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field final timeskip:J

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field final w:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/concurrent/Callable;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;)V
    .locals 1
    .param p3, "timespan"    # J
    .param p5, "timeskip"    # J
    .param p7, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p8, "w"    # Lio/reactivex/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 248
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 249
    iput-wide p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timespan:J

    .line 250
    iput-wide p5, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timeskip:J

    .line 251
    iput-object p7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 252
    iput-object p8, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    .line 253
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    .line 254
    return-void
.end method

.method static synthetic access$000(Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p0, "x0"    # Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 232
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->fastPathOrderedEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Lorg/reactivestreams/Subscriber;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 232
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;TU;)Z"
        }
    .end annotation

    .prologue
    .line 366
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    invoke-interface {p1, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 367
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 327
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->clear()V

    .line 328
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 329
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 330
    return-void
.end method

.method clear()V
    .locals 1

    .prologue
    .line 333
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    monitor-enter p0

    .line 334
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 335
    monitor-exit p0

    .line 336
    return-void

    .line 335
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onComplete()V
    .locals 7

    .prologue
    .line 306
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    monitor-enter p0

    .line 307
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 308
    .local v1, "bs":Ljava/util/List;, "Ljava/util/List<TU;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 309
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 312
    .local v0, "b":Ljava/util/Collection;, "TU;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v3, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 309
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v1    # "bs":Ljava/util/List;, "Ljava/util/List<TU;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 314
    .restart local v1    # "bs":Ljava/util/List;, "Ljava/util/List<TU;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->done:Z

    .line 315
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->enter()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 316
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v5, 0x0

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-static {v3, v4, v5, v6, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V

    .line 318
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 297
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->done:Z

    .line 298
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 299
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->clear()V

    .line 300
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 301
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 289
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 290
    .local v0, "b":Ljava/util/Collection;, "TU;"
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 292
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 293
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 9
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 258
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 284
    :goto_0
    return-void

    .line 261
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 266
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "The supplied buffer is null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    .local v7, "b":Ljava/util/Collection;, "TU;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 279
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 281
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timeskip:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timeskip:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 283
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber$RemoveFromBuffer;

    invoke-direct {v1, p0, v7}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber$RemoveFromBuffer;-><init>(Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;Ljava/util/Collection;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timespan:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 267
    .end local v7    # "b":Ljava/util/Collection;, "TU;"
    :catch_0
    move-exception v8

    .line 268
    .local v8, "e":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 269
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 270
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 271
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-static {v8, v0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 322
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->requested(J)V

    .line 323
    return-void
.end method

.method public run()V
    .locals 7

    .prologue
    .line 340
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber<TT;TU;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->cancelled:Z

    if-eqz v2, :cond_0

    .line 362
    :goto_0
    return-void

    .line 346
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The supplied buffer is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    .local v0, "b":Ljava/util/Collection;, "TU;"
    monitor-enter p0

    .line 355
    :try_start_1
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->cancelled:Z

    if-eqz v2, :cond_1

    .line 356
    monitor-exit p0

    goto :goto_0

    .line 359
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 347
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catch_0
    move-exception v1

    .line 348
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 349
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->cancel()V

    .line 350
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 358
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Ljava/util/Collection;, "TU;"
    :cond_1
    :try_start_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->buffers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 361
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->w:Lio/reactivex/Scheduler$Worker;

    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber$RemoveFromBuffer;

    invoke-direct {v3, p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber$RemoveFromBuffer;-><init>(Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;Ljava/util/Collection;)V

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferTimed$BufferSkipBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5, v6}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method
