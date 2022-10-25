.class final Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
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
    name = "PublisherBufferSkipSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C::",
        "Ljava/util/Collection",
        "<-TT;>;>",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4df0a4abec27f371L


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

.field final skip:I


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;IILjava/util/concurrent/Callable;)V
    .locals 0
    .param p2, "size"    # I
    .param p3, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TC;>;II",
            "Ljava/util/concurrent/Callable",
            "<TC;>;)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TC;>;"
    .local p4, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TC;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 183
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 184
    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->size:I

    .line 185
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->skip:I

    .line 186
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 187
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 208
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 209
    return-void
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 273
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 286
    :goto_0
    return-void

    .line 277
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->done:Z

    .line 278
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 279
    .local v0, "b":Ljava/util/Collection;, "TC;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 281
    if-eqz v0, :cond_1

    .line 282
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 285
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 260
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 261
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 269
    :goto_0
    return-void

    .line 265
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->done:Z

    .line 266
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 268
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->done:Z

    if-eqz v4, :cond_0

    .line 256
    :goto_0
    return-void

    .line 226
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 228
    .local v0, "b":Ljava/util/Collection;, "TC;"
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->index:I

    .line 230
    .local v2, "i":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    if-nez v2, :cond_1

    .line 232
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The bufferSupplier returned a null buffer"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "b":Ljava/util/Collection;, "TC;"
    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    .restart local v0    # "b":Ljava/util/Collection;, "TC;"
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 244
    :cond_1
    if-eqz v0, :cond_2

    .line 245
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 246
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v4

    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->size:I

    if-ne v4, v5, :cond_2

    .line 247
    const/4 v4, 0x0

    iput-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->buffer:Ljava/util/Collection;

    .line 248
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 252
    :cond_2
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->skip:I

    if-ne v3, v4, :cond_3

    .line 253
    const/4 v2, 0x0

    .line 255
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :goto_1
    iput v2, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->index:I

    goto :goto_0

    .line 233
    .end local v0    # "b":Ljava/util/Collection;, "TC;"
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :catch_0
    move-exception v1

    .line 234
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 235
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->cancel()V

    .line 237
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Ljava/util/Collection;, "TC;"
    :cond_3
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_1
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 213
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 216
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 218
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 9
    .param p1, "n"    # J

    .prologue
    .line 191
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber<TT;TC;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 192
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->get()I

    move-result v4

    if-nez v4, :cond_1

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v5}, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 194
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->size:I

    int-to-long v4, v4

    invoke-static {p1, p2, v4, v5}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v0

    .line 196
    .local v0, "u":J
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->skip:I

    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->size:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    const-wide/16 v6, 0x1

    sub-long v6, p1, v6

    invoke-static {v4, v5, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v2

    .line 198
    .local v2, "v":J
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, v1, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v6

    invoke-interface {v4, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 204
    .end local v0    # "u":J
    .end local v2    # "v":J
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableBuffer$PublisherBufferSkipSubscriber;->skip:I

    int-to-long v6, v5

    invoke-static {v6, v7, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->multiplyCap(JJ)J

    move-result-wide v6

    invoke-interface {v4, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method
