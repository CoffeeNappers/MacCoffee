.class final Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;
.source "ParallelRunOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelRunOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RunOnSubscriber"
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
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V
    .locals 0
    .param p2, "prefetch"    # I
    .param p4, "worker"    # Lio/reactivex/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I",
            "Lio/reactivex/internal/queue/SpscArrayQueue",
            "<TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "queue":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    invoke-direct {p0, p2, p3, p4}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;-><init>(ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V

    .line 185
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 186
    return-void
.end method


# virtual methods
.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 193
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 195
    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->prefetch:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 197
    :cond_0
    return-void
.end method

.method public run()V
    .locals 20

    .prologue
    .line 201
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber<TT;>;"
    const/4 v10, 0x1

    .line 202
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget v3, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->consumed:I

    .line 203
    .local v3, "c":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->queue:Lio/reactivex/internal/queue/SpscArrayQueue;

    .line 204
    .local v12, "q":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 205
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget v9, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->limit:I

    .line 209
    .local v9, "lim":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 210
    .local v14, "r":J
    const-wide/16 v6, 0x0

    .line 212
    .local v6, "e":J
    :cond_1
    :goto_1
    cmp-long v17, v6, v14

    if-eqz v17, :cond_6

    .line 213
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 214
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 298
    :goto_2
    return-void

    .line 218
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->done:Z

    .line 220
    .local v4, "d":Z
    if-eqz v4, :cond_3

    .line 221
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->error:Ljava/lang/Throwable;

    .line 222
    .local v8, "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_3

    .line 223
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 225
    invoke-interface {v2, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_2

    .line 232
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_3
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v13

    .line 234
    .local v13, "v":Ljava/lang/Object;, "TT;"
    if-nez v13, :cond_4

    const/4 v5, 0x1

    .line 236
    .local v5, "empty":Z
    :goto_3
    if-eqz v4, :cond_5

    if-eqz v5, :cond_5

    .line 237
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_2

    .line 234
    .end local v5    # "empty":Z
    :cond_4
    const/4 v5, 0x0

    goto :goto_3

    .line 243
    .restart local v5    # "empty":Z
    :cond_5
    if-eqz v5, :cond_7

    .line 258
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_6
    cmp-long v17, v6, v14

    if-nez v17, :cond_a

    .line 259
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_8

    .line 260
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    goto :goto_2

    .line 247
    .restart local v4    # "d":Z
    .restart local v5    # "empty":Z
    .restart local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-interface {v2, v13}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 249
    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    .line 251
    add-int/lit8 v3, v3, 0x1

    move v11, v3

    .line 252
    .local v11, "p":I
    if-ne v11, v9, :cond_1

    .line 253
    const/4 v3, 0x0

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v17, v0

    int-to-long v0, v11

    move-wide/from16 v18, v0

    invoke-interface/range {v17 .. v19}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    .line 264
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v11    # "p":I
    .end local v13    # "v":Ljava/lang/Object;, "TT;"
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->done:Z

    move/from16 v17, v0

    if-eqz v17, :cond_a

    .line 265
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->error:Ljava/lang/Throwable;

    .line 266
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_9

    .line 267
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    .line 269
    invoke-interface {v2, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_2

    .line 274
    :cond_9
    invoke-virtual {v12}, Lio/reactivex/internal/queue/SpscArrayQueue;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 275
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto/16 :goto_2

    .line 283
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_a
    const-wide/16 v18, 0x0

    cmp-long v17, v6, v18

    if-eqz v17, :cond_b

    const-wide v18, 0x7fffffffffffffffL

    cmp-long v17, v14, v18

    if-eqz v17, :cond_b

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v17, v0

    neg-long v0, v6

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 287
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->get()I

    move-result v16

    .line 288
    .local v16, "w":I
    move/from16 v0, v16

    if-ne v0, v10, :cond_c

    .line 289
    move-object/from16 v0, p0

    iput v3, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->consumed:I

    .line 290
    neg-int v0, v10

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;->addAndGet(I)I

    move-result v10

    .line 291
    if-nez v10, :cond_0

    goto/16 :goto_2

    .line 295
    :cond_c
    move/from16 v10, v16

    goto/16 :goto_0
.end method
