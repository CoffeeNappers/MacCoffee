.class public final Lio/reactivex/internal/operators/flowable/FlowableBlockingSubscribe;
.super Ljava/lang/Object;
.source "FlowableBlockingSubscribe.java"


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static subscribe(Lorg/reactivestreams/Publisher;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "o":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    new-instance v0, Lio/reactivex/internal/util/BlockingIgnoringReceiver;

    invoke-direct {v0}, Lio/reactivex/internal/util/BlockingIgnoringReceiver;-><init>()V

    .line 84
    .local v0, "callback":Lio/reactivex/internal/util/BlockingIgnoringReceiver;
    new-instance v2, Lio/reactivex/internal/subscribers/LambdaSubscriber;

    invoke-static {}, Lio/reactivex/internal/functions/Functions;->emptyConsumer()Lio/reactivex/functions/Consumer;

    move-result-object v3

    sget-object v4, Lio/reactivex/internal/functions/Functions;->REQUEST_MAX:Lio/reactivex/functions/Consumer;

    invoke-direct {v2, v3, v0, v0, v4}, Lio/reactivex/internal/subscribers/LambdaSubscriber;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V

    .line 87
    .local v2, "ls":Lio/reactivex/internal/subscribers/LambdaSubscriber;, "Lio/reactivex/internal/subscribers/LambdaSubscriber<TT;>;"
    invoke-interface {p0, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 89
    invoke-static {v0, v2}, Lio/reactivex/internal/util/BlockingHelper;->awaitForComplete(Ljava/util/concurrent/CountDownLatch;Lio/reactivex/disposables/Disposable;)V

    .line 90
    iget-object v1, v0, Lio/reactivex/internal/util/BlockingIgnoringReceiver;->error:Ljava/lang/Throwable;

    .line 91
    .local v1, "e":Ljava/lang/Throwable;
    if-eqz v1, :cond_0

    .line 92
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 94
    :cond_0
    return-void
.end method

.method public static subscribe(Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;)V
    .locals 2
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Publisher",
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
    .line 106
    .local p0, "o":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "onNext is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    const-string/jumbo v0, "onError is null"

    invoke-static {p2, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    const-string/jumbo v0, "onComplete is null"

    invoke-static {p3, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    new-instance v0, Lio/reactivex/internal/subscribers/LambdaSubscriber;

    sget-object v1, Lio/reactivex/internal/functions/Functions;->REQUEST_MAX:Lio/reactivex/functions/Consumer;

    invoke-direct {v0, p1, p2, p3, v1}, Lio/reactivex/internal/subscribers/LambdaSubscriber;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableBlockingSubscribe;->subscribe(Lorg/reactivestreams/Publisher;Lorg/reactivestreams/Subscriber;)V

    .line 110
    return-void
.end method

.method public static subscribe(Lorg/reactivestreams/Publisher;Lorg/reactivestreams/Subscriber;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "o":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    .local p1, "subscriber":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 46
    .local v2, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Object;>;"
    new-instance v0, Lio/reactivex/internal/subscribers/BlockingSubscriber;

    invoke-direct {v0, v2}, Lio/reactivex/internal/subscribers/BlockingSubscriber;-><init>(Ljava/util/Queue;)V

    .line 48
    .local v0, "bs":Lio/reactivex/internal/subscribers/BlockingSubscriber;, "Lio/reactivex/internal/subscribers/BlockingSubscriber<TT;>;"
    invoke-interface {p0, v0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 52
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lio/reactivex/internal/subscribers/BlockingSubscriber;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 75
    :cond_1
    :goto_0
    return-void

    .line 55
    :cond_2
    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v3

    .line 56
    .local v3, "v":Ljava/lang/Object;
    if-nez v3, :cond_3

    .line 57
    invoke-virtual {v0}, Lio/reactivex/internal/subscribers/BlockingSubscriber;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 60
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 61
    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v3

    .line 63
    :cond_3
    invoke-virtual {v0}, Lio/reactivex/internal/subscribers/BlockingSubscriber;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 66
    sget-object v4, Lio/reactivex/internal/subscribers/BlockingSubscriber;->TERMINATED:Ljava/lang/Object;

    if-eq p0, v4, :cond_1

    invoke-static {v3, p1}, Lio/reactivex/internal/util/NotificationLite;->acceptFull(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 71
    .end local v3    # "v":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Lio/reactivex/internal/subscribers/BlockingSubscriber;->cancel()V

    .line 73
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
