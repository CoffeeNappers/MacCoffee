.class final Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "MaybeConcatIterable.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeConcatIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x30dc8174e7c3966aL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

.field produced:J

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final sources:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "sources":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/MaybeSource<+TT;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 79
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 80
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->sources:Ljava/util/Iterator;

    .line 81
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 82
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 84
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 97
    return-void
.end method

.method drain()V
    .locals 13

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    const/4 v12, 0x0

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->getAndIncrement()I

    move-result v10

    if-eqz v10, :cond_0

    .line 190
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 128
    .local v2, "c":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 129
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 132
    .local v3, "cancelled":Lio/reactivex/disposables/Disposable;
    :cond_1
    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 133
    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 137
    :cond_2
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    .line 139
    .local v6, "o":Ljava/lang/Object;
    if-eqz v6, :cond_3

    .line 141
    sget-object v10, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-eq v6, v10, :cond_5

    .line 142
    iget-wide v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->produced:J

    .line 143
    .local v8, "p":J
    iget-object v10, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    cmp-long v10, v8, v10

    if-eqz v10, :cond_4

    .line 144
    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->produced:J

    .line 145
    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 146
    const/4 v5, 0x1

    .line 148
    .local v5, "goNextSource":Z
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 157
    .end local v8    # "p":J
    :goto_1
    if-eqz v5, :cond_3

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v10

    if-nez v10, :cond_3

    .line 161
    :try_start_0
    iget-object v10, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->sources:Ljava/util/Iterator;

    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 168
    .local v1, "b":Z
    if-eqz v1, :cond_6

    .line 172
    :try_start_1
    iget-object v10, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->sources:Ljava/util/Iterator;

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    const-string/jumbo v11, "The source Iterator returned a null MaybeSource"

    invoke-static {v10, v11}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/reactivex/MaybeSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 179
    .local v7, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    invoke-interface {v7, p0}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 186
    .end local v1    # "b":Z
    .end local v5    # "goNextSource":Z
    .end local v7    # "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->decrementAndGet()I

    move-result v10

    if-nez v10, :cond_1

    goto :goto_0

    .line 150
    .restart local v8    # "p":J
    :cond_4
    const/4 v5, 0x0

    .restart local v5    # "goNextSource":Z
    goto :goto_1

    .line 153
    .end local v5    # "goNextSource":Z
    .end local v8    # "p":J
    :cond_5
    const/4 v5, 0x1

    .line 154
    .restart local v5    # "goNextSource":Z
    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_1

    .line 162
    :catch_0
    move-exception v4

    .line 163
    .local v4, "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 164
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 173
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "b":Z
    :catch_1
    move-exception v4

    .line 174
    .restart local v4    # "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 175
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 181
    .end local v4    # "ex":Ljava/lang/Throwable;
    :cond_6
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_2
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 118
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->drain()V

    .line 119
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 112
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 113
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 102
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 107
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->drain()V

    .line 108
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 90
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatIterable$ConcatMaybeObserver;->drain()V

    .line 92
    :cond_0
    return-void
.end method
