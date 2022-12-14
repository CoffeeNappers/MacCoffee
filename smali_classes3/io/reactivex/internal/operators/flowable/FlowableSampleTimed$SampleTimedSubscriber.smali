.class abstract Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableSampleTimed.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSampleTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SampleTimedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<TT;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x30d108f96c89b153L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final period:J

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field final scheduler:Lio/reactivex/Scheduler;

.field final timer:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 2
    .param p2, "period"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 62
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 64
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 69
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 70
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->period:J

    .line 71
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 72
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    .line 73
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->cancelTimer()V

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 117
    return-void
.end method

.method cancelTimer()V
    .locals 1

    .prologue
    .line 103
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 104
    return-void
.end method

.method abstract complete()V
.end method

.method emit()V
    .locals 6

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 121
    .local v2, "value":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_0

    .line 122
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 123
    .local v0, "r":J
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-eqz v3, :cond_1

    .line 124
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 125
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v4, 0x1

    invoke-static {v3, v4, v5}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 131
    .end local v0    # "r":J
    :cond_0
    :goto_0
    return-void

    .line 127
    .restart local v0    # "r":J
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->cancel()V

    .line 128
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v4, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v5, "Couldn\'t emit value due to lack of requests!"

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->cancelTimer()V

    .line 99
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->complete()V

    .line 100
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->cancelTimer()V

    .line 93
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 94
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->lazySet(Ljava/lang/Object;)V

    .line 88
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 8
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 79
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 80
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->period:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->period:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    invoke-virtual {v7, v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 81
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 83
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSampleTimed$SampleTimedSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 111
    :cond_0
    return-void
.end method
