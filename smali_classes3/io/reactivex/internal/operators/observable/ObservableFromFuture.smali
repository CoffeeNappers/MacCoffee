.class public final Lio/reactivex/internal/operators/observable/ObservableFromFuture;
.super Lio/reactivex/Observable;
.source "ObservableFromFuture.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
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
    .line 28
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromFuture;, "Lio/reactivex/internal/operators/observable/ObservableFromFuture<TT;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->future:Ljava/util/concurrent/Future;

    .line 30
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->timeout:J

    .line 31
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->unit:Ljava/util/concurrent/TimeUnit;

    .line 32
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromFuture;, "Lio/reactivex/internal/operators/observable/ObservableFromFuture<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v0, Lio/reactivex/internal/observers/DeferredScalarDisposable;

    invoke-direct {v0, p1}, Lio/reactivex/internal/observers/DeferredScalarDisposable;-><init>(Lio/reactivex/Observer;)V

    .line 37
    .local v0, "d":Lio/reactivex/internal/observers/DeferredScalarDisposable;, "Lio/reactivex/internal/observers/DeferredScalarDisposable<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 38
    invoke-virtual {v0}, Lio/reactivex/internal/observers/DeferredScalarDisposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 41
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->unit:Ljava/util/concurrent/TimeUnit;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->future:Ljava/util/concurrent/Future;

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->timeout:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v5, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v3

    :goto_0
    const-string/jumbo v4, "Future returned null"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 49
    .local v2, "v":Ljava/lang/Object;, "TT;"
    invoke-virtual {v0, v2}, Lio/reactivex/internal/observers/DeferredScalarDisposable;->complete(Ljava/lang/Object;)V

    .line 51
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    :goto_1
    return-void

    .line 41
    :cond_1
    :try_start_1
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromFuture;->future:Ljava/util/concurrent/Future;

    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_0

    .line 42
    :catch_0
    move-exception v1

    .line 43
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 44
    invoke-virtual {v0}, Lio/reactivex/internal/observers/DeferredScalarDisposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 45
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
