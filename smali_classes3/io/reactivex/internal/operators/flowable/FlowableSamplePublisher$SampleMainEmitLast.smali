.class final Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;
.super Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SamplePublisherSubscriber;
.source "FlowableSamplePublisher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SampleMainEmitLast"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SamplePublisherSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2a0bdab9530de829L


# instance fields
.field volatile done:Z

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lorg/reactivestreams/Publisher;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lorg/reactivestreams/Publisher",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;, "Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<*>;"
    invoke-direct {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SamplePublisherSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lorg/reactivestreams/Publisher;)V

    .line 208
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 209
    return-void
.end method


# virtual methods
.method completeMain()V
    .locals 1

    .prologue
    .line 213
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;, "Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->done:Z

    .line 214
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 215
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->emit()V

    .line 216
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 218
    :cond_0
    return-void
.end method

.method completeOther()V
    .locals 1

    .prologue
    .line 222
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;, "Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->done:Z

    .line 223
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 224
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->emit()V

    .line 225
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 227
    :cond_0
    return-void
.end method

.method run()V
    .locals 2

    .prologue
    .line 231
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;, "Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 233
    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->done:Z

    .line 234
    .local v0, "d":Z
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->emit()V

    .line 235
    if-eqz v0, :cond_2

    .line 236
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 241
    .end local v0    # "d":Z
    :cond_1
    :goto_0
    return-void

    .line 239
    .restart local v0    # "d":Z
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSamplePublisher$SampleMainEmitLast;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0
.end method
