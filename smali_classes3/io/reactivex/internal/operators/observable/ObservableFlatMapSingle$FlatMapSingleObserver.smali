.class final Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableFlatMapSingle.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatMapSingleObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x775a28d5b42d01b7L


# instance fields
.field final active:Ljava/util/concurrent/atomic/AtomicInteger;

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field d:Lio/reactivex/disposables/Disposable;

.field final delayErrors:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final queue:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TR;>;>;"
        }
    .end annotation
.end field

.field final set:Lio/reactivex/disposables/CompositeDisposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Z)V
    .locals 2
    .param p3, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;Z)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 77
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    .line 78
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->mapper:Lio/reactivex/functions/Function;

    .line 79
    iput-boolean p3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->delayErrors:Z

    .line 80
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    .line 81
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 82
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 84
    return-void
.end method


# virtual methods
.method clear()V
    .locals 2

    .prologue
    .line 215
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 216
    .local v0, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_0

    .line 217
    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 219
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->cancelled:Z

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 140
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 141
    return-void
.end method

.method drain()V
    .locals 1

    .prologue
    .line 209
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 210
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->drainLoop()V

    .line 212
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 12

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 222
    const/4 v4, 0x1

    .line 223
    .local v4, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    .line 224
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 225
    .local v5, "n":Ljava/util/concurrent/atomic/AtomicInteger;
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 229
    .local v7, "qr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;>;"
    :cond_0
    :goto_0
    iget-boolean v11, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->cancelled:Z

    if-eqz v11, :cond_1

    .line 230
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->clear()V

    .line 271
    :goto_1
    return-void

    .line 234
    :cond_1
    iget-boolean v11, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->delayErrors:Z

    if-nez v11, :cond_2

    .line 235
    iget-object v11, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v11}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .line 236
    .local v3, "ex":Ljava/lang/Throwable;
    if-eqz v3, :cond_2

    .line 237
    iget-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v3

    .line 238
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->clear()V

    .line 239
    invoke-interface {v0, v3}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 244
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v11

    if-nez v11, :cond_3

    move v1, v9

    .line 245
    .local v1, "d":Z
    :goto_2
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 246
    .local v6, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v6, :cond_4

    invoke-virtual {v6}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    .line 247
    .local v8, "v":Ljava/lang/Object;, "TR;"
    :goto_3
    if-nez v8, :cond_5

    move v2, v9

    .line 249
    .local v2, "empty":Z
    :goto_4
    if-eqz v1, :cond_7

    if-eqz v2, :cond_7

    .line 250
    iget-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v9}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v3

    .line 251
    .restart local v3    # "ex":Ljava/lang/Throwable;
    if-eqz v3, :cond_6

    .line 252
    invoke-interface {v0, v3}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .end local v1    # "d":Z
    .end local v2    # "empty":Z
    .end local v3    # "ex":Ljava/lang/Throwable;
    .end local v6    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .end local v8    # "v":Ljava/lang/Object;, "TR;"
    :cond_3
    move v1, v10

    .line 244
    goto :goto_2

    .line 246
    .restart local v1    # "d":Z
    .restart local v6    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_4
    const/4 v8, 0x0

    goto :goto_3

    .restart local v8    # "v":Ljava/lang/Object;, "TR;"
    :cond_5
    move v2, v10

    .line 247
    goto :goto_4

    .line 254
    .restart local v2    # "empty":Z
    .restart local v3    # "ex":Ljava/lang/Throwable;
    :cond_6
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 259
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_7
    if-eqz v2, :cond_8

    .line 266
    neg-int v11, v4

    invoke-virtual {p0, v11}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->addAndGet(I)I

    move-result v4

    .line 267
    if-nez v4, :cond_0

    goto :goto_1

    .line 263
    :cond_8
    invoke-interface {v0, v8}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method getOrCreateQueue()Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 184
    .local v0, "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 189
    .end local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .local v1, "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :goto_0
    return-object v1

    .line 187
    .end local v1    # "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    .restart local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_1
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .end local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v2

    invoke-direct {v0, v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 188
    .restart local v0    # "current":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 189
    .restart local v1    # "current":Ljava/lang/Object;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    goto :goto_0
.end method

.method innerError(Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;Ljava/lang/Throwable;)V
    .locals 1
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver",
            "<TT;TR;>.InnerObserver;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>.InnerObserver;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 196
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 197
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->delayErrors:Z

    if-nez v0, :cond_0

    .line 198
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 199
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 201
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 202
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->drain()V

    .line 206
    :goto_0
    return-void

    .line 204
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerSuccess(Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver",
            "<TT;TR;>.InnerObserver;TR;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>.InnerObserver;"
    .local p2, "value":Ljava/lang/Object;, "TR;"
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 149
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v4, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 150
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->get()I

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {p0, v3, v0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 151
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v4, p2}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 153
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    if-nez v4, :cond_2

    .line 154
    .local v0, "d":Z
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 156
    .local v2, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    if-eqz v0, :cond_4

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 157
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v1

    .line 158
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_3

    .line 159
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 179
    .end local v0    # "d":Z
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    return-void

    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_2
    move v0, v3

    .line 153
    goto :goto_0

    .line 161
    .restart local v0    # "d":Z
    .restart local v1    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 165
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->decrementAndGet()I

    move-result v3

    if-eqz v3, :cond_1

    .line 178
    .end local v0    # "d":Z
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->drainLoop()V

    goto :goto_1

    .line 169
    .end local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->getOrCreateQueue()Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-result-object v2

    .line 170
    .restart local v2    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TR;>;"
    monitor-enter v2

    .line 171
    :try_start_0
    invoke-virtual {v2, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 172
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 174
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->getAndIncrement()I

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_1

    .line 172
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 133
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->drain()V

    .line 134
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 120
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 121
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->delayErrors:Z

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 124
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->drain()V

    .line 128
    :goto_0
    return-void

    .line 126
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

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
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The mapper returned a null SingleSource"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/SingleSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .local v2, "ms":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TR;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 110
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;

    invoke-direct {v1, p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;)V

    .line 112
    .local v1, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>.InnerObserver;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v3, v1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 113
    invoke-interface {v2, v1}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 115
    .end local v1    # "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>.InnerObserver;"
    .end local v2    # "ms":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TR;>;"
    :cond_0
    :goto_0
    return-void

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 103
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 104
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 91
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMapSingle$FlatMapSingleObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 93
    :cond_0
    return-void
.end method
