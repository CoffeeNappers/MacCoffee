.class final Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "SingleFlatMapIterableFlowable.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatMapIterableObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TR;>;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7c0d039055ea7eaeL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field d:Lio/reactivex/disposables/Disposable;

.field volatile it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+TR;>;"
        }
    .end annotation
.end field

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field outputFused:Z

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 76
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 77
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    .line 78
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 79
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->cancelled:Z

    .line 130
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 131
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 132
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 267
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 268
    return-void
.end method

.method drain()V
    .locals 12

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->getAndIncrement()I

    move-result v10

    if-eqz v10, :cond_1

    .line 214
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 140
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 142
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    iget-boolean v10, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->outputFused:Z

    if-eqz v10, :cond_2

    if-eqz v5, :cond_2

    .line 143
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 144
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 148
    :cond_2
    const/4 v6, 0x1

    .line 152
    .local v6, "missed":I
    :cond_3
    :goto_1
    if-eqz v5, :cond_6

    .line 153
    iget-object v10, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 154
    .local v8, "r":J
    const-wide/16 v2, 0x0

    .line 156
    .local v2, "e":J
    const-wide v10, 0x7fffffffffffffffL

    cmp-long v10, v8, v10

    if-nez v10, :cond_4

    .line 157
    invoke-virtual {p0, v0, v5}, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->slowPath(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V

    goto :goto_0

    .line 161
    :cond_4
    cmp-long v10, v2, v8

    if-eqz v10, :cond_5

    .line 162
    iget-boolean v10, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->cancelled:Z

    if-nez v10, :cond_0

    .line 169
    :try_start_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    const-string/jumbo v11, "The iterator returned a null value"

    invoke-static {v10, v11}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 176
    .local v7, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 178
    iget-boolean v10, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->cancelled:Z

    if-nez v10, :cond_0

    .line 182
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    .line 187
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 194
    .local v1, "b":Z
    if-nez v1, :cond_4

    .line 195
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 170
    .end local v1    # "b":Z
    .end local v7    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v4

    .line 171
    .local v4, "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 172
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 188
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v7    # "v":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v4

    .line 189
    .restart local v4    # "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 190
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 200
    .end local v4    # "ex":Ljava/lang/Throwable;
    .end local v7    # "v":Ljava/lang/Object;, "TR;"
    :cond_5
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-eqz v10, :cond_6

    .line 201
    iget-object v10, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v10, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 205
    .end local v2    # "e":J
    .end local v8    # "r":J
    :cond_6
    neg-int v10, v6

    invoke-virtual {p0, v10}, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->addAndGet(I)I

    move-result v6

    .line 206
    if-eqz v6, :cond_0

    .line 210
    if-nez v5, :cond_3

    .line 211
    iget-object v5, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 272
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 117
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 86
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 88
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 97
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 104
    .local v1, "has":Z
    if-nez v1, :cond_0

    .line 105
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 111
    .end local v1    # "has":Z
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :goto_0
    return-void

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 100
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 109
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "has":Z
    .restart local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_0
    iput-object v2, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 110
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->drain()V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
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
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v2, 0x0

    .line 278
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 280
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    if-eqz v0, :cond_1

    .line 281
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The iterator returned a null value"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 282
    .local v1, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 283
    iput-object v2, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 287
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :cond_0
    :goto_0
    return-object v1

    :cond_1
    move-object v1, v2

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->drain()V

    .line 125
    :cond_0
    return-void
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 258
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 259
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->outputFused:Z

    .line 260
    const/4 v0, 0x2

    .line 262
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method slowPath(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Ljava/util/Iterator",
            "<+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_0
    iget-boolean v3, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->cancelled:Z

    if-eqz v3, :cond_2

    .line 251
    :cond_1
    :goto_0
    return-void

    .line 225
    :cond_2
    :try_start_0
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 232
    .local v2, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {p1, v2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 234
    iget-boolean v3, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableFlowable$FlatMapIterableObserver;->cancelled:Z

    if-nez v3, :cond_1

    .line 242
    :try_start_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .line 249
    .local v0, "b":Z
    if-nez v0, :cond_0

    .line 250
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 226
    .end local v0    # "b":Z
    .end local v2    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v1

    .line 227
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 228
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 243
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "v":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v1

    .line 244
    .restart local v1    # "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 245
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
