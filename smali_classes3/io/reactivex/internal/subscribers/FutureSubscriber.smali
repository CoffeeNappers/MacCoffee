.class public final Lio/reactivex/internal/subscribers/FutureSubscriber;
.super Ljava/util/concurrent/CountDownLatch;
.source "FutureSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Ljava/util/concurrent/Future;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/CountDownLatch;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Ljava/util/concurrent/Future",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field error:Ljava/lang/Throwable;

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    .line 44
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 165
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    return-void
.end method

.method public cancel(Z)Z
    .locals 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 50
    .local v0, "a":Lorg/reactivestreams/Subscription;
    if-eq v0, p0, :cond_1

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_2

    .line 51
    :cond_1
    const/4 v1, 0x0

    .line 59
    :goto_0
    return v1

    .line 54
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 58
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->countDown()V

    .line 59
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 77
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 78
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->await()V

    .line 81
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 82
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 84
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->error:Ljava/lang/Throwable;

    .line 85
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 86
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 88
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 94
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 95
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/internal/subscribers/FutureSubscriber;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 96
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v1

    .line 100
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 101
    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v1

    .line 104
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->error:Ljava/lang/Throwable;

    .line 105
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 106
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 108
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-static {v0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->isCancelled(Lorg/reactivestreams/Subscription;)Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 4

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->value:Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 147
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string/jumbo v2, "The source is empty"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/subscribers/FutureSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 151
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 152
    .local v0, "a":Lorg/reactivestreams/Subscription;
    if-eq v0, p0, :cond_0

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v0, v1, :cond_0

    .line 155
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 156
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->countDown()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 132
    .local v0, "a":Lorg/reactivestreams/Subscription;
    if-eq v0, p0, :cond_1

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_2

    .line 133
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 139
    :goto_0
    return-void

    .line 136
    :cond_2
    iput-object p1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->error:Ljava/lang/Throwable;

    .line 137
    iget-object v1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->countDown()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 122
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string/jumbo v1, "More than one element received"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/subscribers/FutureSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 126
    :goto_0
    return-void

    .line 125
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 113
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/FutureSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 116
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 0
    .param p1, "n"    # J

    .prologue
    .line 170
    .local p0, "this":Lio/reactivex/internal/subscribers/FutureSubscriber;, "Lio/reactivex/internal/subscribers/FutureSubscriber<TT;>;"
    return-void
.end method
