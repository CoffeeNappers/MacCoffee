.class final Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableSequenceEqual.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EqualSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lorg/reactivestreams/Subscription;",
        ">;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x42abb13cc59281abL


# instance fields
.field volatile done:Z

.field final limit:I

.field final parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

.field final prefetch:I

.field produced:J

.field volatile queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field sourceMode:I


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;I)V
    .locals 1
    .param p1, "parent"    # Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;
    .param p2, "prefetch"    # I

    .prologue
    .line 265
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 266
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

    .line 267
    shr-int/lit8 v0, p2, 0x2

    sub-int v0, p2, v0

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->limit:I

    .line 268
    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->prefetch:I

    .line 269
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 335
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 336
    return-void
.end method

.method clear()V
    .locals 1

    .prologue
    .line 339
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 340
    .local v0, "sq":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v0, :cond_0

    .line 341
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 343
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 318
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->done:Z

    .line 319
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

    invoke-interface {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;->drain()V

    .line 320
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 313
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

    invoke-interface {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;->innerError(Ljava/lang/Throwable;)V

    .line 314
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 302
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->sourceMode:I

    if-nez v0, :cond_0

    .line 303
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 304
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    invoke-direct {v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>()V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 309
    :goto_0
    return-void

    .line 308
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

    invoke-interface {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    const/4 v3, 0x1

    .line 273
    invoke-static {p0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 274
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 276
    check-cast v1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 278
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 279
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 280
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->sourceMode:I

    .line 281
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 282
    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->done:Z

    .line 283
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->parent:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;

    invoke-interface {v2}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;->drain()V

    .line 298
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 286
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 287
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->sourceMode:I

    .line 288
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 289
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 294
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_2
    new-instance v2, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->prefetch:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 296
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public request()V
    .locals 6

    .prologue
    .line 323
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber<TT;>;"
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->sourceMode:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 324
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->produced:J

    const-wide/16 v4, 0x1

    add-long v0, v2, v4

    .line 325
    .local v0, "p":J
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->limit:I

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    .line 326
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->produced:J

    .line 327
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Subscription;

    invoke-interface {v2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 332
    .end local v0    # "p":J
    :cond_0
    :goto_0
    return-void

    .line 329
    .restart local v0    # "p":J
    :cond_1
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->produced:J

    goto :goto_0
.end method
