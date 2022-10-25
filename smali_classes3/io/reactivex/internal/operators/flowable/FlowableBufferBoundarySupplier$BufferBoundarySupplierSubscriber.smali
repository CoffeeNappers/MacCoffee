.class final Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableBufferBoundarySupplier.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferBoundarySupplierSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U::",
        "Ljava/util/Collection",
        "<-TT;>;B:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;TU;TU;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final boundarySupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<TB;>;>;"
        }
    .end annotation
.end field

.field buffer:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TU;"
        }
    .end annotation
.end field

.field final bufferSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TU;>;"
        }
    .end annotation
.end field

.field final other:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/concurrent/Callable;Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<TB;>;>;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    .local p3, "boundarySupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lorg/reactivestreams/Publisher<TB;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 58
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    .line 65
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 66
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->boundarySupplier:Ljava/util/concurrent/Callable;

    .line 67
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Lorg/reactivestreams/Subscriber;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z

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
    .line 232
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 233
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 158
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    .line 159
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 160
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->disposeOther()V

    .line 162
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 166
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 221
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 222
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->disposeOther()V

    .line 223
    return-void
.end method

.method disposeOther()V
    .locals 1

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 170
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 227
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method next()V
    .locals 9

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v7}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The buffer supplied is null"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .local v5, "next":Ljava/util/Collection;, "TU;"
    :try_start_1
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->boundarySupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v7}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The boundary publisher supplied is null"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 197
    .local v1, "boundary":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TB;>;"
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;

    invoke-direct {v2, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;)V

    .line 199
    .local v2, "bs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber<TT;TU;TB;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lio/reactivex/disposables/Disposable;

    .line 201
    .local v6, "o":Lio/reactivex/disposables/Disposable;
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7, v6, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 217
    .end local v1    # "boundary":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TB;>;"
    .end local v2    # "bs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber<TT;TU;TB;>;"
    .end local v5    # "next":Ljava/util/Collection;, "TU;"
    .end local v6    # "o":Lio/reactivex/disposables/Disposable;
    :goto_0
    return-void

    .line 178
    :catch_0
    move-exception v3

    .line 179
    .local v3, "e":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 180
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancel()V

    .line 181
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v7, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 189
    .end local v3    # "e":Ljava/lang/Throwable;
    .restart local v5    # "next":Ljava/util/Collection;, "TU;"
    :catch_1
    move-exception v4

    .line 190
    .local v4, "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 191
    const/4 v7, 0x1

    iput-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    .line 192
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v7}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 193
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v7, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 206
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "boundary":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TB;>;"
    .restart local v2    # "bs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber<TT;TU;TB;>;"
    .restart local v6    # "o":Lio/reactivex/disposables/Disposable;
    :cond_0
    monitor-enter p0

    .line 207
    :try_start_2
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 208
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_1

    .line 209
    monitor-exit p0

    goto :goto_0

    .line 212
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v7

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .line 211
    .restart local v0    # "b":Ljava/util/Collection;, "TU;"
    :cond_1
    :try_start_3
    iput-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 212
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 214
    invoke-interface {v1, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 216
    const/4 v7, 0x0

    invoke-virtual {p0, v0, v7, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->fastPathEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    monitor-enter p0

    .line 137
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 138
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_1

    .line 139
    monitor-exit p0

    .line 148
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 142
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v1, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 144
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->done:Z

    .line 145
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->enter()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, p0, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V

    goto :goto_0

    .line 142
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancel()V

    .line 130
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 131
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 119
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 120
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_0

    .line 121
    monitor-exit p0

    .line 125
    :goto_0
    return-void

    .line 123
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 124
    monitor-exit p0

    goto :goto_0

    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 9
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    const/4 v8, 0x1

    .line 71
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v6, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 76
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 81
    .local v0, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v6}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The buffer supplied is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .local v1, "b":Ljava/util/Collection;, "TU;"
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->buffer:Ljava/util/Collection;

    .line 95
    :try_start_1
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->boundarySupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v6}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The boundary publisher supplied is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 104
    .local v2, "boundary":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TB;>;"
    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;

    invoke-direct {v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;)V

    .line 105
    .local v3, "bs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber<TT;TU;TB;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->other:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 107
    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 109
    iget-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    if-nez v6, :cond_0

    .line 110
    const-wide v6, 0x7fffffffffffffffL

    invoke-interface {p1, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 112
    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 82
    .end local v1    # "b":Ljava/util/Collection;, "TU;"
    .end local v2    # "boundary":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TB;>;"
    .end local v3    # "bs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySubscriber<TT;TU;TB;>;"
    :catch_0
    move-exception v4

    .line 83
    .local v4, "e":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 84
    iput-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    .line 85
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 86
    invoke-static {v4, v0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 96
    .end local v4    # "e":Ljava/lang/Throwable;
    .restart local v1    # "b":Ljava/util/Collection;, "TU;"
    :catch_1
    move-exception v5

    .line 97
    .local v5, "ex":Ljava/lang/Throwable;
    invoke-static {v5}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 98
    iput-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->cancelled:Z

    .line 99
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 100
    invoke-static {v5, v0}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber<TT;TU;TB;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundarySupplier$BufferBoundarySupplierSubscriber;->requested(J)V

    .line 153
    return-void
.end method
