.class final Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableBufferBoundary.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferBoundarySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U::",
        "Ljava/util/Collection",
        "<-TT;>;Open:",
        "Ljava/lang/Object;",
        "Close:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;TU;TU;>;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final bufferClose:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TOpen;+",
            "Lorg/reactivestreams/Publisher",
            "<+TClose;>;>;"
        }
    .end annotation
.end field

.field final bufferOpen:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<+TOpen;>;"
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

.field final buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TU;>;"
        }
    .end annotation
.end field

.field final resources:Lio/reactivex/disposables/CompositeDisposable;

.field s:Lorg/reactivestreams/Subscription;

.field final windows:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Lorg/reactivestreams/Publisher",
            "<+TOpen;>;",
            "Lio/reactivex/functions/Function",
            "<-TOpen;+",
            "Lorg/reactivestreams/Publisher",
            "<+TClose;>;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "bufferOpen":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TOpen;>;"
    .local p3, "bufferClose":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TOpen;+Lorg/reactivestreams/Publisher<+TClose;>;>;"
    .local p4, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 75
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferOpen:Lorg/reactivestreams/Publisher;

    .line 76
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferClose:Lio/reactivex/functions/Function;

    .line 77
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 78
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    .line 79
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    .line 80
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Lorg/reactivestreams/Subscriber;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->accept(Lorg/reactivestreams/Subscriber;Ljava/util/Collection;)Z

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
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    invoke-interface {p1, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 167
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    .line 160
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->dispose()V

    .line 162
    :cond_0
    return-void
.end method

.method close(Ljava/util/Collection;Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p2, "d"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;",
            "Lio/reactivex/disposables/Disposable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    .local p1, "b":Ljava/util/Collection;, "TU;"
    monitor-enter p0

    .line 226
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 227
    .local v0, "e":Z
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    if-eqz v0, :cond_0

    .line 230
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->fastPathOrderedEmitMax(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    .line 233
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v1, p2}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 234
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_1

    .line 235
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->complete()V

    .line 238
    :cond_1
    return-void

    .line 227
    .end local v0    # "e":Z
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method complete()V
    .locals 6

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    monitor-enter p0

    .line 127
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 128
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TU;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 129
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 132
    .local v2, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    .line 133
    .local v3, "u":Ljava/util/Collection;, "TU;"
    invoke-interface {v2, v3}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 129
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<TU;>;"
    .end local v2    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    .end local v3    # "u":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 135
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<TU;>;"
    .restart local v2    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    :cond_0
    const/4 v4, 0x1

    iput-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->done:Z

    .line 136
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->enter()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 137
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v5, 0x0

    invoke-static {v2, v4, v5, p0, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainMaxLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lorg/reactivestreams/Subscriber;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/QueueDrain;)V

    .line 139
    :cond_1
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 149
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 153
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->complete()V

    .line 122
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 109
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancel()V

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    .line 111
    monitor-enter p0

    .line 112
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 113
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 115
    return-void

    .line 113
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 101
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

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

    .line 102
    .local v0, "b":Ljava/util/Collection;, "TU;"
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 104
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

    .line 105
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 86
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;)V

    .line 87
    .local v0, "bos":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v1, v0}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 89
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 91
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 92
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferOpen:Lorg/reactivestreams/Publisher;

    invoke-interface {v1, v0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 94
    const-wide v2, 0x7fffffffffffffffL

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 96
    .end local v0    # "bos":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferOpenSubscriber<TT;TU;TOpen;TClose;>;"
    :cond_0
    return-void
.end method

.method open(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOpen;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    .local p1, "window":Ljava/lang/Object;, "TOpen;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    if-eqz v4, :cond_1

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 178
    :cond_1
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The buffer supplied is null"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .local v0, "b":Ljava/util/Collection;, "TU;"
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->bufferClose:Lio/reactivex/functions/Function;

    invoke-interface {v4, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The buffer closing publisher is null"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 195
    .local v3, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TClose;>;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    if-nez v4, :cond_0

    .line 199
    monitor-enter p0

    .line 200
    :try_start_2
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->cancelled:Z

    if-eqz v4, :cond_2

    .line 201
    monitor-exit p0

    goto :goto_0

    .line 204
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 179
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v3    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TClose;>;"
    :catch_0
    move-exception v2

    .line 180
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 181
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 189
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Ljava/util/Collection;, "TU;"
    :catch_1
    move-exception v2

    .line 190
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 191
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 203
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v3    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TClose;>;"
    :cond_2
    :try_start_3
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->buffers:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 206
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferCloseSubscriber;

    invoke-direct {v1, v0, p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferCloseSubscriber;-><init>(Ljava/util/Collection;Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;)V

    .line 207
    .local v1, "bcs":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferCloseSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferCloseSubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v4, v1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 209
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 211
    invoke-interface {v3, v1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method

.method openFinished(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 215
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->windows:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 217
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->complete()V

    .line 220
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber<TT;TU;TOpen;TClose;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableBufferBoundary$BufferBoundarySubscriber;->requested(J)V

    .line 144
    return-void
.end method
