.class final Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableFlatMapMaybe.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatMapMaybeSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;
    }
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
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x775a28d5b42d01b7L


# instance fields
.field final active:Ljava/util/concurrent/atomic/AtomicInteger;

.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final delayErrors:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/MaybeSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final queue:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TR;>;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final set:Lio/reactivex/disposables/CompositeDisposable;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;ZI)V
    .locals 2
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/MaybeSource",
            "<+TR;>;>;ZI)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/MaybeSource<+TR;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 87
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 88
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 89
    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->delayErrors:Z

    .line 90
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->maxConcurrency:I

    .line 91
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 92
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    .line 93
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 94
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 96
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->cancelled:Z

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 159
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 160
    return-void
.end method

.method clear()V
    .locals 2

    .prologue
    .line 274
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 275
    .local v0, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 278
    :cond_0
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 268
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 269
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drainLoop()V

    .line 271
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 18

    .prologue
    .line 281
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    const/4 v8, 0x1

    .line 282
    .local v8, "missed":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 283
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 284
    .local v9, "n":Ljava/util/concurrent/atomic/AtomicInteger;
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 287
    .local v11, "qr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;>;"
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v12

    .line 288
    .local v12, "r":J
    const-wide/16 v4, 0x0

    .line 290
    .local v4, "e":J
    :goto_0
    cmp-long v15, v4, v12

    if-eqz v15, :cond_8

    .line 291
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->cancelled:Z

    if-eqz v15, :cond_1

    .line 292
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->clear()V

    .line 373
    :goto_1
    return-void

    .line 296
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->delayErrors:Z

    if-nez v15, :cond_2

    .line 297
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 298
    .local v7, "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_2

    .line 299
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v7

    .line 300
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->clear()V

    .line 301
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 306
    .end local v7    # "ex":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v15

    if-nez v15, :cond_3

    const/4 v3, 0x1

    .line 307
    .local v3, "d":Z
    :goto_2
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 308
    .local v10, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v10, :cond_4

    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v14

    .line 309
    .local v14, "v":Ljava/lang/Object;, "TR;"
    :goto_3
    if-nez v14, :cond_5

    const/4 v6, 0x1

    .line 311
    .local v6, "empty":Z
    :goto_4
    if-eqz v3, :cond_7

    if-eqz v6, :cond_7

    .line 312
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v7

    .line 313
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_6

    .line 314
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 306
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .end local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    .line 308
    .restart local v3    # "d":Z
    .restart local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_4
    const/4 v14, 0x0

    goto :goto_3

    .line 309
    .restart local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_5
    const/4 v6, 0x0

    goto :goto_4

    .line 316
    .restart local v6    # "empty":Z
    .restart local v7    # "ex":Ljava/lang/Throwable;
    :cond_6
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 321
    .end local v7    # "ex":Ljava/lang/Throwable;
    :cond_7
    if-eqz v6, :cond_9

    .line 330
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .end local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_8
    cmp-long v15, v4, v12

    if-nez v15, :cond_10

    .line 331
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->cancelled:Z

    if-eqz v15, :cond_a

    .line 332
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->clear()V

    goto :goto_1

    .line 325
    .restart local v3    # "d":Z
    .restart local v6    # "empty":Z
    .restart local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .restart local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_9
    invoke-interface {v2, v14}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 327
    const-wide/16 v16, 0x1

    add-long v4, v4, v16

    .line 328
    goto :goto_0

    .line 336
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .end local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->delayErrors:Z

    if-nez v15, :cond_b

    .line 337
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 338
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_b

    .line 339
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v7

    .line 340
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->clear()V

    .line 341
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 346
    .end local v7    # "ex":Ljava/lang/Throwable;
    :cond_b
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v15

    if-nez v15, :cond_d

    const/4 v3, 0x1

    .line 347
    .restart local v3    # "d":Z
    :goto_5
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 348
    .restart local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v10, :cond_c

    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_e

    :cond_c
    const/4 v6, 0x1

    .line 350
    .restart local v6    # "empty":Z
    :goto_6
    if-eqz v3, :cond_10

    if-eqz v6, :cond_10

    .line 351
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v15}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v7

    .line 352
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_f

    .line 353
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 346
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_d
    const/4 v3, 0x0

    goto :goto_5

    .line 348
    .restart local v3    # "d":Z
    .restart local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_e
    const/4 v6, 0x0

    goto :goto_6

    .line 355
    .restart local v6    # "empty":Z
    .restart local v7    # "ex":Ljava/lang/Throwable;
    :cond_f
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_1

    .line 361
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    .end local v10    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_10
    const-wide/16 v16, 0x0

    cmp-long v15, v4, v16

    if-eqz v15, :cond_11

    .line 362
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v15, v4, v5}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 363
    move-object/from16 v0, p0

    iget v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->maxConcurrency:I

    const v16, 0x7fffffff

    move/from16 v0, v16

    if-eq v15, v0, :cond_11

    .line 364
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v15, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 368
    :cond_11
    neg-int v15, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->addAndGet(I)I

    move-result v8

    .line 369
    if-nez v8, :cond_0

    goto/16 :goto_1
.end method

.method getOrCreateQueue()Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 217
    .local v0, "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 222
    .end local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .local v1, "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :goto_0
    return-object v1

    .line 220
    .end local v1    # "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .restart local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_1
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .end local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v2

    invoke-direct {v0, v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 221
    .restart local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 222
    .restart local v1    # "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    goto :goto_0
.end method

.method innerComplete(Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber",
            "<TT;TR;>.InnerObserver;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>.InnerObserver;"
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 242
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v4, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 244
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->get()I

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {p0, v3, v0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 245
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    if-nez v4, :cond_2

    .line 246
    .local v0, "d":Z
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 248
    .local v2, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_4

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 249
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    .line 250
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_3

    .line 251
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 265
    .end local v0    # "d":Z
    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_1
    :goto_1
    return-void

    :cond_2
    move v0, v3

    .line 245
    goto :goto_0

    .line 253
    .restart local v0    # "d":Z
    .restart local v1    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 257
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->decrementAndGet()I

    move-result v3

    if-eqz v3, :cond_1

    .line 260
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drainLoop()V

    goto :goto_1

    .line 262
    .end local v0    # "d":Z
    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_5
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 263
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drain()V

    goto :goto_1
.end method

.method innerError(Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;Ljava/lang/Throwable;)V
    .locals 1
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber",
            "<TT;TR;>.InnerObserver;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>.InnerObserver;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 229
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 230
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->delayErrors:Z

    if-nez v0, :cond_0

    .line 231
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 232
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 234
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 235
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drain()V

    .line 239
    :goto_0
    return-void

    .line 237
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerSuccess(Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber",
            "<TT;TR;>.InnerObserver;TR;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>.InnerObserver;"
    .local p2, "value":Ljava/lang/Object;, "TR;"
    const-wide/16 v8, 0x1

    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 171
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v4, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 172
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->get()I

    move-result v4

    if-nez v4, :cond_8

    invoke-virtual {p0, v3, v0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 173
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    if-nez v4, :cond_2

    .line 174
    .local v0, "d":Z
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_7

    .line 175
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 177
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 179
    .local v2, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_4

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 180
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    .line 181
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_3

    .line 182
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 212
    .end local v0    # "d":Z
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    return-void

    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_2
    move v0, v3

    .line 173
    goto :goto_0

    .line 184
    .restart local v0    # "d":Z
    .restart local v1    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 188
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_4
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v3, v8, v9}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 189
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->maxConcurrency:I

    const v4, 0x7fffffff

    if-eq v3, v4, :cond_5

    .line 190
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3, v8, v9}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 198
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->decrementAndGet()I

    move-result v3

    if-eqz v3, :cond_1

    .line 211
    .end local v0    # "d":Z
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drainLoop()V

    goto :goto_1

    .line 193
    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .restart local v0    # "d":Z
    :cond_7
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->getOrCreateQueue()Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-result-object v2

    .line 194
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    monitor-enter v2

    .line 195
    :try_start_0
    invoke-virtual {v2, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 196
    monitor-exit v2

    goto :goto_2

    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 202
    .end local v0    # "d":Z
    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_8
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->getOrCreateQueue()Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-result-object v2

    .line 203
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    monitor-enter v2

    .line 204
    :try_start_1
    invoke-virtual {v2, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 205
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 206
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 207
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->getAndIncrement()I

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    .line 205
    :catchall_1
    move-exception v3

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 152
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drain()V

    .line 153
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 140
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->delayErrors:Z

    if-nez v0, :cond_0

    .line 141
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 143
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drain()V

    .line 147
    :goto_0
    return-void

    .line 145
    :cond_1
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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The mapper returned a null MaybeSource"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/MaybeSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .local v2, "ms":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TR;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 129
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;

    invoke-direct {v1, p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;-><init>(Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;)V

    .line 131
    .local v1, "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>.InnerObserver;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v3, v1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 132
    invoke-interface {v2, v1}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 134
    .end local v1    # "inner":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>.InnerObserver;"
    .end local v2    # "ms":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TR;>;"
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
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 123
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 103
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 105
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->maxConcurrency:I

    .line 106
    .local v0, "m":I
    const v1, 0x7fffffff

    if-ne v0, v1, :cond_1

    .line 107
    const-wide v2, 0x7fffffffffffffffL

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 112
    .end local v0    # "m":I
    :cond_0
    :goto_0
    return-void

    .line 109
    .restart local v0    # "m":I
    :cond_1
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->maxConcurrency:I

    int-to-long v2, v1

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 166
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFlatMapMaybe$FlatMapMaybeSubscriber;->drain()V

    .line 168
    :cond_0
    return-void
.end method
