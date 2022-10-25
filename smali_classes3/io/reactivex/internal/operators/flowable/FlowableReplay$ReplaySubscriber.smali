.class final Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableReplay.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReplaySubscriber"
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
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

.field static final TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

.field private static final serialVersionUID:J = 0x6442c5ce7145e104L


# instance fields
.field final buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final management:Ljava/util/concurrent/atomic/AtomicInteger;

.field maxChildRequested:J

.field maxUpstreamRequested:J

.field final shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 248
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 250
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    return-void
.end method

.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    .local p1, "buffer":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 269
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    .line 270
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->management:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 271
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 272
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 273
    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    .local p1, "producer":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    const/4 v3, 0x0

    .line 300
    if-nez p1, :cond_0

    .line 301
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 306
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 309
    .local v0, "c":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    if-ne v0, v4, :cond_1

    .line 319
    :goto_0
    return v3

    .line 313
    :cond_1
    array-length v1, v0

    .line 314
    .local v1, "len":I
    add-int/lit8 v4, v1, 0x1

    new-array v2, v4, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 315
    .local v2, "u":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 316
    aput-object p1, v2, v1

    .line 318
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 319
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 283
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 289
    invoke-static {p0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 290
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 277
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method manageRequests()V
    .locals 24

    .prologue
    .line 430
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->management:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v17

    if-eqz v17, :cond_1

    .line 483
    :cond_0
    :goto_0
    return-void

    .line 433
    :cond_1
    const/4 v12, 0x1

    .line 436
    .local v12, "missed":I
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->isDisposed()Z

    move-result v17

    if-nez v17, :cond_0

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 442
    .local v4, "a":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    move-object/from16 v0, p0

    iget-wide v14, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxChildRequested:J

    .line 443
    .local v14, "ri":J
    move-wide v10, v14

    .line 445
    .local v10, "maxTotalRequests":J
    move-object v5, v4

    .local v5, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    array-length v9, v5

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_1
    if-ge v8, v9, :cond_3

    aget-object v16, v5, v8

    .line 446
    .local v16, "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    move-object/from16 v0, v16

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v22

    move-wide/from16 v0, v22

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    .line 445
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 449
    .end local v16    # "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_3
    move-object/from16 v0, p0

    iget-wide v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxUpstreamRequested:J

    move-wide/from16 v20, v0

    .line 450
    .local v20, "ur":J
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/reactivestreams/Subscription;

    .line 452
    .local v13, "p":Lorg/reactivestreams/Subscription;
    sub-long v6, v10, v14

    .line 453
    .local v6, "diff":J
    const-wide/16 v22, 0x0

    cmp-long v17, v6, v22

    if-eqz v17, :cond_8

    .line 454
    move-object/from16 v0, p0

    iput-wide v10, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxChildRequested:J

    .line 455
    if-eqz v13, :cond_6

    .line 456
    const-wide/16 v22, 0x0

    cmp-long v17, v20, v22

    if-eqz v17, :cond_5

    .line 457
    const-wide/16 v22, 0x0

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxUpstreamRequested:J

    .line 458
    add-long v22, v20, v6

    move-wide/from16 v0, v22

    invoke-interface {v13, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 478
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->management:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v17, v0

    neg-int v0, v12

    move/from16 v22, v0

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v12

    .line 479
    if-nez v12, :cond_2

    goto :goto_0

    .line 460
    :cond_5
    invoke-interface {v13, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_2

    .line 464
    :cond_6
    add-long v18, v20, v6

    .line 465
    .local v18, "u":J
    const-wide/16 v22, 0x0

    cmp-long v17, v18, v22

    if-gez v17, :cond_7

    .line 466
    const-wide v18, 0x7fffffffffffffffL

    .line 468
    :cond_7
    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxUpstreamRequested:J

    goto :goto_2

    .line 472
    .end local v18    # "u":J
    :cond_8
    const-wide/16 v22, 0x0

    cmp-long v17, v20, v22

    if-eqz v17, :cond_4

    if-eqz v13, :cond_4

    .line 473
    const-wide/16 v22, 0x0

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->maxUpstreamRequested:J

    .line 475
    move-wide/from16 v0, v20

    invoke-interface {v13, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_2
.end method

.method public onComplete()V
    .locals 6

    .prologue
    .line 417
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->done:Z

    if-nez v4, :cond_0

    .line 418
    const/4 v4, 0x1

    iput-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->done:Z

    .line 419
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->complete()V

    .line 420
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 421
    .local v3, "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    .line 420
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 424
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 402
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->done:Z

    if-nez v4, :cond_0

    .line 403
    const/4 v4, 0x1

    iput-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->done:Z

    .line 404
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->error(Ljava/lang/Throwable;)V

    .line 405
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 406
    .local v3, "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    .line 405
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 409
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 411
    :cond_1
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 389
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->done:Z

    if-nez v4, :cond_0

    .line 390
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->next(Ljava/lang/Object;)V

    .line 391
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 392
    .local v3, "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    .line 391
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 395
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_0
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 5
    .param p1, "p"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 379
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 380
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->manageRequests()V

    .line 381
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 382
    .local v3, "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v4, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    .line 381
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 385
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "rp":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_0
    return-void
.end method

.method remove(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    .local p1, "p":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    const/4 v7, 0x0

    .line 335
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 336
    .local v0, "c":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    array-length v3, v0

    .line 338
    .local v3, "len":I
    if-nez v3, :cond_2

    .line 370
    :cond_1
    :goto_0
    return-void

    .line 343
    :cond_2
    const/4 v2, -0x1

    .line 344
    .local v2, "j":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_3

    .line 345
    aget-object v5, v0, v1

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 346
    move v2, v1

    .line 351
    :cond_3
    if-ltz v2, :cond_1

    .line 358
    const/4 v5, 0x1

    if-ne v3, v5, :cond_5

    .line 359
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 369
    .local v4, "u":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 344
    .end local v4    # "u":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 362
    :cond_5
    add-int/lit8 v5, v3, -0x1

    new-array v4, v5, [Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    .line 364
    .restart local v4    # "u":[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    invoke-static {v0, v7, v4, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 366
    add-int/lit8 v5, v2, 0x1

    sub-int v6, v3, v2

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v4, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method
