.class final Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "CompletableConcatIterable.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableConcatIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatInnerObserver"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6e8ac9652ad7cd50L


# instance fields
.field final actual:Lio/reactivex/CompletableObserver;

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final sources:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/CompletableObserver;Ljava/util/Iterator;)V
    .locals 1
    .param p1, "actual"    # Lio/reactivex/CompletableObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/CompletableObserver;",
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "sources":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 60
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 61
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sources:Ljava/util/Iterator;

    .line 62
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 63
    return-void
.end method


# virtual methods
.method next()V
    .locals 6

    .prologue
    .line 81
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v4}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->getAndIncrement()I

    move-result v4

    if-nez v4, :cond_0

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sources:Ljava/util/Iterator;

    .line 91
    .local v0, "a":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    :cond_2
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v4}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 97
    :try_start_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 104
    .local v1, "b":Z
    if-nez v1, :cond_3

    .line 105
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_0

    .line 98
    .end local v1    # "b":Z
    :catch_0
    move-exception v3

    .line 99
    .local v3, "ex":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 100
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, v3}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 112
    .end local v3    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "b":Z
    :cond_3
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The CompletableSource returned is null"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/CompletableSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 119
    .local v2, "c":Lio/reactivex/CompletableSource;
    invoke-interface {v2, p0}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    .line 120
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->decrementAndGet()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 113
    .end local v2    # "c":Lio/reactivex/CompletableSource;
    :catch_1
    move-exception v3

    .line 114
    .restart local v3    # "ex":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 115
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, v3}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 77
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->next()V

    .line 78
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 72
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 73
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 67
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatIterable$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 68
    return-void
.end method
