.class final Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;
.source "ParallelRunOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelRunOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RunOnConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xeeb976b788f368aL


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V
    .locals 0
    .param p2, "prefetch"    # I
    .param p4, "worker"    # Lio/reactivex/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;I",
            "Lio/reactivex/internal/queue/SpscArrayQueue",
            "<TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 308
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p3, "queue":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    invoke-direct {p0, p2, p3, p4}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;-><init>(ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V

    .line 309
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 310
    return-void
.end method


# virtual methods
.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 314
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 317
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 319
    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->prefetch:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 321
    :cond_0
    return-void
.end method

.method public run()V
    .locals 20

    .prologue
    .line 325
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber<TT;>;"
    const/4 v10, 0x1

    .line 326
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget v3, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->consumed:I

    .line 327
    .local v3, "c":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->queue:Lio/reactivex/internal/queue/SpscArrayQueue;

    .line 328
    .local v12, "q":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 329
    .local v2, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    move-object/from16 v0, p0

    iget v9, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->limit:I

    .line 333
    .local v9, "lim":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 334
    .local v14, "r":J
    const-wide/16 v6, 0x0

    .line 336
    .local v6, "e":J
    :cond_1
    :goto_1
    cmp-long v17, v6, v14

    if-eqz v17, :cond_6

    .line 337
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 338
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 422
    :goto_2
    return-void

    .line 342
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->done:Z

    .line 344
    .local v4, "d":Z
    if-eqz v4, :cond_3

    .line 345
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->error:Ljava/lang/Throwable;

    .line 346
    .local v8, "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_3

    .line 347
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 349
    invoke-interface {v2, v8}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_2

    .line 356
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_3
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v13

    .line 358
    .local v13, "v":Ljava/lang/Object;, "TT;"
    if-nez v13, :cond_4

    const/4 v5, 0x1

    .line 360
    .local v5, "empty":Z
    :goto_3
    if-eqz v4, :cond_5

    if-eqz v5, :cond_5

    .line 361
    invoke-interface {v2}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_2

    .line 358
    .end local v5    # "empty":Z
    :cond_4
    const/4 v5, 0x0

    goto :goto_3

    .line 367
    .restart local v5    # "empty":Z
    :cond_5
    if-eqz v5, :cond_7

    .line 382
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_6
    cmp-long v17, v6, v14

    if-nez v17, :cond_b

    .line 383
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_9

    .line 384
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    goto :goto_2

    .line 371
    .restart local v4    # "d":Z
    .restart local v5    # "empty":Z
    .restart local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-interface {v2, v13}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 372
    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    .line 375
    :cond_8
    add-int/lit8 v3, v3, 0x1

    move v11, v3

    .line 376
    .local v11, "p":I
    if-ne v11, v9, :cond_1

    .line 377
    const/4 v3, 0x0

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v17, v0

    int-to-long v0, v11

    move-wide/from16 v18, v0

    invoke-interface/range {v17 .. v19}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    .line 388
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v11    # "p":I
    .end local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->done:Z

    move/from16 v17, v0

    if-eqz v17, :cond_b

    .line 389
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->error:Ljava/lang/Throwable;

    .line 390
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_a

    .line 391
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 393
    invoke-interface {v2, v8}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto/16 :goto_2

    .line 398
    :cond_a
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_b

    .line 399
    invoke-interface {v2}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 401
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto/16 :goto_2

    .line 407
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_b
    const-wide/16 v18, 0x0

    cmp-long v17, v6, v18

    if-eqz v17, :cond_c

    const-wide v18, 0x7fffffffffffffffL

    cmp-long v17, v14, v18

    if-eqz v17, :cond_c

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    neg-long v0, v6

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 411
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->get()I

    move-result v16

    .line 412
    .local v16, "w":I
    move/from16 v0, v16

    if-ne v0, v10, :cond_d

    .line 413
    move-object/from16 v0, p0

    iput v3, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->consumed:I

    .line 414
    neg-int v0, v10

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->addAndGet(I)I

    move-result v10

    .line 415
    if-nez v10, :cond_0

    goto/16 :goto_2

    .line 419
    :cond_d
    move/from16 v10, v16

    goto/16 :goto_0
.end method
