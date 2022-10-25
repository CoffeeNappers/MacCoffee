.class final Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ObservableReplay.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReplayObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

.field static final TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

.field private static final serialVersionUID:J = -0x7686330d232fac3L


# instance fields
.field final buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer",
            "<TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;",
            ">;"
        }
    .end annotation
.end field

.field final shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 243
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 245
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    return-void
.end method

.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    .local p1, "buffer":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 256
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    .line 258
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 259
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 260
    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    .local p1, "producer":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    const/4 v3, 0x0

    .line 288
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 291
    .local v0, "c":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    sget-object v4, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    if-ne v0, v4, :cond_1

    .line 301
    :goto_0
    return v3

    .line 295
    :cond_1
    array-length v1, v0

    .line 296
    .local v1, "len":I
    add-int/lit8 v4, v1, 0x1

    new-array v2, v4, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 297
    .local v2, "u":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 298
    aput-object p1, v2, v1

    .line 300
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 301
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 269
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 275
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 276
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 264
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 389
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->done:Z

    if-nez v0, :cond_0

    .line 390
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->done:Z

    .line 391
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    invoke-interface {v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;->complete()V

    .line 392
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->replayFinal()V

    .line 394
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 377
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->done:Z

    if-nez v0, :cond_0

    .line 378
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->done:Z

    .line 379
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    invoke-interface {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;->error(Ljava/lang/Throwable;)V

    .line 380
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->replayFinal()V

    .line 384
    :goto_0
    return-void

    .line 382
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 368
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->done:Z

    if-nez v0, :cond_0

    .line 369
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    invoke-interface {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;->next(Ljava/lang/Object;)V

    .line 370
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->replay()V

    .line 372
    :cond_0
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "p"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 361
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->replay()V

    .line 364
    :cond_0
    return-void
.end method

.method remove(Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    .local p1, "producer":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    const/4 v7, 0x0

    .line 316
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 318
    .local v0, "c":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    array-length v3, v0

    .line 320
    .local v3, "len":I
    if-nez v3, :cond_2

    .line 352
    :cond_1
    :goto_0
    return-void

    .line 325
    :cond_2
    const/4 v2, -0x1

    .line 326
    .local v2, "j":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_3

    .line 327
    aget-object v5, v0, v1

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 328
    move v2, v1

    .line 333
    :cond_3
    if-ltz v2, :cond_1

    .line 340
    const/4 v5, 0x1

    if-ne v3, v5, :cond_5

    .line 341
    sget-object v4, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 351
    .local v4, "u":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 326
    .end local v4    # "u":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 344
    :cond_5
    add-int/lit8 v5, v3, -0x1

    new-array v4, v5, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 346
    .restart local v4    # "u":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    invoke-static {v0, v7, v4, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 348
    add-int/lit8 v5, v2, 0x1

    sub-int v6, v3, v2

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v4, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method replay()V
    .locals 6

    .prologue
    .line 401
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 402
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    move-object v1, v0

    .local v1, "arr$":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v1, v2

    .line 403
    .local v4, "rp":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    invoke-interface {v5, v4}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;)V

    .line 402
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 405
    .end local v4    # "rp":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    :cond_0
    return-void
.end method

.method replayFinal()V
    .locals 7

    .prologue
    .line 412
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;

    .line 413
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    move-object v1, v0

    .local v1, "arr$":[Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v1, v2

    .line 414
    .local v4, "rp":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->buffer:Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    invoke-interface {v5, v4}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;)V

    .line 413
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 416
    .end local v4    # "rp":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    :cond_0
    return-void
.end method
