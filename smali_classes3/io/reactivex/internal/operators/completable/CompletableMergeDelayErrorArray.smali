.class public final Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray;
.super Lio/reactivex/Completable;
.source "CompletableMergeDelayErrorArray.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray$MergeInnerCompletableObserver;
    }
.end annotation


# instance fields
.field final sources:[Lio/reactivex/CompletableSource;


# direct methods
.method public constructor <init>([Lio/reactivex/CompletableSource;)V
    .locals 0
    .param p1, "sources"    # [Lio/reactivex/CompletableSource;

    .prologue
    .line 27
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray;->sources:[Lio/reactivex/CompletableSource;

    .line 29
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 9
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 33
    new-instance v6, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v6}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 34
    .local v6, "set":Lio/reactivex/disposables/CompositeDisposable;
    new-instance v7, Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v8, p0, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray;->sources:[Lio/reactivex/CompletableSource;

    array-length v8, v8

    add-int/lit8 v8, v8, 0x1

    invoke-direct {v7, v8}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 36
    .local v7, "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    new-instance v2, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v2}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    .line 38
    .local v2, "error":Lio/reactivex/internal/util/AtomicThrowable;
    invoke-interface {p1, v6}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 40
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray;->sources:[Lio/reactivex/CompletableSource;

    .local v0, "arr$":[Lio/reactivex/CompletableSource;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v1, v0, v4

    .line 41
    .local v1, "c":Lio/reactivex/CompletableSource;
    invoke-virtual {v6}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 63
    .end local v1    # "c":Lio/reactivex/CompletableSource;
    :cond_0
    :goto_1
    return-void

    .line 45
    .restart local v1    # "c":Lio/reactivex/CompletableSource;
    :cond_1
    if-nez v1, :cond_2

    .line 46
    new-instance v3, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "A completable source is null"

    invoke-direct {v3, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 47
    .local v3, "ex":Ljava/lang/Throwable;
    invoke-virtual {v2, v3}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 48
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 40
    .end local v3    # "ex":Ljava/lang/Throwable;
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 52
    :cond_2
    new-instance v8, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray$MergeInnerCompletableObserver;

    invoke-direct {v8, p1, v6, v2, v7}, Lio/reactivex/internal/operators/completable/CompletableMergeDelayErrorArray$MergeInnerCompletableObserver;-><init>(Lio/reactivex/CompletableObserver;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/internal/util/AtomicThrowable;Ljava/util/concurrent/atomic/AtomicInteger;)V

    invoke-interface {v1, v8}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    goto :goto_2

    .line 55
    .end local v1    # "c":Lio/reactivex/CompletableSource;
    :cond_3
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v8

    if-nez v8, :cond_0

    .line 56
    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v3

    .line 57
    .restart local v3    # "ex":Ljava/lang/Throwable;
    if-nez v3, :cond_4

    .line 58
    invoke-interface {p1}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_1

    .line 60
    :cond_4
    invoke-interface {p1, v3}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
