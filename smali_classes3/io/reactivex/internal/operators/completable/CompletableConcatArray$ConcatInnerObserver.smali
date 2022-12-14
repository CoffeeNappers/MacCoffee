.class final Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "CompletableConcatArray.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableConcatArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatInnerObserver"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6e8ac9652ad7cd50L


# instance fields
.field final actual:Lio/reactivex/CompletableObserver;

.field index:I

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final sources:[Lio/reactivex/CompletableSource;


# direct methods
.method constructor <init>(Lio/reactivex/CompletableObserver;[Lio/reactivex/CompletableSource;)V
    .locals 1
    .param p1, "actual"    # Lio/reactivex/CompletableObserver;
    .param p2, "sources"    # [Lio/reactivex/CompletableSource;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 48
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 49
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sources:[Lio/reactivex/CompletableSource;

    .line 50
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 51
    return-void
.end method


# virtual methods
.method next()V
    .locals 3

    .prologue
    .line 69
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v2}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->getAndIncrement()I

    move-result v2

    if-nez v2, :cond_0

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sources:[Lio/reactivex/CompletableSource;

    .line 79
    .local v0, "a":[Lio/reactivex/CompletableSource;
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v2}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 83
    iget v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->index:I

    .line 84
    .local v1, "idx":I
    array-length v2, v0

    if-ne v1, v2, :cond_3

    .line 85
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v2}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_0

    .line 89
    :cond_3
    aget-object v2, v0, v1

    invoke-interface {v2, p0}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    .line 90
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->decrementAndGet()I

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 65
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->next()V

    .line 66
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 60
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 61
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 55
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcatArray$ConcatInnerObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 56
    return-void
.end method
