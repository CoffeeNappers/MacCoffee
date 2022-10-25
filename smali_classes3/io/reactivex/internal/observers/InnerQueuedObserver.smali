.class public final Lio/reactivex/internal/observers/InnerQueuedObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "InnerQueuedObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4b2db39073b2fa8dL


# instance fields
.field volatile done:Z

.field fusionMode:I

.field final parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/observers/InnerQueuedObserverSupport",
            "<TT;>;"
        }
    .end annotation
.end field

.field final prefetch:I

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/internal/observers/InnerQueuedObserverSupport;I)V
    .locals 0
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/observers/InnerQueuedObserverSupport",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    .local p1, "parent":Lio/reactivex/internal/observers/InnerQueuedObserverSupport;, "Lio/reactivex/internal/observers/InnerQueuedObserverSupport<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 48
    iput-object p1, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    .line 49
    iput p2, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->prefetch:I

    .line 50
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 100
    return-void
.end method

.method public fusionMode()I
    .locals 1

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    iget v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->fusionMode:I

    return v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/InnerQueuedObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->done:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0}, Lio/reactivex/internal/observers/InnerQueuedObserverSupport;->innerComplete(Lio/reactivex/internal/observers/InnerQueuedObserver;)V

    .line 95
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/internal/observers/InnerQueuedObserverSupport;->innerError(Lio/reactivex/internal/observers/InnerQueuedObserver;Ljava/lang/Throwable;)V

    .line 90
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->fusionMode:I

    if-nez v0, :cond_0

    .line 81
    iget-object v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/internal/observers/InnerQueuedObserverSupport;->innerNext(Lio/reactivex/internal/observers/InnerQueuedObserver;Ljava/lang/Object;)V

    .line 85
    :goto_0
    return-void

    .line 83
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0}, Lio/reactivex/internal/observers/InnerQueuedObserverSupport;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    const/4 v3, 0x1

    .line 54
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 55
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 57
    check-cast v1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 59
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 60
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 61
    iput v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->fusionMode:I

    .line 62
    iput-object v1, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 63
    iput-boolean v3, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->done:Z

    .line 64
    iget-object v2, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v2, p0}, Lio/reactivex/internal/observers/InnerQueuedObserverSupport;->innerComplete(Lio/reactivex/internal/observers/InnerQueuedObserver;)V

    .line 76
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 67
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 68
    iput v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->fusionMode:I

    .line 69
    iput-object v1, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    goto :goto_0

    .line 74
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_2
    iget v2, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->prefetch:I

    neg-int v2, v2

    invoke-static {v2}, Lio/reactivex/internal/util/QueueDrainHelper;->createQueue(I)Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    goto :goto_0
.end method

.method public queue()Lio/reactivex/internal/fuseable/SimpleQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    return-object v0
.end method

.method public setDone()V
    .locals 1

    .prologue
    .line 112
    .local p0, "this":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/observers/InnerQueuedObserver;->done:Z

    .line 113
    return-void
.end method
