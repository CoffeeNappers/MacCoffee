.class final Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableWindowTimed.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactUnboundedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber",
        "<TT;",
        "Ljava/lang/Object;",
        "Lio/reactivex/Flowable",
        "<TT;>;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field static final NEXT:Ljava/lang/Object;


# instance fields
.field final bufferSize:I

.field s:Lorg/reactivestreams/Subscription;

.field final scheduler:Lio/reactivex/Scheduler;

.field volatile terminated:Z

.field final timer:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field window:Lio/reactivex/processors/UnicastProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->NEXT:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)V
    .locals 2
    .param p2, "timespan"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 89
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 98
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timespan:J

    .line 99
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 100
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    .line 101
    iput p6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->bufferSize:I

    .line 102
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 184
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->cancelled:Z

    .line 185
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 188
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 189
    return-void
.end method

.method drainLoop()V
    .locals 13

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    const/4 v12, 0x0

    .line 207
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 208
    .local v5, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 209
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 211
    .local v9, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    const/4 v3, 0x1

    .line 215
    .local v3, "missed":I
    :cond_0
    :goto_0
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->terminated:Z

    .line 217
    .local v8, "term":Z
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->done:Z

    .line 219
    .local v1, "d":Z
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    .line 221
    .local v4, "o":Ljava/lang/Object;
    if-eqz v1, :cond_3

    if-eqz v4, :cond_1

    sget-object v10, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->NEXT:Ljava/lang/Object;

    if-ne v4, v10, :cond_3

    .line 222
    :cond_1
    iput-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 223
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 224
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->dispose()V

    .line 225
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->error:Ljava/lang/Throwable;

    .line 226
    .local v2, "err":Ljava/lang/Throwable;
    if-eqz v2, :cond_2

    .line 227
    invoke-virtual {v9, v2}, Lio/reactivex/processors/UnicastProcessor;->onError(Ljava/lang/Throwable;)V

    .line 272
    .end local v2    # "err":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 229
    .restart local v2    # "err":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v9}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    goto :goto_1

    .line 234
    .end local v2    # "err":Ljava/lang/Throwable;
    :cond_3
    if-nez v4, :cond_4

    .line 267
    neg-int v10, v3

    invoke-virtual {p0, v10}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->leave(I)I

    move-result v3

    .line 268
    if-nez v3, :cond_0

    goto :goto_1

    .line 238
    :cond_4
    sget-object v10, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->NEXT:Ljava/lang/Object;

    if-ne v4, v10, :cond_7

    .line 239
    invoke-virtual {v9}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    .line 240
    if-nez v8, :cond_6

    .line 241
    iget v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->bufferSize:I

    invoke-static {v10}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v9

    .line 242
    iput-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 244
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->requested()J

    move-result-wide v6

    .line 245
    .local v6, "r":J
    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-eqz v10, :cond_5

    .line 246
    invoke-interface {v0, v9}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 247
    const-wide v10, 0x7fffffffffffffffL

    cmp-long v10, v6, v10

    if-eqz v10, :cond_0

    .line 248
    const-wide/16 v10, 0x1

    invoke-virtual {p0, v10, v11}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->produced(J)J

    goto :goto_0

    .line 251
    :cond_5
    iput-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 252
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v10}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 253
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v10}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 254
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->dispose()V

    .line 255
    new-instance v10, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v11, "Could not deliver first window due to lack of requests."

    invoke-direct {v10, v11}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v10}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 259
    .end local v6    # "r":J
    :cond_6
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v10}, Lorg/reactivestreams/Subscription;->cancel()V

    goto :goto_0

    .line 264
    :cond_7
    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->done:Z

    .line 169
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->drainLoop()V

    .line 173
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 174
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->dispose()V

    .line 175
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->error:Ljava/lang/Throwable;

    .line 157
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->done:Z

    .line 158
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->drainLoop()V

    .line 162
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 163
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->dispose()V

    .line 164
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->terminated:Z

    if-eqz v0, :cond_1

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 140
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->fastEnter()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 141
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-virtual {v0, p1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    .line 142
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->leave(I)I

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->drainLoop()V

    goto :goto_0

    .line 146
    :cond_3
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 147
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->enter()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 14
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    const-wide v12, 0x7fffffffffffffffL

    .line 106
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 109
    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 111
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 112
    .local v7, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    invoke-interface {v7, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 114
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->requested()J

    move-result-wide v8

    .line 115
    .local v8, "r":J
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-eqz v0, :cond_2

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-interface {v7, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 117
    cmp-long v0, v8, v12

    if-eqz v0, :cond_0

    .line 118
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->produced(J)J

    .line 127
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->cancelled:Z

    if-nez v0, :cond_1

    .line 128
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    invoke-virtual {v10, v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    invoke-interface {p1, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 133
    .end local v7    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    .end local v8    # "r":J
    :cond_1
    :goto_0
    return-void

    .line 121
    .restart local v7    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    .restart local v8    # "r":J
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->cancelled:Z

    .line 122
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 123
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v1, "Could not deliver first window due to lack of requests."

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v7, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 179
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->requested(J)V

    .line 180
    return-void
.end method

.method public run()V
    .locals 2

    .prologue
    .line 194
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->cancelled:Z

    if-eqz v0, :cond_0

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->terminated:Z

    .line 196
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->dispose()V

    .line 198
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->NEXT:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 199
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactUnboundedSubscriber;->drainLoop()V

    .line 203
    :cond_1
    return-void
.end method
