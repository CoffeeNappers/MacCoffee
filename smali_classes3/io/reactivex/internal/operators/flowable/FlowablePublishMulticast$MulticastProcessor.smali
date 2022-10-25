.class final Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;
.super Lio/reactivex/Flowable;
.source "FlowablePublishMulticast.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MulticastProcessor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TT;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

.field static final TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;


# instance fields
.field consumed:I

.field final delayError:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final limit:I

.field final prefetch:I

.field volatile queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field sourceMode:I

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 130
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 133
    new-array v0, v1, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    return-void
.end method

.method constructor <init>(IZ)V
    .locals 2
    .param p1, "prefetch"    # I
    .param p2, "delayError"    # Z

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 158
    iput p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->prefetch:I

    .line 159
    shr-int/lit8 v0, p1, 0x2

    sub-int v0, p1, v0

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->limit:I

    .line 160
    iput-boolean p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->delayError:Z

    .line 161
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 162
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    .line 163
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 164
    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    .local p1, "s":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    const/4 v3, 0x0

    .line 245
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 246
    .local v0, "current":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    if-ne v0, v4, :cond_1

    .line 255
    :goto_0
    return v3

    .line 249
    :cond_1
    array-length v1, v0

    .line 251
    .local v1, "n":I
    add-int/lit8 v4, v1, 0x1

    new-array v2, v4, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 252
    .local v2, "next":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 253
    aput-object p1, v2, v1

    .line 254
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 255
    const/4 v3, 0x1

    goto :goto_0
.end method

.method completeAll()V
    .locals 8

    .prologue
    .line 456
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 457
    .local v3, "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->get()J

    move-result-wide v4

    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 458
    iget-object v4, v3, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 456
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 461
    .end local v3    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    :cond_1
    return-void
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 198
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_0

    .line 199
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 200
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v0, :cond_0

    .line 201
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 204
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_0
    return-void
.end method

.method drain()V
    .locals 28

    .prologue
    .line 315
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v23

    if-eqz v23, :cond_1

    .line 443
    :cond_0
    :goto_0
    return-void

    .line 319
    :cond_1
    const/4 v13, 0x1

    .line 321
    .local v13, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    move-object/from16 v16, v0

    .line 323
    .local v16, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->consumed:I

    move/from16 v17, v0

    .line 324
    .local v17, "upstreamConsumed":I
    move-object/from16 v0, p0

    iget v12, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->limit:I

    .line 325
    .local v12, "localLimit":I
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->sourceMode:I

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_4

    const/4 v4, 0x1

    .line 328
    .local v4, "canRequest":Z
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 330
    .local v3, "array":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    array-length v15, v3

    .line 332
    .local v15, "n":I
    if-eqz v16, :cond_14

    if-eqz v15, :cond_14

    .line 333
    const-wide v18, 0x7fffffffffffffffL

    .line 335
    .local v18, "r":J
    move-object v2, v3

    .local v2, "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_2
    if-ge v10, v11, :cond_5

    aget-object v14, v2, v10

    .line 336
    .local v14, "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-virtual {v14}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->get()J

    move-result-wide v20

    .line 337
    .local v20, "u":J
    const-wide/high16 v24, -0x8000000000000000L

    cmp-long v23, v20, v24

    if-eqz v23, :cond_3

    .line 338
    cmp-long v23, v18, v20

    if-lez v23, :cond_3

    .line 339
    move-wide/from16 v18, v20

    .line 335
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 325
    .end local v2    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    .end local v3    # "array":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    .end local v4    # "canRequest":Z
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v14    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    .end local v15    # "n":I
    .end local v18    # "r":J
    .end local v20    # "u":J
    :cond_4
    const/4 v4, 0x0

    goto :goto_1

    .line 344
    .restart local v2    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    .restart local v3    # "array":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    .restart local v4    # "canRequest":Z
    .restart local v10    # "i$":I
    .restart local v11    # "len$":I
    .restart local v15    # "n":I
    .restart local v18    # "r":J
    :cond_5
    const-wide/16 v6, 0x0

    .line 345
    .local v6, "e":J
    :cond_6
    :goto_3
    cmp-long v23, v6, v18

    if-eqz v23, :cond_c

    .line 346
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->isDisposed()Z

    move-result v23

    if-eqz v23, :cond_7

    .line 347
    invoke-interface/range {v16 .. v16}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    goto :goto_0

    .line 351
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    .line 353
    .local v5, "d":Z
    if-eqz v5, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->delayError:Z

    move/from16 v23, v0

    if-nez v23, :cond_8

    .line 354
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 355
    .local v9, "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_8

    .line 356
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->errorAll(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 364
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_8
    :try_start_0
    invoke-interface/range {v16 .. v16}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v22

    .line 372
    .local v22, "v":Ljava/lang/Object;, "TT;"
    if-nez v22, :cond_9

    const/4 v8, 0x1

    .line 374
    .local v8, "empty":Z
    :goto_4
    if-eqz v5, :cond_b

    if-eqz v8, :cond_b

    .line 375
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 376
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_a

    .line 377
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->errorAll(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 365
    .end local v8    # "empty":Z
    .end local v9    # "ex":Ljava/lang/Throwable;
    .end local v22    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v9

    .line 366
    .restart local v9    # "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 367
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 368
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->errorAll(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 372
    .end local v9    # "ex":Ljava/lang/Throwable;
    .restart local v22    # "v":Ljava/lang/Object;, "TT;"
    :cond_9
    const/4 v8, 0x0

    goto :goto_4

    .line 379
    .restart local v8    # "empty":Z
    .restart local v9    # "ex":Ljava/lang/Throwable;
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->completeAll()V

    goto/16 :goto_0

    .line 384
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_b
    if-eqz v8, :cond_d

    .line 402
    .end local v5    # "d":Z
    .end local v8    # "empty":Z
    .end local v22    # "v":Ljava/lang/Object;, "TT;"
    :cond_c
    cmp-long v23, v6, v18

    if-nez v23, :cond_13

    .line 403
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->isDisposed()Z

    move-result v23

    if-eqz v23, :cond_10

    .line 404
    invoke-interface/range {v16 .. v16}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    goto/16 :goto_0

    .line 388
    .restart local v5    # "d":Z
    .restart local v8    # "empty":Z
    .restart local v22    # "v":Ljava/lang/Object;, "TT;"
    :cond_d
    move-object v2, v3

    array-length v11, v2

    const/4 v10, 0x0

    :goto_5
    if-ge v10, v11, :cond_f

    aget-object v14, v2, v10

    .line 389
    .restart local v14    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-virtual {v14}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->get()J

    move-result-wide v24

    const-wide/high16 v26, -0x8000000000000000L

    cmp-long v23, v24, v26

    if-eqz v23, :cond_e

    .line 390
    iget-object v0, v14, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->actual:Lorg/reactivestreams/Subscriber;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 388
    :cond_e
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 394
    .end local v14    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    :cond_f
    const-wide/16 v24, 0x1

    add-long v6, v6, v24

    .line 396
    if-eqz v4, :cond_6

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    if-ne v0, v12, :cond_6

    .line 397
    const/16 v17, 0x0

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lorg/reactivestreams/Subscription;

    int-to-long v0, v12

    move-wide/from16 v24, v0

    invoke-interface/range {v23 .. v25}, Lorg/reactivestreams/Subscription;->request(J)V

    goto/16 :goto_3

    .line 408
    .end local v5    # "d":Z
    .end local v8    # "empty":Z
    .end local v22    # "v":Ljava/lang/Object;, "TT;"
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    .line 410
    .restart local v5    # "d":Z
    if-eqz v5, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->delayError:Z

    move/from16 v23, v0

    if-nez v23, :cond_11

    .line 411
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 412
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_11

    .line 413
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->errorAll(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 418
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_11
    if-eqz v5, :cond_13

    invoke-interface/range {v16 .. v16}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v23

    if-eqz v23, :cond_13

    .line 419
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 420
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_12

    .line 421
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->errorAll(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 423
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->completeAll()V

    goto/16 :goto_0

    .line 429
    .end local v5    # "d":Z
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_13
    move-object v2, v3

    array-length v11, v2

    const/4 v10, 0x0

    :goto_6
    if-ge v10, v11, :cond_14

    aget-object v14, v2, v10

    .line 430
    .restart local v14    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-static {v14, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 429
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 434
    .end local v2    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    .end local v6    # "e":J
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v14    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    .end local v18    # "r":J
    :cond_14
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->consumed:I

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v23, v0

    neg-int v0, v13

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v13

    .line 436
    if-eqz v13, :cond_0

    .line 439
    if-nez v16, :cond_2

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    move-object/from16 v16, v0

    goto/16 :goto_1
.end method

.method errorAll(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 447
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 448
    .local v3, "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->get()J

    move-result-wide v4

    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 449
    iget-object v4, v3, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 447
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 452
    .end local v3    # "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    :cond_1
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 208
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-static {v0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->isCancelled(Lorg/reactivestreams/Subscription;)Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 237
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    if-nez v0, :cond_0

    .line 238
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    .line 239
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->drain()V

    .line 241
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 226
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    .line 227
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 233
    :goto_0
    return-void

    .line 230
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    .line 232
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    .line 222
    :goto_0
    return-void

    .line 216
    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->sourceMode:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 217
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 218
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    invoke-direct {v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>()V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    const/4 v3, 0x1

    .line 168
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 171
    check-cast v1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 173
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 174
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 175
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->sourceMode:I

    .line 176
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 177
    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->done:Z

    .line 178
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->drain()V

    .line 193
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 181
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 182
    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->sourceMode:I

    .line 183
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 184
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->prefetch:I

    invoke-static {p1, v2}, Lio/reactivex/internal/util/QueueDrainHelper;->request(Lorg/reactivestreams/Subscription;I)V

    goto :goto_0

    .line 189
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_2
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->prefetch:I

    invoke-static {v2}, Lio/reactivex/internal/util/QueueDrainHelper;->createQueue(I)Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 191
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->prefetch:I

    invoke-static {p1, v2}, Lio/reactivex/internal/util/QueueDrainHelper;->request(Lorg/reactivestreams/Subscription;I)V

    goto :goto_0
.end method

.method remove(Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    .local p1, "s":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    const/4 v7, 0x0

    .line 263
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 264
    .local v0, "current":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    if-ne v0, v5, :cond_2

    .line 289
    :cond_1
    :goto_0
    return-void

    .line 267
    :cond_2
    array-length v3, v0

    .line 268
    .local v3, "n":I
    const/4 v2, -0x1

    .line 270
    .local v2, "j":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_3

    .line 271
    aget-object v5, v0, v1

    if-ne v5, p1, :cond_4

    .line 272
    move v2, v1

    .line 277
    :cond_3
    if-ltz v2, :cond_1

    .line 281
    const/4 v5, 0x1

    if-ne v3, v5, :cond_5

    .line 282
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 288
    .local v4, "next":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 270
    .end local v4    # "next":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 284
    :cond_5
    add-int/lit8 v5, v3, -0x1

    new-array v4, v5, [Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    .line 285
    .restart local v4    # "next":[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "[Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-static {v0, v7, v4, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 286
    add-int/lit8 v5, v2, 0x1

    sub-int v6, v3, v2

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v4, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 296
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;

    invoke-direct {v1, p1, p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;)V

    .line 297
    .local v1, "ms":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription<TT;>;"
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 298
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->add(Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 299
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 300
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->remove(Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;)V

    .line 312
    :goto_0
    return-void

    .line 303
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->drain()V

    goto :goto_0

    .line 305
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 306
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 307
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 309
    :cond_2
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method
