.class final Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "CompletableConcat.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableConcat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CompletableConcatSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<",
        "Lio/reactivex/CompletableSource;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7d58c452a57faa4cL


# instance fields
.field volatile active:Z

.field final actual:Lio/reactivex/CompletableObserver;

.field consumed:I

.field volatile done:Z

.field final inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

.field final limit:I

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final prefetch:I

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field sourceFused:I


# direct methods
.method constructor <init>(Lio/reactivex/CompletableObserver;I)V
    .locals 1
    .param p1, "actual"    # Lio/reactivex/CompletableObserver;
    .param p2, "prefetch"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 71
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    .line 72
    iput p2, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->prefetch:I

    .line 73
    new-instance v0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;-><init>(Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    shr-int/lit8 v0, p2, 0x2

    sub-int v0, p2, v0

    iput v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->limit:I

    .line 76
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 150
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 151
    return-void
.end method

.method drain()V
    .locals 7

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 159
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->getAndIncrement()I

    move-result v6

    if-eqz v6, :cond_1

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 164
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->isDisposed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 168
    iget-boolean v6, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->active:Z

    if-nez v6, :cond_4

    .line 170
    iget-boolean v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->done:Z

    .line 175
    .local v1, "d":Z
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v6}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/CompletableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    .local v0, "cs":Lio/reactivex/CompletableSource;
    if-nez v0, :cond_2

    move v2, v4

    .line 184
    .local v2, "empty":Z
    :goto_1
    if-eqz v1, :cond_3

    if-eqz v2, :cond_3

    .line 185
    iget-object v6, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v5, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 186
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_0

    .line 176
    .end local v0    # "cs":Lio/reactivex/CompletableSource;
    .end local v2    # "empty":Z
    :catch_0
    move-exception v3

    .line 177
    .local v3, "ex":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 178
    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->innerError(Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v3    # "ex":Ljava/lang/Throwable;
    .restart local v0    # "cs":Lio/reactivex/CompletableSource;
    :cond_2
    move v2, v5

    .line 182
    goto :goto_1

    .line 191
    .restart local v2    # "empty":Z
    :cond_3
    if-nez v2, :cond_4

    .line 192
    iput-boolean v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->active:Z

    .line 193
    iget-object v6, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    invoke-interface {v0, v6}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    .line 194
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->request()V

    .line 198
    .end local v0    # "cs":Lio/reactivex/CompletableSource;
    .end local v1    # "d":Z
    .end local v2    # "empty":Z
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->decrementAndGet()I

    move-result v6

    if-nez v6, :cond_1

    goto :goto_0
.end method

.method innerComplete()V
    .locals 1

    .prologue
    .line 226
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->active:Z

    .line 227
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->drain()V

    .line 228
    return-void
.end method

.method innerError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 217
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 219
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 223
    :goto_0
    return-void

    .line 221
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->done:Z

    .line 144
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->drain()V

    .line 145
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 133
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->inner:Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber$ConcatInnerObserver;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 135
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 139
    :goto_0
    return-void

    .line 137
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Lio/reactivex/CompletableSource;)V
    .locals 1
    .param p1, "t"    # Lio/reactivex/CompletableSource;

    .prologue
    .line 122
    iget v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->sourceFused:I

    if-nez v0, :cond_0

    .line 123
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    invoke-direct {v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>()V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 129
    :goto_0
    return-void

    .line 128
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->drain()V

    goto :goto_0
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 43
    check-cast p1, Lio/reactivex/CompletableSource;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->onNext(Lio/reactivex/CompletableSource;)V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 7
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    const v6, 0x7fffffff

    const/4 v5, 0x1

    .line 80
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v4, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 83
    iget v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->prefetch:I

    if-ne v4, v6, :cond_1

    const-wide v2, 0x7fffffffffffffffL

    .line 85
    .local v2, "r":J
    :goto_0
    instance-of v4, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v4, :cond_3

    move-object v1, p1

    .line 87
    check-cast v1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 89
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<Lio/reactivex/CompletableSource;>;"
    const/4 v4, 0x3

    invoke-interface {v1, v4}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 91
    .local v0, "m":I
    if-ne v0, v5, :cond_2

    .line 92
    iput v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->sourceFused:I

    .line 93
    iput-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 94
    iput-boolean v5, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->done:Z

    .line 95
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, p0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 96
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->drain()V

    .line 118
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<Lio/reactivex/CompletableSource;>;"
    .end local v2    # "r":J
    :cond_0
    :goto_1
    return-void

    .line 83
    :cond_1
    iget v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->prefetch:I

    int-to-long v2, v4

    goto :goto_0

    .line 99
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<Lio/reactivex/CompletableSource;>;"
    .restart local v2    # "r":J
    :cond_2
    const/4 v4, 0x2

    if-ne v0, v4, :cond_3

    .line 100
    iput v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->sourceFused:I

    .line 101
    iput-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 102
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, p0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 103
    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    .line 108
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<Lio/reactivex/CompletableSource;>;"
    :cond_3
    iget v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->prefetch:I

    if-ne v4, v6, :cond_4

    .line 109
    new-instance v4, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v5

    invoke-direct {v4, v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 114
    :goto_2
    iget-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, p0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 116
    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    .line 111
    :cond_4
    new-instance v4, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v5, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->prefetch:I

    invoke-direct {v4, v5}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v4, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    goto :goto_2
.end method

.method request()V
    .locals 4

    .prologue
    .line 205
    iget v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->sourceFused:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 206
    iget v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->consumed:I

    add-int/lit8 v0, v1, 0x1

    .line 207
    .local v0, "p":I
    iget v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->limit:I

    if-ne v0, v1, :cond_1

    .line 208
    const/4 v1, 0x0

    iput v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->consumed:I

    .line 209
    iget-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->s:Lorg/reactivestreams/Subscription;

    int-to-long v2, v0

    invoke-interface {v1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 214
    .end local v0    # "p":I
    :cond_0
    :goto_0
    return-void

    .line 211
    .restart local v0    # "p":I
    :cond_1
    iput v0, p0, Lio/reactivex/internal/operators/completable/CompletableConcat$CompletableConcatSubscriber;->consumed:I

    goto :goto_0
.end method
