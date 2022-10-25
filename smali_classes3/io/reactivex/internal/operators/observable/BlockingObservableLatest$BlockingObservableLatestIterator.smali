.class final Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;
.super Lio/reactivex/observers/DisposableObserver;
.source "BlockingObservableLatest.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/BlockingObservableLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BlockingObservableLatestIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observers/DisposableObserver",
        "<",
        "Lio/reactivex/Notification",
        "<TT;>;>;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field iteratorNotification:Lio/reactivex/Notification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Notification",
            "<TT;>;"
        }
    .end annotation
.end field

.field final notify:Ljava/util/concurrent/Semaphore;

.field final value:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/Notification",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    invoke-direct {p0}, Lio/reactivex/observers/DisposableObserver;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->notify:Ljava/util/concurrent/Semaphore;

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->value:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 4

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    invoke-virtual {v2}, Lio/reactivex/Notification;->isOnError()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    invoke-virtual {v2}, Lio/reactivex/Notification;->getError()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 80
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    if-nez v2, :cond_1

    .line 82
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 83
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->notify:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->value:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Notification;

    .line 91
    .local v1, "n":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    .line 92
    invoke-virtual {v1}, Lio/reactivex/Notification;->isOnError()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 93
    invoke-virtual {v1}, Lio/reactivex/Notification;->getError()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 84
    .end local v1    # "n":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    :catch_0
    move-exception v0

    .line 85
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->dispose()V

    .line 86
    invoke-static {v0}, Lio/reactivex/Notification;->createOnError(Ljava/lang/Throwable;)Lio/reactivex/Notification;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    .line 87
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 96
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    invoke-virtual {v2}, Lio/reactivex/Notification;->isOnNext()Z

    move-result v2

    return v2
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    invoke-virtual {v1}, Lio/reactivex/Notification;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 103
    .local v0, "v":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->iteratorNotification:Lio/reactivex/Notification;

    .line 104
    return-object v0

    .line 106
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 68
    return-void
.end method

.method public onNext(Lio/reactivex/Notification;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Notification",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    .local p1, "args":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 60
    .local v0, "wasNotAvailable":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 61
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->notify:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 63
    :cond_0
    return-void

    .line 59
    .end local v0    # "wasNotAvailable":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    check-cast p1, Lio/reactivex/Notification;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;->onNext(Lio/reactivex/Notification;)V

    return-void
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 111
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator;, "Lio/reactivex/internal/operators/observable/BlockingObservableLatest$BlockingObservableLatestIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read-only iterator."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
