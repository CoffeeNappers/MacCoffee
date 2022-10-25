.class final Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "MaybeMergeArray.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeMergeArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MergeMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TT;>;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x92a32049d0458bbL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field consumed:J

.field final error:Lio/reactivex/internal/util/AtomicThrowable;

.field outputFused:Z

.field final queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final set:Lio/reactivex/disposables/CompositeDisposable;

.field final sourceCount:I


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;)V
    .locals 1
    .param p2, "sourceCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I",
            "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "queue":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 94
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 95
    iput p2, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->sourceCount:I

    .line 96
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    .line 97
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 98
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 99
    iput-object p3, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    .line 100
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->cancelled:Z

    .line 145
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 146
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 147
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    invoke-interface {v0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 150
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 130
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    invoke-interface {v0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 131
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 290
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    :goto_0
    return-void

    .line 294
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->outputFused:Z

    if-eqz v0, :cond_1

    .line 295
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drainFused()V

    goto :goto_0

    .line 297
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drainNormal()V

    goto :goto_0
.end method

.method drainFused()V
    .locals 7

    .prologue
    .line 254
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    const/4 v3, 0x1

    .line 255
    .local v3, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 256
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    .line 259
    .local v4, "q":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    :cond_0
    iget-boolean v5, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->cancelled:Z

    if-eqz v5, :cond_1

    .line 260
    invoke-interface {v4}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 287
    :goto_0
    return-void

    .line 263
    :cond_1
    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v5}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 264
    .local v2, "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_2

    .line 265
    invoke-interface {v4}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 266
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 270
    :cond_2
    invoke-interface {v4}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->producerIndex()I

    move-result v5

    iget v6, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->sourceCount:I

    if-ne v5, v6, :cond_4

    const/4 v1, 0x1

    .line 272
    .local v1, "d":Z
    :goto_1
    invoke-interface {v4}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 273
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 276
    :cond_3
    if-eqz v1, :cond_5

    .line 277
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 270
    .end local v1    # "d":Z
    :cond_4
    const/4 v1, 0x0

    goto :goto_1

    .line 281
    .restart local v1    # "d":Z
    :cond_5
    neg-int v5, v3

    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->addAndGet(I)I

    move-result v3

    .line 282
    if-nez v3, :cond_0

    goto :goto_0
.end method

.method drainNormal()V
    .locals 12

    .prologue
    .line 186
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    const/4 v4, 0x1

    .line 187
    .local v4, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 188
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    .line 189
    .local v5, "q":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->consumed:J

    .line 193
    .local v2, "e":J
    :cond_0
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 195
    .local v6, "r":J
    :cond_1
    :goto_0
    cmp-long v9, v2, v6

    if-eqz v9, :cond_5

    .line 196
    iget-boolean v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->cancelled:Z

    if-eqz v9, :cond_2

    .line 197
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 251
    :goto_1
    return-void

    .line 201
    :cond_2
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 202
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_3

    .line 203
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 204
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v0, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 208
    :cond_3
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->consumerIndex()I

    move-result v9

    iget v10, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->sourceCount:I

    if-ne v9, v10, :cond_4

    .line 209
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 213
    :cond_4
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->poll()Ljava/lang/Object;

    move-result-object v8

    .line 215
    .local v8, "v":Ljava/lang/Object;
    if-nez v8, :cond_6

    .line 226
    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v8    # "v":Ljava/lang/Object;
    :cond_5
    cmp-long v9, v2, v6

    if-nez v9, :cond_9

    .line 227
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 228
    .restart local v1    # "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_7

    .line 229
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->clear()V

    .line 230
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v9

    invoke-interface {v0, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 219
    .restart local v8    # "v":Ljava/lang/Object;
    :cond_6
    sget-object v9, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-eq v8, v9, :cond_1

    .line 220
    invoke-interface {v0, v8}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 222
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    goto :goto_0

    .line 234
    .end local v8    # "v":Ljava/lang/Object;
    :cond_7
    :goto_2
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->peek()Ljava/lang/Object;

    move-result-object v9

    sget-object v10, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne v9, v10, :cond_8

    .line 235
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->drop()V

    goto :goto_2

    .line 238
    :cond_8
    invoke-interface {v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->consumerIndex()I

    move-result v9

    iget v10, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->sourceCount:I

    if-ne v9, v10, :cond_9

    .line 239
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 244
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_9
    iput-wide v2, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->consumed:J

    .line 245
    neg-int v9, v4

    invoke-virtual {p0, v9}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->addAndGet(I)I

    move-result v4

    .line 246
    if-nez v4, :cond_0

    goto :goto_1
.end method

.method isCancelled()Z
    .locals 1

    .prologue
    .line 181
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->cancelled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 125
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    invoke-interface {v0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 176
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-interface {v0, v1}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->offer(Ljava/lang/Object;)Z

    .line 177
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drain()V

    .line 178
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 165
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 167
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-interface {v0, v1}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->offer(Ljava/lang/Object;)Z

    .line 168
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drain()V

    .line 172
    :goto_0
    return-void

    .line 170
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 154
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 155
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    invoke-interface {v0, p1}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->offer(Ljava/lang/Object;)Z

    .line 160
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drain()V

    .line 161
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->queue:Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;

    invoke-interface {v1}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 117
    .local v0, "o":Ljava/lang/Object;
    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-eq v0, v1, :cond_0

    .line 118
    return-object v0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 137
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->drain()V

    .line 139
    :cond_0
    return-void
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->outputFused:Z

    .line 106
    const/4 v0, 0x2

    .line 108
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
