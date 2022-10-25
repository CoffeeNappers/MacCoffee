.class public final Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;
.super Ljava/lang/Object;
.source "ObservableBlockingSubscribe.java"


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static subscribe(Lio/reactivex/ObservableSource;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "o":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    new-instance v0, Lio/reactivex/internal/util/BlockingIgnoringReceiver;

    invoke-direct {v0}, Lio/reactivex/internal/util/BlockingIgnoringReceiver;-><init>()V

    .line 78
    .local v0, "callback":Lio/reactivex/internal/util/BlockingIgnoringReceiver;
    new-instance v2, Lio/reactivex/internal/observers/LambdaObserver;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v3

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v4

    invoke-direct {v2, v3, v0, v0, v4}, Lio/reactivex/internal/observers/LambdaObserver;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V

    .line 81
    .local v2, "ls":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-interface {p0, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 83
    invoke-static {v0, v2}, Lio/reactivex/internal/util/BlockingHelper;->awaitForComplete(Ljava/util/concurrent/CountDownLatch;Lio/reactivex/disposables/Disposable;)V

    .line 84
    iget-object v1, v0, Lio/reactivex/internal/util/BlockingIgnoringReceiver;->error:Ljava/lang/Throwable;

    .line 85
    .local v1, "e":Ljava/lang/Throwable;
    if-eqz v1, :cond_0

    .line 86
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 88
    :cond_0
    return-void
.end method

.method public static subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/Observer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "o":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 45
    .local v2, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Object;>;"
    new-instance v0, Lio/reactivex/internal/observers/BlockingObserver;

    invoke-direct {v0, v2}, Lio/reactivex/internal/observers/BlockingObserver;-><init>(Ljava/util/Queue;)V

    .line 46
    .local v0, "bs":Lio/reactivex/internal/observers/BlockingObserver;, "Lio/reactivex/internal/observers/BlockingObserver<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 48
    invoke-interface {p0, v0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 50
    :cond_0
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingObserver;->isDisposed()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 69
    :cond_1
    :goto_0
    return-void

    .line 53
    :cond_2
    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v3

    .line 54
    .local v3, "v":Ljava/lang/Object;
    if-nez v3, :cond_3

    .line 56
    :try_start_0
    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 63
    :cond_3
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingObserver;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lio/reactivex/internal/observers/BlockingObserver;->TERMINATED:Ljava/lang/Object;

    if-eq p0, v4, :cond_1

    invoke-static {v3, p1}, Lio/reactivex/internal/util/NotificationLite;->acceptFull(Ljava/lang/Object;Lio/reactivex/Observer;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 57
    :catch_0
    move-exception v1

    .line 58
    .local v1, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Lio/reactivex/internal/observers/BlockingObserver;->dispose()V

    .line 59
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V
    .locals 2
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "o":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "onNext is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    const-string/jumbo v0, "onError is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    const-string/jumbo v0, "onComplete is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 103
    new-instance v0, Lio/reactivex/internal/observers/LambdaObserver;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-direct {v0, p1, p2, p3, v1}, Lio/reactivex/internal/observers/LambdaObserver;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableBlockingSubscribe;->subscribe(Lio/reactivex/ObservableSource;Lio/reactivex/Observer;)V

    .line 104
    return-void
.end method
