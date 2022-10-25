.class final Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;
.super Ljava/lang/Object;
.source "FlowableBuffer.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PublisherBufferExactSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C::",
        "Ljava/util/Collection",
        "<-TT;>;>",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TC;>;"
        }
    .end annotation
.end field

.field buffer:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field final bufferSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TC;>;"
        }
    .end annotation
.end field

.field done:Z

.field index:I

.field s:Lorg/reactivestreams/Subscription;

.field final size:I


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILjava/util/concurrent/Callable;)V
    .locals 0
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TC;>;I",
            "Ljava/util/concurrent/Callable",
            "<TC;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TC;>;"
    .local p3, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 74
    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->size:I

    .line 75
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 76
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 88
    return-void
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 155
    :goto_0
    return-void

    .line 147
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->done:Z

    .line 149
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->buffer:Ljava/util/Collection;

    .line 151
    .local v0, "b":Ljava/util/Collection;, "TC;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 152
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 154
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 134
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 135
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 140
    :goto_0
    return-void

    .line 138
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->done:Z

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 130
    :goto_0
    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->buffer:Ljava/util/Collection;

    .line 106
    .local v0, "b":Ljava/util/Collection;, "TC;"
    if-nez v0, :cond_1

    .line 109
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The bufferSupplier returned a null buffer"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "b":Ljava/util/Collection;, "TC;"
    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .restart local v0    # "b":Ljava/util/Collection;, "TC;"
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->buffer:Ljava/util/Collection;

    .line 120
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 122
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->index:I

    add-int/lit8 v2, v3, 0x1

    .line 123
    .local v2, "i":I
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->size:I

    if-ne v2, v3, :cond_2

    .line 124
    const/4 v3, 0x0

    iput v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->index:I

    .line 125
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->buffer:Ljava/util/Collection;

    .line 126
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 110
    .end local v0    # "b":Ljava/util/Collection;, "TC;"
    .end local v2    # "i":I
    :catch_0
    move-exception v1

    .line 111
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 112
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->cancel()V

    .line 113
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 128
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Ljava/util/Collection;, "TC;"
    .restart local v2    # "i":I
    :cond_2
    iput v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->index:I

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 95
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 97
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber<TT;TC;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferExactSubscriber;->size:I

    int-to-long v2, v1

    invoke-static {p1, p2, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 83
    :cond_0
    return-void
.end method
