.class public final Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorIterable;
.super Lio/reactivex/Completable;
.source "CompletableMergeDelayErrorIterable.java"


# instance fields
.field final sources:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/CompletableSource;>;"
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorIterable;->sources:Ljava/lang/Iterable;

    .line 32
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 10
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 36
    new-instance v6, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v6}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 38
    .local v6, "set":Lio/reactivex/disposables/CompositeDisposable;
    invoke-interface {p1, v6}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 43
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorIterable;->sources:Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const-string/jumbo v9, "The source iterator returned is null"

    invoke-static {v8, v9}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    new-instance v7, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v8, 0x1

    invoke-direct {v7, v8}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 52
    .local v7, "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    new-instance v3, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v3}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    .line 55
    .local v3, "error":Lio/reactivex/internal/util/AtomicThrowable;
    :goto_0
    invoke-virtual {v6}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 103
    .end local v3    # "error":Lio/reactivex/internal/util/AtomicThrowable;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    .end local v7    # "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_0
    :goto_1
    return-void

    .line 44
    :catch_0
    move-exception v2

    .line 45
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 46
    invoke-interface {p1, v2}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 61
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v3    # "error":Lio/reactivex/internal/util/AtomicThrowable;
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    .restart local v7    # "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .line 68
    .local v0, "b":Z
    if-nez v0, :cond_2

    .line 95
    .end local v0    # "b":Z
    :goto_2
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v8

    if-nez v8, :cond_0

    .line 96
    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v4

    .line 97
    .local v4, "ex":Ljava/lang/Throwable;
    if-nez v4, :cond_3

    .line 98
    invoke-interface {p1}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_1

    .line 62
    .end local v4    # "ex":Ljava/lang/Throwable;
    :catch_1
    move-exception v2

    .line 63
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 64
    invoke-virtual {v3, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    goto :goto_2

    .line 72
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_2
    invoke-virtual {v6}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v8

    if-nez v8, :cond_0

    .line 79
    :try_start_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    const-string/jumbo v9, "The iterator returned a null CompletableSource"

    invoke-static {v8, v9}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/CompletableSource;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 86
    .local v1, "c":Lio/reactivex/CompletableSource;
    invoke-virtual {v6}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v8

    if-nez v8, :cond_0

    .line 90
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 92
    new-instance v8, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray$MergeInnerCompletableObserver;

    invoke-direct {v8, p1, v6, v3, v7}, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray$MergeInnerCompletableObserver;-><init>(Lio/reactivex/CompletableObserver;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/internal/util/AtomicThrowable;Ljava/util/concurrent/atomic/AtomicInteger;)V

    invoke-interface {v1, v8}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    goto :goto_0

    .line 80
    .end local v1    # "c":Lio/reactivex/CompletableSource;
    :catch_2
    move-exception v2

    .line 81
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 82
    invoke-virtual {v3, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    goto :goto_2

    .line 100
    .end local v0    # "b":Z
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v4    # "ex":Ljava/lang/Throwable;
    :cond_3
    invoke-interface {p1, v4}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
