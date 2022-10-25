.class public final Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "FlowableGroupBy.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableGroupBy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GroupBySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<",
        "Lio/reactivex/flowables/GroupedFlowable",
        "<TK;TV;>;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final NULL_KEY:Ljava/lang/Object;

.field private static final serialVersionUID:J = -0x332f71b8460722ceL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/flowables/GroupedFlowable",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final delayError:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final groupCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final groups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;"
        }
    .end annotation
.end field

.field outputFused:Z

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Lio/reactivex/flowables/GroupedFlowable",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final valueSelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->NULL_KEY:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;IZ)V
    .locals 2
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/flowables/GroupedFlowable",
            "<TK;TV;>;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p3, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 82
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 83
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->keySelector:Lio/reactivex/functions/Function;

    .line 84
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->valueSelector:Lio/reactivex/functions/Function;

    .line 85
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->bufferSize:I

    .line 86
    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->delayError:Z

    .line 87
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    .line 88
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 89
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 194
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 196
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 199
    :cond_0
    return-void
.end method

.method public cancel(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-eqz p1, :cond_1

    move-object v0, p1

    .line 203
    .local v0, "mapKey":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_0

    .line 205
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 207
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_0

    .line 208
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 211
    :cond_0
    return-void

    .line 202
    .end local v0    # "mapKey":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->NULL_KEY:Ljava/lang/Object;

    goto :goto_0
.end method

.method checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lorg/reactivestreams/Subscriber",
            "<*>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    .local p3, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    const/4 v1, 0x1

    .line 317
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 318
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 346
    :goto_0
    return v1

    .line 322
    :cond_0
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->delayError:Z

    if-eqz v2, :cond_2

    .line 323
    if-eqz p1, :cond_4

    if-eqz p2, :cond_4

    .line 324
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->error:Ljava/lang/Throwable;

    .line 325
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 326
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 328
    :cond_1
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 333
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_2
    if-eqz p1, :cond_4

    .line 334
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->error:Ljava/lang/Throwable;

    .line 335
    .restart local v0    # "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 336
    invoke-virtual {p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 337
    invoke-interface {p3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 339
    :cond_3
    if-eqz p2, :cond_4

    .line 340
    invoke-interface {p3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 346
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 366
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 367
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 214
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    :goto_0
    return-void

    .line 218
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->outputFused:Z

    if-eqz v0, :cond_1

    .line 219
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drainFused()V

    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drainNormal()V

    goto :goto_0
.end method

.method drainFused()V
    .locals 6

    .prologue
    .line 226
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    const/4 v3, 0x1

    .line 228
    .local v3, "missed":I
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 229
    .local v4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 232
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 233
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 262
    :goto_0
    return-void

    .line 237
    :cond_1
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    .line 239
    .local v1, "d":Z
    if-eqz v1, :cond_2

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->delayError:Z

    if-nez v5, :cond_2

    .line 240
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->error:Ljava/lang/Throwable;

    .line 241
    .local v2, "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_2

    .line 242
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 243
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 248
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_2
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 250
    if-eqz v1, :cond_4

    .line 251
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->error:Ljava/lang/Throwable;

    .line 252
    .restart local v2    # "ex":Ljava/lang/Throwable;
    if-eqz v2, :cond_3

    .line 253
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 255
    :cond_3
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 260
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_4
    neg-int v5, v3

    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->addAndGet(I)I

    move-result v3

    .line 261
    if-nez v3, :cond_0

    goto :goto_0
.end method

.method drainNormal()V
    .locals 14

    .prologue
    .line 268
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    const/4 v5, 0x1

    .line 270
    .local v5, "missed":I
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 271
    .local v6, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 275
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    :cond_0
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 276
    .local v8, "r":J
    const-wide/16 v2, 0x0

    .line 278
    .local v2, "e":J
    :goto_0
    cmp-long v10, v2, v8

    if-eqz v10, :cond_4

    .line 279
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    .line 281
    .local v1, "d":Z
    invoke-virtual {v6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/reactivex/flowables/GroupedFlowable;

    .line 283
    .local v7, "t":Lio/reactivex/flowables/GroupedFlowable;, "Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;"
    if-nez v7, :cond_2

    const/4 v4, 0x1

    .line 285
    .local v4, "empty":Z
    :goto_1
    invoke-virtual {p0, v1, v4, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 314
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "t":Lio/reactivex/flowables/GroupedFlowable;, "Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;"
    :cond_1
    :goto_2
    return-void

    .line 283
    .restart local v1    # "d":Z
    .restart local v7    # "t":Lio/reactivex/flowables/GroupedFlowable;, "Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;"
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 289
    .restart local v4    # "empty":Z
    :cond_3
    if-eqz v4, :cond_8

    .line 298
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v7    # "t":Lio/reactivex/flowables/GroupedFlowable;, "Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;"
    :cond_4
    cmp-long v10, v2, v8

    if-nez v10, :cond_5

    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    invoke-virtual {v6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v11

    invoke-virtual {p0, v10, v11, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 302
    :cond_5
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-eqz v10, :cond_7

    .line 303
    const-wide v10, 0x7fffffffffffffffL

    cmp-long v10, v8, v10

    if-eqz v10, :cond_6

    .line 304
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v12, v2

    invoke-virtual {v10, v12, v13}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 306
    :cond_6
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v10, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 309
    :cond_7
    neg-int v10, v5

    invoke-virtual {p0, v10}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->addAndGet(I)I

    move-result v5

    .line 310
    if-nez v5, :cond_0

    goto :goto_2

    .line 293
    .restart local v1    # "d":Z
    .restart local v4    # "empty":Z
    .restart local v7    # "t":Lio/reactivex/flowables/GroupedFlowable;, "Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;"
    :cond_8
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 295
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    .line 296
    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 371
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    if-nez v2, :cond_1

    .line 173
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;

    .line 174
    .local v0, "g":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;->onComplete()V

    goto :goto_0

    .line 176
    .end local v0    # "g":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 177
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    .line 178
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drain()V

    .line 180
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 157
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 168
    :goto_0
    return-void

    .line 160
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;

    .line 161
    .local v0, "g":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    invoke-virtual {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 163
    .end local v0    # "g":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 165
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->error:Ljava/lang/Throwable;

    .line 166
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    .line 167
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->done:Z

    if-eqz v7, :cond_1

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 110
    .local v5, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Lio/reactivex/flowables/GroupedFlowable<TK;TV;>;>;"
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v7, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 118
    .local v2, "key":Ljava/lang/Object;, "TK;"
    const/4 v4, 0x0

    .line 119
    .local v4, "newGroup":Z
    if-eqz v2, :cond_3

    move-object v3, v2

    .line 120
    .local v3, "mapKey":Ljava/lang/Object;
    :goto_1
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;

    .line 121
    .local v1, "group":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    if-nez v1, :cond_2

    .line 124
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_0

    .line 128
    iget v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->bufferSize:I

    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->delayError:Z

    invoke-static {v2, v7, p0, v8}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;->createWith(Ljava/lang/Object;ILio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;Z)Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;

    move-result-object v1

    .line 129
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groups:Ljava/util/Map;

    invoke-interface {v7, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->groupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 133
    const/4 v4, 0x1

    .line 138
    :cond_2
    :try_start_1
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->valueSelector:Lio/reactivex/functions/Function;

    invoke-interface {v7, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The valueSelector returned null"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 146
    .local v6, "v":Ljava/lang/Object;, "TV;"
    invoke-virtual {v1, v6}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;->onNext(Ljava/lang/Object;)V

    .line 148
    if-eqz v4, :cond_0

    .line 149
    invoke-virtual {v5, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 150
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drain()V

    goto :goto_0

    .line 111
    .end local v1    # "group":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    .end local v3    # "mapKey":Ljava/lang/Object;
    .end local v4    # "newGroup":Z
    .end local v6    # "v":Ljava/lang/Object;, "TV;"
    :catch_0
    move-exception v0

    .line 112
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 113
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v7}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 114
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 119
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "key":Ljava/lang/Object;, "TK;"
    .restart local v4    # "newGroup":Z
    :cond_3
    sget-object v3, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->NULL_KEY:Ljava/lang/Object;

    goto :goto_1

    .line 139
    .restart local v1    # "group":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupedUnicast<TK;TV;>;"
    .restart local v3    # "mapKey":Ljava/lang/Object;
    :catch_1
    move-exception v0

    .line 140
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 141
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v7}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 142
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 95
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 96
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 98
    :cond_0
    return-void
.end method

.method public poll()Lio/reactivex/flowables/GroupedFlowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/flowables/GroupedFlowable",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 361
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/flowables/GroupedFlowable;

    return-object v0
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->poll()Lio/reactivex/flowables/GroupedFlowable;

    move-result-object v0

    return-object v0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 184
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 186
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->drain()V

    .line 188
    :cond_0
    return-void
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 351
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber<TT;TK;TV;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 352
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupBy$GroupBySubscriber;->outputFused:Z

    .line 353
    const/4 v0, 0x2

    .line 355
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
