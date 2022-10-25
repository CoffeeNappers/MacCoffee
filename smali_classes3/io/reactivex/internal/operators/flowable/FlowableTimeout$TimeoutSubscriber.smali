.class final Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;
.super Ljava/lang/Object;
.source "FlowableTimeout.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/internal/operators/flowable/FlowableTimeout$OnTimeout;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimeoutSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/internal/operators/flowable/FlowableTimeout$OnTimeout;"
    }
.end annotation


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

.field final firstTimeoutIndicator:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<TU;>;"
        }
    .end annotation
.end field

.field volatile index:J

.field final itemTimeoutIndicator:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field final timeout:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lorg/reactivestreams/Publisher",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "firstTimeoutIndicator":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TU;>;"
    .local p3, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<TV;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->timeout:Ljava/util/concurrent/atomic/AtomicReference;

    .line 76
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 77
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->firstTimeoutIndicator:Lorg/reactivestreams/Publisher;

    .line 78
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->itemTimeoutIndicator:Lio/reactivex/functions/Function;

    .line 79
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancelled:Z

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 159
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->timeout:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 160
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancel()V

    .line 147
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 148
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancel()V

    .line 141
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 142
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->index:J

    const-wide/16 v8, 0x1

    add-long v2, v6, v8

    .line 111
    .local v2, "idx":J
    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->index:J

    .line 113
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v6, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 115
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->timeout:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 116
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    .line 117
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 123
    :cond_0
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->itemTimeoutIndicator:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The publisher returned is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .local v4, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TV;>;"
    new-instance v5, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;

    invoke-direct {v5, p0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableTimeout$OnTimeout;J)V

    .line 133
    .local v5, "tis":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber<TT;TU;TV;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->timeout:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, v0, v5}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 134
    invoke-interface {v4, v5}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 136
    .end local v4    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TV;>;"
    .end local v5    # "tis":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber<TT;TU;TV;>;"
    :cond_1
    :goto_0
    return-void

    .line 124
    :catch_0
    move-exception v1

    .line 125
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 126
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancel()V

    .line 127
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v6, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 6
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v3, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 86
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 88
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancelled:Z

    if-nez v3, :cond_0

    .line 92
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 94
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->firstTimeoutIndicator:Lorg/reactivestreams/Publisher;

    .line 96
    .local v1, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TU;>;"
    if-eqz v1, :cond_2

    .line 97
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;

    const-wide/16 v4, 0x0

    invoke-direct {v2, p0, v4, v5}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableTimeout$OnTimeout;J)V

    .line 99
    .local v2, "tis":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber<TT;TU;TV;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->timeout:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 101
    invoke-interface {v1, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 104
    .end local v2    # "tis":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutInnerSubscriber<TT;TU;TV;>;"
    :cond_2
    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 153
    return-void
.end method

.method public timeout(J)V
    .locals 3
    .param p1, "idx"    # J

    .prologue
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber<TT;TU;TV;>;"
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->index:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->cancel()V

    .line 166
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeout$TimeoutSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 168
    :cond_0
    return-void
.end method
