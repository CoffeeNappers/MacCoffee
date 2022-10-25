.class public final Lio/reactivex/processors/UnicastProcessor;
.super Lio/reactivex/processors/FlowableProcessor;
.source "UnicastProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/processors/UnicastProcessor$UnicastQueueSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/processors/FlowableProcessor",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final delayError:Z

.field volatile done:Z

.field enableOperatorFusion:Z

.field error:Ljava/lang/Throwable;

.field final onTerminate:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "capacityHint"    # I

    .prologue
    .line 150
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lio/reactivex/processors/UnicastProcessor;-><init>(ILjava/lang/Runnable;Z)V

    .line 151
    return-void
.end method

.method constructor <init>(ILjava/lang/Runnable;)V
    .locals 1
    .param p1, "capacityHint"    # I
    .param p2, "onTerminate"    # Ljava/lang/Runnable;

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lio/reactivex/processors/UnicastProcessor;-><init>(ILjava/lang/Runnable;Z)V

    .line 162
    return-void
.end method

.method constructor <init>(ILjava/lang/Runnable;Z)V
    .locals 2
    .param p1, "capacityHint"    # I
    .param p2, "onTerminate"    # Ljava/lang/Runnable;
    .param p3, "delayError"    # Z

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    invoke-direct {p0}, Lio/reactivex/processors/FlowableProcessor;-><init>()V

    .line 173
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    const-string/jumbo v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 174
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    .line 175
    iput-boolean p3, p0, Lio/reactivex/processors/UnicastProcessor;->delayError:Z

    .line 176
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    .line 177
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 178
    new-instance v0, Lio/reactivex/processors/UnicastProcessor$UnicastQueueSubscription;

    invoke-direct {v0, p0}, Lio/reactivex/processors/UnicastProcessor$UnicastQueueSubscription;-><init>(Lio/reactivex/processors/UnicastProcessor;)V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    .line 179
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 180
    return-void
.end method

.method public static create()Lio/reactivex/processors/UnicastProcessor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 78
    new-instance v0, Lio/reactivex/processors/UnicastProcessor;

    invoke-static {}, Lio/reactivex/processors/UnicastProcessor;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/processors/UnicastProcessor;-><init>(I)V

    return-object v0
.end method

.method public static create(I)Lio/reactivex/processors/UnicastProcessor;
    .locals 1
    .param p0, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 89
    new-instance v0, Lio/reactivex/processors/UnicastProcessor;

    invoke-direct {v0, p0}, Lio/reactivex/processors/UnicastProcessor;-><init>(I)V

    return-object v0
.end method

.method public static create(ILjava/lang/Runnable;)Lio/reactivex/processors/UnicastProcessor;
    .locals 1
    .param p0, "capacityHint"    # I
    .param p1, "onCancelled"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Runnable;",
            ")",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 119
    const-string/jumbo v0, "onTerminate"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 120
    new-instance v0, Lio/reactivex/processors/UnicastProcessor;

    invoke-direct {v0, p0, p1}, Lio/reactivex/processors/UnicastProcessor;-><init>(ILjava/lang/Runnable;)V

    return-object v0
.end method

.method public static create(ILjava/lang/Runnable;Z)Lio/reactivex/processors/UnicastProcessor;
    .locals 1
    .param p0, "capacityHint"    # I
    .param p1, "onCancelled"    # Ljava/lang/Runnable;
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Runnable;",
            "Z)",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 140
    const-string/jumbo v0, "onTerminate"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    new-instance v0, Lio/reactivex/processors/UnicastProcessor;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/processors/UnicastProcessor;-><init>(ILjava/lang/Runnable;Z)V

    return-object v0
.end method

.method public static create(Z)Lio/reactivex/processors/UnicastProcessor;
    .locals 3
    .param p0, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 102
    new-instance v0, Lio/reactivex/processors/UnicastProcessor;

    invoke-static {}, Lio/reactivex/processors/UnicastProcessor;->bufferSize()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lio/reactivex/processors/UnicastProcessor;-><init>(ILjava/lang/Runnable;Z)V

    return-object v0
.end method


# virtual methods
.method checkTerminated(ZZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z
    .locals 4
    .param p1, "failFast"    # Z
    .param p2, "d"    # Z
    .param p3, "empty"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    .local p4, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p5, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 303
    iget-boolean v2, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v2, :cond_0

    .line 304
    invoke-virtual {p5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 305
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 328
    :goto_0
    return v1

    .line 309
    :cond_0
    if-eqz p2, :cond_3

    .line 310
    if-eqz p1, :cond_1

    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v2, :cond_1

    .line 311
    invoke-virtual {p5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 312
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 313
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    invoke-interface {p4, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 316
    :cond_1
    if-eqz p3, :cond_3

    .line 317
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    .line 318
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 319
    if-eqz v0, :cond_2

    .line 320
    invoke-interface {p4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 322
    :cond_2
    invoke-interface {p4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 328
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method doTerminate()V
    .locals 3

    .prologue
    .line 183
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/UnicastProcessor;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 184
    .local v0, "r":Ljava/lang/Runnable;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lio/reactivex/processors/UnicastProcessor;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 187
    :cond_0
    return-void
.end method

.method drain()V
    .locals 4

    .prologue
    .line 276
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    invoke-virtual {v2}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;->getAndIncrement()I

    move-result v2

    if-eqz v2, :cond_1

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 280
    :cond_1
    const/4 v1, 0x1

    .line 282
    .local v1, "missed":I
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscriber;

    .line 284
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :goto_1
    if-eqz v0, :cond_3

    .line 286
    iget-boolean v2, p0, Lio/reactivex/processors/UnicastProcessor;->enableOperatorFusion:Z

    if-eqz v2, :cond_2

    .line 287
    invoke-virtual {p0, v0}, Lio/reactivex/processors/UnicastProcessor;->drainFused(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 289
    :cond_2
    invoke-virtual {p0, v0}, Lio/reactivex/processors/UnicastProcessor;->drainRegular(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 294
    :cond_3
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    neg-int v3, v1

    invoke-virtual {v2, v3}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;->addAndGet(I)I

    move-result v1

    .line 295
    if-eqz v1, :cond_0

    .line 298
    iget-object v2, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    check-cast v0, Lorg/reactivestreams/Subscriber;

    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    goto :goto_1
.end method

.method drainFused(Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v7, 0x0

    .line 234
    const/4 v3, 0x1

    .line 236
    .local v3, "missed":I
    iget-object v4, p0, Lio/reactivex/processors/UnicastProcessor;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 237
    .local v4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/processors/UnicastProcessor;->delayError:Z

    if-nez v5, :cond_1

    const/4 v2, 0x1

    .line 240
    .local v2, "failFast":Z
    :cond_0
    :goto_0
    iget-boolean v5, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v5, :cond_2

    .line 241
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 242
    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 273
    :goto_1
    return-void

    .line 237
    .end local v2    # "failFast":Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 246
    .restart local v2    # "failFast":Z
    :cond_2
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    .line 248
    .local v0, "d":Z
    if-eqz v2, :cond_3

    if-eqz v0, :cond_3

    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v5, :cond_3

    .line 249
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 250
    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 251
    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    invoke-interface {p1, v5}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 254
    :cond_3
    invoke-interface {p1, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 256
    if-eqz v0, :cond_5

    .line 257
    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 259
    iget-object v1, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    .line 260
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_4

    .line 261
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 263
    :cond_4
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 268
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_5
    iget-object v5, p0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    neg-int v6, v3

    invoke-virtual {v5, v6}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;->addAndGet(I)I

    move-result v3

    .line 269
    if-nez v3, :cond_0

    goto :goto_1
.end method

.method drainRegular(Lorg/reactivestreams/Subscriber;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/16 v16, 0x1

    .line 192
    .local v16, "missed":I
    move-object/from16 v0, p0

    iget-object v7, v0, Lio/reactivex/processors/UnicastProcessor;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 193
    .local v7, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/processors/UnicastProcessor;->delayError:Z

    if-nez v2, :cond_2

    const/4 v3, 0x1

    .line 196
    .local v3, "failFast":Z
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/processors/UnicastProcessor;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v18

    .line 197
    .local v18, "r":J
    const-wide/16 v14, 0x0

    .line 199
    .local v14, "e":J
    :goto_1
    cmp-long v2, v18, v14

    if-eqz v2, :cond_5

    .line 200
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    .line 202
    .local v4, "d":Z
    invoke-virtual {v7}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v17

    .line 203
    .local v17, "t":Ljava/lang/Object;, "TT;"
    if-nez v17, :cond_3

    const/4 v5, 0x1

    .local v5, "empty":Z
    :goto_2
    move-object/from16 v2, p0

    move-object/from16 v6, p1

    .line 205
    invoke-virtual/range {v2 .. v7}, Lio/reactivex/processors/UnicastProcessor;->checkTerminated(ZZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 231
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v17    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    :goto_3
    return-void

    .line 193
    .end local v3    # "failFast":Z
    .end local v14    # "e":J
    .end local v18    # "r":J
    :cond_2
    const/4 v3, 0x0

    goto :goto_0

    .line 203
    .restart local v3    # "failFast":Z
    .restart local v4    # "d":Z
    .restart local v14    # "e":J
    .restart local v17    # "t":Ljava/lang/Object;, "TT;"
    .restart local v18    # "r":J
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .line 209
    .restart local v5    # "empty":Z
    :cond_4
    if-eqz v5, :cond_8

    .line 218
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v17    # "t":Ljava/lang/Object;, "TT;"
    :cond_5
    cmp-long v2, v18, v14

    if-nez v2, :cond_6

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    invoke-virtual {v7}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v11

    move-object/from16 v8, p0

    move v9, v3

    move-object/from16 v12, p1

    move-object v13, v7

    invoke-virtual/range {v8 .. v13}, Lio/reactivex/processors/UnicastProcessor;->checkTerminated(ZZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 222
    :cond_6
    const-wide/16 v8, 0x0

    cmp-long v2, v14, v8

    if-eqz v2, :cond_7

    const-wide v8, 0x7fffffffffffffffL

    cmp-long v2, v18, v8

    if-eqz v2, :cond_7

    .line 223
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/processors/UnicastProcessor;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v8, v14

    invoke-virtual {v2, v8, v9}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 226
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    move/from16 v0, v16

    neg-int v6, v0

    invoke-virtual {v2, v6}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;->addAndGet(I)I

    move-result v16

    .line 227
    if-nez v16, :cond_0

    goto :goto_3

    .line 213
    .restart local v4    # "d":Z
    .restart local v5    # "empty":Z
    .restart local v17    # "t":Ljava/lang/Object;, "TT;"
    :cond_8
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 215
    const-wide/16 v8, 0x1

    add-long/2addr v14, v8

    .line 216
    goto :goto_1
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 466
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-eqz v0, :cond_0

    .line 467
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    .line 469
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 1

    .prologue
    .line 474
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSubscribers()Z
    .locals 1

    .prologue
    .line 461
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasThrowable()Z
    .locals 1

    .prologue
    .line 479
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 376
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v0, :cond_1

    .line 385
    :cond_0
    :goto_0
    return-void

    .line 380
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    .line 382
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->doTerminate()V

    .line 384
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 357
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v0, :cond_1

    .line 358
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 372
    :goto_0
    return-void

    .line 362
    :cond_1
    if-nez p1, :cond_2

    .line 363
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 366
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    iput-object p1, p0, Lio/reactivex/processors/UnicastProcessor;->error:Ljava/lang/Throwable;

    .line 367
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    .line 369
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->doTerminate()V

    .line 371
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 342
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v0, :cond_1

    .line 353
    :cond_0
    :goto_0
    return-void

    .line 346
    :cond_1
    if-nez p1, :cond_2

    .line 347
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/processors/UnicastProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 351
    :cond_2
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 352
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 333
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v0, :cond_1

    .line 334
    :cond_0
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 338
    :goto_0
    return-void

    .line 336
    :cond_1
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
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
    .line 389
    .local p0, "this":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 391
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->wip:Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 392
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 393
    iget-boolean v0, p0, Lio/reactivex/processors/UnicastProcessor;->cancelled:Z

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, p0, Lio/reactivex/processors/UnicastProcessor;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 401
    :goto_0
    return-void

    .line 396
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/processors/UnicastProcessor;->drain()V

    goto :goto_0

    .line 399
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "This processor allows only a single Subscriber"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
