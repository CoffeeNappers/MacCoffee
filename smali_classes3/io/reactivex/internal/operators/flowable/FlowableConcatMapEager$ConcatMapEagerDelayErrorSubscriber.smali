.class final Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableConcatMapEager.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatMapEagerDelayErrorSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport",
        "<TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3b0ddc635a9c154fL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field volatile current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber",
            "<TR;>;"
        }
    .end annotation
.end field

.field volatile done:Z

.field final errorMode:Lio/reactivex/internal/util/ErrorMode;

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final prefetch:I

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final subscribers:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber",
            "<TR;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IILio/reactivex/internal/util/ErrorMode;)V
    .locals 2
    .param p3, "maxConcurrency"    # I
    .param p4, "prefetch"    # I
    .param p5, "errorMode"    # Lio/reactivex/internal/util/ErrorMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;II",
            "Lio/reactivex/internal/util/ErrorMode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 92
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 93
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 94
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->maxConcurrency:I

    .line 95
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->prefetch:I

    .line 96
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    .line 97
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {p4, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->subscribers:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 98
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 100
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 165
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    if-eqz v0, :cond_0

    .line 172
    :goto_0
    return-void

    .line 168
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    .line 169
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 171
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drainAndCancel()V

    goto :goto_0
.end method

.method cancelAll()V
    .locals 2

    .prologue
    .line 185
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->subscribers:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .local v0, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    goto :goto_0

    .line 188
    :cond_0
    return-void
.end method

.method public drain()V
    .locals 20

    .prologue
    .line 229
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->getAndIncrement()I

    move-result v17

    if-eqz v17, :cond_0

    .line 377
    :goto_0
    return-void

    .line 233
    :cond_0
    const/4 v11, 0x1

    .line 234
    .local v11, "missed":I
    move-object/from16 v0, p0

    iget-object v10, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 235
    .local v10, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 236
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    .line 239
    .local v5, "em":Lio/reactivex/internal/util/ErrorMode;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 240
    .local v14, "r":J
    const-wide/16 v6, 0x0

    .line 242
    .local v6, "e":J
    if-nez v10, :cond_5

    .line 244
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-eq v5, v0, :cond_2

    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 246
    .local v9, "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_2

    .line 247
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 254
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->done:Z

    .line 256
    .local v12, "outerDone":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->subscribers:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    check-cast v10, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 258
    .restart local v10    # "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    if-eqz v12, :cond_4

    if-nez v10, :cond_4

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    .line 260
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_3

    .line 261
    invoke-interface {v2, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 263
    :cond_3
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 268
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_4
    if-eqz v10, :cond_5

    .line 269
    move-object/from16 v0, p0

    iput-object v10, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 273
    .end local v12    # "outerDone":Z
    :cond_5
    const/4 v3, 0x0

    .line 275
    .local v3, "continueNextSource":Z
    if-eqz v10, :cond_d

    .line 276
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v13

    .line 277
    .local v13, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    if-eqz v13, :cond_d

    .line 278
    :goto_1
    cmp-long v17, v6, v14

    if-eqz v17, :cond_8

    .line 279
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6

    .line 280
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    goto/16 :goto_0

    .line 284
    :cond_6
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v5, v0, :cond_7

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 286
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_7

    .line 287
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 288
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    .line 289
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 296
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_7
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->isDone()Z

    move-result v4

    .line 301
    .local v4, "d":Z
    :try_start_0
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v16

    .line 311
    .local v16, "v":Ljava/lang/Object;, "TR;"
    if-nez v16, :cond_9

    const/4 v8, 0x1

    .line 313
    .local v8, "empty":Z
    :goto_2
    if-eqz v4, :cond_a

    if-eqz v8, :cond_a

    .line 314
    const/4 v10, 0x0

    .line 315
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v17, v0

    const-wide/16 v18, 0x1

    invoke-interface/range {v17 .. v19}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 317
    const/4 v3, 0x1

    .line 332
    .end local v4    # "d":Z
    .end local v8    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TR;"
    :cond_8
    cmp-long v17, v6, v14

    if-nez v17, :cond_d

    .line 333
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_b

    .line 334
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    goto/16 :goto_0

    .line 302
    .restart local v4    # "d":Z
    :catch_0
    move-exception v9

    .line 303
    .restart local v9    # "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 304
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 305
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    .line 306
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    .line 307
    invoke-interface {v2, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 311
    .end local v9    # "ex":Ljava/lang/Throwable;
    .restart local v16    # "v":Ljava/lang/Object;, "TR;"
    :cond_9
    const/4 v8, 0x0

    goto :goto_2

    .line 321
    .restart local v8    # "empty":Z
    :cond_a
    if-nez v8, :cond_8

    .line 325
    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 327
    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    .line 329
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->requestOne()V

    goto/16 :goto_1

    .line 338
    .end local v4    # "d":Z
    .end local v8    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TR;"
    :cond_b
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v5, v0, :cond_c

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 340
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_c

    .line 341
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 342
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    .line 343
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 350
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_c
    invoke-virtual {v10}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->isDone()Z

    move-result v4

    .line 352
    .restart local v4    # "d":Z
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v8

    .line 354
    .restart local v8    # "empty":Z
    if-eqz v4, :cond_d

    if-eqz v8, :cond_d

    .line 355
    const/4 v10, 0x0

    .line 356
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->current:Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v17, v0

    const-wide/16 v18, 0x1

    invoke-interface/range {v17 .. v19}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 358
    const/4 v3, 0x1

    .line 364
    .end local v4    # "d":Z
    .end local v8    # "empty":Z
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    :cond_d
    const-wide/16 v18, 0x0

    cmp-long v17, v6, v18

    if-eqz v17, :cond_e

    const-wide v18, 0x7fffffffffffffffL

    cmp-long v17, v14, v18

    if-eqz v17, :cond_e

    .line 365
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    neg-long v0, v6

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 368
    :cond_e
    if-nez v3, :cond_1

    .line 372
    neg-int v0, v11

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->addAndGet(I)I

    move-result v11

    .line 373
    if-nez v11, :cond_1

    goto/16 :goto_0
.end method

.method drainAndCancel()V
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_1

    .line 177
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelAll()V

    .line 178
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 180
    :cond_1
    return-void
.end method

.method public innerComplete(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    invoke-virtual {p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->setDone()V

    .line 224
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 225
    return-void
.end method

.method public innerError(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;Ljava/lang/Throwable;)V
    .locals 2
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber",
            "<TR;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 210
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 211
    invoke-virtual {p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->setDone()V

    .line 212
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    sget-object v1, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    if-eq v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 215
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 219
    :goto_0
    return-void

    .line 217
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerNext(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber",
            "<TR;>;TR;)V"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    .local p2, "value":Ljava/lang/Object;, "TR;"
    invoke-virtual {p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v0

    invoke-interface {v0, p2}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 206
    :goto_0
    return-void

    .line 203
    :cond_0
    invoke-virtual {p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    .line 204
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    invoke-direct {v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>()V

    invoke-virtual {p0, p1, v0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->innerError(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 159
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->done:Z

    .line 160
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 161
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->done:Z

    .line 151
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 155
    :goto_0
    return-void

    .line 153
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The mapper returned a null Publisher"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .local v2, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    new-instance v1, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->prefetch:I

    invoke-direct {v1, p0, v3}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;-><init>(Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;I)V

    .line 129
    .local v1, "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    if-eqz v3, :cond_1

    .line 145
    .end local v1    # "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    .end local v2    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_0
    :goto_0
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 122
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 123
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 133
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "inner":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TR;>;"
    .restart local v2    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :cond_1
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->subscribers:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v3, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 135
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    if-nez v3, :cond_0

    .line 139
    invoke-interface {v2, v1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 141
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->cancelled:Z

    if-eqz v3, :cond_0

    .line 142
    invoke-virtual {v1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->cancel()V

    .line 143
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drainAndCancel()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 107
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 109
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->maxConcurrency:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_1

    const-wide v0, 0x7fffffffffffffffL

    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 112
    :cond_0
    return-void

    .line 109
    :cond_1
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->maxConcurrency:I

    int-to-long v0, v0

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 194
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatMapEager$ConcatMapEagerDelayErrorSubscriber;->drain()V

    .line 196
    :cond_0
    return-void
.end method
