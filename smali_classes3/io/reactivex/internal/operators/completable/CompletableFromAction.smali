.class public final Lio/reactivex/internal/operators/completable/CompletableFromAction;
.super Lio/reactivex/Completable;
.source "CompletableFromAction.java"


# instance fields
.field final run:Lio/reactivex/functions/Action;


# direct methods
.method public constructor <init>(Lio/reactivex/functions/Action;)V
    .locals 0
    .param p1, "run"    # Lio/reactivex/functions/Action;

    .prologue
    .line 25
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 26
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableFromAction;->run:Lio/reactivex/functions/Action;

    .line 27
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 3
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 31
    invoke-static {}, Lio/reactivex/disposables/Disposables;->empty()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 32
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    invoke-interface {p1, v0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 34
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableFromAction;->run:Lio/reactivex/functions/Action;

    invoke-interface {v2}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 43
    invoke-interface {p1}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 45
    :cond_0
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v1

    .line 36
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 37
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 38
    invoke-interface {p1, v1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
