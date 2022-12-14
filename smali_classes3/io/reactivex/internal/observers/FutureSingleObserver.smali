.class public final Lio/reactivex/internal/observers/FutureSingleObserver;
.super Ljava/util/concurrent/CountDownLatch;
.source "FutureSingleObserver.java"

# interfaces
.implements Lio/reactivex/SingleObserver;
.implements Ljava/util/concurrent/Future;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/CountDownLatch;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;",
        "Ljava/util/concurrent/Future",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field error:Ljava/lang/Throwable;

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    .line 42
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 48
    .local v0, "a":Lio/reactivex/disposables/Disposable;
    if-eq v0, p0, :cond_1

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_2

    .line 49
    :cond_1
    const/4 v1, 0x0

    .line 57
    :goto_0
    return v1

    .line 52
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 56
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->countDown()V

    .line 57
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public dispose()V
    .locals 0

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 75
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 76
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->await()V

    .line 79
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 80
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 82
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->error:Ljava/lang/Throwable;

    .line 83
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 84
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 86
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 92
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 93
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/internal/observers/FutureSingleObserver;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v1

    .line 98
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 102
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->error:Ljava/lang/Throwable;

    .line 103
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 104
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 106
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->isDone()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 4

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 128
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 129
    .local v0, "a":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_1

    .line 130
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 136
    :goto_0
    return-void

    .line 133
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->error:Ljava/lang/Throwable;

    .line 134
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->countDown()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 111
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 112
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/observers/FutureSingleObserver;, "Lio/reactivex/internal/observers/FutureSingleObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 117
    .local v0, "a":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    .line 123
    :goto_0
    return-void

    .line 120
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->value:Ljava/lang/Object;

    .line 121
    iget-object v1, p0, Lio/reactivex/internal/observers/FutureSingleObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    invoke-virtual {p0}, Lio/reactivex/internal/observers/FutureSingleObserver;->countDown()V

    goto :goto_0
.end method
