.class final Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ParallelFromPublisher.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelFromPublisher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelDispatcher"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3e0ae1f3a0d08e59L


# instance fields
.field volatile cancelled:Z

.field volatile done:Z

.field final emissions:[J

.field error:Ljava/lang/Throwable;

.field index:I

.field final limit:I

.field final prefetch:I

.field produced:I

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final requests:Ljava/util/concurrent/atomic/AtomicLongArray;

.field s:Lorg/reactivestreams/Subscription;

.field sourceMode:I

.field final subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final subscribers:[Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Lorg/reactivestreams/Subscriber;I)V
    .locals 6
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    .local p1, "subscribers":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 94
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 101
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    .line 102
    iput p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    .line 103
    shr-int/lit8 v1, p2, 0x2

    sub-int v1, p2, v1

    iput v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->limit:I

    .line 104
    array-length v0, p1

    .line 105
    .local v0, "m":I
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLongArray;

    add-int v2, v0, v0

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicLongArray;-><init>(I)V

    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    .line 106
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    add-int v2, v0, v0

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLongArray;->lazySet(IJ)V

    .line 107
    new-array v1, v0, [J

    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    .line 108
    return-void
.end method


# virtual methods
.method cancel(I)V
    .locals 4
    .param p1, "m"    # I

    .prologue
    .line 229
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicLongArray;->decrementAndGet(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 230
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    .line 231
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 233
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 234
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 237
    :cond_0
    return-void
.end method

.method drain()V
    .locals 2

    .prologue
    .line 430
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 439
    :goto_0
    return-void

    .line 434
    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 435
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drainSync()V

    goto :goto_0

    .line 437
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drainAsync()V

    goto :goto_0
.end method

.method drainAsync()V
    .locals 30

    .prologue
    .line 240
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    const/4 v15, 0x1

    .line 242
    .local v15, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    move-object/from16 v18, v0

    .line 243
    .local v18, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    .line 244
    .local v2, "a":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    move-object/from16 v19, v0

    .line 245
    .local v19, "r":Ljava/util/concurrent/atomic/AtomicLongArray;
    move-object/from16 v0, p0

    iget-object v7, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    .line 246
    .local v7, "e":[J
    array-length v0, v7

    move/from16 v16, v0

    .line 247
    .local v16, "n":I
    move-object/from16 v0, p0

    iget v13, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    .line 248
    .local v13, "idx":I
    move-object/from16 v0, p0

    iget v5, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->produced:I

    .line 252
    .local v5, "consumed":I
    :cond_0
    :goto_0
    const/16 v17, 0x0

    .line 255
    .local v17, "notReady":I
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_3

    .line 256
    invoke-interface/range {v18 .. v18}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 342
    :cond_2
    :goto_1
    return-void

    .line 260
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    .line 261
    .local v6, "d":Z
    if-eqz v6, :cond_4

    .line 262
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->error:Ljava/lang/Throwable;

    .line 263
    .local v11, "ex":Ljava/lang/Throwable;
    if-eqz v11, :cond_4

    .line 264
    invoke-interface/range {v18 .. v18}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 265
    move-object v3, v2

    .local v3, "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v14, v3

    .local v14, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_2
    if-ge v12, v14, :cond_2

    aget-object v22, v3, v12

    .line 266
    .local v22, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, v22

    invoke-interface {v0, v11}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 265
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 272
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v11    # "ex":Ljava/lang/Throwable;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    .end local v22    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_4
    invoke-interface/range {v18 .. v18}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v10

    .line 274
    .local v10, "empty":Z
    if-eqz v6, :cond_5

    if-eqz v10, :cond_5

    .line 275
    move-object v3, v2

    .restart local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v14, v3

    .restart local v14    # "len$":I
    const/4 v12, 0x0

    .restart local v12    # "i$":I
    :goto_3
    if-ge v12, v14, :cond_2

    aget-object v22, v3, v12

    .line 276
    .restart local v22    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface/range {v22 .. v22}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 275
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 281
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    .end local v22    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_5
    if-eqz v10, :cond_7

    .line 330
    :cond_6
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->get()I

    move-result v24

    .line 331
    .local v24, "w":I
    move/from16 v0, v24

    if-ne v0, v15, :cond_b

    .line 332
    move-object/from16 v0, p0

    iput v13, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    .line 333
    move-object/from16 v0, p0

    iput v5, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->produced:I

    .line 334
    neg-int v0, v15

    move/from16 v25, v0

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->addAndGet(I)I

    move-result v15

    .line 335
    if-nez v15, :cond_0

    goto :goto_1

    .line 285
    .end local v24    # "w":I
    :cond_7
    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v20

    .line 286
    .local v20, "requestAtIndex":J
    aget-wide v8, v7, v13

    .line 287
    .local v8, "emissionAtIndex":J
    cmp-long v25, v20, v8

    if-eqz v25, :cond_a

    add-int v25, v16, v13

    move-object/from16 v0, v19

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v26

    const-wide/16 v28, 0x0

    cmp-long v25, v26, v28

    if-nez v25, :cond_a

    .line 292
    :try_start_0
    invoke-interface/range {v18 .. v18}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v23

    .line 302
    .local v23, "v":Ljava/lang/Object;, "TT;"
    if-eqz v23, :cond_6

    .line 306
    aget-object v25, v2, v13

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 308
    const-wide/16 v26, 0x1

    add-long v26, v26, v8

    aput-wide v26, v7, v13

    .line 310
    add-int/lit8 v5, v5, 0x1

    move v4, v5

    .line 311
    .local v4, "c":I
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->limit:I

    move/from16 v25, v0

    move/from16 v0, v25

    if-ne v4, v0, :cond_8

    .line 312
    const/4 v5, 0x0

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v25, v0

    int-to-long v0, v4

    move-wide/from16 v26, v0

    invoke-interface/range {v25 .. v27}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 315
    :cond_8
    const/16 v17, 0x0

    .line 320
    .end local v4    # "c":I
    .end local v23    # "v":Ljava/lang/Object;, "TT;"
    :goto_5
    add-int/lit8 v13, v13, 0x1

    .line 321
    move/from16 v0, v16

    if-ne v13, v0, :cond_9

    .line 322
    const/4 v13, 0x0

    .line 325
    :cond_9
    move/from16 v0, v17

    move/from16 v1, v16

    if-ne v0, v1, :cond_1

    goto :goto_4

    .line 293
    :catch_0
    move-exception v11

    .line 294
    .restart local v11    # "ex":Ljava/lang/Throwable;
    invoke-static {v11}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 296
    move-object v3, v2

    .restart local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v14, v3

    .restart local v14    # "len$":I
    const/4 v12, 0x0

    .restart local v12    # "i$":I
    :goto_6
    if-ge v12, v14, :cond_2

    aget-object v22, v3, v12

    .line 297
    .restart local v22    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, v22

    invoke-interface {v0, v11}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 296
    add-int/lit8 v12, v12, 0x1

    goto :goto_6

    .line 317
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v11    # "ex":Ljava/lang/Throwable;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    .end local v22    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_a
    add-int/lit8 v17, v17, 0x1

    goto :goto_5

    .line 339
    .end local v8    # "emissionAtIndex":J
    .end local v20    # "requestAtIndex":J
    .restart local v24    # "w":I
    :cond_b
    move/from16 v15, v24

    goto/16 :goto_0
.end method

.method drainSync()V
    .locals 26

    .prologue
    .line 345
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    const/4 v12, 0x1

    .line 347
    .local v12, "missed":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 348
    .local v15, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    .line 349
    .local v2, "a":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    move-object/from16 v16, v0

    .line 350
    .local v16, "r":Ljava/util/concurrent/atomic/AtomicLongArray;
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    .line 351
    .local v4, "e":[J
    array-length v13, v4

    .line 352
    .local v13, "n":I
    move-object/from16 v0, p0

    iget v10, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    .line 356
    .local v10, "idx":I
    :cond_0
    :goto_0
    const/4 v14, 0x0

    .line 359
    .local v14, "notReady":I
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    move/from16 v22, v0

    if-eqz v22, :cond_3

    .line 360
    invoke-interface {v15}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 427
    :cond_2
    :goto_1
    return-void

    .line 364
    :cond_3
    invoke-interface {v15}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v5

    .line 366
    .local v5, "empty":Z
    if-eqz v5, :cond_4

    .line 367
    move-object v3, v2

    .local v3, "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v11, v3

    .local v11, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_2
    if-ge v9, v11, :cond_2

    aget-object v17, v3, v9

    .line 368
    .local v17, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface/range {v17 .. v17}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 367
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 373
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v9    # "i$":I
    .end local v11    # "len$":I
    .end local v17    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_4
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v18

    .line 374
    .local v18, "requestAtIndex":J
    aget-wide v6, v4, v10

    .line 375
    .local v6, "emissionAtIndex":J
    cmp-long v22, v18, v6

    if-eqz v22, :cond_7

    add-int v22, v13, v10

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v22

    const-wide/16 v24, 0x0

    cmp-long v22, v22, v24

    if-nez v22, :cond_7

    .line 380
    :try_start_0
    invoke-interface {v15}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v20

    .line 390
    .local v20, "v":Ljava/lang/Object;, "TT;"
    if-nez v20, :cond_5

    .line 391
    move-object v3, v2

    .restart local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v11, v3

    .restart local v11    # "len$":I
    const/4 v9, 0x0

    .restart local v9    # "i$":I
    :goto_3
    if-ge v9, v11, :cond_2

    aget-object v17, v3, v9

    .line 392
    .restart local v17    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface/range {v17 .. v17}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 391
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 381
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v9    # "i$":I
    .end local v11    # "len$":I
    .end local v17    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v20    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v8

    .line 382
    .local v8, "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 383
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 384
    move-object v3, v2

    .restart local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    array-length v11, v3

    .restart local v11    # "len$":I
    const/4 v9, 0x0

    .restart local v9    # "i$":I
    :goto_4
    if-ge v9, v11, :cond_2

    aget-object v17, v3, v9

    .line 385
    .restart local v17    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 384
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 397
    .end local v3    # "arr$":[Lorg/reactivestreams/Subscriber;
    .end local v8    # "ex":Ljava/lang/Throwable;
    .end local v9    # "i$":I
    .end local v11    # "len$":I
    .end local v17    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .restart local v20    # "v":Ljava/lang/Object;, "TT;"
    :cond_5
    aget-object v22, v2, v10

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 399
    const-wide/16 v22, 0x1

    add-long v22, v22, v6

    aput-wide v22, v4, v10

    .line 401
    const/4 v14, 0x0

    .line 406
    .end local v20    # "v":Ljava/lang/Object;, "TT;"
    :goto_5
    add-int/lit8 v10, v10, 0x1

    .line 407
    if-ne v10, v13, :cond_6

    .line 408
    const/4 v10, 0x0

    .line 411
    :cond_6
    if-ne v14, v13, :cond_1

    .line 416
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->get()I

    move-result v21

    .line 417
    .local v21, "w":I
    move/from16 v0, v21

    if-ne v0, v12, :cond_8

    .line 418
    move-object/from16 v0, p0

    iput v10, v0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    .line 419
    neg-int v0, v12

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->addAndGet(I)I

    move-result v12

    .line 420
    if-nez v12, :cond_0

    goto/16 :goto_1

    .line 403
    .end local v21    # "w":I
    :cond_7
    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    .line 424
    .restart local v21    # "w":I
    :cond_8
    move/from16 v12, v21

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 224
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    .line 225
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    .line 226
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 217
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->error:Ljava/lang/Throwable;

    .line 218
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    .line 219
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    .line 220
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    if-nez v0, :cond_0

    .line 206
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 208
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v1, "Queue is full?"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->onError(Ljava/lang/Throwable;)V

    .line 213
    :goto_0
    return-void

    .line 212
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    const/4 v3, 0x1

    .line 112
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v2, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 113
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    .line 115
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 117
    check-cast v1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 119
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 121
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 122
    iput v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    .line 123
    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 124
    iput-boolean v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    .line 125
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    .line 126
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    .line 147
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 129
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 130
    iput v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    .line 131
    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 133
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    .line 135
    iget v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 141
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_2
    new-instance v2, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 143
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    .line 145
    iget v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method setupSubscribers()V
    .locals 5

    .prologue
    .line 150
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;, "Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher<TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    .line 151
    .local v2, "subs":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    array-length v1, v2

    .line 153
    .local v1, "m":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 154
    iget-boolean v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    if-eqz v3, :cond_1

    .line 162
    :cond_0
    return-void

    .line 158
    :cond_1
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 160
    aget-object v3, v2, v0

    new-instance v4, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;

    invoke-direct {v4, p0, v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;-><init>(Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;II)V

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 153
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
