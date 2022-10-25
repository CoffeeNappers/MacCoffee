.class final Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "MaybeConcatArray.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeConcatArray;
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

.field index:I

.field produced:J

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final sources:[Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;[Lio/reactivex/MaybeSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;[",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 68
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->sources:[Lio/reactivex/MaybeSource;

    .line 69
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 70
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 72
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 85
    return-void
.end method

.method drain()V
    .locals 11

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    const/4 v10, 0x0

    .line 111
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->getAndIncrement()I

    move-result v8

    if-eqz v8, :cond_0

    .line 161
    :goto_0
    return-void

    .line 115
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 116
    .local v1, "c":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    .line 117
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 120
    .local v2, "cancelled":Lio/reactivex/disposables/Disposable;
    :cond_1
    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 121
    invoke-virtual {v1, v10}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 125
    :cond_2
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    .line 127
    .local v5, "o":Ljava/lang/Object;
    if-eqz v5, :cond_6

    .line 129
    sget-object v8, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-eq v5, v8, :cond_4

    .line 130
    iget-wide v6, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->produced:J

    .line 131
    .local v6, "p":J
    iget-object v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    cmp-long v8, v6, v8

    if-eqz v8, :cond_3

    .line 132
    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    iput-wide v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->produced:J

    .line 133
    invoke-virtual {v1, v10}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 134
    const/4 v3, 0x1

    .line 136
    .local v3, "goNextSource":Z
    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 145
    .end local v6    # "p":J
    :goto_1
    if-eqz v3, :cond_6

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v8

    if-nez v8, :cond_6

    .line 146
    iget v4, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->index:I

    .line 147
    .local v4, "i":I
    iget-object v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->sources:[Lio/reactivex/MaybeSource;

    array-length v8, v8

    if-ne v4, v8, :cond_5

    .line 148
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 138
    .end local v3    # "goNextSource":Z
    .end local v4    # "i":I
    .restart local v6    # "p":J
    :cond_3
    const/4 v3, 0x0

    .restart local v3    # "goNextSource":Z
    goto :goto_1

    .line 141
    .end local v3    # "goNextSource":Z
    .end local v6    # "p":J
    :cond_4
    const/4 v3, 0x1

    .line 142
    .restart local v3    # "goNextSource":Z
    invoke-virtual {v1, v10}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_1

    .line 151
    .restart local v4    # "i":I
    :cond_5
    add-int/lit8 v8, v4, 0x1

    iput v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->index:I

    .line 153
    iget-object v8, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->sources:[Lio/reactivex/MaybeSource;

    aget-object v8, v8, v4

    invoke-interface {v8, p0}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 157
    .end local v3    # "goNextSource":Z
    .end local v4    # "i":I
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->decrementAndGet()I

    move-result v8

    if-nez v8, :cond_1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 106
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->drain()V

    .line 107
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 101
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->disposables:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 90
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
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 95
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->drain()V

    .line 96
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 78
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeConcatArray$ConcatMaybeObserver;->drain()V

    .line 80
    :cond_0
    return-void
.end method
