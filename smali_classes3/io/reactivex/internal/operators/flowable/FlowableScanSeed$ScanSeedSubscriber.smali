.class final Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableScanSeed.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableScanSeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScanSeedSubscriber"
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
.field private static final serialVersionUID:J = -0x18a87226297dfae5L


# instance fields
.field final accumulator:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;"
        }
    .end annotation
.end field

.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field consumed:I

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final limit:I

.field final prefetch:I

.field final queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TR;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/BiFunction;Ljava/lang/Object;I)V
    .locals 1
    .param p4, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;TR;I)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "accumulator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    .local p3, "value":Ljava/lang/Object;, "TR;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 84
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 85
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->accumulator:Lio/reactivex/functions/BiFunction;

    .line 86
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->value:Ljava/lang/Object;

    .line 87
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->prefetch:I

    .line 88
    shr-int/lit8 v0, p4, 0x2

    sub-int v0, p4, v0

    iput v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->limit:I

    .line 89
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    invoke-direct {v0, p4}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 90
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v0, p3}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 91
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 92
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->cancelled:Z

    .line 149
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 150
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 151
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 153
    :cond_0
    return-void
.end method

.method drain()V
    .locals 18

    .prologue
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->getAndIncrement()I

    move-result v15

    if-eqz v15, :cond_0

    .line 241
    :goto_0
    return-void

    .line 168
    :cond_0
    const/4 v10, 0x1

    .line 169
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 170
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 171
    .local v11, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TR;>;"
    move-object/from16 v0, p0

    iget v9, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->limit:I

    .line 172
    .local v9, "lim":I
    move-object/from16 v0, p0

    iget v3, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->consumed:I

    .line 176
    .local v3, "c":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v12

    .line 177
    .local v12, "r":J
    const-wide/16 v6, 0x0

    .line 179
    .local v6, "e":J
    :cond_2
    :goto_1
    cmp-long v15, v6, v12

    if-eqz v15, :cond_7

    .line 180
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->cancelled:Z

    if-eqz v15, :cond_3

    .line 181
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    goto :goto_0

    .line 184
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    .line 186
    .local v4, "d":Z
    if-eqz v4, :cond_4

    .line 187
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->error:Ljava/lang/Throwable;

    .line 188
    .local v8, "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_4

    .line 189
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 190
    invoke-interface {v2, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 195
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v14

    .line 196
    .local v14, "v":Ljava/lang/Object;, "TR;"
    if-nez v14, :cond_5

    const/4 v5, 0x1

    .line 198
    .local v5, "empty":Z
    :goto_2
    if-eqz v4, :cond_6

    if-eqz v5, :cond_6

    .line 199
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 196
    .end local v5    # "empty":Z
    :cond_5
    const/4 v5, 0x0

    goto :goto_2

    .line 203
    .restart local v5    # "empty":Z
    :cond_6
    if-eqz v5, :cond_8

    .line 216
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_7
    cmp-long v15, v6, v12

    if-nez v15, :cond_a

    .line 217
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    if-eqz v15, :cond_a

    .line 218
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->error:Ljava/lang/Throwable;

    .line 219
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_9

    .line 220
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 221
    invoke-interface {v2, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 207
    .end local v8    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "d":Z
    .restart local v5    # "empty":Z
    .restart local v14    # "v":Ljava/lang/Object;, "TR;"
    :cond_8
    invoke-interface {v2, v14}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 209
    const-wide/16 v16, 0x1

    add-long v6, v6, v16

    .line 210
    add-int/lit8 v3, v3, 0x1

    if-ne v3, v9, :cond_2

    .line 211
    const/4 v3, 0x0

    .line 212
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->s:Lorg/reactivestreams/Subscription;

    int-to-long v0, v9

    move-wide/from16 v16, v0

    invoke-interface/range {v15 .. v17}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    .line 224
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v14    # "v":Ljava/lang/Object;, "TR;"
    .restart local v8    # "ex":Ljava/lang/Throwable;
    :cond_9
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_a

    .line 225
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 231
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_a
    const-wide/16 v16, 0x0

    cmp-long v15, v6, v16

    if-eqz v15, :cond_b

    .line 232
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v15, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 235
    :cond_b
    move-object/from16 v0, p0

    iput v3, v0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->consumed:I

    .line 236
    neg-int v15, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->addAndGet(I)I

    move-result v10

    .line 237
    if-nez v10, :cond_1

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 139
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 144
    :goto_0
    return-void

    .line 142
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    .line 143
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 128
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 129
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 135
    :goto_0
    return-void

    .line 132
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->error:Ljava/lang/Throwable;

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    .line 134
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 124
    :goto_0
    return-void

    .line 111
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->value:Ljava/lang/Object;

    .line 113
    .local v1, "v":Ljava/lang/Object;, "TR;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->accumulator:Lio/reactivex/functions/BiFunction;

    invoke-interface {v2, v1, p1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The accumulator returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 121
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->value:Ljava/lang/Object;

    .line 122
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v2, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->drain()V

    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 116
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 117
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 101
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->prefetch:I

    add-int/lit8 v0, v0, -0x1

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 103
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 159
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableScanSeed$ScanSeedSubscriber;->drain()V

    .line 161
    :cond_0
    return-void
.end method
