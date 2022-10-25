.class final Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;
.super Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase;
.source "ParallelJoin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JoinSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x579a0f4f7e6bd483L


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;II)V
    .locals 0
    .param p2, "n"    # I
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;II)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscriptionBase;-><init>(Lorg/reactivestreams/Subscriber;II)V

    .line 141
    return-void
.end method


# virtual methods
.method drain()V
    .locals 1

    .prologue
    .line 206
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    :goto_0
    return-void

    .line 210
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->drainLoop()V

    goto :goto_0
.end method

.method drainLoop()V
    .locals 22

    .prologue
    .line 214
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    const/4 v10, 0x1

    .line 216
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;

    move-object/from16 v16, v0

    .line 217
    .local v16, "s":[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "[Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    move-object/from16 v0, v16

    array-length v11, v0

    .line 218
    .local v11, "n":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 222
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 223
    .local v14, "r":J
    const-wide/16 v4, 0x0

    .line 226
    .local v4, "e":J
    :cond_1
    cmp-long v19, v4, v14

    if-eqz v19, :cond_4

    .line 227
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cancelled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 228
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cleanup()V

    .line 317
    :goto_1
    return-void

    .line 232
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 233
    .local v7, "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_3

    .line 234
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cleanup()V

    .line 235
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 239
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v19

    if-nez v19, :cond_5

    const/4 v3, 0x1

    .line 241
    .local v3, "d":Z
    :goto_2
    const/4 v6, 0x1

    .line 243
    .local v6, "empty":Z
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v8, v0, :cond_7

    .line 244
    aget-object v9, v16, v8

    .line 245
    .local v9, "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    iget-object v12, v9, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 246
    .local v12, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    if-eqz v12, :cond_6

    .line 247
    invoke-interface {v12}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v17

    .line 249
    .local v17, "v":Ljava/lang/Object;, "TT;"
    if-eqz v17, :cond_6

    .line 250
    const/4 v6, 0x0

    .line 251
    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 252
    invoke-virtual {v9}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->requestOne()V

    .line 253
    const-wide/16 v20, 0x1

    add-long v4, v4, v20

    cmp-long v19, v4, v14

    if-nez v19, :cond_6

    .line 270
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v8    # "i":I
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    .end local v17    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    :goto_4
    cmp-long v19, v4, v14

    if-nez v19, :cond_e

    .line 271
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cancelled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_9

    .line 272
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cleanup()V

    goto :goto_1

    .line 239
    .restart local v7    # "ex":Ljava/lang/Throwable;
    :cond_5
    const/4 v3, 0x0

    goto :goto_2

    .line 243
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v8    # "i":I
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .restart local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 260
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v12    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_7
    if-eqz v3, :cond_8

    if-eqz v6, :cond_8

    .line 261
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 265
    :cond_8
    if-eqz v6, :cond_1

    goto :goto_4

    .line 276
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v8    # "i":I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 277
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_a

    .line 278
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cleanup()V

    .line 279
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 283
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v19

    if-nez v19, :cond_c

    const/4 v3, 0x1

    .line 285
    .restart local v3    # "d":Z
    :goto_5
    const/4 v6, 0x1

    .line 287
    .restart local v6    # "empty":Z
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_6
    if-ge v8, v11, :cond_b

    .line 288
    aget-object v9, v16, v8

    .line 290
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    iget-object v13, v9, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 291
    .local v13, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v13, :cond_d

    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_d

    .line 292
    const/4 v6, 0x0

    .line 297
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_b
    if-eqz v3, :cond_e

    if-eqz v6, :cond_e

    .line 298
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_1

    .line 283
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v8    # "i":I
    :cond_c
    const/4 v3, 0x0

    goto :goto_5

    .line 287
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v8    # "i":I
    .restart local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .restart local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_d
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 303
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v8    # "i":I
    .end local v9    # "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_e
    const-wide/16 v20, 0x0

    cmp-long v19, v4, v20

    if-eqz v19, :cond_f

    const-wide v20, 0x7fffffffffffffffL

    cmp-long v19, v14, v20

    if-eqz v19, :cond_f

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v19, v0

    neg-long v0, v4

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 307
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->get()I

    move-result v18

    .line 308
    .local v18, "w":I
    move/from16 v0, v18

    if-ne v0, v10, :cond_10

    .line 309
    neg-int v0, v10

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->addAndGet(I)I

    move-result v10

    .line 310
    if-nez v10, :cond_0

    goto/16 :goto_1

    .line 314
    :cond_10
    move/from16 v10, v18

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 200
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->done:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 201
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->drain()V

    .line 202
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 188
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lio/reactivex/internal/util/AtomicThrowable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 189
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cancelAll()V

    .line 190
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->drain()V

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 193
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription<TT;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->get()I

    move-result v2

    if-nez v2, :cond_5

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->compareAndSet(II)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 146
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    .line 147
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 148
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 149
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 151
    :cond_0
    const-wide/16 v2, 0x1

    invoke-virtual {p1, v2, v3}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->request(J)V

    .line 166
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->decrementAndGet()I

    move-result v2

    if-nez v2, :cond_7

    .line 184
    :cond_2
    :goto_0
    return-void

    .line 153
    :cond_3
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->getQueue()Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-result-object v1

    .line 155
    .local v1, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    invoke-interface {v1, p2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 156
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cancelAll()V

    .line 157
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v2, "Queue full?!"

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    .line 158
    .local v0, "mbe":Ljava/lang/Throwable;
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lio/reactivex/internal/util/AtomicThrowable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 159
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 161
    :cond_4
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 170
    .end local v0    # "mbe":Ljava/lang/Throwable;
    .end local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_5
    invoke-virtual {p1}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinInnerSubscriber;->getQueue()Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-result-object v1

    .line 172
    .restart local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    invoke-interface {v1, p2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 173
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->cancelAll()V

    .line 174
    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v3, "Queue full?!"

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 178
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->getAndIncrement()I

    move-result v2

    if-nez v2, :cond_2

    .line 183
    .end local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    :cond_7
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelJoin$JoinSubscription;->drainLoop()V

    goto :goto_0
.end method
