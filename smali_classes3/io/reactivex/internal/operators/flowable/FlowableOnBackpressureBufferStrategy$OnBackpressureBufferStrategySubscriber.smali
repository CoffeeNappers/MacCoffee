.class final Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableOnBackpressureBufferStrategy.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OnBackpressureBufferStrategySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2cf94dc376ca3e41L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final bufferSize:J

.field volatile cancelled:Z

.field final deque:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<TT;>;"
        }
    .end annotation
.end field

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final onOverflow:Lio/reactivex/functions/Action;

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final strategy:Lio/reactivex/BackpressureOverflowStrategy;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Action;Lio/reactivex/BackpressureOverflowStrategy;J)V
    .locals 2
    .param p2, "onOverflow"    # Lio/reactivex/functions/Action;
    .param p3, "strategy"    # Lio/reactivex/BackpressureOverflowStrategy;
    .param p4, "bufferSize"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/BackpressureOverflowStrategy;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 82
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->onOverflow:Lio/reactivex/functions/Action;

    .line 83
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->strategy:Lio/reactivex/BackpressureOverflowStrategy;

    .line 84
    iput-wide p4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->bufferSize:J

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 86
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->deque:Ljava/util/Deque;

    .line 87
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->cancelled:Z

    .line 177
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 179
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 180
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->deque:Ljava/util/Deque;

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->clear(Ljava/util/Deque;)V

    .line 182
    :cond_0
    return-void
.end method

.method clear(Ljava/util/Deque;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Deque",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    .local p1, "dq":Ljava/util/Deque;, "Ljava/util/Deque<TT;>;"
    monitor-enter p1

    .line 186
    :try_start_0
    invoke-interface {p1}, Ljava/util/Deque;->clear()V

    .line 187
    monitor-exit p1

    .line 188
    return-void

    .line 187
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method drain()V
    .locals 14

    .prologue
    .line 191
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->getAndIncrement()I

    move-result v11

    if-eqz v11, :cond_0

    .line 276
    :goto_0
    return-void

    .line 195
    :cond_0
    const/4 v7, 0x1

    .line 196
    .local v7, "missed":I
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->deque:Ljava/util/Deque;

    .line 197
    .local v2, "dq":Ljava/util/Deque;, "Ljava/util/Deque<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 199
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_1
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 200
    .local v8, "r":J
    const-wide/16 v4, 0x0

    .line 201
    .local v4, "e":J
    :goto_1
    cmp-long v11, v4, v8

    if-eqz v11, :cond_6

    .line 202
    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->cancelled:Z

    if-eqz v11, :cond_2

    .line 203
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->clear(Ljava/util/Deque;)V

    goto :goto_0

    .line 207
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    .line 211
    .local v1, "d":Z
    monitor-enter v2

    .line 212
    :try_start_0
    invoke-interface {v2}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v10

    .line 213
    .local v10, "v":Ljava/lang/Object;, "TT;"
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    if-nez v10, :cond_3

    const/4 v3, 0x1

    .line 217
    .local v3, "empty":Z
    :goto_2
    if-eqz v1, :cond_5

    .line 218
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->error:Ljava/lang/Throwable;

    .line 219
    .local v6, "ex":Ljava/lang/Throwable;
    if-eqz v6, :cond_4

    .line 220
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->clear(Ljava/util/Deque;)V

    .line 221
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 213
    .end local v3    # "empty":Z
    .end local v6    # "ex":Ljava/lang/Throwable;
    .end local v10    # "v":Ljava/lang/Object;, "TT;"
    :catchall_0
    move-exception v11

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v11

    .line 215
    .restart local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    .line 224
    .restart local v3    # "empty":Z
    .restart local v6    # "ex":Ljava/lang/Throwable;
    :cond_4
    if-eqz v3, :cond_5

    .line 225
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 230
    .end local v6    # "ex":Ljava/lang/Throwable;
    :cond_5
    if-eqz v3, :cond_7

    .line 239
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_6
    cmp-long v11, v4, v8

    if-nez v11, :cond_a

    .line 240
    iget-boolean v11, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->cancelled:Z

    if-eqz v11, :cond_8

    .line 241
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->clear(Ljava/util/Deque;)V

    goto :goto_0

    .line 234
    .restart local v1    # "d":Z
    .restart local v3    # "empty":Z
    .restart local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-interface {v0, v10}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 236
    const-wide/16 v12, 0x1

    add-long/2addr v4, v12

    .line 237
    goto :goto_1

    .line 245
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v10    # "v":Ljava/lang/Object;, "TT;"
    :cond_8
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    .line 249
    .restart local v1    # "d":Z
    monitor-enter v2

    .line 250
    :try_start_2
    invoke-interface {v2}, Ljava/util/Deque;->isEmpty()Z

    move-result v3

    .line 251
    .restart local v3    # "empty":Z
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 253
    if-eqz v1, :cond_a

    .line 254
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->error:Ljava/lang/Throwable;

    .line 255
    .restart local v6    # "ex":Ljava/lang/Throwable;
    if-eqz v6, :cond_9

    .line 256
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->clear(Ljava/util/Deque;)V

    .line 257
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 251
    .end local v3    # "empty":Z
    .end local v6    # "ex":Ljava/lang/Throwable;
    :catchall_1
    move-exception v11

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v11

    .line 260
    .restart local v3    # "empty":Z
    .restart local v6    # "ex":Ljava/lang/Throwable;
    :cond_9
    if-eqz v3, :cond_a

    .line 261
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 267
    .end local v1    # "d":Z
    .end local v3    # "empty":Z
    .end local v6    # "ex":Ljava/lang/Throwable;
    :cond_a
    const-wide/16 v12, 0x0

    cmp-long v11, v4, v12

    if-eqz v11, :cond_b

    .line 268
    iget-object v11, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v11, v4, v5}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 271
    :cond_b
    neg-int v11, v7

    invoke-virtual {p0, v11}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->addAndGet(I)I

    move-result v7

    .line 272
    if-nez v7, :cond_1

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    .line 163
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->drain()V

    .line 164
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 152
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 158
    :goto_0
    return-void

    .line 155
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->error:Ljava/lang/Throwable;

    .line 156
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->done:Z

    if-eqz v4, :cond_1

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 105
    :cond_1
    const/4 v1, 0x0

    .line 106
    .local v1, "callOnOverflow":Z
    const/4 v0, 0x0

    .line 107
    .local v0, "callError":Z
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->deque:Ljava/util/Deque;

    .line 108
    .local v2, "dq":Ljava/util/Deque;, "Ljava/util/Deque<TT;>;"
    monitor-enter v2

    .line 109
    :try_start_0
    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v4

    int-to-long v4, v4

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->bufferSize:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 110
    sget-object v4, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$1;->$SwitchMap$io$reactivex$BackpressureOverflowStrategy:[I

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->strategy:Lio/reactivex/BackpressureOverflowStrategy;

    invoke-virtual {v5}, Lio/reactivex/BackpressureOverflowStrategy;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 123
    const/4 v0, 0x1

    .line 129
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    if-eqz v1, :cond_3

    .line 132
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->onOverflow:Lio/reactivex/functions/Action;

    if-eqz v4, :cond_0

    .line 134
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->onOverflow:Lio/reactivex/functions/Action;

    invoke-interface {v4}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v3

    .line 136
    .local v3, "ex":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 137
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 138
    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 112
    .end local v3    # "ex":Ljava/lang/Throwable;
    :pswitch_0
    :try_start_2
    invoke-interface {v2}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    .line 113
    invoke-interface {v2, p1}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    .line 114
    const/4 v1, 0x1

    .line 115
    goto :goto_1

    .line 117
    :pswitch_1
    invoke-interface {v2}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    .line 118
    invoke-interface {v2, p1}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    .line 119
    const/4 v1, 0x1

    .line 120
    goto :goto_1

    .line 127
    :cond_2
    invoke-interface {v2, p1}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    goto :goto_1

    .line 129
    :catchall_0
    move-exception v4

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 141
    :cond_3
    if-eqz v0, :cond_4

    .line 142
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 143
    new-instance v4, Lio/reactivex/exceptions/MissingBackpressureException;

    invoke-direct {v4}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>()V

    invoke-virtual {p0, v4}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 145
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->drain()V

    goto :goto_0

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 94
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 96
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 98
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 170
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBufferStrategy$OnBackpressureBufferStrategySubscriber;->drain()V

    .line 172
    :cond_0
    return-void
.end method
