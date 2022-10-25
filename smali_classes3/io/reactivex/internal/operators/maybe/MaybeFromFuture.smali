.class public final Lio/reactivex/internal/operators/maybe/MaybeFromFuture;
.super Lio/reactivex/Maybe;
.source "MaybeFromFuture.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final timeout:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFromFuture;, "Lio/reactivex/internal/operators/maybe/MaybeFromFuture<TT;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 36
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->future:Ljava/util/concurrent/Future;

    .line 37
    iput-wide p2, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->timeout:J

    .line 38
    iput-object p4, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->unit:Ljava/util/concurrent/TimeUnit;

    .line 39
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFromFuture;, "Lio/reactivex/internal/operators/maybe/MaybeFromFuture<TT;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-static {}, Lio/reactivex/disposables/Disposables;->empty()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 44
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    invoke-interface {p1, v0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 45
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 48
    :try_start_0
    iget-wide v4, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->timeout:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_1

    .line 49
    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->future:Ljava/util/concurrent/Future;

    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 69
    .local v2, "v":Ljava/lang/Object;, "TT;"
    :goto_0
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 70
    if-nez v2, :cond_2

    .line 71
    invoke-interface {p1}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 77
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    :goto_1
    return-void

    .line 51
    :cond_1
    :try_start_1
    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->future:Ljava/util/concurrent/Future;

    iget-wide v4, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->timeout:J

    iget-object v6, p0, Lio/reactivex/internal/operators/maybe/MaybeFromFuture;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v5, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v2

    .restart local v2    # "v":Ljava/lang/Object;, "TT;"
    goto :goto_0

    .line 53
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v1

    .line 54
    .local v1, "ex":Ljava/lang/InterruptedException;
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 55
    invoke-interface {p1, v1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 58
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 59
    .local v1, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 60
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-interface {p1, v3}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 63
    .end local v1    # "ex":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v1

    .line 64
    .local v1, "ex":Ljava/util/concurrent/TimeoutException;
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 65
    invoke-interface {p1, v1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 73
    .end local v1    # "ex":Ljava/util/concurrent/TimeoutException;
    .restart local v2    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-interface {p1, v2}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_1
.end method
