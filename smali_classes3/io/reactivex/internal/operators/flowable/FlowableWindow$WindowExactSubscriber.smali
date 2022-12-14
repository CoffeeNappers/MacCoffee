.class final Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableWindow.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x20d478356927aeadL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field index:J

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field s:Lorg/reactivestreams/Subscription;

.field final size:J

.field window:Lio/reactivex/processors/UnicastProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/UnicastProcessor",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JI)V
    .locals 2
    .param p2, "size"    # J
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;JI)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 77
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 78
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->size:J

    .line 79
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 80
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->bufferSize:I

    .line 81
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 3

    .prologue
    .line 150
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->run()V

    .line 153
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 132
    .local v0, "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    if-eqz v0, :cond_0

    .line 133
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 134
    invoke-interface {v0}, Lorg/reactivestreams/Processor;->onComplete()V

    .line 137
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 138
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 121
    .local v0, "w":Lorg/reactivestreams/Processor;, "Lorg/reactivestreams/Processor<TT;TT;>;"
    if-eqz v0, :cond_0

    .line 122
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 123
    invoke-interface {v0, p1}, Lorg/reactivestreams/Processor;->onError(Ljava/lang/Throwable;)V

    .line 126
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 127
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v6, 0x0

    .line 93
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->index:J

    .line 95
    .local v0, "i":J
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 96
    .local v2, "w":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TT;>;"
    cmp-long v3, v0, v6

    if-nez v3, :cond_0

    .line 97
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->getAndIncrement()I

    .line 99
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->bufferSize:I

    invoke-static {v3, p0}, Lio/reactivex/processors/UnicastProcessor;->create(ILjava/lang/Runnable;)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v2

    .line 100
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 102
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 105
    :cond_0
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 107
    invoke-virtual {v2, p1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    .line 109
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->size:J

    cmp-long v3, v0, v4

    if-nez v3, :cond_1

    .line 110
    iput-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->index:J

    .line 111
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    .line 112
    invoke-virtual {v2}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_1
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->index:J

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 87
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 89
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 143
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->size:J

    invoke-static {v2, v3, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v0

    .line 144
    .local v0, "u":J
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 146
    .end local v0    # "u":J
    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindow$WindowExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 160
    :cond_0
    return-void
.end method
