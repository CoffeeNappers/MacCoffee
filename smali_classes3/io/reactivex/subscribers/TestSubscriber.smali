.class public Lio/reactivex/subscribers/TestSubscriber;
.super Lio/reactivex/observers/BaseTestConsumer;
.source "TestSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subscribers/TestSubscriber$EmptySubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observers/BaseTestConsumer",
        "<TT;",
        "Lio/reactivex/subscribers/TestSubscriber",
        "<TT;>;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field private final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private volatile cancelled:Z

.field private final missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

.field private qs:Lio/reactivex/internal/fuseable/QueueSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/QueueSubscription",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final subscription:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    sget-object v0, Lio/reactivex/subscribers/TestSubscriber$EmptySubscriber;->INSTANCE:Lio/reactivex/subscribers/TestSubscriber$EmptySubscriber;

    const-wide v2, 0x7fffffffffffffffL

    invoke-direct {p0, v0, v2, v3}, Lio/reactivex/subscribers/TestSubscriber;-><init>(Lorg/reactivestreams/Subscriber;J)V

    .line 92
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .param p1, "initialRequest"    # J

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    sget-object v0, Lio/reactivex/subscribers/TestSubscriber$EmptySubscriber;->INSTANCE:Lio/reactivex/subscribers/TestSubscriber$EmptySubscriber;

    invoke-direct {p0, v0, p1, p2}, Lio/reactivex/subscribers/TestSubscriber;-><init>(Lorg/reactivestreams/Subscriber;J)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-direct {p0, p1, v0, v1}, Lio/reactivex/subscribers/TestSubscriber;-><init>(Lorg/reactivestreams/Subscriber;J)V

    .line 110
    return-void
.end method

.method public constructor <init>(Lorg/reactivestreams/Subscriber;J)V
    .locals 2
    .param p2, "initialRequest"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/observers/BaseTestConsumer;-><init>()V

    .line 121
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gez v0, :cond_0

    .line 122
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Negative initial request not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_0
    iput-object p1, p0, Lio/reactivex/subscribers/TestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 125
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    .line 126
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 127
    return-void
.end method

.method public static create()Lio/reactivex/subscribers/TestSubscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lio/reactivex/subscribers/TestSubscriber;

    invoke-direct {v0}, Lio/reactivex/subscribers/TestSubscriber;-><init>()V

    return-object v0
.end method

.method public static create(J)Lio/reactivex/subscribers/TestSubscriber;
    .locals 2
    .param p0, "initialRequested"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Lio/reactivex/subscribers/TestSubscriber;

    invoke-direct {v0, p0, p1}, Lio/reactivex/subscribers/TestSubscriber;-><init>(J)V

    return-object v0
.end method

.method public static create(Lorg/reactivestreams/Subscriber;)Lio/reactivex/subscribers/TestSubscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "delegate":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v0, Lio/reactivex/subscribers/TestSubscriber;

    invoke-direct {v0, p0}, Lio/reactivex/subscribers/TestSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    return-object v0
.end method

.method static fusionModeToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "mode"    # I

    .prologue
    .line 363
    packed-switch p0, :pswitch_data_0

    .line 367
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Unknown("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 364
    :pswitch_0
    const-string/jumbo v0, "NONE"

    goto :goto_0

    .line 365
    :pswitch_1
    const-string/jumbo v0, "SYNC"

    goto :goto_0

    .line 366
    :pswitch_2
    const-string/jumbo v0, "ASYNC"

    goto :goto_0

    .line 363
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method final assertFuseable()Lio/reactivex/subscribers/TestSubscriber;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 378
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    if-nez v0, :cond_0

    .line 379
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Upstream is not fuseable."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 381
    :cond_0
    return-object p0
.end method

.method final assertFusionMode(I)Lio/reactivex/subscribers/TestSubscriber;
    .locals 4
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 350
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget v0, p0, Lio/reactivex/subscribers/TestSubscriber;->establishedFusionMode:I

    .line 351
    .local v0, "m":I
    if-eq v0, p1, :cond_1

    .line 352
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v1, :cond_0

    .line 353
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Fusion mode different. Expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lio/reactivex/subscribers/TestSubscriber;->fusionModeToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", actual: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lio/reactivex/subscribers/TestSubscriber;->fusionModeToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 356
    :cond_0
    const-string/jumbo v1, "Upstream is not fuseable"

    invoke-virtual {p0, v1}, Lio/reactivex/subscribers/TestSubscriber;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v1

    throw v1

    .line 359
    :cond_1
    return-object p0
.end method

.method final assertNotFuseable()Lio/reactivex/subscribers/TestSubscriber;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 391
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v0, :cond_0

    .line 392
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Upstream is fuseable."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 394
    :cond_0
    return-object p0
.end method

.method public bridge synthetic assertNotSubscribed()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/subscribers/TestSubscriber;->assertNotSubscribed()Lio/reactivex/subscribers/TestSubscriber;

    move-result-object v0

    return-object v0
.end method

.method public final assertNotSubscribed()Lio/reactivex/subscribers/TestSubscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 321
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 322
    const-string/jumbo v0, "Subscribed!"

    invoke-virtual {p0, v0}, Lio/reactivex/subscribers/TestSubscriber;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 324
    :cond_0
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 325
    const-string/jumbo v0, "Not subscribed but errors found"

    invoke-virtual {p0, v0}, Lio/reactivex/subscribers/TestSubscriber;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 327
    :cond_1
    return-object p0
.end method

.method public final assertOf(Lio/reactivex/functions/Consumer;)Lio/reactivex/subscribers/TestSubscriber;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;>;)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 404
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    .local p1, "check":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/subscribers/TestSubscriber<TT;>;>;"
    :try_start_0
    invoke-interface {p1, p0}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    return-object p0

    .line 405
    :catch_0
    move-exception v0

    .line 406
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public bridge synthetic assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/subscribers/TestSubscriber;->assertSubscribed()Lio/reactivex/subscribers/TestSubscriber;

    move-result-object v0

    return-object v0
.end method

.method public final assertSubscribed()Lio/reactivex/subscribers/TestSubscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 309
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 310
    const-string/jumbo v0, "Not subscribed!"

    invoke-virtual {p0, v0}, Lio/reactivex/subscribers/TestSubscriber;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 312
    :cond_0
    return-object p0
.end method

.method public final cancel()V
    .locals 1

    .prologue
    .line 267
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 268
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->cancelled:Z

    .line 269
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 271
    :cond_0
    return-void
.end method

.method public final dispose()V
    .locals 0

    .prologue
    .line 283
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/subscribers/TestSubscriber;->cancel()V

    .line 284
    return-void
.end method

.method public final hasSubscription()Z
    .locals 1

    .prologue
    .line 298
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isCancelled()Z
    .locals 1

    .prologue
    .line 278
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->cancelled:Z

    return v0
.end method

.method public final isDisposed()Z
    .locals 1

    .prologue
    .line 288
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 244
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    if-nez v0, :cond_0

    .line 245
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    .line 246
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 247
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "onSubscribe not called in proper order"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->lastThread:Ljava/lang/Thread;

    .line 252
    iget-wide v0, p0, Lio/reactivex/subscribers/TestSubscriber;->completions:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/subscribers/TestSubscriber;->completions:J

    .line 254
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 258
    return-void

    .line 256
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 222
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    if-nez v0, :cond_0

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    .line 224
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 225
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "onSubscribe not called in proper order"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->lastThread:Ljava/lang/Thread;

    .line 230
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    if-nez p1, :cond_1

    .line 233
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "onError received a null Throwable"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_1
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 240
    return-void

    .line 238
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    if-nez v1, :cond_0

    .line 192
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    .line 193
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 194
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "onSubscribe not called in proper order"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iput-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->lastThread:Ljava/lang/Thread;

    .line 199
    iget v1, p0, Lio/reactivex/subscribers/TestSubscriber;->establishedFusionMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 201
    :goto_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 202
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->values:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 204
    :catch_0
    move-exception v0

    .line 206
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    return-void

    .line 211
    :cond_2
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->values:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    if-nez p1, :cond_3

    .line 214
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "onNext received a null value"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    :cond_3
    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 187
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 10
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    const-wide/16 v8, 0x0

    const/4 v7, 0x1

    .line 132
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    iput-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->lastThread:Ljava/lang/Thread;

    .line 134
    if-nez p1, :cond_1

    .line 135
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v6, Ljava/lang/NullPointerException;

    const-string/jumbo v7, "onSubscribe received a null Subscription"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 139
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 140
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v5, v6, :cond_0

    .line 141
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "onSubscribe received multiple subscriptions: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 146
    :cond_2
    iget v5, p0, Lio/reactivex/subscribers/TestSubscriber;->initialFusionMode:I

    if-eqz v5, :cond_4

    .line 147
    instance-of v5, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v5, :cond_4

    move-object v5, p1

    .line 148
    check-cast v5, Lio/reactivex/internal/fuseable/QueueSubscription;

    iput-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 150
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    iget v6, p0, Lio/reactivex/subscribers/TestSubscriber;->initialFusionMode:I

    invoke-interface {v5, v6}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v1

    .line 151
    .local v1, "m":I
    iput v1, p0, Lio/reactivex/subscribers/TestSubscriber;->establishedFusionMode:I

    .line 153
    if-ne v1, v7, :cond_4

    .line 154
    iput-boolean v7, p0, Lio/reactivex/subscribers/TestSubscriber;->checkSubscriptionOnce:Z

    .line 155
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    iput-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->lastThread:Ljava/lang/Thread;

    .line 158
    :goto_1
    :try_start_0
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v5}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v4

    .local v4, "t":Ljava/lang/Object;, "TT;"
    if-eqz v4, :cond_3

    .line 159
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->values:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 162
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 164
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->errors:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 161
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    :try_start_1
    iget-wide v6, p0, Lio/reactivex/subscribers/TestSubscriber;->completions:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, p0, Lio/reactivex/subscribers/TestSubscriber;->completions:J
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 172
    .end local v1    # "m":I
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_4
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v5, p1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 174
    iget-object v5, p0, Lio/reactivex/subscribers/TestSubscriber;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5, v8, v9}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    .line 175
    .local v2, "mr":J
    cmp-long v5, v2, v8

    if-eqz v5, :cond_5

    .line 176
    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 179
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/subscribers/TestSubscriber;->onStart()V

    goto/16 :goto_0
.end method

.method public final request(J)V
    .locals 3
    .param p1, "n"    # J

    .prologue
    .line 262
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/TestSubscriber;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Lio/reactivex/subscribers/TestSubscriber;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, v1, p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->deferredRequest(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicLong;J)V

    .line 263
    return-void
.end method

.method public final requestMore(J)Lio/reactivex/subscribers/TestSubscriber;
    .locals 1
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 419
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/subscribers/TestSubscriber;->request(J)V

    .line 420
    return-object p0
.end method

.method final setInitialFusionMode(I)Lio/reactivex/subscribers/TestSubscriber;
    .locals 0
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/subscribers/TestSubscriber",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 338
    .local p0, "this":Lio/reactivex/subscribers/TestSubscriber;, "Lio/reactivex/subscribers/TestSubscriber<TT;>;"
    iput p1, p0, Lio/reactivex/subscribers/TestSubscriber;->initialFusionMode:I

    .line 339
    return-object p0
.end method
