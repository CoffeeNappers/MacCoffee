.class final Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;
.super Lio/reactivex/internal/observers/QueueDrainObserver;
.source "ObservableBufferExactBoundary.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferExactBoundaryObserver"
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
        "Lio/reactivex/internal/observers/QueueDrainObserver",
        "<TT;TU;TU;>;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final boundary:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TB;>;"
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

.field other:Lio/reactivex/disposables/Disposable;

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Ljava/util/concurrent/Callable;Lio/reactivex/ObservableSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;",
            "Ljava/util/concurrent/Callable",
            "<TU;>;",
            "Lio/reactivex/ObservableSource",
            "<TB;>;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p2, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    .local p3, "boundary":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/observers/QueueDrainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 60
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 61
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->boundary:Lio/reactivex/ObservableSource;

    .line 62
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Lio/reactivex/Observer;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Lio/reactivex/Observer;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 45
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->accept(Lio/reactivex/Observer;Ljava/util/Collection;)V

    return-void
.end method

.method public accept(Lio/reactivex/Observer;Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;TU;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p2, "v":Ljava/util/Collection;, "TU;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p2}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 174
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 130
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->cancelled:Z

    .line 132
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->other:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 133
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 135
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 139
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->cancelled:Z

    return v0
.end method

.method next()V
    .locals 5

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The buffer supplied is null"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    .local v2, "next":Ljava/util/Collection;, "TU;"
    monitor-enter p0

    .line 161
    :try_start_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 162
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_0

    .line 163
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v2    # "next":Ljava/util/Collection;, "TU;"
    :goto_0
    return-void

    .line 152
    :catch_0
    move-exception v1

    .line 153
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 154
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->dispose()V

    .line 155
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 165
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Ljava/util/Collection;, "TU;"
    .restart local v2    # "next":Ljava/util/Collection;, "TU;"
    :cond_0
    :try_start_2
    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 166
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 168
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->fastPathEmit(Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    goto :goto_0

    .line 166
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    monitor-enter p0

    .line 115
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 116
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_1

    .line 117
    monitor-exit p0

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 119
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 120
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v1, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 122
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->done:Z

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->enter()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, p0, p0}, Lio/reactivex/internal/util/QueueDrainHelper;->drainLoop(Lio/reactivex/internal/fuseable/SimplePlainQueue;Lio/reactivex/Observer;ZLio/reactivex/disposables/Disposable;Lio/reactivex/internal/util/ObservableQueueDrain;)V

    goto :goto_0

    .line 120
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
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->dispose()V

    .line 108
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 109
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
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 97
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 98
    .local v0, "b":Ljava/util/Collection;, "TU;"
    if-nez v0, :cond_0

    .line 99
    monitor-exit p0

    .line 103
    :goto_0
    return-void

    .line 101
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 102
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

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 5
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver<TT;TU;TB;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v3, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 72
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The buffer supplied is null"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .local v0, "b":Ljava/util/Collection;, "TU;"
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->buffer:Ljava/util/Collection;

    .line 83
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver;

    invoke-direct {v1, p0}, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;)V

    .line 84
    .local v1, "bs":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver<TT;TU;TB;>;"
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->other:Lio/reactivex/disposables/Disposable;

    .line 86
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 88
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->cancelled:Z

    if-nez v3, :cond_0

    .line 89
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->boundary:Lio/reactivex/ObservableSource;

    invoke-interface {v3, v1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 92
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v1    # "bs":Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver;, "Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferBoundaryObserver<TT;TU;TB;>;"
    :cond_0
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v2

    .line 74
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 75
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->cancelled:Z

    .line 76
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 77
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferExactBoundary$BufferExactBoundaryObserver;->actual:Lio/reactivex/Observer;

    invoke-static {v2, v3}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
