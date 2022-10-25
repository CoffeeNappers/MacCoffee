.class final Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableCache.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReplaySubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final CANCELLED:J = -0x1L

.field private static final serialVersionUID:J = -0x237e491daced6e1dL


# instance fields
.field final child:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field currentBuffer:[Ljava/lang/Object;

.field currentIndexInBuffer:I

.field index:I

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final state:Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription<TT;>;"
    .local p1, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "state":Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;, "Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 269
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->child:Lorg/reactivestreams/Subscriber;

    .line 270
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->state:Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;

    .line 271
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 272
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription<TT;>;"
    const-wide/16 v2, -0x1

    .line 292
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 293
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->state:Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;

    invoke-virtual {v0, p0}, Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;->removeChild(Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;)V

    .line 295
    :cond_0
    return-void
.end method

.method public replay()V
    .locals 18

    .prologue
    .line 301
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription<TT;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->getAndIncrement()I

    move-result v14

    if-eqz v14, :cond_1

    .line 383
    :cond_0
    :goto_0
    return-void

    .line 305
    :cond_1
    const/4 v6, 0x1

    .line 306
    .local v6, "missed":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->child:Lorg/reactivestreams/Subscriber;

    .line 307
    .local v3, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 311
    .local v9, "rq":Ljava/util/concurrent/atomic/AtomicLong;
    :cond_2
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    .line 313
    .local v10, "r":J
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-ltz v14, :cond_0

    .line 319
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->state:Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;

    invoke-virtual {v14}, Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;->size()I

    move-result v12

    .line 320
    .local v12, "s":I
    if-eqz v12, :cond_9

    .line 321
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->currentBuffer:[Ljava/lang/Object;

    .line 324
    .local v2, "b":[Ljava/lang/Object;
    if-nez v2, :cond_3

    .line 325
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->state:Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;

    invoke-virtual {v14}, Lio/reactivex/internal/operators/flowable/FlowableCache$CacheState;->head()[Ljava/lang/Object;

    move-result-object v2

    .line 326
    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->currentBuffer:[Ljava/lang/Object;

    .line 328
    :cond_3
    array-length v14, v2

    add-int/lit8 v7, v14, -0x1

    .line 329
    .local v7, "n":I
    move-object/from16 v0, p0

    iget v4, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->index:I

    .line 330
    .local v4, "j":I
    move-object/from16 v0, p0

    iget v5, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->currentIndexInBuffer:I

    .line 331
    .local v5, "k":I
    const/4 v13, 0x0

    .line 333
    .local v13, "valuesProduced":I
    :goto_1
    if-ge v4, v12, :cond_5

    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-lez v14, :cond_5

    .line 334
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    const-wide/16 v16, -0x1

    cmp-long v14, v14, v16

    if-eqz v14, :cond_0

    .line 337
    if-ne v5, v7, :cond_4

    .line 338
    aget-object v14, v2, v7

    check-cast v14, [Ljava/lang/Object;

    move-object v2, v14

    check-cast v2, [Ljava/lang/Object;

    .line 339
    const/4 v5, 0x0

    .line 341
    :cond_4
    aget-object v8, v2, v5

    .line 343
    .local v8, "o":Ljava/lang/Object;
    invoke-static {v8, v3}, Lio/reactivex/internal/util/NotificationLite;->accept(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 347
    add-int/lit8 v5, v5, 0x1

    .line 348
    add-int/lit8 v4, v4, 0x1

    .line 349
    const-wide/16 v14, 0x1

    sub-long/2addr v10, v14

    .line 350
    add-int/lit8 v13, v13, 0x1

    .line 351
    goto :goto_1

    .line 353
    .end local v8    # "o":Ljava/lang/Object;
    :cond_5
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    const-wide/16 v16, -0x1

    cmp-long v14, v14, v16

    if-eqz v14, :cond_0

    .line 357
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-nez v14, :cond_7

    .line 358
    aget-object v8, v2, v5

    .line 359
    .restart local v8    # "o":Ljava/lang/Object;
    invoke-static {v8}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 360
    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 363
    :cond_6
    invoke-static {v8}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 364
    invoke-static {v8}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v14

    invoke-interface {v3, v14}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 369
    .end local v8    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz v13, :cond_8

    .line 370
    int-to-long v14, v13

    invoke-static {v9, v14, v15}, Lio/reactivex/internal/util/BackpressureHelper;->producedCancel(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 373
    :cond_8
    move-object/from16 v0, p0

    iput v4, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->index:I

    .line 374
    move-object/from16 v0, p0

    iput v5, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->currentIndexInBuffer:I

    .line 375
    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->currentBuffer:[Ljava/lang/Object;

    .line 378
    .end local v2    # "b":[Ljava/lang/Object;
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v7    # "n":I
    .end local v13    # "valuesProduced":I
    :cond_9
    neg-int v14, v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->addAndGet(I)I

    move-result v6

    .line 379
    if-nez v6, :cond_2

    goto/16 :goto_0
.end method

.method public request(J)V
    .locals 7
    .param p1, "n"    # J

    .prologue
    .line 275
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 277
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 278
    .local v0, "r":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-nez v4, :cond_2

    .line 288
    .end local v0    # "r":J
    :cond_1
    :goto_0
    return-void

    .line 281
    .restart local v0    # "r":J
    :cond_2
    invoke-static {v0, v1, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v2

    .line 282
    .local v2, "u":J
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 283
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCache$ReplaySubscription;->replay()V

    goto :goto_0
.end method
